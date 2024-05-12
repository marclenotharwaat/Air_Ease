import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF21868C),
      body: Container(
        // padding: EdgeInsets.symmetric(vertical: 5),
        margin: EdgeInsets.only(top: 121),

        // padding: EdgeInsets.fromLTRB(50, 12, 50, 12), 
        child: Column(
          children: [
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              children: [
                Container(
                  width: 190, // Adjust width as needed
                  height: 290,

                 
                  decoration: BoxDecoration(
                      color: Color(0xFFEAE7E7),
                      borderRadius: BorderRadius.circular(500),
                      border: Border.all(
                          color: Color(0xFFD2D2D3),
                          width: 20) 
                      ),
                  child:
                      //borderRadius: BorderRadius.circular(80),
                      Center(
                    child: Image.asset(
                      'assets/ef3c0551b78d0932139c091bd079260c.png', //fit: BoxFit.contain,
                      width: 128,
                      height: 128,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Big world out there, ",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.w600),
            ),
            Text(
              "Go Explore ",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.w600),
            ),

            SizedBox(height: 20,),
            Text(
              "Easy to use the app for your next ",
              textAlign: TextAlign.center,
              style: TextStyle(color:Color(0xFFEAE7E7),fontSize: 16,fontWeight: FontWeight.w300),
            ),
            Text(
              "flight booking ticket",
              textAlign: TextAlign.center,
              style: TextStyle(color:Color(0xFFEAE7E7),fontSize: 16,fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}
