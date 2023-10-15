import 'package:flutter/material.dart';

class radio_tab extends StatelessWidget {
  static const String RouteName = "radio_tab";

  const radio_tab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 60,
          ),
          Image.asset("assets/images/radio_image.png"),
          Text(
            "إذاعه القران الكريم",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.skip_previous,
                size: 50,
              ),
              Icon(
                Icons.play_arrow,
                size: 50,
              ),
              Icon(
                Icons.skip_next,
                size: 50,
              ),
            ],
          )
        ],
      ),
    );
  }
}
