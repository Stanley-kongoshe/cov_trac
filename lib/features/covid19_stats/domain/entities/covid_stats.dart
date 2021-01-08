import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class CovidStats extends Equatable {
  final String country;
  final String flag;
  final int cases;
  final int todayCases;
  final int deaths;
  final int todayDeaths;
  final int recovered;
  final int active;
  final int critical;

  CovidStats(
      {@required this.country,
      @required this.flag,
      @required this.cases,
      @required this.todayCases,
      @required this.deaths,
      @required this.todayDeaths,
      @required this.recovered,
      @required this.active,
      @required this.critical})
      : super([
          country,
          flag,
          cases,
          todayCases,
          deaths,
          todayDeaths,
          recovered,
          active,
          critical
        ]);
}
