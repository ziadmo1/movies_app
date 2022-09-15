import 'package:flutter/material.dart';
import 'package:movies_app/models/LikeMoviesResponse.dart';
import 'package:movies_app/models/PopularResponse.dart';
import 'package:movies_app/screens/movie_details_screen/moreLike_tab/moreLike_widget.dart';
import '../../../apiManager/api_manager.dart';
import '../../../themes/themes.dart';

class MoreLikeTab extends StatefulWidget {
  int id;
  Results results;
  MoreLikeTab(this.id,this.results);

  @override
  State<MoreLikeTab> createState() => _MoreLikeTabState();
}

class _MoreLikeTabState extends State<MoreLikeTab> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LikeMoviesResponse>(
        future: ApiManager.likeMovies(widget.id),
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return Center(child: Text(snapshot.data?.statusMessage ?? ''));
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: CircularProgressIndicator(color: Colors.yellow,),);
      }
      var likeMovies = snapshot.data;
      return ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => InkWell(
              onTap: (){
                widget.results = likeMovies!.results![index];
                setState(() {

                });
              },
              child: MoreLikeWidget(likeMovies!.results![index])),
          itemCount: likeMovies?.results?.length
      );
    }
    );
  }
}

