import 'package:brazeellian_community/View/Create%20Account/widgets/input_cPassword_widget.dart';
import 'package:brazeellian_community/View/Create%20Account/widgets/input_email_widget.dart';
import 'package:brazeellian_community/View/Create%20Account/widgets/input_name_widget.dart';
import 'package:brazeellian_community/View/Create%20Account/widgets/input_password_widget.dart';
import 'package:brazeellian_community/View/Create%20Account/widgets/signup_button_widget.dart';
import 'package:brazeellian_community/ViewModel/RegisterViewModel/RegisterViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';


class Create_Account extends StatefulWidget {
  Create_Account({super.key});

  @override
  State<Create_Account> createState() => _Create_AccountState();
}

class _Create_AccountState extends State<Create_Account> {
  bool loading=false;
  final registerVM = Get.put(RegisterViewModel()) ;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        progressIndicator: const CupertinoActivityIndicator(),
          inAsyncCall:loading,

        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 120),
                Text(
                  "Create Account",
                  style: TextStyle(
                      fontSize: 30,
                      color: Color(0xff222741),
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 10),
                Text(
                  "Please fill in the information below\nto create an account. It's a snap!",
                  style: TextStyle(fontSize: 16, color: Color(0xff75788D)),
                ),
                SizedBox(height: 40),
                Form(
                  key: _formkey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 15.0, top: 3.0, right: 15),
                          child: InputNameWidget(),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 15.0, top: 3.0, right: 15),
                          child: InputEmailWidget(),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 15.0, top: 3.0, right: 15),
                          child: InputPasswordWidget(),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 15.0, top: 3.0, right: 15),
                          child: InputConfirmPasswordWidget(),
                        ),
                  ],
                )),
                SizedBox(height: 80),
                Text(
                  "I already have an account",
                  style: TextStyle(fontSize: 16, color: Color(0xff75838d)),
                ),
                SizedBox(height: 30),
                SizedBox(
                  height: 55,
                  width: MediaQuery.of(context).size.width / 1.150,
                  child: SignUpButtonWidget( formKey: _formkey,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
