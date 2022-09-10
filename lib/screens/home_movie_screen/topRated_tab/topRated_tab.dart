import 'package:flutter/material.dart';
import 'package:movies_app/apiManager/api_manager.dart';
import 'package:movies_app/models/TopRatedResponse.dart';
import 'package:movies_app/screens/home_movie_screen/topRated_tab/topRated_tab_widget.dart';
import 'package:movies_app/themes/themes.dart';

class TopRatedTab extends StatelessWidget {
  const TopRatedTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TopRatedResponse>(
        future: ApiManager.topRated(),
        builder: (context, snapshot) {
          if(snapshot.hasError){
            return Center(child: Text(snapshot.data?.statusMessage??''));
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(color: MyThemeData.lightBlack,),);
          }
          var topRated = snapshot.data;
          return  ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => TopRatedWidget(topRated!.results![index]),
              itemCount: topRated?.results?.length
          );
        },

    );
  }
}
