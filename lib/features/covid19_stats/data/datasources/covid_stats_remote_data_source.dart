import 'dart:convert';

import 'package:covtrac/features/core/error/exceptions.dart';
import 'package:covtrac/features/covid19_stats/data/models/covid_stats_model.dart';
import 'package:http/http.dart' as http;

abstract class CovidStatsRemoteDataSource {
  /// Calls the https://disease.sh/v3/covid-19/countries/{country}?strict=true endpoint
  ///
  /// Throws a [ServerException] for all the error codes.
  Future<CovidStatsModel> getCountryStats(String country);
}

class CovidStatsRemoteDataSourceImpl implements CovidStatsRemoteDataSource {
  final http.Client client;

  CovidStatsRemoteDataSourceImpl({this.client});

  @override
  Future<CovidStatsModel> getCountryStats(String country) async {
    final response = await client.get(
      'https://disease.sh/v3/covid-19/countries/$country',
    );
    if (response.statusCode == 200) {
      try {
        return CovidStatsModel.fromJson(jsonDecode(response.body));
      } on Exception {
        throw CountryNotFoundException();
      }
    } else {
      throw ServerException();
    }
  }
}
