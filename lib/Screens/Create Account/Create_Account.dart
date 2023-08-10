import 'dart:async';
import 'package:brazeellian_community/ApiServices/signupApi.dart';
import 'package:brazeellian_community/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../Models/signUpModel.dart';
import '../Verification/verification.dart';

class Create_Account extends StatefulWidget {
  Create_Account({super.key});

  @override
  State<Create_Account> createState() => _Create_AccountState();
}

class _Create_AccountState extends State<Create_Account> {
  bool loading=false;
  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController confirmPassword=TextEditingController();
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
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xffefefef)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 50,
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(20),
                    ],
                    controller: name,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 15),
                        border: InputBorder.none,
                        hintText: "Full name",
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Color(0xff75788D),
                        )),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xffefefef)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 50,
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(30),
                    ],
                    controller: email,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 15),
                        border: InputBorder.none,
                        hintText: "Enter your email",
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Color(0xff75788D),
                        )),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xffefefef)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 50,
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(15),
                    ],
                    controller: password,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 15, top: 12),
                        border: InputBorder.none,
                        suffixIcon: SvgPicture.asset(
                          "assets/Icon.svg",
                          fit: BoxFit.scaleDown,
                        ),
                        hintText: "password",
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Color(0xff75788D),
                        )),
                    // obscureText: true,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xffefefef)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 50,
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(15),
                    ],
                    controller: confirmPassword,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 15, top: 12),
                        border: InputBorder.none,
                        suffixIcon: SvgPicture.asset(
                          "assets/Icon.svg",
                          fit: BoxFit.scaleDown,
                        ),
                        hintText: "Confirm password",
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Color(0xff75788D),
                        )),
                    // obscureText: true,
                  ),
                ),
                SizedBox(height: 80),
                Text(
                  "I already have an account",
                  style: TextStyle(fontSize: 16, color: Color(0xff75838d)),
                ),
                SizedBox(height: 30),
                SizedBox(
                  height: 55,
                  width: MediaQuery.of(context).size.width / 1.150,
                  child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          loading=true;
                        });
                         await Future.delayed(const Duration(seconds: 3));
                        setState(() {
                          loading=false;

                        });
                        // Navigator.of(context).pushReplacement(
                        //     MaterialPageRoute(builder: (BuildContext context) {
                        //       return verification(email: email.text,);
                        //     }));
                        if(confirmPassword.text==password.text&&(confirmPassword.text!=""&&password.text!="")){
                          SignUpResponse response=await ApiServicesforSignUp.signup(email.text, password.text, name.text);
                          if(response.message=="User Created Successfully"){
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (BuildContext context) {
                                  return verification(email: email.text,);
                                }));
                          }
                          else{
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return CupertinoAlertDialog(
                                    title: Text('Error Message'),
                                    content:response.error!=null? Text(response.error.toString()):Text(response.message.toString()),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context); //close Dialog
                                        },
                                        child: Text('Close'),
                                      )
                                    ],
                                  );
                                });
                          }
                        }
                        else{
                          showDialog(
                              context: context,
                              builder: (context) {
                                return CupertinoAlertDialog(
                                  title: Text('Error Message'),
                                  content: Text('Password and Confirm Password do not match'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context); //close Dialog
                                      },
                                      child: Text('Close'),
                                    )
                                  ],
                                );
                              });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xffCD9403),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: Text(
                        "Next",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
