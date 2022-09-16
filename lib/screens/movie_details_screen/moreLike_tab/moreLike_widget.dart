import 'package:flutter/material.dart';
import 'package:movies_app/models/PopularResponse.dart';

import '../../../database/my_dataBase.dart';
import '../../watchlist_screen/watchlist_screen.dart';

class MoreLikeWidget extends StatefulWidget {

  Results results;
  bool pressed = false;
  MoreLikeWidget(this.results);

  @override
  State<MoreLikeWidget> createState() => _MoreLikeWidgetState();
}

class _MoreLikeWidgetState extends State<MoreLikeWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Row(
        children: [
          Column(
            children: [
              Image.network(
                'https://image.tmdb.org/t/p/w500' + '${widget.results.posterPath}',
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
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 13,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text('${widget.results.voteAverage!.toStringAsFixed(1)}',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(widget.results.title??'',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall),
                    SizedBox(
                      height: 5,
                    ),
                    Text(widget.results.releaseDate??'',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(
                            color: Colors.grey))
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
