import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Statistics extends StatelessWidget {
  const Statistics({super.key});

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
                  "Statistics",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Plus Jakarta Sans",
                      color: Color(0xff111111)),
                ),
                SizedBox(width: 40),
              ],
            ),
            SvgPicture.asset("assets/Group 427322030.svg"),
            SizedBox(height: 20),
            Row(
              children: [

              ],
            )
          ],
        ),
      ),
    );
  }
}
