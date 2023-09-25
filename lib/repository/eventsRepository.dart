import 'dart:io';

import 'package:brazeellian_community/constant/app_urls/app_urls.dart';
import 'package:brazeellian_community/data/network/networkApiServices.dart';

class eventsRepository {

  final _apiService  = NetworkApiServices() ;
  Future<dynamic> postApi(var data) async{
    dynamic response = await _apiService.postApi(data, "${Constants.baseUrl}${Constants.createEvent}");
    return response ;
  }

  Future<dynamic> addApi(var data,  File? singleFile, List<File?> multipleFiles
      ) async{
    dynamic response = await _apiService.postMultipartApi(data, "${Constants.baseUrl}${Constants.createEvent}" ,singleFile,multipleFiles);
    return response ;
  }
  Future<dynamic> getApi() async{
    dynamic response = await _apiService.getApi( "${Constants.baseUrl}${Constants.getAllEvents}");
    return response ;
  }
}