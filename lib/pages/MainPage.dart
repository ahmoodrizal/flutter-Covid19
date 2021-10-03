import 'package:flutter/material.dart';
import 'package:ihaa/pages/HomePage.dart';
import 'package:ihaa/pages/VaccinePage.dart';
import 'package:ihaa/pages/VirusPage.dart';
import 'package:ihaa/theme.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  Widget customNavBar() {
    return DotNavigationBar(
      enableFloatingNavBar: true,
      dotIndicatorColor: backgroundColor1,
      borderRadius: 14,
      marginR: EdgeInsets.symmetric(
        vertical: defaultmargin,
        horizontal: defaultmargin,
      ),
      paddingR: EdgeInsets.only(
        top: 4,
        bottom: 4,
        left: 8,
        right: 8,
      ),
      currentIndex: currentIndex,
      backgroundColor: bottomNavColor,
      onTap: (value) {
        print('Page ' + value.toString());
        setState(() {
          currentIndex = value;
        });
      },
      items: [
        DotNavigationBarItem(
          icon: Container(
            width: 22,
            child: Image.asset(
                currentIndex == 0 ? 'assets/Home_On.png' : 'assets/Home.png'),
          ),
          selectedColor: backgroundColor1,
        ),
        DotNavigationBarItem(
          icon: Container(
            width: 22,
            child: Image.asset(
                currentIndex == 1 ? 'assets/Virus_On.png' : 'assets/Virus.png'),
          ),
          selectedColor: backgroundColor1,
        ),
        DotNavigationBarItem(
          icon: Container(
            width: 22,
            child: Image.asset(currentIndex == 2
                ? 'assets/Vaccine_On.png'
                : 'assets/Vaccine.png'),
          ),
          selectedColor: backgroundColor1,
        ),
      ],
    );
  }

  // ignore: override_on_non_overriding_member
  Widget body() {
    switch (currentIndex) {
      case 0:
        return HomePage();
        // ignore: dead_code
        break;
      case 1:
        return VirusPage();
        // ignore: dead_code
        break;
      case 2:
        return VaccinePage();
        // ignore: dead_code
        break;
      default:
        return HomePage();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
      extendBody: true,
      bottomNavigationBar: customNavBar(),
    );
  }
}
