import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/themes/themes.dart';

class HomeMovieScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.network(
                      'https://images.thedirect.com/media/article_full/avengers-endgame-marvel_MHrI22M.jpg'),
                  SizedBox(height: 5,),
                  Container(
                    padding: EdgeInsets.only(left: 112),
                      child: Text('avengers infinity war'.toUpperCase(),textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodyMedium,)),
                  SizedBox(height: 5,),
                  Text('2019  PG-13  2h 7m',textAlign:TextAlign.center,style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey
                  )),
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
                  child: IconButton(onPressed: (){}, icon: Icon(Icons.bookmark_add,color: Colors.grey,size: 35,))),
            ],
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
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Stack(
                          children: [ Row(
                                children: [
                                  Image.network(
                                    'https://m.media-amazon.com/images/M/MV5BNjZlOGVhZDctODU2Yi00NzcyLWFlNmItZGQ2ZDc2NTIwNGMyXkEyXkFqcGdeQXVyNzkwMTYyMTI@._V1_.jpg',
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
                                right: 85,
                                bottom: 108,
                                child: IconButton(onPressed: (){}, icon: Icon(Icons.bookmark_add,color: Colors.grey,size: 35,)))
                    ]
                        ),
                        itemCount: 20),
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
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Stack(
                            children: [ Row(
                              children: [
                                Column(
                                  children: [
                                    Image.network(
                                      'https://cdn1.epicgames.com/offer/4bc43145bb8245a5b5cc9ea262ffbe0e/EGS_MarvelsSpiderManRemastered_InsomniacGamesNixxesSoftware_S2_1200x1600-76424286902489f4d9639ac9b735c2b2',
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
                                              Icon(Icons.star,color: Colors.yellow,size: 13,),
                                              SizedBox(width: 3,),
                                              Text('7.7',style: Theme.of(context).textTheme.bodySmall),
                                            ],
                                          ),
                                          SizedBox(height: 5,),
                                          Text('spider man',style: Theme.of(context).textTheme.bodySmall),
                                          SizedBox(height: 5,),
                                          Text('2018 R 1h 59m',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                            color: Colors.grey
                                          ))
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
                                  bottom: 138,
                                  child: IconButton(onPressed: (){}, icon: Icon(Icons.bookmark_add,color: Colors.grey,size: 35,)))
                            ]
                        ),
                        itemCount: 20),
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
