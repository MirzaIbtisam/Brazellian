import 'dart:convert';
import 'package:brazeellian_community/constant/constant.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Models/userModel.dart';


class ApiServicesforGetUserInfo{
  static Future<UserProfile> getUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String id =  prefs.get("id").toString();
    String URL =
        "${Constants.baseUrl}${Constants.getUser}/${id}"; // Replace 'Constants.baseUrl' with your actual base URL.
    print(URL);
    final response = await http.get(
      Uri.parse(URL),
      headers: {"Content-Type": "application/json"},
    );
    final String res = response.body;
    print(res);
    if (res != 'null') {
      try {
        Map<String, dynamic> jsonResponse = json.decode(res);
        return UserProfile.fromJson(jsonResponse['message']);
      } catch (e) {
        // Handle parsing error
        return UserProfile(id: " ", name: " ", email: " ", interests: [], accountType: " ", location: " ", language: " ", address: " ", complement: " ", dateOfBirth: " ", zipCode: " ", state: " ", gender: ' ');
      }
    }
    return UserProfile(id: " ", name: " ", email: " ", interests: [], accountType: " ", location: " ", language: " ", address: " ", complement: " ", dateOfBirth: " ", zipCode: " ", state: " ", gender: ' ');

  }
}
