import 'package:brazeellian_community/ApiServices/loginApi.dart';
import 'package:brazeellian_community/Screens/Bottom%20Bar/Bottom_bar.dart';
import 'package:brazeellian_community/Screens/Forgot%20Password/Forgot_Password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Models/signUpModel.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  bool loading = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  void _login(BuildContext context,String id) async {
    await _saveLoggedIn(id);
  }
  Future<void> _saveLoggedIn(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString("id", id);}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        progressIndicator: const CupertinoActivityIndicator(),
        inAsyncCall: loading,
        child: Stack(
          children: [
            Image.asset(
              "assets/brasilcoms_0030.jpg",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                      ),
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Text(
                            "Connect with our people!",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Plus Jakarta Sans",
                                color: Color(0xff232f30)),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15.0, top: 3.0, right: 15),
                            child: TextFormField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(50)
                              ],
                              controller: email,
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
                            ),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15.0, top: 3.0, right: 15),
                            child: TextFormField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(50)
                              ],
                              controller: password,
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
                                hintText: "********",
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Plus Jakarta Sans",
                                    color: Color(0xff75788d)),
                              ),
                              obscureText: true,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Don't have an account?",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Plus Jakarta Sans",
                                      color: Color(0xff78828a)),
                                ),
                                TextButton(
                                  onPressed: () async {


                                    Get.to(() => Forgot_Password());
                                  },
                                  child: Text(
                                    "Forgot password?"
                                    "",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Plus Jakarta Sans",
                                        color: Color(0xff231f20)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            height: 55,
                            width: MediaQuery.of(context).size.width / 1.1,
                            child: ElevatedButton(
                                onPressed: () async {
                                  setState(() {
                                    loading = true;
                                  });
                                  await Future.delayed(
                                      const Duration(seconds: 3));
                                  setState(() {
                                    loading = false;
                                  });
                                  if (email.text.toString() == "" ||
                                      password.text.toString() == "") {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return CupertinoAlertDialog(
                                            title: Text('Error Message'),
                                            content: Text(
                                                'Please fillout email and password'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(
                                                      context); //close Dialog
                                                },
                                                child: Text('Close'),
                                              )
                                            ],
                                          );
                                        });
                                  } else {
                                    UserLoginResponse response =
                                        await ApiServicesforlogin.login(
                                            email.text.toString(),
                                            password.text.toString());
                                    if (response.message ==
                                        "User logged in successfully") {
                                      _login(context, response.id.toString());
                                      print(response.id);
                                      print("ASdasd");
                                      Get.to(() => Bottom_bar());
                                    } else {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return CupertinoAlertDialog(
                                              title: Text('Error Message'),
                                              content: response.error != null
                                                  ? Text(
                                                      response.error.toString())
                                                  : Text(response.message
                                                      .toString()),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(
                                                        context); //close Dialog
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
                                        borderRadius:
                                            BorderRadius.circular(15))),
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                )),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Or conecting using",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Plus Jakarta Sans",
                                color: Color(0xff78828a)),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/Icon - Google.svg"),
                              SizedBox(width: 10),
                              SvgPicture.asset("assets/Icon - Apple.svg"),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
