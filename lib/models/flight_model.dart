class FlightModel {
  String id;
  String from;
  String to;
  String abbreviationFrom;
  String abbreviationTo;
  DateTime departureDate;
  DateTime arrivalDate;
  int price;
  int busSeats;
  int ecoSeats;
  String numOfFlightHour;

  FlightModel({
    required this.id,
    required this.from,
    required this.to,
    required this.abbreviationFrom,
    required this.abbreviationTo,
    required this.departureDate,
    required this.arrivalDate,
    required this.price,
    required this.busSeats,
    required this.ecoSeats,
    required this.numOfFlightHour,
  });

  factory FlightModel.fromJson(Map<String, dynamic> json) => FlightModel(
        id: json["_id"],
        from: json["from"],
        to: json["to"],
        abbreviationFrom: json["abbreviationFrom"],
        abbreviationTo: json["abbreviationDistination"],
        departureDate: DateTime.parse(json["departureDate"]),
        arrivalDate: DateTime.parse(json["arrivalDate"]),
        price: json["price"],
        busSeats: json["busSeats"],
        ecoSeats: json["ecoSeats"],
        numOfFlightHour: json["numOfFlightHour"],
      );

  // Map<String, dynamic> toJson() => {
  //       "_id": id,
  //       "from": from,
  //       "distination": distination,
  //       "abbreviationFrom": abbreviationFrom,
  //       "abbreviationDistination": abbreviationDistination,
  //       "departureDate": departureDate.toIso8601String(),
  //       "arrivalDate": arrivalDate.toIso8601String(),
  //       "price": price,
  //       "busSeats": busSeats,
  //       "ecoSeats": ecoSeats,
  //       "numOfFlightHour": numOfFlightHour,
  //     };
}
