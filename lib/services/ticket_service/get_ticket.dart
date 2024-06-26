
import 'package:airease/config.dart';
import 'package:airease/models/ticket_model.dart';
import 'package:airease/models/user_model.dart';
import 'package:dio/dio.dart';


class GetTickets {
  final Dio dio;

  GetTickets({required this.dio});

  Future<List<TicketModel>> getTickets() async {
    try {
      Response response =
          await dio.get('${urlBase}/ticket/getTicket/${UserModel.id}');
      print(response);
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> tickets = jsonData['data'];
      List<TicketModel> ticketList = [];
      for (var ticket in tickets) {
        TicketModel ticketModel = TicketModel(
            ticketNumber: ticket['ticketNumber'],
            from: ticket['from'],
            to: ticket['to'],
            price: ticket['price'],
            departureDate: DateTime.parse(ticket['departureDate']),
            abbreviationTo: ticket['abbreviationTo'],
            abbreviationFrom: ticket['abbreviationFrom'],
            kindOfTicket: ticket['kindOfTicket'],
            ticktOwner: ticket['ticktOwner'],
            flight: ticket['Flight'],
            numOfFlightHour: ticket['numOfFlightHour'],
            id: ticket['_id'],
            bookingDate: DateTime.parse(ticket['bookingDate']),
            );
        ticketList.add(ticketModel);
      }
      return ticketList;
    } on Exception catch (e) {
      return [];
    }
  }
}
