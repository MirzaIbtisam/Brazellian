import 'dart:convert';
import 'package:brazeellian_community/constant/constant.dart';
import 'package:http/http.dart' as http;
import '../Models/signUpModel.dart';

class ApiServicesforListing {
  static Future<UserLoginResponse> addListing(Map<String, dynamic> body,String endpoint) async {
     String URL =
        "${Constants.baseUrl}${Constants.create}${endpoint}"; // Replace 'Constants.baseUrl' with your actual base URL.
    final response = await http.post(
      Uri.parse(URL),
      body: json.encode(body),
      headers: {"Content-Type": "application/json"},
    );
    final String res = response.body;
    if (res != 'null') {
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
