import 'package:airease/widget/flight_list_view_bulder.dart';
import 'package:flutter/material.dart';

class AvailableFlights extends StatelessWidget {
  const AvailableFlights({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        centerTitle: true,
        title: Text(
          "Available Flights",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Perform your custom action when the back button is pressed
            Navigator.popUntil(context, (route) => route.isFirst);
          },
        ),
      ),
      body: FlightListViewBulder(),
    );
  }
}
