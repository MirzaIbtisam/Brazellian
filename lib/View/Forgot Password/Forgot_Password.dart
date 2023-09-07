import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../Models/signUpModel.dart';
import '../../ViewModel/ApiServices/forgotApi.dart';
import 'Change_Password.dart';

class Forgot_Password extends StatefulWidget {
  const Forgot_Password({super.key});

  @override
  State<Forgot_Password> createState() => _Forgot_PasswordState();
}

class _Forgot_PasswordState extends State<Forgot_Password> {
  bool loading = false;
  TextEditingController email = TextEditingController();

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
                  "Forgot Password",
                  style: TextStyle(
                      fontSize: 24,
                      color: Color(0xff343A40),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "Recover your account password",
                  style: TextStyle(fontSize: 14, color: Color(0xff78828A)),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "E-mail",
                      style: TextStyle(fontSize: 14, color: Color(0xff78828A)),
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
                      LengthLimitingTextInputFormatter(30),
                    ],
                    controller: email,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 15),
                        border: InputBorder.none,
                        hintText: "Enter your email",
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Color(0xff9ca4ab),
                        )),
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
                        SignUpResponse response =
                            await ApiServicesforForgot.forgot(email.toString());
                        if (email.text.toString() == "") {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return CupertinoAlertDialog(
                                  title: Text('Error Message'),
                                  content: Text('Please Enter the Email'),
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
                        } else {
                          SignUpResponse response=await ApiServicesforForgot.forgot(email.text.toString());
                          if(response.message=="Code sent to email"){
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return Change_Password(
                                        email: email.text,
                                      );
                                    }));
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
