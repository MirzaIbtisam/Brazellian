import 'package:brazeellian_community/Validations/validations.dart';
import 'package:brazeellian_community/ViewModel/login/loginViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../utils/utils.dart';

class InputEmailWidget extends StatelessWidget {
  InputEmailWidget({Key? key}) : super(key: key);

  final loginVM = Get.put(LoginViewModel()) ;

  @override
  Widget build(BuildContext context) {

    return  TextFormField(
      inputFormatters: [
        LengthLimitingTextInputFormatter(50)
      ],
      controller: loginVM.emailController.value,
      focusNode: loginVM.emailFocusNode.value,
      validator:Validations.validateEmail,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.blue, width: 1.0),
          borderRadius: BorderRadius.circular(15.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Color(0xffefefef), width: 1.0),
          borderRadius: BorderRadius.circular(15.0),
        ),
        border: InputBorder.none,
        hintText: "crissgermano@gmail.com",
        hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: "Plus Jakarta Sans",
            color: Color(0xff75788d)),
      ),
    );
  }
}