import 'package:brazeellian_community/ViewModel/RegisterViewModel/RegisterViewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpButtonWidget extends StatelessWidget {
  final formKey ;
  SignUpButtonWidget({Key? key , required this.formKey}) : super(key: key);
  final registerVM = Get.put(RegisterViewModel()) ;

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
        onPressed: ()async{
          if(formKey.currentState!.validate()){
            registerVM.signUp();
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
          "Next",
          style: TextStyle(
              fontSize: 16, color: Colors.white),
        ));
  }
}