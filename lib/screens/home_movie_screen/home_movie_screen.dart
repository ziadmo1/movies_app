import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/apiManager/api_manager.dart';
import 'package:movies_app/models/PopularResponse.dart';
import 'package:movies_app/screens/home_movie_screen/popular_tab/popular_tab.dart';
import 'package:movies_app/screens/home_movie_screen/topRated_tab/topRated_tab.dart';
import 'package:movies_app/themes/themes.dart';

class HomeMovieScreen extends StatelessWidget {

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          FutureBuilder<PopularResponse>(
            future: ApiManager.popularMovieData(),
            builder:(context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.data?.statusMessage ?? ''));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(color: MyThemeData.lightBlack,),);
              }
            var popularMovie = snapshot.data;
         return Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.network(
                        'https://images.thedirect.com/media/article_full/avengers-endgame-marvel_MHrI22M.jpg'),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 112),
                        child: Text(
                          popularMovie?.results?[currentIndex].title??'',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium,
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                        popularMovie?.results?[currentIndex].releaseDate??'',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.grey)),
                  ],
                ),
                Positioned(
                  left: 10,
                  child: Image.network(
                    'https://lumiere-a.akamaihd.net/v1/images/p_avengersinfinitywar_19871_cb171514.jpeg?region=0,0,540,810&width=480',
                    width: 125,
                    height: 200,
                  ),
                ),
                Positioned(
                    bottom: 159,
                    left: -6,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.bookmark_add,
                          color: Colors.grey,
                          size: 35,
                        ))),
              ],
            );

    }
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Container(
              padding: EdgeInsets.all(20),
              color: MyThemeData.lightBlack,
              height: 220,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'New Releases',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: PopularTab(currentIndex),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Container(
              padding: EdgeInsets.all(20),
              color: MyThemeData.lightBlack,
              height: 250,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recommended',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: TopRatedTab()
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
