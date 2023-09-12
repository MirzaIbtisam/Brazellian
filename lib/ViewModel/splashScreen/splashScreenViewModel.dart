import 'dart:async';
import 'package:brazeellian_community/ViewModel/user_preference/userPrefrenceViewModel.dart';
import 'package:brazeellian_community/constant/routes/routes_name.dart';
import 'package:get/get.dart';

class SplashServices {

  UserPreference userPreference = UserPreference();

  void isLogin(){
    userPreference.getUser().then((value){
      if(value.isLogin == false || value.isLogin.toString() == 'null'){
        Timer(const Duration(seconds: 3) ,
                () => Get.toNamed(RouteName.loginView) );
      }else {
        Timer(const Duration(seconds: 3) ,
                () => Get.toNamed(RouteName.homeView) );
      }
    });
  }
}