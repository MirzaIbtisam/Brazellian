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
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson ;
      case 500:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson ;

      default :
        throw FetchDataException('Error accoured while communicating with server '+response.statusCode.toString()) ;
    }
  }
  Future<dynamic> postMultipartApi(
      Map data,
      String url,
        File? singleFile,
        List<File?> multipleFiles
    ) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }

    dynamic responseJson;
    try {
      final request = http.MultipartRequest('POST', Uri.parse(url));

      // Add fields to the request
      data.forEach((key, value) {
        request.fields[key] = value.toString();
      });
      if (singleFile != null) {
        final filePart = await http.MultipartFile.fromPath('thumbnail', singleFile.path);
        request.files.add(filePart);
      }
      if(multipleFiles!=null){
        for(int i=0;i<multipleFiles.length;i++){
          if(multipleFiles[i]!=null){
            final filePart = await http.MultipartFile.fromPath('images', multipleFiles[i]!.path);
            request.files.add(filePart);
          }
        }
      }
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }


}