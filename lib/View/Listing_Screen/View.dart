import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class View_Items extends StatelessWidget {
  const View_Items({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 60),
              SvgPicture.asset(
                  "assets/guy offers discounts at an online store.svg",height: MediaQuery.of(context).size.height / 2.5,),
              SizedBox(height: 20),
              Text(
                "    Yeah!!\nGood job!",
                style: TextStyle(
                    fontSize: 26,
                    color: Color(0xff111111),
                    fontWeight: FontWeight.w700,
                    fontFamily: "Plus Jakarat Sans"),
              ),
              SizedBox(height: 20),
              Text(
                'Your ad was successfully registered!\nTo see how it looks, simply go to the item\nyour menu item called "My Items"\nnand it will and it will be there.',
                style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff111111),
                    fontWeight: FontWeight.w700,
                    fontFamily: "Plus Jakarat Sans"),textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              SizedBox(
                height: 60,
                width: Get.width * 0.9,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xfffcd9403),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 0),
                    child: Text(
                      "View item",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontFamily: "Plus Jakarta Sans"),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
