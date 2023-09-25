import 'package:brazeellian_community/ViewModel/LoginViewModel/loginViewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginButtonWidget extends StatelessWidget {
  final formKey ;
  LoginButtonWidget({Key? key , required this.formKey}) : super(key: key);
  final loginVM = Get.put(LoginViewModel()) ;

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
        onPressed: ()async{
          if(formKey.currentState!.validate()){
            loginVM.loginApi();
          }
          else{
          }
        },
        style: ElevatedButton.styleFrom(
            primary: Color(0xffCD9403),
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(15))),
        child: Text(
          "Login",
          style: TextStyle(
              fontSize: 16, color: Colors.white),
        ));
  }
}