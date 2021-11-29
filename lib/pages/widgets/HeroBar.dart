import 'package:flutter/material.dart';
import 'package:ihaa/theme.dart';

class HeroBar extends StatelessWidget {
  final title;
  final subtitle;
  final description;
  final image;

  HeroBar({
    this.title,
    this.subtitle,
    this.description,
    this.image,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
          bottom: defaultmargin,
        ),
        height: MediaQuery.of(context).size.height * 0.33,
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor1,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        padding: EdgeInsets.only(
          top: defaultmargin,
          left: defaultmargin,
          right: 20,
          bottom: defaultmargin,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.23,
              width: MediaQuery.of(context).size.width * 0.55,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: heroTextStyle.copyWith(
                      fontSize: 32,
                      fontWeight: semibold,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: heroTextStyle.copyWith(
                      fontSize: 32,
                      fontWeight: semibold,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    description,
                    style: heroTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: light,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 3,
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              width: MediaQuery.of(context).size.width * 0.28,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(image),
              )),
            )
          ],
        ));
  }
}
