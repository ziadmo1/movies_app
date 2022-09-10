import 'package:flutter/material.dart';
import 'package:movies_app/models/PopularResponse.dart';

class MoreLikeWidget extends StatelessWidget {

  Results results;
  MoreLikeWidget(this.results);
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Row(
        children: [
          Column(
            children: [
              Image.network(
                      'https://wwwimage-us.pplusstatic.com/thumbnails/photos/w370-q80/movie_asset/77/00/10/lostc_salone_poster_1400x2100.jpg',
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
                        Text('${results.voteAverage}',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(results.title??'',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall),
                    SizedBox(
                      height: 5,
                    ),
                    Text('sssssss',
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
          right: 85,
          bottom: 139,
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.bookmark_add,
                color: Colors.grey,
                size: 35,
              )))
    ]);
  }
}
