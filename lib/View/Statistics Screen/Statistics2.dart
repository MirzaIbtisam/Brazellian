import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Statistics2 extends StatefulWidget {
  const Statistics2({super.key});

  @override
  State<Statistics2> createState() => _Statistics2State();
}

class _Statistics2State extends State<Statistics2> {
  List<String> imge = [
    "assets/florida.png",
    "assets/Boston.webp",
    "assets/Chicago.png",
    "assets/Massachusets.webp",
    "assets/florida.png",
    "assets/Boston.webp",
    "assets/Chicago.png",
    "assets/Massachusets.webp",
  ];
  List<String> txt = [
    "Florida",
    "Boston",
    "Chicago",
    "Massachusetts",
    "Florida",
    "Boston",
    "Chicago",
    "Massachusetts",
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
            SizedBox(height: 30),
            Text(
              "Most Used Locations",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Plus Jakarta Sans",
                  color: Color(0xff111111)),
            ),
            SizedBox(height: 15),
            Text(
              "Places where your ads\n    get the most views",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Plus Jakarta Sans",
                  color: Color(0xff767676)),
            ),
            SizedBox(height: 10),
            Flexible(
              child: ListView.builder(
                itemCount: txt.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: country(
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

  Widget country(
    String imge,
    String txt,
  ) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(0xffd1d5d9))),
      height: 90,
      width: Get.width * 0.9,
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                      image: AssetImage(imge), fit: BoxFit.cover)),
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
                      color: Color(0xff8d959c),
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
