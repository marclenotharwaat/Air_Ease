import 'package:airease/widget/ticket.dart';
import 'package:flutter/material.dart';

class Boardingpass extends StatelessWidget {
  const Boardingpass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        centerTitle: true,
        title: Text(
          "Boarding pass",
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
      body: Column(
        children: <Widget>[
          Image.asset("assets/Frame.png"),
          Ticket(
              fromCity: "aasdfs",
              toCity: 'asd',
              date: "22/4/2023",
              timeOfFlight: "66",
              flightNumber: "flightNumber",
              price: 222,
              fromCountry: "asd",
              toCountry: "fgh"),
        ],
      ),
    );
  }
}
