import 'package:airease/screens/searchFlightResult.dart';
import 'package:flutter/material.dart';

var from = 'New York';
var to = 'San Fransisco';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _fromController = TextEditingController();
  final _toController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xff21868C),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Transform.translate(
              offset: const Offset(5.0, 25.0),
              child: SizedBox(
                height: 130.0,
                child: AppBar(
                  backgroundColor: const Color(0xff21868C),
                  title: const Text(
                    'Search Flight',
                    style: TextStyle(color: Colors.white),
                  ),
                  centerTitle: true,
                  leading: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.all(7.0),
                    padding: const EdgeInsets.only(right: 12, bottom: 5),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back,
                          color: Color(0xfffefefe)),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.2,
                        left: MediaQuery.of(context).size.height * 0.01,
                      ),
                      child: TextField(
                        controller: _fromController,
                        onChanged: (value) {
                          setState(() {
                            from = value;
                          });
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.0,
                            ),
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.0,
                            ),
                          ),
                          alignLabelWithHint: true,
                          hintText: 'New york',
                          hintStyle: const TextStyle(color: Color(0xFFBDBDBD)),
                          labelText: 'From',
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.08,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Padding(
                      padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.2,
                        left: MediaQuery.of(context).size.height * 0.01,
                      ),
                      child: TextField(
                        controller: _toController,
                        onChanged: (value) {
                          setState(() {
                            to = value;
                          });
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.0,
                            ),
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.0,
                            ),
                          ),
                          hintText: 'San Fransisco',
                          hintStyle: const TextStyle(color: Color(0xFFBDBDBD)),
                          labelText: 'To',
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.08,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.11),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xff45EA69)),
                        elevation: MaterialStateProperty.all<double>(7.0),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.30,
                              vertical:
                                  MediaQuery.of(context).size.width * 0.045),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SearchResult(from: from, to: to),
                            ));
                        SearchResult(from: from, to: to);
                      },
                      child: Text(
                        'Search',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
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
