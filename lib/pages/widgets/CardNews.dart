import 'package:flutter/material.dart';
import 'package:ihaa/theme.dart';

class CardNews extends StatelessWidget {
  final imgUrl;
  final title;

  CardNews({this.imgUrl, this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, right: 10),
      padding: EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 18,
      ),
      height: 120,
      width: 225,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imgUrl),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.30),
            BlendMode.darken,
          ),
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            title,
            style: heroTextStyle.copyWith(
              fontSize: 12,
              fontWeight: semibold,
            ),
          )
        ],
      ),
    );
  }
}
