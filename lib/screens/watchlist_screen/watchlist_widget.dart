import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WatchlistWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 10),
      child: Row(
        children: [
          Image.network(
            'https://flxt.tmsimg.com/assets/p18099_p_v8_an.jpg',
            width: 100,
            height: 100,
            fit: BoxFit.fill,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Alita Batel Angel',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w500)),
              Text(
                '2020',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                'Rosa Salazar',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          )
        ],
      ),
    );
  }
}
