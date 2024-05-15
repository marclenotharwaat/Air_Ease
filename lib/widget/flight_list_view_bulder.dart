import 'package:airease/services/flight_service/get_all_flight.dart';
import 'package:airease/widget/flight_list_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class FlightListViewBulder extends StatelessWidget {
  const FlightListViewBulder({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetAllFlights(dio: Dio()).getAllFlighs(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return FlightListView(
            flightModelList: snapshot.data!
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
