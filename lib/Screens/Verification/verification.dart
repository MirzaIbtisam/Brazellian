import 'package:brazeellian_community/Models/signUpModel.dart';
import 'package:brazeellian_community/Screens/Starting%20Pages/Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../ApiServices/verificationapi.dart';
import '../Selecione o seu perfil/Selecione.dart';

class verification extends StatefulWidget {
  final email;
  const verification({super.key, this.email});

  @override
  State<verification> createState() => _verificationState();
}

class _verificationState extends State<verification> {
  bool loading = false;
  TextEditingController Code = TextEditingController();
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
                SizedBox(height: 120),
                Text(
                  "Enter the code",
                  style: TextStyle(
                      fontSize: 24,
                      color: Color(0xff111111),
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 15),
                Text(
                  "We have just sent you a 4-digit code to",
                  style: TextStyle(fontSize: 14, color: Color(0xff6C6C6C)),
                ),
                Text(
                  "example@gmail.com",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff3A3A3A),
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: OtpTextField(
                    textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff6c6c6c),
                        fontFamily: "Plus Jakarta Sans"),
                    numberOfFields: 4,
                    borderColor: Color(0xFF6c6c6c),
                    showFieldAsBox: true,
                    onCodeChanged: (String code) {},
                    onSubmit: (String verificationCode) {
                      Code.text = verificationCode.toString();
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Verification Code"),
                              content:
                                  Text('Code entered is $verificationCode'),
                            );
                          });
                    }, // end onSubmit
                  ),
                ),
                SizedBox(height: 40),
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
                        SignUpResponse response = await ApiServicesforVerification. verification(widget.email.toString(),Code.text.toString());
                        if(response.message=="OTP verified successfully"){
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              title: SvgPicture.asset("assets/Vector.svg"),
                              content: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(
                                  "Código confirmado\n     com sucesso!",
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Color(0xff343A40),
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              actions: <Widget>[
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Estamos quase lá! Agora precisamos\n   saber um pouco mais sobre você",
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xff6C6C6C)),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    height: 53,
                                    width:
                                    MediaQuery.of(context).size.width / 1.5,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(builder:
                                                  (BuildContext context) {
                                                return Login();
                                              }));
                                        },
                                        style: ElevatedButton.styleFrom(
                                            primary: Color(0xffCD9403),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(15))),
                                        child: Text(
                                          "Continuar",
                                          style: TextStyle(
                                              fontSize: 16, color: Colors.white),
                                        )),
                                  ),
                                ),
                                SizedBox(height: 15),
                              ],
                            ),
                          );
                        }
                        else {
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
                SizedBox(height: 25),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't receive?",
                      style: TextStyle(fontSize: 15, color: Color(0xff6C6C6C)),
                    ),
                    SizedBox(height: 5),
                    Text(
                      " Resend Code",
                      style: TextStyle(fontSize: 15, color: Color(0xffCD9403)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
