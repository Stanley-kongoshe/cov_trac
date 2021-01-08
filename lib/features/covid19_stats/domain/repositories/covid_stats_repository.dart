import 'package:covtrac/features/core/error/failures.dart';
import 'package:covtrac/features/covid19_stats/domain/entities/covid_stats.dart';
import 'package:dartz/dartz.dart';

abstract class CovidStatsRepository {
  Future<Either<Failure, CovidStats>> getCountryStats(String country);
}
