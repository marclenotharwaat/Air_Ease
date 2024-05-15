import 'package:airease/widget/ticket.dart';

class TicketModel {
  final String ticketNumber;
  final String from;
  final String distination;
  final int price;
  final DateTime departureDate;
  final String abbreviationDistination;
  final String abbreviationFrom;
  final String kindOfTicket;
  final String ticktOwner;
  final String flight;
  final String id;
  final DateTime bookingDate;
  final String numOfFlightHour;

  TicketModel({
    required this.ticketNumber,
    required this.from,
    required this.distination,
    required this.price,
    required this.departureDate,
    required this.abbreviationDistination,
    required this.abbreviationFrom,
    required this.kindOfTicket,
    required this.ticktOwner,
    required this.flight,
    required this.numOfFlightHour,
    required this.id,
    required this.bookingDate,
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) => TicketModel(
        ticketNumber: json["ticketNumber"],
        from: json["from"],
        distination: json["distination"],
        price: json["price"],
        departureDate: DateTime.parse(json["departureDate"]),
        abbreviationDistination: json["abbreviationDistination"],
        abbreviationFrom: json["abbreviationFrom"],
        kindOfTicket: json["kindOfTicket"],
        ticktOwner: json["ticktOwner"],
        flight: json["Flight"],
        numOfFlightHour: json['numOfFlightHour'],
        id: json["_id"],
        bookingDate: DateTime.parse(json["bookingDate"]),
      );

  factory TicketModel.toJson(Map<String, dynamic> json) => TicketModel(
        ticketNumber: json["ticketNumber"],
        from: json["from"],
        distination: json["destination"],
        price: json["price"],
        departureDate: DateTime.parse(json["departureDate"]),
        abbreviationDistination: json["abbreviationDestination"],
        abbreviationFrom: json["abbreviationFrom"],
        kindOfTicket: json["kindOfTicket"],
        ticktOwner: json["ticketOwner"],
        flight: json["flight"],
        numOfFlightHour: json["numOfFlightHour"],
        id: json["_id"],
        bookingDate: DateTime.parse(json["bookingDate"]),
      );
}
