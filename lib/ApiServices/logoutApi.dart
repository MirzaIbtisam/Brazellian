import 'dart:convert';
import 'package:brazeellian_community/constant/constant.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/signUpModel.dart';

class ApiServicesforlogout {
  static Future<UserLoginResponse> logout() async {
    const String URL = "${Constants.baseUrl}${Constants.logoutUser}"; // Replace 'Constants.baseUrl' with your actual base URL.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String id =  prefs.get("id").toString();
    Map<String, dynamic> body = {
      'id': id,
    };
    print(body);
    final response = await http.post(
      Uri.parse(URL),
      body: json.encode(body),
      headers: {"Content-Type": "application/json"},
    );
    final String res = response.body;
    print(response.body);
    if (res != 'null') {
      print(res);
      try {
        final jsonData = json.decode(res) as Map<String, dynamic>;

        return UserLoginResponse.fromJson(jsonData);
      } catch (e) {
        // Handle parsing error
        return UserLoginResponse( error: e.toString());
      }
    }
    // Return an error response if the server response is 'null'
    return UserLoginResponse(error: "Server returned null response");
  }
}

