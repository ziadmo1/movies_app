import 'package:flutter/material.dart';
import 'package:movies_app/models/CategoryResponse.dart';

class CategoryScreenWidget extends StatelessWidget {
  Genres category;
  CategoryScreenWidget(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: (){},
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://amc-theatres-res.cloudinary.com/image/upload/f_auto,fl_lossy,h_465,q_auto,w_310/v1653402156/amc-cdn/production/2/movies/56500/56479/PosterDynamic/138773.jpg',
                  width: 180,
                  height: 140,
                  fit: BoxFit.fill,
                )),
            Container(
              color: Color.fromRGBO(1, 1, 1, 0.3),
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              child: Text(
                category.name??'',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
