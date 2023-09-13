import 'package:brazeellian_community/constant/app_urls/app_urls.dart';
import 'package:brazeellian_community/data/network/networkApiServices.dart';

class SignUpRepository {

  final _apiService  = NetworkApiServices() ;
  Future<dynamic> signUpApi(var data) async{
    dynamic response = await _apiService.postApi(data, "${Constants.baseUrl}${Constants.registerUser}");
    return response ;
  }
}