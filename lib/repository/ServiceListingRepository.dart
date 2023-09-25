import 'dart:io';
import 'dart:math';

import 'package:brazeellian_community/constant/app_urls/app_urls.dart';
import 'package:brazeellian_community/data/network/networkApiServices.dart';

class ServiceRepository {

  final _apiService  = NetworkApiServices() ;
  Future<dynamic> addApi(var data,  File? singleFile, List<File?> multipleFiles
      ) async{
    dynamic response = await _apiService.postMultipartApi(data, "${Constants.baseUrl}${Constants.createService}" ,singleFile,multipleFiles);
    return response ;
  }
  Future<dynamic> postApi(var data
      ) async{
    dynamic response = await _apiService.postApi(data, "${Constants.baseUrl}${Constants.createService}" );
    return response ;
  }
  Future<dynamic> getApi() async{
    dynamic response = await _apiService.getApi( "${Constants.baseUrl}${Constants.getAllServices}");
    return response ;
  }
}