import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/database/my_dataBase.dart';
import 'package:movies_app/models/PopularResponse.dart';
import 'package:movies_app/screens/watchlist_screen/watchlist_screen.dart';

class WatchlistWidget extends StatefulWidget {
  Results results;
  WatchlistWidget({required this.results});

  @override
  State<WatchlistWidget> createState() => _WatchlistWidgetState();
}

class _WatchlistWidgetState extends State<WatchlistWidget> {
  @override

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      child: Row(
        children: [
          Stack(
            children: [
              Image.network(
                'https://image.tmdb.org/t/p/w500' +
                    '${widget.results.posterPath}',
                width: 130,
                height: 130,
                fit: BoxFit.fill,
              ),
              Positioned(
                right: 94,
                bottom: 91,
                child: IconButton(
                  onPressed: () {
                    if (WatchlistScreen.watchlist.any(
                        (element) => element.title == widget.results.title)) {
                      if (WatchlistScreen.watchlist.length == 1) {
                        MyDB.deletemovie(widget.results);
                        WatchlistScreen.watchlist = [];
                      } else {
                        MyDB.deletemovie(widget.results);
                      }
                    }
                  },
                  icon: Stack(
                    children: const [
                      ImageIcon(
                        AssetImage("assets/images/preseedbookmark.png"),
                        color: Colors.amber,
                        size: 60,
                      ),
                      Positioned(
                        top: 5,
                        left: 5,
                        child: Icon(
                          Icons.check,
                          size: 20,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.results.title ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w500)),
              SizedBox(height: 5,),
              Text(
                widget.results.releaseDate ?? "",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 16,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text('${widget.results.voteAverage?.toStringAsFixed(1)}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 13
                      )),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
