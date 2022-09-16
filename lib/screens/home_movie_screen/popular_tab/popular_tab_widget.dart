import 'package:flutter/material.dart';
import 'package:movies_app/database/my_dataBase.dart';
import 'package:movies_app/models/PopularResponse.dart';
import 'package:movies_app/screens/watchlist_screen/watchlist_screen.dart';

class PopularTabWidget extends StatefulWidget {
  Results results;
  bool pressed = false;
  PopularTabWidget(this.results);

  @override
  State<PopularTabWidget> createState() => _PopularTabWidgetState();
}

class _PopularTabWidgetState extends State<PopularTabWidget> {
  void initState() {
    if (WatchlistScreen.watchlist.isEmpty) {
      widget.pressed = false;
    } else if (WatchlistScreen.watchlist
        .any((element) => element.title == widget.results.title)) {
      widget.pressed = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    MyDB.getMovies();
    return Stack(children: [
      Row(
        children: [
          Image.network(
            'https://image.tmdb.org/t/p/w500' '${widget.results.posterPath}',
            width: 100,
            height: 150,
            fit: BoxFit.fill,
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
      Positioned(
        right: 79,
        bottom: 106,
        child: IconButton(
          onPressed: () {
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
