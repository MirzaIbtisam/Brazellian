import 'package:brazeellian_community/Validations/validations.dart';
import 'package:brazeellian_community/ViewModel/RegisterViewModel/RegisterViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class InputPasswordWidget extends StatelessWidget {
  InputPasswordWidget({Key? key}) : super(key: key);

  final registerVM = Get.put(RegisterViewModel()) ;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      inputFormatters: [
        LengthLimitingTextInputFormatter(50)
      ],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: Validations.validatePassword,
      controller: registerVM.passwordController.value,
      focusNode: registerVM.passwordFocusNode.value,
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
        hintText: "Enter Password",
        hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: "Plus Jakarta Sans",
            color: Color(0xff75788d)),
      ),
      obscureText: true,
    );
  }
}