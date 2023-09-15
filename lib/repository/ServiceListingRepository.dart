import 'dart:io';

import 'package:brazeellian_community/constant/app_urls/app_urls.dart';
import 'package:brazeellian_community/data/network/networkApiServices.dart';

class ServiceRepository {

  final _apiService  = NetworkApiServices() ;
  Future<dynamic> addApi(var data,  File? singleFile,
  // List<File?> multipleFiles
      ) async{
    dynamic response = await _apiService.postMultipartApi(data, "${Constants.baseUrl}${Constants.createService}" ,singleFile);
    return response ;
  }

  Future<dynamic> getApi(var data) async{
    dynamic response = await _apiService.getApi( "${Constants.baseUrl}${Constants.getAllServices}");
    return response ;
  }
}