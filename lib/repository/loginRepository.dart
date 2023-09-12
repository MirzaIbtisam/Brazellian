import 'package:brazeellian_community/constant/app_urls/app_urls.dart';
import 'package:brazeellian_community/data/network/networkApiServices.dart';

class LoginRepository {

  final _apiService  = NetworkApiServices() ;
  Future<dynamic> loginApi(var data) async{
    dynamic response = await _apiService.postApi(data, "${Constants.baseUrl}${Constants.loginUser}");
    return response ;
  }
}