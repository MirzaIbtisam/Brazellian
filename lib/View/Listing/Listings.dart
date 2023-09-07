import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'Full_list.dart';
import 'New_Add.dart';
import 'Spotlight.dart';

class Listings extends StatefulWidget {
  const Listings({super.key});

  @override
  State<Listings> createState() => _ListingsState();
}

class _ListingsState extends State<Listings> {
  List<String> files = [
    "assets/advertice now.svg",
    "assets/advertice now.svg",
    "assets/advertice now.svg",
    "assets/advertice now.svg",
    "assets/advertice now.svg",
  ];
  List<String> images = [
    "assets/gruping.png",
    "assets/brushes.jpg",
    "assets/cramel shoes.jpg",
    "assets/skuter.webp",
    "assets/car.webp",
    "assets/gruping.png",
    "assets/brushes.jpg",
    "assets/cramel shoes.jpg",
    "assets/skuter.webp",
    "assets/car.webp",
  ];
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
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
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Your listings",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Plus Jakarta Sans",
                      color: Color(0xff212121)),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => Full_list());
                  },
                  child: Text(
                    "View All",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Plus Jakarta Sans",
                        color: Color(0xffa4acb2)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Divider(
            thickness: 0.5,
            color: Color(0xffe3e7ec),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView(
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 215,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              // itemCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                listing("assets/cramel shoes.jpg", "New Balance\nCaramel",
                    "\$ 150,00", context),
                listing("assets/i pad.jpg", "Ipad 9th Generation\nNew sealed",
                    "\$ 3000,00", context),
                listing(
                    "assets/ipad +airpod.jpg",
                    "Aipad complete + airpods\n+ keyboard",
                    "\$ 1800,00",
                    context),
                listing("assets/macboookpro.jpg", "Macbook pro m2\nnew sealed",
                    "\$ 3000,00", context),
              ],
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width / 1.1,
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => New_Add());
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff495057),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  child: Text(
                    "New listing",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Plus Jakarta Sans",
                        color: Colors.white),
                  )),
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width / 1.1,
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(()=> Spotlight());
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xffcd9403),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  child: Text(
                    "New sotlight",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Plus Jakarta Sans",
                        color: Colors.white),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  CarouselSlider.builder(
                      itemCount: files.length,
                      itemBuilder:
                          (BuildContext context, int index, int realIndex) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: const BoxDecoration(),
                          child: SvgPicture.asset(
                            files[currentIndex],
                            height: MediaQuery.of(context).size.height / 5,
                          ),
                        );
                      },
                      options: CarouselOptions(
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: files.length,
                          enableInfiniteScroll: false,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          scrollDirection: Axis.horizontal,
                          onPageChanged:
                              (int index, CarouselPageChangedReason reason) {
                            setState(() {
                              currentIndex =
                                  index; // Update currentIndex when the carousel index changes
                            });
                          })),
                  Container(
                    height: 15,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xffeaecf0), width: 1),
                        borderRadius: BorderRadius.circular(32)),
                    child: DotsIndicator(
                      dotsCount: files.length,
                      position: currentIndex,
                      decorator: const DotsDecorator(
                        spacing: EdgeInsets.symmetric(horizontal: 4),
                        size: Size.square(7.5),
                        color: Color(0xffd0d5dd), // Inactive color
                        activeColor: Color(0xffee9e03),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Spotlights",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Plus Jakarta Sans",
                    color: Color(0xff212121)),
              ),
            ),
          ),
          SizedBox(height: 10),
          Divider(
            thickness: 0.5,
            color: Color(0xffe3e7ec),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: SizedBox(
              height: 70,
              child: ListView.builder(
                itemCount: images.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(right: 8),
                    child: list1(images[index]),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 100),
          SvgPicture.asset("assets/card.svg"),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget listing(
    String img,
    String txt1,
    String txt2,
    BuildContext context,
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
                              onPressed: () {},
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
                              onPressed: () {},
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
                txt1,
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
                  txt2,
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

  Widget list1(
    String img,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xffeeac04), width: 2),
        borderRadius: BorderRadius.circular(100),
      ),
      height: 70,
      width: 70,
      child: Padding(
        padding: const EdgeInsets.all(1.5),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}
