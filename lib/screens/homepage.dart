import 'package:airease/models/user_model.dart';
import 'package:airease/screens/flightsByCountry.dart';
import 'package:airease/screens/searchScreen.dart';
import 'package:airease/widget/static_flight.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  IconData? _selectedIcon;
  String _selectedText = '';
  var _action;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xFF21868C),
      body: Builder(
        builder: (BuildContext context) {
          return Container(
            child: SingleChildScrollView(
              
              child: Column(
                children: [
                  SizedBox(height: 70,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 30),
                      Text(
                        "Hello, ${UserModel.firstName} "+ "${UserModel.lastName}",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(15, 226, 8, 1),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Text(
                      "Where are you going?",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 28,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 325,
                    height: 41.2,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        "Search a flight",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 18,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                    ),
                  ),
                  //   SizedBox(height: 5),
////////////////////////////////////////////////flight/////////////////////
                  StaticFlight(),
                  Row(
                    children: [
                      SizedBox(width: 24),
                      Text(
                        "Popular Places",
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      SizedBox(width: 100),

            
                    ],
                  ),
                  //  SizedBox(height: 10),
                  SliderWithImagesAndDescriptions(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class SliderWithImagesAndDescriptions extends StatefulWidget {
  @override
  _SliderWithImagesAndDescriptionsState createState() =>
      _SliderWithImagesAndDescriptionsState();
}

class _SliderWithImagesAndDescriptionsState
    extends State<SliderWithImagesAndDescriptions> {
  int _selectedIndex = -1;

  final List<String> imageUrls = [
    "assets/cairo.jpg",
    "assets/paris.jpg",
    "assets/abudhabi.jpg",
    "assets/almadina.jpg",
    "assets/america.jpg",
    "assets/china.jpg",
  ];

  final List<String> cities = [
    "Cairo",
    "Paris",
    "Abu Dhabi",
    "Al Madina",
    "New York",
    "Pekin",
  ];
  final List<String> countries = [
    "Egypt",
    "France",
    "Dubai",
    "Saudi Arabia",
    "America",
    "China",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: imageUrls.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FlightsByCountry(
                      country: countries[index],
                    ),
                  ),
                );
                setState(() {
                  _selectedIndex = index;
                  print("selected ${_selectedIndex}");
                });
              },
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                        child: Image.asset(
                          imageUrls[index],
                          height: 160,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cities[index],
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              countries[index],
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: 230,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
          ),
        ),
      ],
    );
  }
}
