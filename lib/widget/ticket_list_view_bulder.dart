import 'package:airease/services/ticket_service/get_ticket.dart';
import 'package:airease/widget/ticket_list_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class TicketListViewBulder extends StatelessWidget {
  const TicketListViewBulder({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetTickets(dio: Dio()).getTickets(),
      builder: (context, snapshot) {
        print(snapshot.data.toString());
        if (snapshot.hasData) {
          return TicektListView(
            ticketModel: snapshot.data!,
          );
        } else if (snapshot.hasError) {
          print(snapshot.error.toString());
          return Text("error");
        } else {
          return Text("xxx");
        }
      },
    );
  }
}
