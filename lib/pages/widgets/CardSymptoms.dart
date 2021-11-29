import 'package:flutter/material.dart';
import 'package:ihaa/theme.dart';

class CardSymptoms extends StatelessWidget {
  final boxColor;
  final boxTitle;
  final boxDesc;
  final boxImage;

  const CardSymptoms(
      {this.boxColor, this.boxTitle, this.boxDesc, this.boxImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 18,
            ),
            decoration: BoxDecoration(
              color: Color(boxColor),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(
              boxImage,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    boxTitle,
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semibold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    boxDesc,
                    style: blackTextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: regular,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
