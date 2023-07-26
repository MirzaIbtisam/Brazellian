import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Statistics1 extends StatefulWidget {
  const Statistics1({super.key});

  @override
  State<Statistics1> createState() => _Statistics1State();
}

class _Statistics1State extends State<Statistics1> {
  List<String> imge = [
    "assets/shoes1.webp",
    "assets/shoes2.webp",
    "assets/shoes4.jpg",
    "assets/shoes1.webp",
    "assets/shoes2.webp",
    "assets/shoes4.jpg",
    "assets/shoes1.webp",
    "assets/shoes2.webp",
  ];
  List<String> txt = [
    "Adidas Sneakers ",
    "NB Sneakers ",
    "Nike Sneakers ",
    "Adidas Sneakers ",
    "NB Sneakers ",
    "Nike Sneakers ",
    "NB Sneakers ",
    "Nike Sneakers ",
  ];

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
            SizedBox(height: 40),
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
                Text(
                  "View All",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xffbac0c6),
                      fontFamily: "Plus Jakarta Sans",
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SizedBox(height: 15),
            Flexible(
              child: ListView.builder(
                itemCount: txt.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: shoess(
                        imge[index],
                        txt[index],
                      ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget shoess(
    String imge,
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
                    DecorationImage(image: AssetImage(imge), fit: BoxFit.cover),
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
}