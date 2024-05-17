import 'package:airease/screens/available_flights.dart';
import 'package:airease/screens/homepage.dart';
import 'package:airease/screens/intro/intro_screen.dart';
import 'package:airease/screens/loginform.dart';
import 'package:airease/screens/mytrip.dart';
import 'package:airease/screens/profileScreen.dart';
import 'package:airease/services/user_service/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  bool _showIntroScreen = true;

  final List<Widget> _pages = [
    HomePage(),
    AvailableFlights(),
    MyTrip(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _hideIntroScreen() {
    setState(() {
      _showIntroScreen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(33, 134, 140, 1),
        appBarTheme: AppBarTheme(
          color: Color.fromRGBO(33, 134, 140, 1),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LoginUser()
        
        // _pages[_selectedIndex],
        // bottomNavigationBar: Container(
        //   color: Color.fromRGBO(33, 134, 140, 1),
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        //     child: GNav(
        //       gap: 8,
        //       backgroundColor: Color.fromRGBO(33, 134, 140, 1),
        //       color: Color.fromRGBO(255, 255, 255, 1),
        //       activeColor: Color.fromRGBO(15, 226, 8, 0.654),
        //       tabBackgroundColor: Color.fromRGBO(33, 134, 140, 1),
        //       tabBorderRadius: 130,
        //       padding: EdgeInsets.all(12),
        //       selectedIndex: _selectedIndex, // Set the selectedIndex
        //       onTabChange: _onItemTapped, // Use _onItemTapped for navigation
        //       tabs: [
        //         GButton(icon: Icons.home, text: 'Home'),
        //         GButton(icon: Icons.flight_takeoff_outlined, text: 'Flights'),
        //         GButton(icon: Icons.calendar_today_outlined, text: 'Trips'),
        //         GButton(icon: Icons.person_sharp, text: 'Profile')
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
