import 'package:airease/models/flight_model.dart';
import 'package:airease/models/ticket_model.dart';
import 'package:airease/widget/flight.dart';
import 'package:airease/widget/ticket_in_trips.dart';
import 'package:flutter/material.dart';

class FlightListView extends StatelessWidget {
  const FlightListView({
    super.key,
    required this.flightModelList,
  });
  final List<FlightModel> flightModelList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: flightModelList.length,
      itemBuilder: (context, index) {
        return Flight(flightModel: flightModelList[index]);
      },
    );
  }
}
