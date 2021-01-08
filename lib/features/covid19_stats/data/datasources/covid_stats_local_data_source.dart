import 'dart:convert';

import 'package:covtrac/features/core/error/exceptions.dart';
import 'package:covtrac/features/covid19_stats/data/models/covid_stats_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart';

abstract class CovidStatsLocalDataSource {
  /// Gets the cached [CovidStatsModel] which was gotten last time
  /// the user hd an internet connection.
  ///
  /// Throws [NoLocalDataException] if no cached data is present
  Future<CovidStatsModel> getLastCovidStats();

  Future<void> cacheCovidStats(CovidStatsModel statsToCache);
}

const CACHED_COVID_COUNTRY = 'CACHED_COVID_COUNTRY';

class CovidStatsLocalDataSourceImpl implements CovidStatsLocalDataSource {
  final SharedPreferences sharedPreferences;

  CovidStatsLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<void> cacheCovidStats(CovidStatsModel statsToCache) {
    return sharedPreferences.setString(
      CACHED_COVID_COUNTRY,
      json.encode(
        statsToCache.toJson(),
      ),
    );
  }

  @override
  Future<CovidStatsModel> getLastCovidStats() {
    final jsonCovidStats = sharedPreferences.getString(CACHED_COVID_COUNTRY);
    if (jsonCovidStats != null) {
      return Future.value(
        CovidStatsModel.fromJson(
          json.decode(jsonCovidStats),
        ),
      );
    } else {
      throw CacheException();
    }
  }
}
