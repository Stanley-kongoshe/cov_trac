import 'package:flutter/material.dart';
import 'package:covtrac/models/covid19_stats.dart';
import 'package:http/http.dart' as http;

void setupData() async {
  final String country = 'Sri Lanka'; // Enter a Country

  CovidStat instance = CovidStat(country);
  await instance.getAllCovidInfo();

  print(instance.results);
}

class CovidUpdate extends StatefulWidget {
  @override
  _CovidUpdateState createState() => _CovidUpdateState();
}

class _CovidUpdateState extends State<CovidUpdate> {
  @override
  void initState() {
    super.initState();
    setupData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Center(
          child: RaisedButton(
            onPressed: () {},
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
