import 'package:airease/models/ticket_model.dart';
import 'package:airease/widget/ticket_in_trips.dart';
import 'package:flutter/material.dart';

class TicektListView extends StatelessWidget {
  const TicektListView({super.key, required this.ticketModel});
  final List<TicketModel> ticketModel;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ticketModel.length,
      itemBuilder: (context, index) {
        Container(
        //  child: IconButton(onPressed: () {}, icon: Icons.delete),
        );

        return TicketInTrip(
          ticketModel: ticketModel[index],
        );
      },
    );
  }
}
