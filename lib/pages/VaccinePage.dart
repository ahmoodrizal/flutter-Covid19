import 'package:flutter/material.dart';

import 'package:ihaa/pages/widgets/HeroBar.dart';
import 'package:ihaa/pages/widgets/VaccineCard.dart';
import 'package:ihaa/theme.dart';

class VaccinePage extends StatefulWidget {
  @override
  _VaccinePageState createState() => _VaccinePageState();
}

class _VaccinePageState extends State<VaccinePage> {
  @override
  void initState() {
    getInit();

    super.initState();
  }

  getInit() async {}

  Widget build(BuildContext context) {
    Widget header() {
      return HeroBar(
        title: "Let's get",
        subtitle: 'vaccinated',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Magna fusce sed.',
        image: 'assets/Hero3.png',
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
          bottom: 20,
          left: defaultmargin,
          right: defaultmargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 12,
              ),
              height: MediaQuery.of(context).size.height * 0.120,
              decoration: BoxDecoration(
                color: Color(0xffC7CEEA),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Target Vaccinated',
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semibold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '208,265,720' + ' person',
                    style: blackTextStyle.copyWith(
                      fontSize: 26,
                      fontWeight: semibold,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: VaccineCard(
                      bgColor: 0xffFFB7B2,
                      title: 'Vaccine dose 1',
                      subtitle: '82,728,114',
                      totalPercent: '39,72',
                    )),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                    flex: 1,
                    child: VaccineCard(
                      bgColor: 0xffB5EAD7,
                      title: 'Vaccine dose 2',
                      subtitle: '46,772,428',
                      totalPercent: '22,46',
                    )),
              ],
            )
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
