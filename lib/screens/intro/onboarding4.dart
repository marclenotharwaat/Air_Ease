import 'package:airease/screens/homepage.dart';
import 'package:airease/screens/intro/screen1.dart';
import 'package:airease/screens/intro/screen2.dart';
import 'package:airease/screens/intro/screen3.dart';
import 'package:airease/screens/loginform.dart';
import 'package:airease/screens/navbar.dart';
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding4 extends StatefulWidget {
  const OnBoarding4({Key? key}) : super(key: key);

  @override
  _OnBoarding4State createState() => _OnBoarding4State();
}

class _OnBoarding4State extends State<OnBoarding4> {
  PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
              Screen1(),
              Screen2(),
              Screen3(),
            ],
          ),
          Positioned(
            top: 52.0,
            right: 20.0,
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginUser()),
                );
              },
              child: Text(
                'Skip',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 25,
            left: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: SlideEffect(
                    dotWidth: 12,
                    dotHeight: 12,
                    dotColor: Color(0xFF51535E),
                    activeDotColor: Color(0XFF45EA69),
                  ),
                ),
                if (onLastPage)
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginUser()),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 140.0),
                      padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0XFF45EA69),
                      ),
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0XFF202124),
                        ),
                      ),
                    ),
                  ),
                GestureDetector(
                  onTap: () {
                    _controller.nextPage(
                      duration: Duration(milliseconds: 555),
                      curve: Curves.easeIn,
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 160.0),
                    padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0XFF45EA69),
                    ),
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0XFF202124),
                      ),
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
