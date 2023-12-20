import 'package:flutter/material.dart';
import 'package:reprohealth_app/theme/theme.dart';

class TermandConditionWidget extends StatelessWidget {
  final String appbarTitle;
  final String title;
  final String subtitle1;
  final String subtitle2;
  final String subtitle3;
  final String subtitle4;
  final String subtitle5;
  final String subtitle6;
  final String date;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  final String text6;
  const TermandConditionWidget({super.key, required this.text1, required this.text2, required this.text3, required this.text4, required this.text5, required this.text6, required this.title, required this.subtitle1, required this.subtitle2, required this.subtitle3, required this.subtitle4, required this.subtitle5, required this.subtitle6, required this.date, required this.appbarTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE9E9E9),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: grey10,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: secondary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        titleSpacing: 0,
        title: Text(appbarTitle,
        style: semiBold16Primary4,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 1),
        child: ListView(
          children: [
            Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              height: 1250,
              decoration: const BoxDecoration(
                color: Color(0xFFFAFAFA),
                ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Align(
                    alignment: Alignment.center,
                    child: Text(title,
                    style: semiBold14Grey500,
                    textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.center,
                    child: Text(date,
                    style: regular12Grey500,
                    textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(subtitle1,
                    style: medium12Grey500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 18, bottom: 8),
                    child: Text(text1,
                    textAlign: TextAlign.justify,
                    style: regular12Grey500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(subtitle2,
                    style: medium12Grey500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 21, bottom: 8),
                    child: Text(text2,
                    textAlign: TextAlign.justify,
                    style: regular12Grey500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(subtitle3,
                    style: medium12Grey500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 22, bottom: 8),
                    child: Text(text3,
                    textAlign: TextAlign.justify,
                    style: regular12Grey500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(subtitle4,
                    style: medium12Grey500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 22, bottom: 8),
                    child: Text(text4,
                    textAlign: TextAlign.justify,
                    style: regular12Grey500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(subtitle5,
                    style: medium12Grey500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 22, bottom: 8),
                    child: Text(text5,
                    textAlign: TextAlign.justify,
                    style: regular12Grey500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(subtitle6,
                    style: medium12Grey500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 22, bottom: 8),
                    child: Text(text6,
                    textAlign: TextAlign.justify,
                    style: regular12Grey500,
                    ),
                  ),
                ],
              ),
            ),
          ]
        ),
      )
    );
  }
}