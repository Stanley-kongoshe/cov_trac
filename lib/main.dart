import 'package:covtrac/features/covid19_stats/presentation/pages/covid_stats_page.dart';
import 'package:flutter/material.dart';
import 'package:covtrac/pages/homepage.dart';
import 'package:covtrac/pages/update_page.dart';
import 'package:covtrac/pages/covid19_education.dart';
import 'package:covtrac/pages/testing_centre.dart';
import 'package:covtrac/pages/precautions.dart';
import 'package:covtrac/pages/testing_procedures.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(CovTrac());
}

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
      routes: {
        '/': (context) => CovidStatsPage(),
        '/stats': (context) => CovidUpdate(),
        '/testing_centre': (context) => TestingCentre(),
        '/precautions': (context) => Precautions(),
        '/testing_procedures': (context) => TestingProcedures(),
        '/covid19_education': (context) => Covid19Education(),
      },
    );
  }
}
