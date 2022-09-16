// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:movies_app/database/my_dataBase.dart';
import 'package:movies_app/models/TopRatedResponse.dart';
import 'package:movies_app/screens/movie_details_screen/movie_details_screen.dart';
import 'package:movies_app/screens/watchlist_screen/watchlist_screen.dart';

import '../../../models/PopularResponse.dart';

class TopRatedWidget extends StatefulWidget {
  Results results;
  bool pressed = false;
  TopRatedWidget(this.results);

  @override
  State<TopRatedWidget> createState() => _TopRatedWidgetState();
}

class _TopRatedWidgetState extends State<TopRatedWidget> {

  @override
  void initState() {
    if (WatchlistScreen.watchlist
        .any((element) => element.title == widget.results.title)) {
      widget.pressed = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      InkWell(
        onTap: () {
          Navigator.pushNamed(context, MovieDetScreen.routeName,
              arguments: widget.results);
        },
        child: Row(
          children: [
            Column(
              children: [
                Image.network(
                  'https://image.tmdb.org/t/p/w500' +
                      '${widget.results.posterPath}',
                  width: 100,
                  height: 114,
                  fit: BoxFit.fill,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  width: 100,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0xFF343534),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 13,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text('${widget.results.voteAverage}',
                              style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(widget.results.title ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall),
                      SizedBox(
                        height: 5,
                      ),
                      Text(widget.results.releaseDate ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.grey))
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              width: 15,
            )
          ],
        ),
      ),
      Positioned(
        right: 79,
        bottom: 136,
        child: IconButton(
          onPressed: () {
            setState(() {
              if (WatchlistScreen.watchlist
                  .any((element) => element.title == widget.results.title)) {
                if (WatchlistScreen.watchlist.length == 1) {
                  MyDB.deletemovie(widget.results);
                  WatchlistScreen.watchlist = [];
                } else {
                  MyDB.deletemovie(widget.results);
                }
              } else {
                MyDB.insertMovie(widget.results);
              }

              widget.pressed = !widget.pressed;
              MyDB.getMovies();
            });
          },
          icon: Stack(
            children: [
              ImageIcon(
                AssetImage(widget.pressed
                    ? "assets/images/preseedbookmark.png"
                    : "assets/images/bookmark.png"),
                color: widget.pressed ? Colors.amber : Colors.grey,
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
      )
    ]);
  }
}
