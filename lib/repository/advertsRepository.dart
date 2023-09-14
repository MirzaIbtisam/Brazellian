import 'package:brazeellian_community/constant/app_urls/app_urls.dart';
import 'package:brazeellian_community/data/network/networkApiServices.dart';

class advertsRepository {

  final _apiService  = NetworkApiServices() ;
  Future<dynamic> addApi(var data) async{
    dynamic response = await _apiService.postApi(data, "${Constants.baseUrl}${Constants.createAdvert}");
    return response ;
  }

  Future<dynamic> getApi(var data) async{
    dynamic response = await _apiService.getApi( "${Constants.baseUrl}${Constants.getAllAdverts}");
    return response ;
  }
}