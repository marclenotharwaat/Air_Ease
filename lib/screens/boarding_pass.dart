import 'package:airease/models/flight_model.dart';
import 'package:airease/screens/homepage.dart';
import 'package:airease/widget/ticket.dart';
import 'package:flutter/material.dart';

class Boardingpass extends StatelessWidget {
  const Boardingpass({super.key, required this.flightModel});
final FlightModel flightModel;
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
            Navigator.push(context, MaterialPageRoute(builder: (context) {
             return HomePage();
            },));
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Image.asset("assets/Frame.png"),
          Ticket(flightModel: flightModel,
             ),
        ],
      ),
    );
  }
}
