import 'package:airease/screens/available_flights.dart';
import 'package:airease/screens/homepage.dart';
import 'package:airease/screens/mytrip.dart';
import 'package:airease/screens/profileScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    AvailableFlights(),
    MyTrip(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        color: Color.fromRGBO(33, 134, 140, 1),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: GNav(
            gap: 8,
            backgroundColor: Color.fromRGBO(33, 134, 140, 1),
            color: Color.fromRGBO(255, 255, 255, 1),
            activeColor: Color.fromRGBO(15, 226, 8, 0.654),
            tabBackgroundColor: Color.fromRGBO(33, 134, 140, 1),
            tabBorderRadius: 130,
            padding: EdgeInsets.all(12),
            selectedIndex: _selectedIndex,
            onTabChange: _onItemTapped,
            tabs: [
              GButton(icon: Icons.home, text: 'Home'),
              GButton(icon: Icons.flight_takeoff_outlined, text: 'Flights'),
              GButton(icon: Icons.calendar_today_outlined, text: 'Trips'),
              GButton(icon: Icons.person_sharp, text: 'Profile')
            ],
          ),
        ),
      ),
    );
  }
}