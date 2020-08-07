import 'package:flutter/material.dart';
import 'package:covtrac/pages/homepage.dart';

void main() => runApp(CovTrac());

class CovTrac extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CovTrac',
      theme: ThemeData(
        primaryColor: Color(0xff070335),
        accentColor: Color(0xffCCF0FD),
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
