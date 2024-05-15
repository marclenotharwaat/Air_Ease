import 'package:airease/screens/available_flights.dart';
import 'package:airease/services/flight_service/get_all_flight.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(33, 134, 140, 1),
        appBarTheme: AppBarTheme(
          color: Color.fromRGBO(33, 134, 140, 1),
        ),
        textTheme: GoogleFonts.poppinsTextTheme()
      ),
      debugShowCheckedModeBanner: false,
      home: AvailableFlights(),
      // IntroScreen() // Use the correct method name here
    );
  }
}