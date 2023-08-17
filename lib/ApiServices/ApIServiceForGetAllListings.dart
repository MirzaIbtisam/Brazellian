import 'dart:convert';
import 'package:brazeellian_community/constant/constant.dart';
import 'package:http/http.dart' as http;

import '../Models/eventModel.dart';
import '../Models/signUpModel.dart';

class ApiServicesforGetListing {
  static Future<EventsResponse> getAllEvents() async {
    String URL =
        "${baseUrl}getAllEvents"; // Replace 'baseUrl' with your actual base URL.
    final response = await http.get(
      Uri.parse(URL),
      headers: {"Content-Type": "application/json"},
    );
    final String res = response.body;
    if (res != 'null') {
      try {
        final jsonData = json.decode(res) as Map<String, dynamic>;
        // Assuming the response follows the structure of SignUpResponse
        return EventsResponse.fromJson(jsonData);
      } catch (e) {
        // Handle parsing error
        return EventsResponse(events: []);
      }
    }
    // Return an error response if the server response is 'null'
    return EventsResponse(events: []);
  }
}
