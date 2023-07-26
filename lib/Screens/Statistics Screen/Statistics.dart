import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'Statistics1.dart';
import 'Statistics2.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
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
              // SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Most clicked items",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff9198a0),
                        fontFamily: "Plus Jakarta Sans",
                        fontWeight: FontWeight.w600),
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(Statistics1());
                    },
                    child: Text(
                      "View All",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xffbac0c6),
                          fontFamily: "Plus Jakarta Sans",
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              shoes("assets/shoes1.webp", "Adidas Sneakers"),
              SizedBox(height: 20),
              shoes("assets/shoes2.webp", "NB Sneakers"),
              SizedBox(height: 20),
              shoes("assets/shoes4.jpg", "Nike Sneakers"),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Most Used Locations",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff9198a0),
                        fontFamily: "Plus Jakarta Sans",
                        fontWeight: FontWeight.w600),
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(Statistics2());
                    },
                    child: Text(
                      "View All",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xffbac0c6),
                          fontFamily: "Plus Jakarta Sans",
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              SvgPicture.asset("assets/Mapping.svg"),
              SizedBox(height: 30),
              country(0xffd53129, "Florida"),
              SizedBox(height: 20),
              country(0xff3f81cc, "Boston"),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget shoes(
    String Imge,
    String txt,
  ) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(0xffd1d5d9))),
      height: 100,
      width: Get.width * 0.9,
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage(Imge), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 70,
              width: Get.width * 0.2,
            ),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  txt,
                  style: TextStyle(
                      fontSize: 13,
                      color: Color(0xff868e96),
                      fontFamily: "Plus Jakarta Sans",
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 8),
                Text(
                  "Registered on 08/13/2023",
                  style: TextStyle(
                      fontSize: 8,
                      color: Color(0xffacacac),
                      fontFamily: "Plus Jakarta Sans",
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("assets/Eye.svg"),
                        Text(
                          "1.200 Views",
                          style: TextStyle(
                              fontSize: 9,
                              color: Color(0xff9d9d9d),
                              fontFamily: "Plus Jakarta Sans",
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(width: 5),
                    Row(
                      children: [
                        SvgPicture.asset("assets/Save.svg"),
                        Text(
                          "120 Saves",
                          style: TextStyle(
                              fontSize: 9,
                              color: Color(0xff9d9d9d),
                              fontFamily: "Plus Jakarta Sans",
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(width: 5),
                    Row(
                      children: [
                        SvgPicture.asset("assets/Clicks.svg"),
                        Text(
                          "120 Clicks",
                          style: TextStyle(
                              fontSize: 9,
                              color: Color(0xff9d9d9d),
                              fontFamily: "Plus Jakarta Sans",
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget country(
    int color,
    String txt,
  ) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(0xffd1d5d9))),
      height: 80,
      width: Get.width * 0.9,
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(color),
                borderRadius: BorderRadius.circular(100),
              ),
              height: 60,
              width: 60,
            ),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  txt,
                  style: TextStyle(
                      fontSize: 13,
                      color: Color(0xff9198a0),
                      fontFamily: "Plus Jakarta Sans",
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("assets/Gender.svg"),
                        SizedBox(width: 5),
                        Text(
                          "Gen. Female",
                          style: TextStyle(
                              fontSize: 9,
                              color: Color(0xffb2b2b2),
                              fontFamily: "Plus Jakarta Sans",
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(width: 8),
                    Row(
                      children: [
                        SvgPicture.asset("assets/User.svg"),
                        SizedBox(width: 5),
                        Text(
                          "15K Users",
                          style: TextStyle(
                              fontSize: 9,
                              color: Color(0xffb2b2b2),
                              fontFamily: "Plus Jakarta Sans",
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(width: 8),
                    Row(
                      children: [
                        SvgPicture.asset("assets/click.svg"),
                        SizedBox(width: 5),
                        Text(
                          "1M Clicks",
                          style: TextStyle(
                              fontSize: 9,
                              color: Color(0xffb2b2b2),
                              fontFamily: "Plus Jakarta Sans",
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
