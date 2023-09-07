import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:share_plus/share_plus.dart';

class Pin extends StatelessWidget {
  const Pin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 120),
            Text(
              "You QRPin",
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: "Plus Jakarta Sans",
                  fontWeight: FontWeight.w700,
                  color: Color(0xff111111)),
            ),
            SizedBox(height: 20),
            Text(
              "This is the link to your space here at Braelo,\n        click the button to share your page.",
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: "Plus Jakarta Sans",
                  fontWeight: FontWeight.w500,
                  color: Color(0xffb6b6b6)),
            ),
            SizedBox(height: 30),
            SvgPicture.asset("assets/pin code.svg"),
            SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xffdadee0))),
              height: 55,
              width: Get.width * 0.9,
              child: Center(
                child: Text(
                  "https://wa.me/00000000",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Plus Jakarta Sans",
                      fontWeight: FontWeight.w500,
                      color: Color(0xffa4aab0)),
                ),
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xffa2b0c5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100))),
                      child: SvgPicture.asset(
                          "assets/copy-paste-select-add-plus.svg")),
                ),
                SizedBox(width: 10),
                SizedBox(
                  height: 50,
                  width: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        Share.share("https://wa.me/00000000");
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xffcd9403),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100))),
                      child: SvgPicture.asset("assets/Group 1000004549.svg")),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
