import 'package:airease/models/flight_model.dart';
import 'package:flutter/material.dart';

class Ticket extends StatelessWidget {
  const Ticket(
      {super.key, required this.flightModel,
    });
  final FlightModel  flightModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 330,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  height: 8,
                ),
                Container(
                  height: 120,
                  child: Image.asset(
                      'assets/large-NaZxbgjtn--removebg-preview-removebg-preview.png'),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      flightModel.abbreviationFrom,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: Colors.indigo.shade50,
                          borderRadius: BorderRadius.circular(20)),
                      child: SizedBox(
                        height: 8,
                        width: 8,
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: Colors.indigo.shade400,
                                borderRadius: BorderRadius.circular(5))),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Stack(
                              children: [
                                SizedBox(
                                  height: 24,
                                  child: LayoutBuilder(
                                    builder: (context, constraints) {
                                      return Flex(
                                        direction: Axis.horizontal,
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween, // or Axis.vertical,
                                        children: List.generate(
                                          (constraints.constrainWidth() / 6)
                                              .floor(),
                                          (index) => const SizedBox(
                                            height: 1,
                                            width: 3,
                                            child: DecoratedBox(
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    33, 134, 140, 1),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Center(
                                    child: Transform.rotate(
                                  angle: 1.5,
                                  child: Icon(
                                    Icons.local_airport,
                                    color: Colors.indigo.shade300,
                                    size: 24,
                                  ),
                                ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: Colors.indigo.shade50,
                          borderRadius: BorderRadius.circular(20)),
                      child: SizedBox(
                        height: 8,
                        width: 8,
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: Colors.pink.shade400,
                                borderRadius: BorderRadius.circular(5))),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      flightModel.abbreviationTo,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 100,
                      child: Text(
                       flightModel.from,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Text(
                      flightModel.numOfFlightHour,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      width: 100,
                      child: Text(
                        flightModel.to,
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Date & Time',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Flight Number',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "${flightModel.departureDate.year}"+"/${flightModel.departureDate.month}"+"/${flightModel.departureDate.day}",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    Text(
                      flightModel.id,
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: Row(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                  width: 10,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        color: Color.fromRGBO(33, 134, 140, 1)),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        LayoutBuilder(
                          builder: (context, constraints) {
                            return Flex(
                              direction: Axis.horizontal,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween, // or Axis.vertical,
                              children: List.generate(
                                (constraints.constrainWidth() / 10).floor(),
                                (index) => const SizedBox(
                                  height: 1,
                                  width: 5,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(33, 134, 140, 1),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                  width: 10,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                        color: Color.fromRGBO(33, 134, 140, 1)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 5),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Boarding pass",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff45EA69)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
