class FlightModel {
  String id;
  String from;
  String distination;
  String abbreviationFrom;
  String abbreviationDistination;
  DateTime departureDate;
  DateTime arrivalDate;
  int price;
  int busSeats;
  int ecoSeats;
  String numOfFlightHour;

  FlightModel({
    required this.id,
    required this.from,
    required this.distination,
    required this.abbreviationFrom,
    required this.abbreviationDistination,
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
        distination: json["distination"],
        abbreviationFrom: json["abbreviationFrom"],
        abbreviationDistination: json["abbreviationDistination"],
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