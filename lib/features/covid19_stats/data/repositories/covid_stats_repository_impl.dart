import 'package:covtrac/features/core/error/exceptions.dart';
import 'package:covtrac/features/core/error/failures.dart';
import 'package:covtrac/features/core/platform/network_info.dart';
import 'package:covtrac/features/covid19_stats/data/datasources/covid_stats_local_data_source.dart';
import 'package:covtrac/features/covid19_stats/data/datasources/covid_stats_remote_data_source.dart';
import 'package:covtrac/features/covid19_stats/domain/entities/covid_stats.dart';
import 'package:covtrac/features/covid19_stats/domain/repositories/covid_stats_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class CovidStatsRepositoryImpl implements CovidStatsRepository {
  final CovidStatsRemoteDataSource remoteDataSource;
  final CovidStatsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  CovidStatsRepositoryImpl(
      {@required this.remoteDataSource,
      @required this.localDataSource,
      @required this.networkInfo});

  @override
  Future<Either<Failure, CovidStats>> getCountryStats(String country) async {
    // ignore: unnecessary_statements
    if (await networkInfo.isConnected) {
      try {
        final remoteStats = await remoteDataSource.getCountryStats(country);
        localDataSource.cacheCovidStats(remoteStats);
        return Right(remoteStats);
      } on ServerException {
        return Left(ServerFailure());
      } on CountryNotFoundException {
        return Left(CountryNotFoundFailure());
      }
    } else {
      try {
        final localStats = await localDataSource.getLastCovidStats();
        return Right(localStats);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
