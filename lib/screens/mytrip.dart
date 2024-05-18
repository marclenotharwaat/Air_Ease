import 'package:airease/widget/ticket_list_view_bulder.dart';
import 'package:flutter/material.dart';

class MyTrip extends StatelessWidget {
  const MyTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          centerTitle: true,
          title: Text(
            "My Trip",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          elevation: 0,
      automaticallyImplyLeading: false,
        ),
        body: TicketListViewBulder());
  }
}
