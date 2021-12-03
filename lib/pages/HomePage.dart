import 'package:flutter/material.dart';
import 'package:ihaa/pages/widgets/CardNews.dart';
import 'package:ihaa/pages/widgets/CardSymptoms.dart';
import 'package:ihaa/theme.dart';

import 'package:url_launcher/url_launcher.dart';

const _url = 'tel:119';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        height: MediaQuery.of(context).size.height * 0.330,
        width: double.infinity,
        decoration: BoxDecoration(
            color: backgroundColor1,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            )),
        padding: EdgeInsets.all(defaultmargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Indonesian Health',
              style: heroTextStyle.copyWith(
                fontSize: 32,
                fontWeight: semibold,
              ),
            ),
            Text(
              'Authorities',
              style: heroTextStyle.copyWith(
                fontSize: 32,
                fontWeight: semibold,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Magna fusce sed. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Magna fusce sed.',
              style: heroTextStyle.copyWith(
                fontSize: 14,
                fontWeight: light,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: _launchCall,
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.42,
                  height: MediaQuery.of(context).size.height * 0.030,
                  decoration: BoxDecoration(
                    color: Color(0xffFF7070),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Call an Emergency',
                      style: heroTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: semibold,
                      ),
                    ),
                  )),
            ),
          ],
        ),
      );
    }

    Widget statusArea() {
      return Container(
        margin: EdgeInsets.only(
          top: 25,
          left: defaultmargin,
          right: defaultmargin,
          bottom: 25,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 26,
                  width: 26,
                  child: Image.asset('assets/Map.png'),
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  'Cibeunying, Kab Bandung',
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: bold,
                  ),
                  overflow: TextOverflow.fade,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 28,
              decoration: BoxDecoration(
                color: Color(0xff4BC088),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Green Zone Area, Follow Health Protocol',
                  style: heroTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget latestNews() {
      return Container(
        margin: EdgeInsets.only(
          bottom: 25,
          left: defaultmargin,
          right: defaultmargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Latest News',
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semibold,
                  ),
                )
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CardNews(
                    link: 'https://www.asahi.com/ajw/articles/14492149',
                    imgUrl: 'assets/News2.jpg',
                    title:
                        'South Korea Donate 4.7 million dose of COVAX to North Korea',
                  ),
                  CardNews(
                    link: 'https://blog.vantagecircle.com/work-from-home-tips/',
                    imgUrl: 'assets/News1.png',
                    title: 'Here are tips to stay at home while quarantine',
                  ),
                  CardNews(
                    link:
                        'https://www.cdc.gov/coronavirus/2019-ncov/travelers/proof-of-vaccination.html',
                    imgUrl: 'assets/News3.png',
                    title:
                        'Now you must have a vaccine certificate when traveling.',
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget covidSymptoms() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultmargin,
          right: defaultmargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Corona Virus-19',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semibold,
              ),
            ),
            Text(
              'Symptoms',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semibold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CardSymptoms(
              boxColor: 0xffC7CEEA,
              boxImage: 'assets/Symptoms1.png',
              boxTitle: 'High Fever',
              boxDesc:
                  'Fever usually appears in people infected with Covid-19, with a temperature of more than 37.7 degrees Celsius.',
            ),
            CardSymptoms(
              boxColor: 0xffFFDAC1,
              boxImage: 'assets/Symptoms2.png',
              boxTitle: 'Dry Cough',
              boxDesc:
                  'Cough that occurs is a dry cough, which does not remove mucus or phlegm from the respiratory tract.',
            ),
            CardSymptoms(
              boxColor: 0xffFFB7B2,
              boxImage: 'assets/Symptoms3.png',
              boxTitle: 'Tiredness',
              boxDesc:
                  'Extreme fatigue is a sign of the immune response to an infection, so the body feels tired.',
            ),
            CardSymptoms(
              boxColor: 0xffB5EAD7,
              boxImage: 'assets/Symptoms4.png',
              boxTitle: 'Difficult Breathing',
              boxDesc:
                  'Shortness of breath usually appears as a sign of the disease reaching a serious stage.',
            ),
          ],
        ),
      );
    }

    return ListView(
      children: [
        header(),
        statusArea(),
        latestNews(),
        covidSymptoms(),
      ],
    );
  }
}

void _launchCall() async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
