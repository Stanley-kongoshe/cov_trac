import 'package:covtrac/features/covid19_stats/domain/entities/covid_stats.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CovidStatsState extends Equatable {
  CovidStatsState([List props = const <dynamic>[]]) : super(props);
}

class Empty extends CovidStatsState {}

class Loading extends CovidStatsState {}

class Loaded extends CovidStatsState {
  final CovidStats stats;

  Loaded({@required this.stats}) : super([stats]);
}

class Error extends CovidStatsState {
  final String message;

  Error({@required this.message}) : super([message]);
}
