import 'dart:convert';

import 'package:airease/config.dart';
import 'package:airease/models/user_model.dart';
import 'package:airease/screens/loginform.dart';
import 'package:airease/screens/navbar.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class AddUser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddUserState();
  }
}

class AddUserState extends State<AddUser> {
  var formkey = GlobalKey<FormState>();
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var passportNumber = TextEditingController();
  var city = TextEditingController();
  var nationality = TextEditingController();
  late String selectedCountryCode;
  bool isPasswordVisible = false;

  String? validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      return "First name is required";
    }
    if (value.contains(RegExp(r'[0-9]'))) {
      return "First name should not contain numbers";
    }
    return null;
  }

  String? validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      return "Last name is required";
    }
    if (value.contains(RegExp(r'[0-9]'))) {
      return "Last name should not contain numbers";
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    if (!value.contains('@') || !value.contains('.com')) {
      return "Invalid email format";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    if (value.length < 8) {
      return "Password should be at least 8 characters long";
    }
    if (!value.contains(RegExp(r'[a-zA-Z]')) ||
        !value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return "Password should contain letters and special characters";
    }
    return null;
  }

  String? validatePassportNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Passport number is required";
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return "Passport number should contain only digits";
    }
    return null;
  }

  Future<void> addUser() async {
    var signup = Uri.parse("${urlBase}/users/signup");
    print(signup);
    var reqBody = {
      "firstName": firstName.text,
      "lastName": lastName.text,
      "email": email.text,
      "password": password.text,
      "passportNumber": passportNumber.text,
      "city": city.text,
      "nationality": nationality.text,
      "countryCode": selectedCountryCode,
    };
    try {
      final response = await http.post(
        signup,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(reqBody),
      );
      print(response.body);
      Map<String, dynamic> data = jsonDecode(response.body);
      if (response.statusCode == 201) {
        print('User added successfully');
        Map<String, dynamic> respoDate = data['user'];
        UserModel.id = await respoDate['_id'];
        UserModel.firstName = await respoDate['firstName'];
        print(UserModel.firstName);
        UserModel.lastName = await respoDate["lastName"];
        UserModel.email = await respoDate['email'];
        UserModel.password = await respoDate['password'];
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Navbar()),
        );
      } else if (response.statusCode == 400) {
        print('Login Failed: ${data}');
      } else {
        Map<String, dynamic> data = jsonDecode(response.body);
        print('Login Failed: ${data}');
        print('Failed to add user: ${response.statusCode}');
      }
    } catch (error) {
      print('Error adding user: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff21868C),
      appBar: AppBar(
        title: Text(
          'Registration',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        //  backgroundColor: Color(0xff21868C),
      ),
      body: SingleChildScrollView(
        // Wrap your Column with SingleChildScrollView
        child: Padding(
          padding: EdgeInsets.all(0.0),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //    SizedBox(height: 20.0),
                Text(
                  'Ready for take off? Welcome to AirEase!',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 20.0),
                Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.0),
                      Text(
                        'First Name',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 40,
                        child: TextFormField(
                          validator: validateFirstName,
                          controller: firstName,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xffEAE7E7),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Last Name',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 40,
                        child: TextFormField(
                          validator: validateLastName,
                          controller: lastName,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xffEAE7E7),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Email',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          //  fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 40,
                        child: TextFormField(
                          validator: validateEmail,
                          controller: email,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xffEAE7E7),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'PassWord',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          //  fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 40,
                        child: TextFormField(
                          validator: validatePassword,
                          controller: password,
                          obscureText: !isPasswordVisible,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xffEAE7E7),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Passport Number',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 40,
                        child: TextFormField(
                          validator: validatePassportNumber,
                          controller: passportNumber,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xffEAE7E7),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'City',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          //    fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 40,
                        child: TextFormField(
                          controller: city,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xffEAE7E7),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Nationality',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          //  fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 40,
                        child: TextFormField(
                          controller: nationality,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xffEAE7E7),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      CountryListPick(
                        onChanged: (CountryCode? code) {
                          setState(() {
                            selectedCountryCode = code!.code!;
                          });
                        },
                        initialSelection: '+1',
                        theme: CountryTheme(
                          isShowFlag: true,
                          isShowTitle: true,
                          isShowCode: true,
                          isDownIcon: true,
                          showEnglishName: true,
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                                color: Color(0xff45EA69)),
                            //color: Color(0xff45EA69),
                            height: 38,
                            width: 290,
                            child: ElevatedButton(
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  addUser();
                                  print(firstName.text +
                                      lastName.text +
                                      email.text);
                                }
                              },
                              child: Text("Create account"),
                              style: ElevatedButton.styleFrom(
                                foregroundColor:
                                    Color.fromARGB(255, 250, 241, 241),
                                backgroundColor: Color(0xff45EA69),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginUser()),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                " login",
                                style: TextStyle(
                                    color: Color(0xff45EA69),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
