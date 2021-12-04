import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:ihaa/pages/widgets/HeroBar.dart';
import 'package:ihaa/pages/widgets/VirusCaseCard.dart';
import 'package:ihaa/theme.dart';
import 'package:intl/intl.dart';

Future<Virus> fetchVirus() async {
  final response = await http.get(
      Uri.parse('https://apicovid19indonesia-v2.vercel.app/api/indonesia'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Virus.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Virus Data');
  }
}

Future<Daily> fetchDaily() async {
  final response = await http.get(Uri.parse(
      'https://apicovid19indonesia-v2.vercel.app/api/indonesia/more'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var json = jsonDecode(response.body);
    var data = (json as Map<String, dynamic>)['penambahan'];
    return Daily.fromJson(data);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Daily Data');
  }
}

class Virus {
  final int positif;
  final int quarantine;
  final int healed;
  final int death;
  final String date;

  Virus(
      {required this.positif,
      required this.quarantine,
      required this.healed,
      required this.death,
      required this.date});

  factory Virus.fromJson(Map<String, dynamic> json) {
    return Virus(
      positif: json['positif'],
      quarantine: json['dirawat'],
      healed: json['sembuh'],
      death: json['meninggal'],
      date: json['lastUpdate'],
    );
  }
}

class Daily {
  final int positif;
  final int quarantine;
  final int healed;
  final int death;

  Daily({
    required this.positif,
    required this.quarantine,
    required this.healed,
    required this.death,
  });

  factory Daily.fromJson(Map<String, dynamic> json) {
    return Daily(
      positif: json['positif'],
      quarantine: json['dirawat'],
      healed: json['sembuh'],
      death: json['meninggal'],
    );
  }
}

class VirusPage extends StatefulWidget {
  @override
  _VirusPageState createState() => _VirusPageState();
}

class _VirusPageState extends State<VirusPage> {
  late Future<Virus> futureVirus;
  late Future<Daily> futureDaily;
  final formatter = NumberFormat('###,###,###');

  @override
  void initState() {
    super.initState();
    futureVirus = fetchVirus();
    futureDaily = fetchDaily();
  }

  Widget build(BuildContext context) {
    Widget header() {
      return HeroBar(
        title: 'Keep safe and',
        subtitle: 'stay at home',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Magna fusce sed.',
        image: 'assets/Hero2.png',
      );
    }

    Widget dailyCase() {
      return FutureBuilder<Daily>(
        future: futureDaily,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                left: defaultmargin,
                right: defaultmargin,
                top: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Daily Case',
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semibold,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          height: MediaQuery.of(context).size.height * 0.26,
                          width: MediaQuery.of(context).size.height * 0.20,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xffA4DEAD),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  (formatter.format(snapshot.data!.healed))
                                      .toString(),
                                  style: blackTextStyle.copyWith(
                                      fontSize: 36,
                                      fontWeight: semibold,
                                      color: Color(0xffA4DEAD)),
                                ),
                                Text(
                                  'Healed',
                                  style: blackTextStyle.copyWith(
                                    fontSize: 22,
                                    fontWeight: medium,
                                    color: Color(0xffA4DEAD),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          height: MediaQuery.of(context).size.height * 0.26,
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xffC56E90),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          (formatter.format(
                                                  snapshot.data!.positif))
                                              .toString(),
                                          style: blackTextStyle.copyWith(
                                            fontWeight: semibold,
                                            fontSize: 26,
                                            color: Color(0xffC56E90),
                                          ),
                                        ),
                                        Text(
                                          'Positive',
                                          style: blackTextStyle.copyWith(
                                            fontWeight: medium,
                                            fontSize: 18,
                                            color: Color(0xffC56E90),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 14,
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xff585A63),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          (formatter
                                                  .format(snapshot.data!.death))
                                              .toString(),
                                          style: blackTextStyle.copyWith(
                                            fontWeight: semibold,
                                            fontSize: 26,
                                            color: Color(0xff585A63),
                                          ),
                                        ),
                                        Text(
                                          'Death',
                                          style: blackTextStyle.copyWith(
                                            fontWeight: medium,
                                            fontSize: 18,
                                            color: Color(0xff585A63),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
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

    Widget statusDate() {
      return FutureBuilder<Virus>(
        future: futureVirus,
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
                      fontSize: 18,
                      fontWeight: semibold,
                    ),
                  ),
                  Text(
                    (snapshot.data!.date).substring(0, 10),
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: regular,
                    ),
                  )
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return Text('');
        },
      );
    }

    Widget statusContent() {
      return Container(
        margin: EdgeInsets.only(
          top: 25,
          left: defaultmargin,
          right: defaultmargin,
        ),
        child: FutureBuilder<Virus>(
          future: futureVirus,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cumulative Case',
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semibold,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    VirusCaseCard(
                      bgColor: 0xffFFDFD3,
                      title: 'Quarantine / Active Case',
                      totalCase: (formatter.format(snapshot.data!.quarantine))
                          .toString(),
                    ),
                    VirusCaseCard(
                      bgColor: 0xffC7CEEA,
                      title: 'Positif Case',
                      totalCase:
                          (formatter.format(snapshot.data!.positif)).toString(),
                    ),
                    VirusCaseCard(
                      bgColor: 0xffB5EAD7,
                      title: 'Healed',
                      totalCase:
                          (formatter.format(snapshot.data!.healed)).toString(),
                    ),
                    VirusCaseCard(
                      bgColor: 0xffDD8DA6,
                      title: 'Death',
                      totalCase:
                          (formatter.format(snapshot.data!.death)).toString(),
                    ),
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
        ),
      );
    }

    return ListView(
      children: [
        header(),
        statusDate(),
        dailyCase(),
        statusContent(),
      ],
    );
  }
}
