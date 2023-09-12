import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Validations/validations.dart';


class registerViewModel extends ChangeNotifier{
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  bool validate = false;
  bool loading = false;

  register(){
    if(name!.isNotEmpty&&email!.isNotEmpty&&password!.isNotEmpty&&confirmPassword!.isNotEmpty){
      Validations.validateName(name!);
      Validations.validateEmail(email!);
      Validations.validatePassword(password!);
    }
  }
}