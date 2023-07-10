import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

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
                  "Messages",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Plus Jakarta Sans",
                      color: Color(0xff111111)),
                ),
                SizedBox(width: 40),
              ],
            ),
            SizedBox(height: 25),
            Container(
              decoration: BoxDecoration(
                color: Color(0xfff6f8fe),
                borderRadius: BorderRadius.circular(15),
              ),
              height: 55,
              width: Get.width,
              child: TextFormField(
                inputFormatters: [LengthLimitingTextInputFormatter(25)],
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 18),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(top: 9),
                      child: SvgPicture.asset(
                        "assets/Seacrh.svg",
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    hintText: "Search...",
                    hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Plus Jakarta Sans",
                        color: Color(0xffa3aab1)),
                    border: InputBorder.none),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/picture.jpg"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  height: 60,
                  width: 60,
                  child: Stack(
                    children: [
                      Transform.translate(
                        offset: Offset(40, 45),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff00c566),
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          height: 18,
                          width: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
