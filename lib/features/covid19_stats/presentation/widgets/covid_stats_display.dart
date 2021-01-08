import 'package:covtrac/features/covid19_stats/domain/entities/covid_stats.dart';
import 'package:flutter/material.dart';

class StatsDisplay extends StatelessWidget {
  final CovidStats covidStats;
  const StatsDisplay({
    Key key,
    @required this.covidStats,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.8,
      // ignore: missing_return
      child: Center(
        child: Column(
          children: <Widget>[
            Center(
              child: Text(
                covidStats.country.toString().toUpperCase(),
                style: TextStyle(
                  fontSize: 40,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 2.5,
                bottom: 2.5,
              ),
            ),
            Center(
              child: Container(
                height: 60.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).accentColor,
                    width: 1.0,
                  ),
                ),
                child: Image(
                  image: NetworkImage(
                    this.covidStats.flag,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
            ),
            Center(
              child: Text(
                'Cases : ' + covidStats.cases.toString(),
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 4,
                bottom: 4,
              ),
            ),
            Center(
              child: Text(
                'Today Cases : ' + covidStats.todayCases.toString(),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 4,
                bottom: 4,
              ),
            ),
            Center(
              child: Text(
                'Deaths : ' + covidStats.deaths.toString(),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 4.0,
                bottom: 4.0,
              ),
            ),
            Center(
              child: Text(
                'Today Deaths : ' + covidStats.todayDeaths.toString(),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.redAccent,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 4.0,
                bottom: 4.0,
              ),
            ),
            Center(
              child: Text(
                'Recovered : ' + covidStats.recovered.toString(),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 5.0,
                bottom: 5.0,
              ),
            ),
            Center(
              child: Text(
                'Active Cases : ' + covidStats.active.toString(),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.orange,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 4.0,
                bottom: 4.0,
              ),
            ),
            Center(
              child: Text(
                'Critical : ' + covidStats.critical.toString(),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.orangeAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
