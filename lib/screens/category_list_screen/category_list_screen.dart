import 'package:flutter/material.dart';
import 'package:movies_app/models/CategoryListResponse.dart';
import 'package:movies_app/screens/category_list_screen/category_screen_widget.dart';

import '../../apiManager/api_manager.dart';
import '../../models/CategoryResponse.dart';
import '../../themes/themes.dart';

class CategoryListScreen extends StatelessWidget {
  static const String routeName = 'catList';

  @override
  Widget build(BuildContext context) {
    Genres category = ModalRoute.of(context)?.settings.arguments as Genres;
    return Scaffold(
        appBar: AppBar(
        title: Text(category.name??''),
    ),
      body: FutureBuilder<CategoryListResponse>(
        future: ApiManager.categoryList(category.id??0),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.data?.statusMessage ?? ''));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: MyThemeData.lightBlack,
              ),
            );
          }
          var catList = snapshot.data;
          return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  CategoryListWidget(catList!.results![index]),
              itemCount: catList?.results?.length
          );
        },
      )
    );
  }
}
