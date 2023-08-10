import 'package:brazeellian_community/Screens/Bottom%20Bar/Bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../ApiServices/updatedpassApi.dart';
import '../../Models/signUpModel.dart';

class New_Password extends StatefulWidget {
  final email;

  const New_Password({super.key, this.email});

  @override
  State<New_Password> createState() => _New_PasswordState();
}

class _New_PasswordState extends State<New_Password> {
  bool loading = false;
  TextEditingController newpassword = TextEditingController();
  TextEditingController Confirmpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: loading,
        progressIndicator: const CupertinoActivityIndicator(),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 130),
                Text(
                  "     Create a\nNew Password",
                  style: TextStyle(
                      fontSize: 24,
                      color: Color(0xff343A40),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "Enter your new password",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff78828A),
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "New Password",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff78828A),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xfff6f8fe),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 50,
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(12),
                    ],
                    controller: newpassword,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 15, top: 15),
                        border: InputBorder.none,
                        suffixIcon: SvgPicture.asset(
                          "assets/bold vector.svg",
                          fit: BoxFit.scaleDown,
                        ),
                        hintText: "Enter new password",
                        hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color(0xff9ca4ab),
                            fontWeight: FontWeight.w500)),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Confirm Password",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff78828A),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xfff6f8fe),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 50,
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(12),
                    ],
                    controller: Confirmpassword,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 15, top: 15),
                        border: InputBorder.none,
                        suffixIcon: SvgPicture.asset(
                          "assets/bold vector.svg",
                          fit: BoxFit.scaleDown,
                        ),
                        hintText: "Confirm your password",
                        hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color(0xff9ca4ab),
                            fontWeight: FontWeight.w500)),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 30),
                SizedBox(
                  height: 55,
                  width: MediaQuery.of(context).size.width / 1.150,
                  child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          loading = true;
                        });
                        await Future.delayed(Duration(seconds: 3));
                        setState(() {
                          loading = false;
                        });

                        if (Confirmpassword.text == newpassword.text &&
                            (Confirmpassword.text != "" &&
                                newpassword.text != "")) {
                          SignUpResponse response =
                              await ApiServicesforUpdatedPassword
                                  .UpdatedPassword(widget.email.toString(),
                                      Confirmpassword.text.toString());
                          if (response.message ==
                              "Password updated successfully") {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                title: SvgPicture.asset("assets/Vector.svg"),
                                content: Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: Text(
                                    "Wonderful!",
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: Color(0xff343A40),
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "Plus Jakarta Sans"),
                                  ),
                                ),
                                actions: <Widget>[
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Your password wassuccessfully changed!\nWrite it down so you don't forget it, okay?",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff6C6C6C)),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                ],
                              ),
                            );
                          }
                        } else {
                          if (newpassword.text.toString().isEmpty &&
                              Confirmpassword.text.toString().isEmpty) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return CupertinoAlertDialog(
                                    title: Text('Error Message'),
                                    content: Text('Please Enter the Password'),
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
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xffCD9403),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: Text(
                        "Continuar",
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
