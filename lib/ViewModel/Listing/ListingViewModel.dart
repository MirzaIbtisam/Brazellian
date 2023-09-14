import 'package:brazeellian_community/constant/app_urls/app_urls.dart';
import 'package:brazeellian_community/data/network/networkApiServices.dart';

class ListingRepository {

  final _apiService  = NetworkApiServices() ;
  Future<dynamic> uploadLists(var data , String event) async{
    dynamic response = await _apiService.postApi(data, "${Constants.baseUrl}${Constants.createEvent}");
    return response ;
  }
}