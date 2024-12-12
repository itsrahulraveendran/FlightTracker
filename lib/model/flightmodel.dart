// To parse this JSON data, do
//
//     final flightDetails = flightDetailsFromJson(jsonString);

import 'dart:convert';

FlightDetails flightDetailsFromJson(String str) => FlightDetails.fromJson(json.decode(str));

String flightDetailsToJson(FlightDetails data) => json.encode(data.toJson());

class FlightDetails {
    Pagination? pagination;
    List<Datum>? data;

    FlightDetails({
        this.pagination,
        this.data,
    });

    factory FlightDetails.fromJson(Map<String, dynamic> json) => FlightDetails(
        pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "pagination": pagination?.toJson(),
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    DateTime? flightDate;
    String? flightStatus;
    Arrival? departure;
    Arrival? arrival;
    Airline? airline;
    Flight? flight;
    Aircraft? aircraft;
    Live? live;

    Datum({
        this.flightDate,
        this.flightStatus,
        this.departure,
        this.arrival,
        this.airline,
        this.flight,
        this.aircraft,
        this.live,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        flightDate: json["flight_date"] == null ? null : DateTime.parse(json["flight_date"]),
        flightStatus: json["flight_status"],
        departure: json["departure"] == null ? null : Arrival.fromJson(json["departure"]),
        arrival: json["arrival"] == null ? null : Arrival.fromJson(json["arrival"]),
        airline: json["airline"] == null ? null : Airline.fromJson(json["airline"]),
        flight: json["flight"] == null ? null : Flight.fromJson(json["flight"]),
        aircraft: json["aircraft"] == null ? null : Aircraft.fromJson(json["aircraft"]),
        live: json["live"] == null ? null : Live.fromJson(json["live"]),
    );

    Map<String, dynamic> toJson() => {
        "flight_date": "${flightDate!.year.toString().padLeft(4, '0')}-${flightDate!.month.toString().padLeft(2, '0')}-${flightDate!.day.toString().padLeft(2, '0')}",
        "flight_status": flightStatus,
        "departure": departure?.toJson(),
        "arrival": arrival?.toJson(),
        "airline": airline?.toJson(),
        "flight": flight?.toJson(),
        "aircraft": aircraft?.toJson(),
        "live": live?.toJson(),
    };
}

class Aircraft {
    String? registration;
    String? iata;
    String? icao;
    String? icao24;

    Aircraft({
        this.registration,
        this.iata,
        this.icao,
        this.icao24,
    });

    factory Aircraft.fromJson(Map<String, dynamic> json) => Aircraft(
        registration: json["registration"],
        iata: json["iata"],
        icao: json["icao"],
        icao24: json["icao24"],
    );

    Map<String, dynamic> toJson() => {
        "registration": registration,
        "iata": iata,
        "icao": icao,
        "icao24": icao24,
    };
}

class Airline {
    String? name;
    String? iata;
    String? icao;

    Airline({
        this.name,
        this.iata,
        this.icao,
    });

    factory Airline.fromJson(Map<String, dynamic> json) => Airline(
        name: json["name"],
        iata: json["iata"],
        icao: json["icao"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "iata": iata,
        "icao": icao,
    };
}

class Arrival {
    String? airport;
    String? timezone;
    String? iata;
    String? icao;
    String? terminal;
    String? gate;
    dynamic baggage;
    int? delay;
    DateTime? scheduled;
    DateTime? estimated;
    DateTime? actual;
    DateTime? estimatedRunway;
    DateTime? actualRunway;

    Arrival({
        this.airport,
        this.timezone,
        this.iata,
        this.icao,
        this.terminal,
        this.gate,
        this.baggage,
        this.delay,
        this.scheduled,
        this.estimated,
        this.actual,
        this.estimatedRunway,
        this.actualRunway,
    });

    factory Arrival.fromJson(Map<String, dynamic> json) => Arrival(
        airport: json["airport"],
        timezone: json["timezone"],
        iata: json["iata"],
        icao: json["icao"],
        terminal: json["terminal"],
        gate: json["gate"],
        baggage: json["baggage"],
        delay: json["delay"],
        scheduled: json["scheduled"] == null ? null : DateTime.parse(json["scheduled"]),
        estimated: json["estimated"] == null ? null : DateTime.parse(json["estimated"]),
        actual: json["actual"] == null ? null : DateTime.parse(json["actual"]),
        estimatedRunway: json["estimated_runway"] == null ? null : DateTime.parse(json["estimated_runway"]),
        actualRunway: json["actual_runway"] == null ? null : DateTime.parse(json["actual_runway"]),
    );

    Map<String, dynamic> toJson() => {
        "airport": airport,
        "timezone": timezone,
        "iata": iata,
        "icao": icao,
        "terminal": terminal,
        "gate": gate,
        "baggage": baggage,
        "delay": delay,
        "scheduled": scheduled?.toIso8601String(),
        "estimated": estimated?.toIso8601String(),
        "actual": actual?.toIso8601String(),
        "estimated_runway": estimatedRunway?.toIso8601String(),
        "actual_runway": actualRunway?.toIso8601String(),
    };
}

class Flight {
    String? number;
    String? iata;
    String? icao;
    dynamic codeshared;

    Flight({
        this.number,
        this.iata,
        this.icao,
        this.codeshared,
    });

    factory Flight.fromJson(Map<String, dynamic> json) => Flight(
        number: json["number"],
        iata: json["iata"],
        icao: json["icao"],
        codeshared: json["codeshared"],
    );

    Map<String, dynamic> toJson() => {
        "number": number,
        "iata": iata,
        "icao": icao,
        "codeshared": codeshared,
    };
}

class Live {
    DateTime? updated;
    double? latitude;
    double? longitude;
    double? altitude;
    int? direction;
    double? speedHorizontal;
    int? speedVertical;
    bool? isGround;

    Live({
        this.updated,
        this.latitude,
        this.longitude,
        this.altitude,
        this.direction,
        this.speedHorizontal,
        this.speedVertical,
        this.isGround,
    });

    factory Live.fromJson(Map<String, dynamic> json) => Live(
        updated: json["updated"] == null ? null : DateTime.parse(json["updated"]),
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        altitude: json["altitude"]?.toDouble(),
        direction: json["direction"],
        speedHorizontal: json["speed_horizontal"]?.toDouble(),
        speedVertical: json["speed_vertical"],
        isGround: json["is_ground"],
    );

    Map<String, dynamic> toJson() => {
        "updated": updated?.toIso8601String(),
        "latitude": latitude,
        "longitude": longitude,
        "altitude": altitude,
        "direction": direction,
        "speed_horizontal": speedHorizontal,
        "speed_vertical": speedVertical,
        "is_ground": isGround,
    };
}

class Pagination {
    int? limit;
    int? offset;
    int? count;
    int? total;

    Pagination({
        this.limit,
        this.offset,
        this.count,
        this.total,
    });

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        limit: json["limit"],
        offset: json["offset"],
        count: json["count"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "limit": limit,
        "offset": offset,
        "count": count,
        "total": total,
    };
}
