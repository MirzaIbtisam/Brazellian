import 'package:brazeellian_community/Models/signUpModel.dart';
import 'package:brazeellian_community/Utils/utils.dart';
import 'package:brazeellian_community/ViewModel/user_preference/userPrefrenceViewModel.dart';
import 'package:brazeellian_community/constant/routes/routes_name.dart';
import 'package:brazeellian_community/repository/loginRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository();
  UserPreference userPreference = UserPreference();
  final emailController = TextEditingController(text: "immuhammadfaizan@gmail.com").obs;
  final passwordController = TextEditingController(text: "12345678").obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  RxBool loading = false.obs;
  void loginApi(){
    loading.value = true;
    Map data =  {
      'email' : emailController.value.text,
      'password' : passwordController.value.text
    };
    _api.loginApi(data).then((value) {
      loading.value = false ;
      if(value['error'] == 'User not found'){
        Utils.snackBar('Login', value['error']);
      }else {
        UserLoginResponse userModel = UserLoginResponse(
            id: value['id'] ,
            isLogin: true
        );
        userPreference.saveUser(userModel).then((value){
          Get.delete<LoginViewModel>();
          Get.toNamed(RouteName.homeView)!.then((value){});
          Utils.snackBar('Login', 'Login successfully');
        }).onError((error, stackTrace){

        });
      }
    }).onError((error, stackTrace){
      loading.value = false ;
      Utils.snackBar('Error', error.toString());
    });
  }
}