import 'package:airease/helper/api.dart';

class DeletTicket {
  Future<void> deletTicket(
      String kindOfTicket, String ticketOwner, String flight) async {
    Map<String, String> requestBody = {
      'kindOfTicket': kindOfTicket,
      'ticktOwner': ticketOwner,
      'Flight': flight,
    };
    Map<String, dynamic> date = await Api()
        .delet(url: 'http://192.168.1.8:10000/ticket', body: requestBody);
  }
}
