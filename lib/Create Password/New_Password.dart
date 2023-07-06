import 'package:brazeellian_community/Home%20Screen/Home_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class New_Password extends StatelessWidget {
  const New_Password({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
                  keyboardType: TextInputType.number,
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
                  keyboardType: TextInputType.number,
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
                              "Senha alterada\n com sucesso!",
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
                                "Recomendamos que você anote\n     para não esquecer, okay?",
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
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) {
                                                return Home_Screen();
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
                      "Continuar",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
