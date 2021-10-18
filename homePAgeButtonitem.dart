//musa
import 'package:dhbt_okulu/constants/color.dart';
import 'package:dhbt_okulu/model/navbar_provider.dart';
import 'package:dhbt_okulu/screen/score_calculation.dart';
import 'package:dhbt_okulu/screen/seminars.dart';
import 'package:dhbt_okulu/screen/trial_exam.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/home_page_button.dart';

class HomeButtonItem extends StatelessWidget {
  final int index;
  HomeButtonItem(this.index);

  final String _url = "https://www.instagram.com/dhbtokulu/?hl=tr";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      // color: Colors.red,
      child: OutlinedButton(
        onPressed: () {
          if (index == 0) {
            selectedNotify.onItemTapped(1);
          } else if (index == 1) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const TrialExam()));
          } else if (index == 2) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const ScoreCalculation()));
                        //burası çekiliş sayfasına gidcek
          } else if (index == 3) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const TrialExam()));
          } else if (index == 4) {
            _launchURL();
          } else if (index == 5) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const Seminars()));
          }
        },
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
              child: Icon(homebuttonList[index].icons, color: FixedColor().color3, size: 40,),
              ),
            Text(homebuttonList[index].text, style: TextStyle(color: FixedColor().color4),)
          ],
        ),
      ),
    );
  }
  void _launchURL() async => await launch(_url);
}
