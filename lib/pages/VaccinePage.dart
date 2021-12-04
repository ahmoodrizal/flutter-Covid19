import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ihaa/pages/widgets/HeroBar.dart';
import 'package:ihaa/pages/widgets/VaccineCard.dart';
import 'package:ihaa/theme.dart';
import 'package:intl/intl.dart';

Future<Vaccine> fetchVaccine() async {
  final response = await http
      .get(Uri.parse('https://vaksincovid19-api.vercel.app/api/vaksin'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Vaccine.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Vaccine Data');
  }
}

class Vaccine {
  final int total;
  final int vaksin1;
  final int vaksin2;
  final String date;

  Vaccine(
      {required this.total,
      required this.vaksin1,
      required this.vaksin2,
      required this.date});

  factory Vaccine.fromJson(Map<String, dynamic> json) {
    return Vaccine(
      total: json['totalsasaran'],
      vaksin1: json['vaksinasi1'],
      vaksin2: json['vaksinasi2'],
      date: json['lastUpdate'],
    );
  }
}

class VaccinePage extends StatefulWidget {
  @override
  _VaccinePageState createState() => _VaccinePageState();
}

class _VaccinePageState extends State<VaccinePage> {
  late Future<Vaccine> futureVaccine;
  final formatter = NumberFormat('###,###,000');

  @override
  void initState() {
    super.initState();
    futureVaccine = fetchVaccine();
  }

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
      return FutureBuilder<Vaccine>(
        future: futureVaccine,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
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
                    (snapshot.data!.date).substring(0, 10),
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  )
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Center(
            child: Text(''),
          );
        },
      );
    }

    Widget statusContent() {
      return FutureBuilder<Vaccine>(
        future: futureVaccine,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
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
                          (formatter.format(snapshot.data!.total)).toString() +
                              ' person',
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
                            subtitle: (formatter.format(snapshot.data!.vaksin1))
                                    .toString() +
                                ' person',
                            totalPercent: ((snapshot.data!.vaksin1 /
                                        snapshot.data!.total) *
                                    100)
                                .toString()
                                .substring(0, 5),
                          )),
                      SizedBox(
                        width: 12,
                      ),
                      Expanded(
                          flex: 1,
                          child: VaccineCard(
                            bgColor: 0xffB5EAD7,
                            title: 'Vaccine dose 2',
                            subtitle: (formatter.format(snapshot.data!.vaksin2))
                                    .toString() +
                                ' person',
                            totalPercent: ((snapshot.data!.vaksin2 /
                                        snapshot.data!.total) *
                                    100)
                                .toString()
                                .substring(0, 5),
                          )),
                    ],
                  )
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Center(
            child: Text(
              'Fetching Data . . .',
              style: blackTextStyle.copyWith(
                fontSize: 28,
                fontWeight: medium,
              ),
            ),
          );
        },
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
