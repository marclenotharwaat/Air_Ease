import "dart:convert";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;

class Api {
  Future<dynamic> get({required String url}) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          "there is a problem with status code ${response.statusCode} ");
    }
  }

  Future<dynamic> post({required String url, required dynamic body}) async {
    Map<String, String> headers = {};

    http.Response response = await http.post(Uri.parse(url),
        body: jsonEncode(body), headers: headers);
    // print(response.body);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          "there is a problem with status code ${response.statusCode} ");
    }
  }

  Future<dynamic> put(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({" Authorization": "Bearer $token"});
    }
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          "there is a problem with status code ${response.statusCode} ");
    }
  }

  Future<dynamic> delet({
    required String url,
    required dynamic body,
  }) async {
    http.Response response =
        await http.post(Uri.parse(url), body: jsonEncode(body));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          "there is a problem with status code ${response.statusCode} ");
    }
  }
}
