import 'package:flutter/material.dart';
import 'package:ihaa/pages/widgets/HeroBar.dart';
import 'package:ihaa/pages/widgets/VirusCaseCard.dart';
import 'package:ihaa/theme.dart';

class VirusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return HeroBar(
        title: 'Keep safe &',
        subtitle: 'stay home',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Magna fusce sed.',
        image: 'assets/Hero2.png',
      );
    }

    Widget statusDate() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultmargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Last Update',
              style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: semibold,
              ),
            ),
            Text(
              '23-09-2021',
              style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: regular,
              ),
            )
          ],
        ),
      );
    }

    Widget statusContent() {
      return Container(
        margin: EdgeInsets.only(
          top: 25,
          left: defaultmargin,
          right: defaultmargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VirusCaseCard(
              bgColor: 0xffC7CEEA,
              title: 'Positif Case',
              totalCase: '277,553',
            ),
            VirusCaseCard(
              bgColor: 0xffB5EAD7,
              title: 'Healed',
              totalCase: '243,650',
            ),
            VirusCaseCard(
              bgColor: 0xffDD8DA6,
              title: 'Death',
              totalCase: '3672',
            ),
          ],
        ),
      );
    }

    return ListView(
      children: [
        header(),
        statusDate(),
        statusContent(),
      ],
    );
  }
}
