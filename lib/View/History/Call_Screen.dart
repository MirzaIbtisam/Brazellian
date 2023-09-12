import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Call_Screen extends StatelessWidget {
  const Call_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                "assets/Rectangle 22426.png",
                fit: BoxFit.cover,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 50),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Align(
                      alignment: Alignment.topLeft,
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
                  ),
                  Spacer(),
                  Column(
                    children: [
                      SizedBox(
                        height: 70,
                        width: 70,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xffe53935),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100))),
                            child: SvgPicture.asset(
                              "assets/end call.svg",
                              fit: BoxFit.scaleDown,
                            )),
                      ),
                      SizedBox(height: 70),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        height: 70,
                        width: Get.width * 0.9,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              "assets/jurandir.jpg")),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100)),
                                    ),
                                    height: 50,
                                    width: 50,
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Jurandir Peçanha",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xffFEFEFE),
                                            fontWeight: FontWeight.w700,
                                            fontFamily: "Plus Jakarta Sans"),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "@marketips",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xffd1d8dd),
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Plus Jakarta Sans"),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset("assets/Call pic1.svg"),
                                      SizedBox(width: 8),
                                      Text(
                                        "07.23",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xffe1e6ea),
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Plus Jakarta Sans"),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 22),
                                  SizedBox(),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
