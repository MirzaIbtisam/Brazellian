import 'package:brazeellian_community/constant/app_urls/app_urls.dart';
import 'package:brazeellian_community/data/network/networkApiServices.dart';

class UserRepository {

  final _apiService  = NetworkApiServices() ;
  Future<dynamic> updateAccountTypeApi(var data) async{
    dynamic response = await _apiService.postApi(data, "${Constants.baseUrl}${Constants.updateAccountType}");
    return response ;
  }
  Future<dynamic> updatePassowrdApi(var data) async{
    dynamic response = await _apiService.postApi(data, "${Constants.baseUrl}${Constants.updatePassword}");
    return response ;
  }
  Future<dynamic> updateInterestApi(var data) async{
    dynamic response = await _apiService.postApi(data, "${Constants.baseUrl}${Constants.updateInterests}");
    return response ;
  }
  Future<dynamic> updateLanguageApi(var data) async{
    dynamic response = await _apiService.postApi(data, "${Constants.baseUrl}${Constants.updateLanguage}");
    return response ;
  }
  Future<dynamic> signUpApi(var data) async{
    dynamic response = await _apiService.postApi(data, "${Constants.baseUrl}${Constants.registerUser}");
    return response ;
  }
  Future<dynamic> updateLocationApi(var data) async{
    dynamic response = await _apiService.postApi(data, "${Constants.baseUrl}${Constants.updateLocation}");
    return response ;
  }
  Future<dynamic> updateUserProfileApi(var data) async{
    dynamic response = await _apiService.postApi(data, "${Constants.baseUrl}${Constants.updateProfile}");
    return response ;
  }
  Future<dynamic> getUserInfo(String id) async{
    dynamic response = await _apiService.getApi("${Constants.baseUrl}${Constants.getUser}/${id}");
    return response ;
  }
}