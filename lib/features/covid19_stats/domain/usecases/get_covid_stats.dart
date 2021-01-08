import 'package:covtrac/features/core/error/failures.dart';
import 'package:covtrac/features/core/usecases/usecase.dart';
import 'package:covtrac/features/covid19_stats/domain/entities/covid_stats.dart';
import 'package:covtrac/features/covid19_stats/domain/repositories/covid_stats_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class GetCovidStats implements Usecase<CovidStats, Params> {
  final CovidStatsRepository repository;

  GetCovidStats(this.repository);

  @override
  Future<Either<Failure, CovidStats>> call(Params params) async {
    return await repository.getCountryStats(params.country);
  }
}

class Params extends Equatable {
  final String country;

  Params({@required this.country}) : super([country]);
}
