import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CovidStatsEvent extends Equatable {
  CovidStatsEvent([List props = const <dynamic>[]]) : super(props);
}

class GetCovidStatsForCountry extends CovidStatsEvent {
  final String countryString;

  GetCovidStatsForCountry(this.countryString) : super([countryString]);
}
