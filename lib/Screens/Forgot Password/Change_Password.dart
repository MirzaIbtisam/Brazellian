import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Change_Password extends StatelessWidget {
  const Change_Password({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xffececec),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      height: 50,
                      width: 50,
                      child: SvgPicture.asset(
                        "assets/back arrow.svg",
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  Text(
                    "Forgot Password",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Plus Jakarta Sans",
                        color: Color(0xff111111)),
                  ),
                  SizedBox(width: 40),
                ],
              ),
              SizedBox(height: 50),
              Text(
                "Confirm the code",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Plus Jakarta Sans",
                    color: Color(0xff111111)),
              ),
              SizedBox(height: 20),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "We have just sent you a 4-digit code to",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff999999),
                    fontFamily: "Plus Jakarta Sans",
                  ),
                  children: [
                    TextSpan(
                      text: "crissgermano@gmail.com",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff262223),
                        fontFamily: "Plus Jakarta Sans",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              OtpTextField(
                cursorColor: Colors.black,
                textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff6c6c6c),
                    fontFamily: "Plus Jakarta Sans"),
                numberOfFields: 4,
                borderColor: Colors.black,
                showFieldAsBox: true,
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Verification Code"),
                          content: Text('Code entered is $verificationCode'),
                        );
                      });
                }, // end onSubmit
              ),
              SizedBox(height: 70),
              SizedBox(
                height: 60,
                width: Get.width,
                child: ElevatedButton(
                    onPressed: () {
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
                                    fontSize: 12, color: Color(0xff6C6C6C)),
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xffCD9403),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: Text(
                      "Confirm",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontFamily: "Plus Jakarta Sans",
                          fontWeight: FontWeight.w600),
                    )),
              ),
              SizedBox(height: 30),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't you receive it?",
                    style: TextStyle(fontSize: 16, color: Color(0xff6C6C6C)),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Resend Code",
                    style: TextStyle(fontSize: 16, color: Color(0xff292526)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
