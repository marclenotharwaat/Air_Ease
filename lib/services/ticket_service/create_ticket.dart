import 'dart:convert';
import 'package:airease/helper/api.dart';
import 'package:airease/models/ticket_model.dart';
import "package:http/http.dart" as http;

class CreateTicket {


  Future<TicketModel?> createTicket(
      String kindOfTicket, String ticktOwner, String Flight) async {
    // Prepare the request body
    var requestBody = {
      "kindOfTicket": kindOfTicket,
      "ticktOwner": ticktOwner,
      "Flight": Flight,
    };

    try {
      print(requestBody);
      final response = await http.post(
        Uri.parse("http://192.168.1.8:10000/ticket"),
        headers: {"Content-Type":"application/json"},
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        // Ticket created successfully, parse the response JSON
        Map<String, dynamic> responseData = jsonDecode(response.body);
        return TicketModel.fromJson(responseData['data']);
      } else {
        // Handle API errors
        print('Failed to create ticket: ${response.body}');
        return null;
      }
    } catch (e) {
      // Handle network errors
      print('Failed to connect to server: $e');
      return null;
    }
  }
}
