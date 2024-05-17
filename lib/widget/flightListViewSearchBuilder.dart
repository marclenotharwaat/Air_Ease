import 'package:airease/services/flight_service/get_all_flight.dart';
import 'package:airease/widget/flight_list_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FlightListViewSearchBuilder extends StatelessWidget {
  const FlightListViewSearchBuilder(
      {Key? key, required this.from, required this.to})
      : super(key: key);
  final String from;
  final String to;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetAllFlights(dio: Dio()).getAllFlighs(from: from, to: to),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: SpinKitCircle( // Using SpinKitCircle indicator
              color: Colors.blue, // You can customize the color
              size: 50.0, // You can customize the size
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          return FlightListView(flightModelList: snapshot.data!);
        }
      },
    );
  }
}
