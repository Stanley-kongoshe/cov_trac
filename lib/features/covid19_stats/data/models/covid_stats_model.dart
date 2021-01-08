import 'package:covtrac/features/covid19_stats/domain/entities/covid_stats.dart';
import 'package:meta/meta.dart';

class CovidStatsModel extends CovidStats {
  CovidStatsModel(
      {@required String country,
      @required String flag,
      @required int cases,
      @required int todayCases,
      @required int deaths,
      @required int todayDeaths,
      @required int recovered,
      @required int active,
      @required int critical})
      : super(
            country: country,
            flag: flag,
            cases: cases,
            todayCases: todayCases,
            deaths: deaths,
            todayDeaths: todayDeaths,
            recovered: recovered,
            active: active,
            critical: critical);

  factory CovidStatsModel.fromJson(Map<String, dynamic> json) {
    return CovidStatsModel(
      country: json['country'],
      flag: json['countryInfo']['flag'],
      cases: (json['cases'] as num).toInt(),
      todayCases: (json['todayCases'] as num).toInt(),
      deaths: (json['deaths'] as num).toInt(),
      todayDeaths: (json['todayDeaths'] as num).toInt(),
      recovered: (json['recovered'] as num).toInt(),
      active: (json['active'] as num).toInt(),
      critical: (json['critical'] as num).toInt(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'country': country,
      'flag': flag,
      'cases': cases,
      'todayCases': todayCases,
      'deaths': deaths,
      'todayDeaths': todayDeaths,
      'recovered': recovered,
      'active': active,
      'critical': critical,
    };
  }
}
