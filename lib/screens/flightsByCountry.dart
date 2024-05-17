import 'package:airease/widget/flight_list_view_category_bulder.dart';
import 'package:flutter/material.dart';

class FlightsByCountry extends StatelessWidget {
  const FlightsByCountry({super.key, required this.country});
  final String country;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        title: Text(
          "Flights to $country",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
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
      body: FlightListViewCountryBuilder(
        country: country,
      ),
    );
  }
}
