import 'package:flutter/material.dart';
import 'package:movies_app/models/LikeMoviesResponse.dart';
import 'package:movies_app/models/PopularResponse.dart';
import 'package:movies_app/screens/movie_details_screen/moreLike_tab/moreLike_widget.dart';

import '../../../apiManager/api_manager.dart';
import '../../../themes/themes.dart';

class MoreLikeTab extends StatelessWidget {
  Results results;
  MoreLikeTab(this.results);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LikeMoviesResponse>(
        future: ApiManager.likeMovies(results.id??0),
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return Center(child: Text(snapshot.data?.statusMessage ?? ''));
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: CircularProgressIndicator(color: MyThemeData.lightBlack,),);
      }
      var likeMovies = snapshot.data;
      return ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => MoreLikeWidget(likeMovies!.results![index]),
          itemCount: likeMovies?.results?.length
      );
    }
    );
  }
}

