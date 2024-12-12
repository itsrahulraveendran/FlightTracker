part of 'flightdata_cubit.dart';

@immutable
abstract class FlightdataState {}

class FlightdataInitial extends FlightdataState {}

class flightDataLoading extends FlightdataState {}

class flightDataLoaded extends FlightdataState {
  final FlightDetails flightdata;
  flightDataLoaded(this.flightdata);
}

class flightdataError extends FlightdataState {
  final String error;
  flightdataError(this.error);
}
