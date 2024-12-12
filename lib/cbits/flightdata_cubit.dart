import 'package:bloc/bloc.dart';
import 'package:flighttracker/model/flightmodel.dart';
import 'package:flighttracker/scecrets/Api/api.dart';
import 'package:meta/meta.dart';

part 'flightdata_state.dart';

class FlightdataCubit extends Cubit<FlightdataState> {
  final FlightTrackerRrepotoryApi apiRepostory;

  FlightdataCubit(this.apiRepostory) : super(FlightdataInitial());

  Future<void> fetchFlightData(String flightnumber) async {
    try {
      emit(flightDataLoading());
      final flightData = await apiRepostory.fetchlightData(flightnumber);
      if ((flightData.data ?? []).isNotEmpty) {
        emit(flightDataLoaded(flightData));
      } else {
        emit(flightdataError("An error occurred while fetching flight data: "));
      }
    } catch (e) {
      print("Error occurred while fetching flight data: $e");
      emit(flightdataError("An error occurred while fetching flight data: $e"));
    }
  }
}
