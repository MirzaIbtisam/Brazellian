import 'dart:convert';
import 'dart:io';
import 'package:brazeellian_community/data/network/baseApiServices.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../app_exceptions.dart';
class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url)async{
    if (kDebugMode) {
      print(url);
    }
    dynamic responseJson ;
    try {
      final response = await http.get(Uri.parse(url)).timeout( const Duration(seconds: 10));
      responseJson  = returnResponse(response) ;
    }on SocketException {
      throw InternetException('');
    }on RequestTimeOut {
      throw RequestTimeOut('');
    }
    return responseJson ;
  }


  @override
  Future<dynamic> postApi(var data , String url)async{

    if (kDebugMode) {
      print(url);
      print(data);
    }

    dynamic responseJson ;
    try {
      final response = await http.post(Uri.parse(url),
          body: json.encode(data),
        headers: {"Content-Type": "application/json"},
      ).timeout( const Duration(seconds: 10));
      responseJson  = returnResponse(response) ;
    }on SocketException {
      throw InternetException('');
    }on RequestTimeOut {
      throw RequestTimeOut('');

    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson ;

  }

  dynamic returnResponse(http.Response response){
    print("Hello");
    print(response.body);
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson ;
      case 404:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson ;

      default :
        throw FetchDataException('Error accoured while communicating with server '+response.statusCode.toString()) ;
    }
  }

}