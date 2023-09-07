import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'Shoes_Screen.dart';

class Full_list extends StatefulWidget {
  const Full_list({super.key});

  @override
  State<Full_list> createState() => _Full_listState();
}

class _Full_listState extends State<Full_list> {
  List<String> img = [
    "assets/cramel shoes.jpg",
    "assets/i pad.jpg",
    "assets/ipad +airpod.jpg",
    "assets/macboookpro.jpg",
    "assets/cramel shoes.jpg",
    "assets/i pad.jpg",
    "assets/ipad +airpod.jpg",
    "assets/macboookpro.jpg",
    "assets/ipad +airpod.jpg",
    "assets/macboookpro.jpg",
  ];
  List<String> txt = [
    "New Balance\nCaramel",
    "Ipad 9th Generation\nNew sealed",
    "Aipad complete + airpods\n+ keyboard",
    "Macbook pro m2\nnew sealed",
    "New Balance\nCaramel",
    "Ipad 9th Generation\nNew sealed",
    "Aipad complete + airpods\n+ keyboard",
    "Macbook pro m2\nnew sealed",
    "Aipad complete + airpods\n+ keyboard",
    "Macbook pro m2\nnew sealed",
  ];
  List<String> txt1 = [
    "\$ 150,00",
    "\$ 3000,00",
    "\$ 1800,00",
    "\$ 3000,00",
    "\$ 150,00",
    "\$ 3000,00",
    "\$ 1800,00",
    "\$ 3000,00",
    "\$ 1800,00",
    "\$ 3000,00",
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
                  "My listings",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Plus Jakarta Sans",
                      color: Color(0xff111111)),
                ),
                SizedBox(width: 20),
              ],
            ),
            Flexible(
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 215,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                // itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return list(img[index], txt[index], txt1[index]);
                },
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget list(
    String img,
    String txt,
    String txt1,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xffedebe9)),
        borderRadius: BorderRadius.circular(15),
      ),
      height: MediaQuery.of(context).size.height / 3.7888,
      width: MediaQuery.of(context).size.width / 2.2,
      child: Column(
        children: [
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 140,
              width: MediaQuery.of(context).size.width / 2.4,
              child: Column(
                children: [
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        height: 15,
                        width: MediaQuery.of(context).size.width / 7.3,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xffe8ac19),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32))),
                            child: Text(
                              "Anúncios",
                              style: TextStyle(
                                  fontSize: 5,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Plus Jakarta Sans",
                                  color: Color(0xff705102)),
                            )),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xffb78506),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(100))),
                              child: SvgPicture.asset("assets/Pen, Edit.svg")),
                        ),
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: ElevatedButton(
                              onPressed: () {
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    title: SvgPicture.asset(
                                        "assets/Delete_Icon.svg"),
                                    content: Padding(
                                      padding: const EdgeInsets.only(left: 30),
                                      child: Text(
                                        "Are you sure you want to\n        delete this item?",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Color(0xff232f30),
                                            fontWeight: FontWeight.w700,
                                            fontFamily: "Plus Jakarta Sans"),
                                      ),
                                    ),
                                    actions: <Widget>[
                                      SizedBox(
                                        height: 50,
                                        width: Get.width * 0.9,
                                        child: ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                                primary: Color(0xffcd9403),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15))),
                                            child: Text(
                                              "Yes, I do",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily:
                                                      "Plus Jakarta Sans"),
                                            )),
                                      ),
                                      SizedBox(height: 10),
                                      Center(
                                        child: TextButton(
                                          child: Text(
                                            "Cancel",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff97a0a9),
                                                fontWeight: FontWeight.w600,
                                                fontFamily:
                                                    "Plus Jakarta Sans"),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                    ],
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xffbd2f13),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(100))),
                              child: SvgPicture.asset("assets/Del.svg")),
                        ),
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: ElevatedButton(
                              onPressed: () {
                                Get.to(() => Shoes());
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xff258feb),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(100))),
                              child: SvgPicture.asset("assets/eye-circle.svg")),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                txt,
                style: TextStyle(
                    fontSize: 11,
                    color: Color(0xff262e3c),
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Plus Jakarta Sans'),
              ),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset("assets/Location.svg"),
                    SizedBox(width: 3),
                    Text(
                      "Miami",
                      style: TextStyle(fontSize: 9, color: Color(0xff475467)),
                    )
                  ],
                ),
                Text(
                  txt1,
                  style: TextStyle(
                      fontSize: 12,
                      color: Color(0xffee9e03),
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
