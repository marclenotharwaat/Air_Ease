import 'package:airease/screens/available_flights.dart';
import 'package:airease/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({super.key});


  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(48, 48, 48, 1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: GNav(
          gap: 8,
          backgroundColor: Color.fromRGBO(33, 134, 140, 1),
          color: Color.fromRGBO(255, 255, 255, 1),
          activeColor: Color.fromRGBO(15, 226, 8, 0.654),
          tabBackgroundColor: Color.fromRGBO(33, 134, 140, 1),
          tabBorderRadius: 130,
          //tabMargin: EdgeInsets.all(0),

          padding: EdgeInsets.all(12),
          onTabChange: (index) {
            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            } else if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AvailableFlights()),
              );
            } else if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AvailableFlights()),
              );
            } else if (index == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AvailableFlights()),
              );
            }
          },
          tabs: const [
            GButton(icon: Icons.home, text: 'Home'),
            GButton(icon: Icons.flight_takeoff_outlined, text: 'Flights'),
            GButton(icon: Icons.calendar_today_outlined, text: 'Trips'),
            GButton(icon: Icons.person_sharp, text: 'Profile')
          ],
        ),
      ),
    );
  }
}
