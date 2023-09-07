
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../Create Password/New_Password.dart';
import '../Starting Pages/Login.dart';

class welcome extends StatefulWidget {
  const welcome({super.key});

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: loading,
        progressIndicator: const CupertinoActivityIndicator(),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 130),
              SvgPicture.asset("assets/Group 1000004649.svg"),
              SizedBox(height: 30),
              Text(
                "Welcome!",
                style: TextStyle(
                    fontSize: 27,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "           how good it is to have you with us.\nNow you are part of this family that only grows!",
                style: TextStyle(fontSize: 13, color: Color(0xff6C6C6C)),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: SizedBox(
                  height: 55,
                  width: MediaQuery.of(context).size.width / 1.150,
                  child: ElevatedButton(
                      onPressed: () async{
                        setState(() {
                          loading=true;
                        });
                        await Future.delayed(Duration(seconds: 2));
                        setState(() {
                          loading=false;
                        });
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            title: SvgPicture.asset("assets/Vector.svg"),
                            content: Padding(
                              padding: const EdgeInsets.only(left: 70),
                              child: Text(
                                "Prontinho!",
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Color(0xff343A40),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            actions: <Widget>[
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "  Sua conta está pronta para ser usada.\nVocê será redirecionado para a página\n      inicial em poucos segundos...",
                                  style: TextStyle(
                                      fontSize: 12, color: Color(0xff6C6C6C)),
                                ),
                              ),
                              SizedBox(height: 20),
                              Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: 53,
                                  width: MediaQuery.of(context).size.width / 1.5,
                                  child: ElevatedButton(
                                      onPressed: () async{
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (BuildContext context) {
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
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xffCD9403),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: Text(
                        "Start",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
