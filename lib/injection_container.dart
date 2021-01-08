import 'package:covtrac/features/core/util/input_converter.dart';
import 'package:covtrac/features/covid19_stats/data/repositories/covid_stats_repository_impl.dart';
import 'package:covtrac/features/covid19_stats/domain/usecases/get_covid_stats.dart';
import 'package:covtrac/features/covid19_stats/presentation/bloc/bloc.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'features/core/platform/network_info.dart';
import 'features/covid19_stats/data/datasources/covid_stats_local_data_source.dart';
import 'features/covid19_stats/data/datasources/covid_stats_remote_data_source.dart';
import 'features/covid19_stats/domain/repositories/covid_stats_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Features - Covid Stats
  //Bloc
  sl.registerFactory(
    () => CovidStatsBloc(
      getCovidStats: sl(),
      inputConverter: sl(),
    ),
  );

  //Use cases
  sl.registerLazySingleton(() => GetCovidStats(sl()));

  //Repository
  sl.registerLazySingleton<CovidStatsRepository>(
    () => CovidStatsRepositoryImpl(
      localDataSource: sl(),
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data Sources
  sl.registerLazySingleton<CovidStatsRemoteDataSource>(
      () => CovidStatsRemoteDataSourceImpl(client: sl()));

  sl.registerLazySingleton<CovidStatsLocalDataSource>(
      () => CovidStatsLocalDataSourceImpl(sharedPreferences: sl()));

  // Core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
