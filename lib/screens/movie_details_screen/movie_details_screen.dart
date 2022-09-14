import 'package:flutter/material.dart';
import 'package:movies_app/models/PopularResponse.dart';
import 'package:movies_app/screens/movie_details_screen/moreLike_tab/moreLike_tab.dart';
import 'package:readmore/readmore.dart';

import '../../themes/themes.dart';

class MovieDetScreen extends StatelessWidget {
static const String routeName = 'movieDet';

  @override
  Widget build(BuildContext context) {
    Results results = ModalRoute.of(context)?.settings.arguments as Results;
    return Scaffold(
        appBar: AppBar(
            title: Text(results.title??'',maxLines: 1,overflow: TextOverflow.ellipsis,),
        ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://image.tmdb.org/t/p/w500' + '${results.backdropPath}',
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(results.title??'',style: Theme.of(context).textTheme.displayMedium,),
                  SizedBox(height: 5,),
                  Text(results.releaseDate??'',style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 12
                  ),),
                  SizedBox(height: 10,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Stack(children: [
                  Image.network(
                  'https://image.tmdb.org/t/p/w500' + '${results.posterPath}',
                    width: 130,
                    height: 180,
                    fit: BoxFit.fill,
                  ),
              Positioned(
                  right: 100,
                  bottom: 145,
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.bookmark_add,
                        color: Colors.grey,
                        size: 35,
                      )))
          ]),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                            ReadMoreText(
                              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontSize: 15
                          ),
                            results.overview??'',
                            trimLines: 7,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'Show more',
                            trimExpandedText: 'Show less',
                            moreStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                                fontSize: 15,
                                color: Colors.yellow
                            ),
                              lessStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                                  fontSize: 15,
                                  color: Colors.yellow
                              ),
                          ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 25,
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text('${results.voteAverage}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              color: MyThemeData.lightBlack,
              height: 250,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'More Like This',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                      child: MoreLikeTab(results.id??0,results)
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
