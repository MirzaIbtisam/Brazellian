
import 'package:brazeellian_community/View/Starting%20Pages/widgets/input_email_widget.dart';
import 'package:brazeellian_community/View/Starting%20Pages/widgets/input_password_widget.dart';
import 'package:brazeellian_community/View/Starting%20Pages/widgets/login_button_widget.dart';
import 'package:brazeellian_community/ViewModel/login/loginViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../Forgot Password/Forgot_Password.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  bool loading = false;
  final loginVM = Get.put(LoginViewModel()) ;
  final _formkey = GlobalKey<FormState>();
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
                          Form(
                            key: _formkey,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 15.0, top: 3.0, right: 15),
                                  child: InputEmailWidget(),
                                ),
                                const SizedBox(height: 20,),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 15.0, top: 3.0, right: 15),
                                  child: InputPasswordWidget(),
                                ),
                              ],
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
                            child: LoginButtonWidget(formKey: _formkey,),
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
