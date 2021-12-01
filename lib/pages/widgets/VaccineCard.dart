import 'package:flutter/material.dart';
import 'package:ihaa/theme.dart';

class VaccineCard extends StatelessWidget {
  final bgColor;
  final title;
  final subtitle;
  final totalPercent;

  VaccineCard({
    this.bgColor,
    this.title,
    this.subtitle,
    this.totalPercent,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 14,
      ),
      height: MediaQuery.of(context).size.height * 0.170,
      decoration: BoxDecoration(
        color: Color(bgColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: semibold,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            subtitle,
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semibold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            totalPercent + '%',
            style: blackTextStyle.copyWith(
              fontSize: 24,
              fontWeight: semibold,
            ),
          )
        ],
      ),
    );
  }
}
