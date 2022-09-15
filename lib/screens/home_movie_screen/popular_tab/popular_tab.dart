import 'package:flutter/material.dart';
import 'package:movies_app/models/PopularResponse.dart';
import 'package:movies_app/screens/home_movie_screen/popular_tab/popular_tab_widget.dart';
import 'package:movies_app/screens/movie_details_screen/movie_details_screen.dart';

import '../../../apiManager/api_manager.dart';
import '../../../themes/themes.dart';

class PopularTab extends StatefulWidget {


  @override
  State<PopularTab> createState() => _PopularTabState();
}

class _PopularTabState extends State<PopularTab> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PopularResponse>(
      future: ApiManager.popularMovieData(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.data?.statusMessage ?? ''));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.yellow,
            ),
          );
        }
        var popularMovie = snapshot.data;
        return ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
                InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, MovieDetScreen.routeName,arguments: popularMovie!.results![index]);
                    },
                    child: PopularTabWidget(popularMovie!.results![index])),
            itemCount: popularMovie?.results?.length);
      },
    );
  }
}
