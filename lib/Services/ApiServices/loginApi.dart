import 'dart:convert';

import 'package:brazeellian_community/constant/app_urls/app_urls.dart';
import 'package:http/http.dart' as http;

import '../../Models/signUpModel.dart';

class ApiServicesforlogin {
  static Future<UserLoginResponse> login(
    String email,
    String password,
  ) async {
    const String URL =
        "${Constants.baseUrl}${Constants.loginUser}"; // Replace 'Constants.baseUrl' with your actual base URL.
    Map<String, dynamic> body = {
      'email': email,
      'password': password,
    };
    final response = await http.post(
      Uri.parse(URL),
      body: json.encode(body),
      headers: {"Content-Type": "application/json"},
    );
    final String res = response.body;
    // print(response.body[])
    if (res != 'null') {
      print(res);
      try {
        final jsonData = json.decode(res) as Map<String, dynamic>;
        // Assuming the response follows the structure of SignUpResponse
        return UserLoginResponse.fromJson(jsonData);
      } catch (e) {
        // Handle parsing error
        return UserLoginResponse(error: e.toString());
      }
    }
    // Return an error response if the server response is 'null'
    return UserLoginResponse(error: "Server returned null response");
  }
}
