import 'package:airease/services/ticket_service/get_ticket.dart';
import 'package:airease/widget/ticket_list_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class TicketListViewBulder extends StatelessWidget {
  const TicketListViewBulder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetTickets(dio: Dio()).getTickets(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: SpinKitCircle(
              color: Colors.blue,
              size: 50.0,
            ),
          );
        } else if (snapshot.hasData) {
          return TicektListView(
            ticketModel: snapshot.data!,
          );
        } else if (snapshot.hasError) {
          print(snapshot.error.toString());
          return Text("Error: ${snapshot.error}");
        } else {
          return Text("");
        }
      },
    );
  }
}
