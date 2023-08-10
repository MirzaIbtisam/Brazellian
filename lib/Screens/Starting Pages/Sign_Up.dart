import 'package:brazeellian_community/Screens/Create%20Account/Create_Account.dart';
import 'package:brazeellian_community/Screens/Starting%20Pages/Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Sign_Up extends StatefulWidget {
  const Sign_Up({super.key});

  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {
  bool loading = false;

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
                          SizedBox(
                            height: 55,
                            width: MediaQuery.of(context).size.width / 1.150,
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
                                  Get.to(() => Login());
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff75838d),
                                    fontFamily: "Plus Jakarta Sans",
                                    fontSize: 14),
                              ),
                              SizedBox(width: 5),
                              InkWell(
                                onTap: () async {
                                  setState(() {
                                    loading = true;
                                  });
                                  await Future.delayed(
                                      const Duration(seconds: 3));
                                  setState(() {
                                    loading = false;
                                  });
                                  Get.to(() => Create_Account());
                                },
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff231f20),
                                      fontFamily: "Plus Jakarta Sans",
                                      fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Or conecting using',
                            style: TextStyle(
                                color: Color(0xff75838d),
                                fontSize: 14,
                                fontFamily: "Plus Jakarta Sans",
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: 30),
                          SizedBox(
                            height: 60,
                            width: MediaQuery.of(context).size.width / 1.150,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    elevation: 0,
                                    side: BorderSide(color: Color(0xff75838d))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                        "assets/Icon - Google.svg"),
                                    SizedBox(width: 20),
                                    Text(
                                      "Sign in with Google",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff75838d),
                                          fontFamily: "Plus Jakarta Sans",
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                )),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            height: 60,
                            width: MediaQuery.of(context).size.width / 1.150,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    elevation: 0,
                                    side: BorderSide(color: Color(0xff75838d))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset("assets/Icon - Apple.svg"),
                                    SizedBox(width: 20),
                                    Text(
                                      "Sign in with Apple",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff75838d),
                                          fontFamily: "Plus Jakarta Sans",
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                )),
                          ),
                          SizedBox(height: 10),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Login as a guest",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Plus Jakarta Sans",
                                  color: Color(0xffcd9403)),
                              textAlign: TextAlign.center,
                            ),
                          ),
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
