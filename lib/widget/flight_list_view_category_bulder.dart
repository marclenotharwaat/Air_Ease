import 'package:airease/services/flight_service/get_all_flight.dart';
import 'package:airease/widget/flight_list_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FlightListViewCountryBuilder extends StatelessWidget {
  final String country;

  const FlightListViewCountryBuilder({Key? key, required this.country})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetAllFlights(dio: Dio()).getAllFlighs(country: country),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: SpinKitCircle(
              color: Colors.blue,
              size: 50.0,
            ),
          );
        } else if (snapshot.hasError) {
          print(snapshot.error.toString());
          return Text("Error: ${snapshot.error}");
        } else {
          return FlightListView(flightModelList: snapshot.data!);
        }
      },
    );
  }
}
