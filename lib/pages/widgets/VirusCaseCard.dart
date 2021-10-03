import 'package:flutter/material.dart';
import 'package:ihaa/theme.dart';

class VirusCaseCard extends StatelessWidget {
  final bgColor;
  final title;
  final totalCase;

  VirusCaseCard({
    this.bgColor,
    this.title,
    this.totalCase,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: double.infinity,
      height: 90,
      padding: EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: Color(bgColor),
        borderRadius: BorderRadius.circular(12),
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
            height: 8,
          ),
          Text(
            totalCase + ' case',
            style: blackTextStyle.copyWith(
              fontSize: 22,
              fontWeight: semibold,
            ),
          )
        ],
      ),
    );
  }
}
