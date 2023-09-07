import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Support extends StatelessWidget {
  const Support({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
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
                  "Support",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Plus Jakarta Sans",
                      color: Color(0xff111111)),
                ),
                SizedBox(width: 40),
              ],
            ),
            SizedBox(height: 40),
            SvgPicture.asset("assets/Suppport.svg"),
            SizedBox(height: 20),
            Text(
              "Contact Us!",
              style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Plus Jakarta Sans",
                  color: Color(0xff111111)),
            ),
            SizedBox(height: 10),
            Text(
              "        Call Center\n+1 (339) 215-9749",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Plus Jakarta Sans",
                  color: Color(0xff9ca4ab)),
            ),
            SizedBox(height: 10),
            Text(
              "    Or if you prefer, click on the\nbutton below to talk to our team!",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Plus Jakarta Sans",
                  color: Color(0xff9ca4ab)),
            ),
            SizedBox(height: 30),
            SizedBox(
              height: 60,
              width: Get.width * 0.9,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xffcd9403),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  child: Text(
                    "Contact now",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Plus Jakarta Sans",
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
