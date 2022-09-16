import 'package:flutter/material.dart';
import 'package:movies_app/apiManager/api_manager.dart';
import 'package:movies_app/database/my_dataBase.dart';
import 'package:movies_app/models/PopularResponse.dart';
import 'package:movies_app/screens/movie_details_screen/moreLike_tab/moreLike_tab.dart';
import 'package:movies_app/screens/watchlist_screen/watchlist_screen.dart';
import 'package:readmore/readmore.dart';

import '../../themes/themes.dart';

class MovieDetScreen extends StatefulWidget {
  static const String routeName = 'movieDet';
  bool pressed = false;

  @override
  State<MovieDetScreen> createState() => _MovieDetScreenState();
}

class _MovieDetScreenState extends State<MovieDetScreen> {
  @override
  Widget build(BuildContext context) {
    Results results = ModalRoute.of(context)?.settings.arguments as Results;
    MyDB.getMovies();
    if (WatchlistScreen.watchlist.isEmpty) {
      widget.pressed = false;
    } else if (WatchlistScreen.watchlist
        .any((element) => element.title == results.title)) {
      widget.pressed = true;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          results.title ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://image.tmdb.org/t/p/w500' + '${results.backdropPath}',
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    results.title ?? '',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    results.releaseDate ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontSize: 12),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                          children: [
                        Image.network(
                          'https://image.tmdb.org/t/p/w500' +
                              '${results.posterPath}',
                          width: 130,
                          height: 180,
                          fit: BoxFit.fill,
                        ),
                        Positioned(
                          right: 96,
                          bottom: 141,
                          child: IconButton(
                            onPressed: () {
                              if (WatchlistScreen.watchlist.any(
                                  (element) => element.title == results.title)) {
                                if (WatchlistScreen.watchlist.length == 1) {
                                  MyDB.deletemovie(results);
                                  WatchlistScreen.watchlist = [];
                                } else {
                                  MyDB.deletemovie(results);
                                }
                              } else {
                                MyDB.insertMovie(results);
                              }

                              widget.pressed = !widget.pressed;
                              setState(() {
                                MyDB.getMovies();
                              });
                            },
                            icon: Stack(
                              children: [
                                ImageIcon(
                                  AssetImage(widget.pressed
                                      ? "assets/images/preseedbookmark.png"
                                      : "assets/images/bookmark.png"),
                                  color:
                                      widget.pressed ? Colors.amber : Colors.grey,
                                  size: 60,
                                ),
                                Positioned(
                                  top: 5,
                                  left: 5,
                                  child: Icon(
                                    widget.pressed ? Icons.check : Icons.add,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ]),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ReadMoreText(
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(fontSize: 15),
                                results.overview ?? '',
                                trimLines: 7,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: 'Show more',
                                trimExpandedText: 'Show less',
                                moreStyle: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                        fontSize: 15, color: Colors.yellow),
                                lessStyle: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                        fontSize: 15, color: Colors.yellow),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
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
                  Expanded(child: MoreLikeTab(results.id ?? 0, results)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
