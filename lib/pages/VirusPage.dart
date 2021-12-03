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

class VirusPage extends StatefulWidget {
  @override
  _VirusPageState createState() => _VirusPageState();
}

class _VirusPageState extends State<VirusPage> {
  late Future<Virus> futureVirus;
  final formatter = NumberFormat('###,###,000');

  @override
  void initState() {
    super.initState();
    futureVirus = fetchVirus();
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

    Widget statusDate() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultmargin),
        child: FutureBuilder<Virus>(
          future: futureVirus,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
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
                        fontWeight: regular,
                      ),
                    )
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const CircularProgressIndicator();
          },
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
        child: FutureBuilder<Virus>(
          future: futureVirus,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VirusCaseCard(
                      bgColor: 0xffC7CEEA,
                      title: 'Positif Case',
                      totalCase:
                          (formatter.format(snapshot.data!.positif)).toString(),
                    ),
                    VirusCaseCard(
                      bgColor: 0xffFFDFD3,
                      title: 'Quarantine / Active Case',
                      totalCase: (formatter.format(snapshot.data!.quarantine))
                          .toString(),
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

            return const CircularProgressIndicator();
          },
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
