class TicketModel {
  final String ticketNumber;
  final String from;
  final String to;
  final int price;
  final DateTime departureDate;
  final String abbreviationFrom;
  final String kindOfTicket;
  final String ticktOwner;
  final String flight;
  final String numOfFlightHour;
  final String id;
  final DateTime bookingDate;
  final String abbreviationTo;

  TicketModel({
    required this.flight,
    required this.id,
    required this.ticketNumber,
    required this.from,
    required this.to,
    required this.price,
    required this.departureDate,
    required this.abbreviationFrom,
    required this.kindOfTicket,
    required this.ticktOwner,
    required this.numOfFlightHour,
    required this.bookingDate,
    required this.abbreviationTo
  
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) => TicketModel(
        ticketNumber: json["ticketNumber"],
        from: json["from"],
        to: json["to"],
        price: json["price"],
        departureDate: DateTime.parse(json["departureDate"]),
        abbreviationTo: json["abbreviationTo"],
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
        to: json["destination"],
        price: json["price"],
        departureDate: DateTime.parse(json["departureDate"]),
        abbreviationTo: json["abbreviationTo"],
        abbreviationFrom: json["abbreviationFrom"],
        kindOfTicket: json["kindOfTicket"],
        ticktOwner: json["ticketOwner"],
        flight: json["flight"],
        numOfFlightHour: json["numOfFlightHour"],
        id: json["_id"],
        bookingDate: DateTime.parse(json["bookingDate"]),
      );
}
