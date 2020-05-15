import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'first_page.dart';
import 'second_page.dart';
import 'third_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Welcome(),
    ),
  );
  SystemChrome.setEnabledSystemUIOverlays([]);
}

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  int currentPageIndex;
  int pageLength;

  @override
  void initState() {
    currentPageIndex = 0;
    pageLength = 3;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: <Widget>[
              PageView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  FirstPage(),
                  SecondPage(),
                  ThirdPage(),
                ],
                onPageChanged: (value) {
                  setState(() {
                    currentPageIndex = value;
                  });
                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new DotsIndicator(
                      dotsCount: pageLength,
                      position: currentPageIndex.toDouble(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
