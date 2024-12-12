import 'dart:convert';

import 'package:flighttracker/model/flightmodel.dart';
import 'package:flighttracker/scecrets/scecrets.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ApiEndpoints {
  final String baseUrl = "https://api.aviationstack.com";
  final String version = "v1";
  final String DynamicResourceAPI = "flights";
}

class FlightTrackerRrepotoryApi {
  final ApiEndpoints _apiEndPoints = ApiEndpoints();
  final String _apiKey = ApiKey;

  Future<FlightDetails> fetchlightData(String flightnumber) async {
    final String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    final String ApiUrl =
        "${_apiEndPoints.baseUrl}/${_apiEndPoints.version}/${_apiEndPoints.DynamicResourceAPI}?access_key=${_apiKey}&flight_iata=$flightnumber&dep_date=$currentDate";
    print("$ApiUrl");

    final url = Uri.parse(ApiUrl);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return FlightDetails.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception("faild to fetch Api${response.statusCode}");
    }
  }
}
