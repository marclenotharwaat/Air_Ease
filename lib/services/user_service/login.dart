import 'dart:convert';
import 'package:airease/config.dart';
import 'package:airease/models/user_model.dart';
import 'package:http/http.dart' as http;

class Login {
  static var userlogin;
  Future loginUser(String? email, String? password) async {
    try {
      if (email == null || password == null) {
        throw Exception("Email or password is null.");
      }

      var req = {
        "email": email,
        "password": password,
      };

      final response = await http.post(
        Uri.parse('${urlBase}/users/login'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(req),
      );
      print(response.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        print('Login successful: ${data['data']}');
        Map<String, dynamic> respoDate = data['data'];
        UserModel.id = await respoDate['_id'];
        UserModel.firstName = await respoDate['firstName'];
        print(UserModel.firstName);
        UserModel.lastName = await respoDate["lastName"];
        UserModel.email = await respoDate['email'];
        UserModel.password = await respoDate['password'];
        
      } else {
        print('Login failed with status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error during login: $e');
      return null;
    }
  }
}
