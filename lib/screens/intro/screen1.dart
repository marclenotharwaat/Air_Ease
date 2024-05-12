import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF21868C),
      body: Container(
        margin: EdgeInsets.only(top: 121),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 190,
                  height: 290,
                  decoration: BoxDecoration(
                      color: Color(0xFFEAE7E7),
                      borderRadius: BorderRadius.circular(500),
                      border: Border.all(color: Color(0xFFD2D2D3), width: 20)),
                  child: Center(
                    child: Image.asset(
                      'assets/baa4658005f66bd09401266d40dd2fe3.png', //fit: BoxFit.contain,
                      width: 160,
                      height: 183,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Find a relax flight ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              "for next trip ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Try this smart app for your next",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFFEAE7E7),
                  fontSize: 16,
                  fontWeight: FontWeight.w300),
            ),
            Text(
              "flight booking ticket",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFFEAE7E7),
                  fontSize: 16,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}
