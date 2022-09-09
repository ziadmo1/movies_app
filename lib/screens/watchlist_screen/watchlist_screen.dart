import 'package:flutter/material.dart';
import 'package:movies_app/screens/watchlist_screen/watchlist_widget.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 60),
            child: Text(
                'Watchlist',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
          ),
          Expanded(
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              separatorBuilder: (context, index) => Divider(height: 2, color: Colors.grey,),
                itemCount: 20,
                itemBuilder: (context, i)=> WatchlistWidget(),
          ),
          )
        ],
      ),
    );
  }
}
