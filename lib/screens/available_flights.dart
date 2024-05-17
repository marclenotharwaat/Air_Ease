import 'package:airease/widget/bottomNavBar.dart';
import 'package:airease/widget/flight_list_view_bulder.dart';
import 'package:flutter/material.dart';

class AvailableFlights extends StatelessWidget {
  const AvailableFlights({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          centerTitle: true,
          title: Text(
            "Available Flights",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          elevation: 0,
      
        ),
        body: FlightListViewBuilder());
  }
}
