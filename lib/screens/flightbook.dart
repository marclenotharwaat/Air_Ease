import 'package:airease/models/flight_model.dart';
import 'package:airease/models/ticket_model.dart';
import 'package:airease/models/user_model.dart';
import 'package:airease/screens/boarding_pass.dart';
import 'package:airease/services/ticket_service/create_ticket.dart';
import 'package:airease/services/user_service/login.dart';

import 'package:flutter/material.dart';

class FlightBook extends StatelessWidget {
  final FlightModel flightModel;

  const FlightBook({super.key, required this.flightModel});
  @override
  Widget build(BuildContext context) {
    final List<String> items = ['business', 'economic'];
    String selectedItem = 'economic';
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        centerTitle: true,
        title: Text(
          "Flight book",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Image.asset("assets/Frame.png"),
            Container(
              height: 500,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "From",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          flightModel.from,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "To",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          flightModel.to,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "DATE",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                         "${flightModel.arrivalDate.year}"+"/${flightModel.arrivalDate.month}"+"/${flightModel.arrivalDate.day}" ,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "Departure time",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "${flightModel.departureDate.year}"+"/${flightModel.departureDate.month}"+"/${flightModel.departureDate.day}" ,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "Class",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        DropdownButton<String>(
                          value: selectedItem,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              print(newValue);
                              selectedItem = newValue;
                            }
                          },
                          items: items
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "\$"+flightModel.price.toString(),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff45EA69)),
                        ),
                        Container(
                          height: 41,
                          width: 190,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xFF45EA69),
                          ),
                          child: ElevatedButton(
                            onPressed: () async {
                  
                              String kindOfTicket =  selectedItem;
                              String ticktOwner = await UserModel.id;
                              String flight = flightModel.id;

                              TicketModel? ticket = await CreateTicket()
                                  .createTicket(
                                      kindOfTicket, ticktOwner, flight);
                              if (ticket != null) {
                                print('Ticket created successfully:');
                                print(ticket);
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return Boardingpass(flightModel: flightModel,);
                                  },
                                ));
                              } else {
                                print('Failed to create ticket.');
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor:
                                  Color(0xFF45EA69), // Background color
                              minimumSize:
                                  Size(40, 40), // Button width and height
                            ),
                            child: Text(
                              'Book',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
