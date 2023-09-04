import 'package:brazeellian_community/Screens/Starting%20Pages/Sign_Up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Brazellian extends StatefulWidget {
  const Brazellian({super.key});

  @override
  State<Brazellian> createState() => _BrazellianState();
}

class _BrazellianState extends State<Brazellian> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        progressIndicator: const CupertinoActivityIndicator(),
        inAsyncCall:loading,
        child: Stack(
          children: [
            Image.asset(
              "assets/brazillion.jpg",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [SvgPicture.asset("assets/vedio play button.svg")],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                ),
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        "Connect with the best\nof Brazilian service!",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Plus Jakarta Sans",
                            color: Color(0xff232f30)),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Text(
                        "You missed Brazil, didn't you?\nClick on the video and learn\nall about the platform.",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Plus Jakarta Sans",
                          color: Color(0xff75838d),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        height: 55,
                        width: MediaQuery.of(context).size.width / 1.150,
                        child: ElevatedButton(
                            onPressed: () async{
                              setState(() {
                                loading=true;
                              });
                              await Future.delayed(const Duration(seconds: 3));
                              setState(() {
                                loading=false;

                              });
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (BuildContext context) {
                                    return Sign_Up();
                                  }));
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
            )
          ],
        ),
      ),
    );
  }
}
