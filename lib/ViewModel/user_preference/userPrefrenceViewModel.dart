import 'package:brazeellian_community/Models/signUpModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {
  Future<bool> saveUser(UserLoginResponse responseModel)async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('id', responseModel.id.toString());
    sp.setBool('isLogin', true);
    return true ;
  }

  Future<UserLoginResponse> getUser()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? id = sp.getString('id');
    bool? isLogin = sp.getBool('isLogin');
    return UserLoginResponse(
        id: id ,
        isLogin: isLogin
    ) ;
  }

  Future<bool> removeUser()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true ;
  }
}