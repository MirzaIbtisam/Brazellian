import 'package:brazeellian_community/Models/signUpModel.dart';
import 'package:brazeellian_community/Utils/utils.dart';
import 'package:brazeellian_community/ViewModel/user_preference/userPrefrenceViewModel.dart';
import 'package:brazeellian_community/constant/routes/routes_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../repository/signupRepository.dart';

class RegisterViewModel extends GetxController {

  final _api = SignUpRepository();
  UserPreference userPreference = UserPreference();
  final emailController = TextEditingController().obs ;
  final nameController = TextEditingController().obs ;
  final passwordController = TextEditingController().obs ;
  final confirmPasswordController = TextEditingController().obs ;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  final confirmPasswordFocusNode = FocusNode().obs;
  final nameFocusNode = FocusNode().obs;
  RxBool loading = false.obs;

  void signUp(){
    loading.value = true ;
    if(confirmPasswordController.value.text!=passwordController.value.text){
      Utils.snackBar('Note', "Your Password and Confirm password doesn't match");
    }
    else{
      Map data = {
        'email' : emailController.value.text,
        'password' : passwordController.value.text,
        'name': nameController.value.text
      };
      _api.signUpApi(data).then((value){
        loading.value = false ;
        if(value['error'] == 'User not found'){
          Utils.snackBar('Signup', value['error']);
        }else {
          UserLoginResponse userModel = UserLoginResponse(
              id: value['id'] ,
              isLogin: true
          );
          userPreference.saveUser(userModel).then((value){
            Get.delete<RegisterViewModel>();
            Get.toNamed(RouteName.AccountType)!.then((value){});
            Utils.snackBar('Login', 'User Registered Successfully');
          }).onError((error, stackTrace){
          });
        }
      }).onError((error, stackTrace){
        loading.value = false ;
        Utils.snackBar('Error', error.toString());
      });
    }
  }
}