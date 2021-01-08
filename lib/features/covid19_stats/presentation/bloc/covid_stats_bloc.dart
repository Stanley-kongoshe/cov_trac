import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:covtrac/features/core/error/failures.dart';
import 'package:covtrac/features/core/util/input_converter.dart';
import 'package:covtrac/features/covid19_stats/domain/usecases/get_covid_stats.dart';
import './bloc.dart';
import 'package:meta/meta.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE = 'Invalid Input';
const String COUNTRY_NOT_FOUND_FAILURE_MESSAGE = 'Country not Found';
const String UNEXPECTED_ERROR_MESSAGE = 'Unexpected Error';

class CovidStatsBloc extends Bloc<CovidStatsEvent, CovidStatsState> {
  final GetCovidStats getCovidStats;
  final InputConverter inputConverter;

  CovidStatsBloc({@required this.getCovidStats, @required this.inputConverter})
      : assert(getCovidStats != null),
        assert(inputConverter != null);

  @override
  CovidStatsState get initialState => Empty();

  @override
  Stream<CovidStatsState> mapEventToState(
    CovidStatsEvent event,
  ) async* {
    if (event is GetCovidStatsForCountry) {
      final inputEither = inputConverter.check(event.countryString);

      yield* inputEither.fold((failure) async* {
        yield Error(message: INVALID_INPUT_FAILURE_MESSAGE);
      }, (coun) async* {
        yield Loading();
        final response = await getCovidStats(Params(country: coun));
        yield response.fold(
            (failure) => Error(message: _mapFailureToMessage(failure)),
            (stats) => Loaded(stats: stats));
      });
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;

      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;

      case CountryNotFoundFailure:
        return COUNTRY_NOT_FOUND_FAILURE_MESSAGE;

      default:
        return UNEXPECTED_ERROR_MESSAGE;
    }
  }
}
