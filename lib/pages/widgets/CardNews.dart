import 'package:flutter/material.dart';
import 'package:ihaa/theme.dart';
import 'package:url_launcher/url_launcher.dart';

// const _url = link;

class CardNews extends StatelessWidget {
  final imgUrl;
  final title;
  late final link;

  CardNews({this.imgUrl, this.title, this.link});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _launchSite(link),
      child: Container(
        margin: EdgeInsets.only(top: 20, right: 10),
        padding: EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 18,
        ),
        height: 120,
        width: 225,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imgUrl),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.30),
              BlendMode.darken,
            ),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
              style: heroTextStyle.copyWith(
                fontSize: 14,
                fontWeight: semibold,
              ),
            )
          ],
        ),
      ),
    );
  }
}

_launchSite(String _site) async => await canLaunch(_site)
    ? await launch(_site)
    : throw 'Could not launch $_site';
