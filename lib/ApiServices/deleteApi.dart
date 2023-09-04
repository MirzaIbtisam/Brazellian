import 'dart:convert';
import 'package:brazeellian_community/constant/constant.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/signUpModel.dart';

class ApiServicesforDelete {
  static Future<SignUpResponse> delete() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
     String id =  prefs.get("id").toString();
     print(id);
     String URL = "${Constants.baseUrl}${Constants.deleteUser}/$id"; // Replace 'Constants.baseUrl' with your actual base URL.
    print(URL);

    final response = await http.delete(
      Uri.parse(URL),

      headers: {"Content-Type": "application/json"},
    );
    final String res = response.body;
    if (res != 'null') {
      print(res);
      try {
        prefs.clear();
        final jsonData = json.decode(res) as Map<String, dynamic>;
        // Assuming the response follows the structure of SignUpResponse
        return SignUpResponse.fromJson(jsonData);
      } catch (e) {
        // Handle parsing error
        return SignUpResponse( error: e.toString());
      }
    }
    // Return an error response if the server response is 'null'
    return SignUpResponse(error: "Server returned null response");
  }
}

