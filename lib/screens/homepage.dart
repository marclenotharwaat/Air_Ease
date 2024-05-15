import 'package:airease/widget/flight.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:airease/helper/ws.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  IconData? _selectedIcon;
  String _selectedText = '';

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xFF21868C),
      appBar: AppBar(
        backgroundColor: Color(0xFF21868C),
        leading: IconButton(
          icon: Icon(Icons.menu, color: Color.fromRGBO(255, 255, 255, 1)),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
      ),
      drawer: Drawer(),
      body: Builder(
        builder: (BuildContext context) {
          return Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 30),
                      Text(
                        "Hello, ",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(15, 226, 8, 1),
                        ),
                      ),
                      Text(
                        "username!",
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
                        fontSize: 30,
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MyApp()));
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        primary: Colors.white,
                        onPrimary: Colors.black,
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
                  Flight(
                      fromCity: 'dd',
                      toCity: "toCity",
                      date: "date",
                      timeOfFlight: "timeOfFlight",
                      flightNumber: "flightNumber",
                      price: 222,
                      fromCountry: "d",
                      toCountry: "d"),
                  Row(
                    children: [
                      SizedBox(width: 24),
                      Text(
                        "Popular Places",
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      SizedBox(width: 100),

                      //   TextButton(
                      //   onPressed: () {},
                      //   style: TextButton.styleFrom(
                      //     padding: EdgeInsets.zero,
                      //     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      //     minimumSize: Size(0, 0),
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.zero,
                      //     ),
                      //     backgroundColor: Colors.transparent,
                      //   ),
                      //   child: Text(
                      //     "View All",
                      //     style: TextStyle(
                      //       color: Color.fromRGBO(255, 255, 255, 1),
                      //       fontSize: 18,
                      //       fontFamily: 'Roboto',
                      //     ),
                      //   ),
                      // ),
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
      bottomNavigationBar: BottomAppBar(
        height: 65,
        color: Color.fromARGB(33, 134, 140, 1),
        shape: const CircularNotchedRectangle(),
        notchMargin: 5.0,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: kBottomNavigationBarHeight,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildIconButtonWithText(Icons.home, ' Home' ),
              _buildIconButtonWithText(Icons.flight_takeoff, ' Flights'),
              _buildIconButtonWithText(Icons.calendar_today_rounded, ' Trips'),
              _buildIconButtonWithText(
                  Icons.account_circle_outlined, ' Profile'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconButtonWithText(IconData icon, String text) {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedIcon = icon;
            _selectedText = text;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: _selectedIcon == icon
                ? Color.fromARGB(226, 255, 255, 255)
                : Color.fromARGB(0, 214, 215, 215),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon,
                color: _selectedIcon == icon
                    ? Color.fromARGB(255, 0, 2, 1)
                    : Colors.white,
              ),
              SizedBox(width: _selectedIcon == Icons.home ? 4.7 : 0),
              Text(
                _selectedIcon == icon ? text : '',
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: 11,
                ),
              ),
              // if (_selectedIcon != Icons.home) Spacer(),
            ],
          ),
        ),
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
                setState(() {
                  _selectedIndex = index;
                  print("selected ${_selectedIndex}");
                });
              },
              child: Container(
                height: 200,
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
                          height: 180,
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
            height: 250,
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
