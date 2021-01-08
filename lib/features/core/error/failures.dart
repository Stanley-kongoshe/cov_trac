import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure([List properties = const <dynamic>[]]) : super(properties);
}

// Server failure
class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class CountryNotFoundFailure extends Failure {}

class InvalidInputFailure extends Failure {}

class InternetConnectionFailure extends Failure {}
