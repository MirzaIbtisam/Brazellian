import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Manage_Plan extends StatefulWidget {
  const Manage_Plan({Key? key}) : super(key: key);

  @override
  State<Manage_Plan> createState() => _Manage_PlanState();
}

class _Manage_PlanState extends State<Manage_Plan> {
  List<Color> colors = [
    Colors.white,
    Color(0xffffedbf),
    (ColorTween(
      begin: Color(0xfffdb807),
      end: Color(0xfffff0cc),
    ).lerp(0.5))!,
  ];

  List<List<String>> ssd = [
    [
      "2 monthly ads",
      "20 monthly highlights",
    ],
    [
      "4 monthly ads",
      "1 Pin fixed on map all yours",
      "1 Pin fixed on map all yours"
    ],
    [
      "8 ads month",
      "1 Pin on the map all yours",
      "Unlimited highlights",
      "Exclusive Support"
    ]
  ];
  List<String> txt1 = [
    "flat",
    "yellow",
    "business",
  ];
  List<String> txt2 = [
    "\$ Free",
    "\$ 14.99",
    "\$ 29.99",
  ];
  List<Color> color1 = [
    Color(0xffe5a910),
    Color(0xffe5a910),
    Color(0xff2e2d29),
  ];
  List<Color> color2 = [
    Color(0xfff4e5be),
    Color(0xfff4e5be),
    Color(0xffe5b12d),
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
                  "Manage Plan",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Plus Jakarta Sans",
                    color: Color(0xff111111),
                  ),
                ),
                SizedBox(width: 40),
              ],
            ),
            SizedBox(height: 40),
            Text(
              "Plans",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontFamily: "Plus Jakarta Sans",
                color: Color(0xff111111),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Choose the ideal plan according\n     according to your business\n              of your business",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                fontFamily: "Plus Jakarta Sans",
                color: Color(0xff9f9f9f),
              ),
            ),
            SizedBox(height: 20),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: colors.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 2) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xfffdb807), Color(0xfffeecbc)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Color(0xffd5a52b)),
                          ),
                          child: Plans(
                            txt1[index],
                            txt2[index],
                            colors[index],
                            ssd[index],
                            color1[index],
                            color2[index],
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        decoration: BoxDecoration(
                            color: colors[index],
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: color2[index])),
                        margin: EdgeInsets.only(bottom: 20),
                        child: Plans(
                          txt1[index],
                          txt2[index],
                          colors[index],
                          ssd[index],
                          color1[index],
                          color2[index],
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Plans(
    String txt1,
    String txt2,
    Color color,
    List asdas,
    Color color1,
    Color color2,
  ) {
    return Container(
      height: Get.height * 0.4255,
      child: Column(
        children: [
          SizedBox(height: 70),
          Text(
            txt1,
            style: TextStyle(
              fontSize: 44,
              fontWeight: FontWeight.w700,
              fontFamily: "Plus Jakarta Sans",
              color: Color(0xff282928),
            ),
          ),
          SizedBox(height: 15),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: txt2,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: Color(0xff282928),
                fontFamily: "Plus Jakarta Sans",
              ),
              children: [
                TextSpan(
                  text: "  /month",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff787878),
                    fontFamily: "Plus Jakarta Sans",
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              thickness: 0.5,
              color: color2,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Column(
              children: [
                SizedBox(
                  height: 110,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: asdas.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: Row(
                          children: [
                            Icon(Icons.check, color: color1),
                            SizedBox(width: 15),
                            Text(
                              asdas[index],
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Plus Jakarta Sans",
                                color: Color(0xff282928),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
