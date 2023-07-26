import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class High_Lights extends StatefulWidget {
  const High_Lights({super.key});

  @override
  State<High_Lights> createState() => _High_LightsState();
}

class _High_LightsState extends State<High_Lights> {
  List<String> imge = [
    "assets/Music.png",
    "assets/Smoking.png",
    "assets/gruping.png",
    "assets/Music.png",
    "assets/Smoking.png",
    "assets/gruping.png",
    "assets/Music.png",
    "assets/Smoking.png",
    "assets/gruping.png",
    "assets/Music.png",
    "assets/Smoking.png",
    "assets/gruping.png",


  ];
  List<String> img = [
    "assets/dj.jpg",
    "assets/makeupkit.jpg",
    "assets/eye.webp",
    "assets/dj.jpg",
    "assets/makeupkit.jpg",
    "assets/eye.webp",
    "assets/dj.jpg",
    "assets/makeupkit.jpg",
    "assets/eye.webp",
    "assets/dj.jpg",
    "assets/makeupkit.jpg",
    "assets/eye.webp",

  ];
  List<String> txt1 = [
    "Eventos",
    "Beauty",
    "Beauty",
    "Eventos",
    "Beauty",
    "Beauty",
    "Eventos",
    "Beauty",
    "Beauty",
    "Eventos",
    "Beauty",
    "Beauty",

  ];
  List<String> txt2 = [
    "The Power of Networking",
    "Event Makeup Artist",
    "Makeup Kit ",
    "The Power of Networking",
    "Event Makeup Artist",
    "Makeup Kit ",
    "The Power of Networking",
    "Event Makeup Artist",
    "Makeup Kit ",
    "The Power of Networking",
    "Event Makeup Artist",
    "Makeup Kit ",

  ];
  List<String> txt3 = [
    "\$ VIP 199,00",
    "\$ 92,00",
    "\$ 92,00",
    "\$ VIP 199,00",
    "\$ 92,00",
    "\$ 92,00",
    "\$ VIP 199,00",
    "\$ 92,00",
    "\$ 92,00",
    "\$ VIP 199,00",
    "\$ 92,00",
    "\$ 92,00",

  ];
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: CarouselSlider.builder(
              itemCount: imge.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Music(context, imge[index], img[index], txt1[index],
                    txt2[index], txt3[index]);
              },
              options: CarouselOptions(
                  aspectRatio: MediaQuery.of(context).size.width /
                      MediaQuery.of(context).size.height,
                  viewportFraction: 2.0,
                  initialPage: imge.length,
                  enableInfiniteScroll: false,
                  reverse: false,
                  autoPlay: true,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (int index, CarouselPageChangedReason reason) {
                    setState(() {

                      currentIndex =
                          index; // Update currentIndex when the carousel index changes
                    });
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: DotsIndicator(
                  dotsCount: imge.length,
                  position: currentIndex,
                  decorator: DotsDecorator(
                      activeSize: Size(100, 4),
                      spacing: EdgeInsets.symmetric(horizontal: 4),
                      size: Size(10, 4),
                      // Default size for both active and inactive dots
                      color: const Color(0xff9c9c9c),
                      // Inactive color
                      activeColor: Color(0xffffefc7),
                      // Active color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            5), // Customize the shape of the dots
                      ),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10), // Customize the shape of the active dot
                      ))),
            ),
          ),
        ],
      ),
    );
  }

  int currentIndex = 0;

  Widget Music(
    BuildContext context,
    String imge,
    String img,
    String txt1,
    String txt2,
    String txt3,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Stack(children: [
        SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              imge,
              fit: BoxFit.cover,
            )),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      height: 50,
                      width: 50,
                      child: SvgPicture.asset(
                        "assets/back arrow.svg",
                        color: Colors.white,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 200,
              ),
              SizedBox(
                height: 60,
                width: 60,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(255, 255, 255, 0.12),
                    // white12 color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: SvgPicture.asset("assets/Volume.svg"),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "  Tap to turn\nthe sound on",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Plus Jakarta Sans"),
              ),
              Expanded(
                child: SizedBox(),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 100,
                  width: Get.width * 0.9,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6.0),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(img), fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          height: 90,
                          width: Get.width * 0.2444,
                          child: Column(
                            children: [
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: SizedBox(
                                    height: 15,
                                    width: Get.width * 0.1333,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          primary: Color(0xffe5ac1c),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5))),
                                      child: Text(
                                        txt1,
                                        style: TextStyle(
                                            fontSize: 6,
                                            color: Color(0xff705102),
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Plus Jakarta Sans"),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              txt2,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff464646),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Plus Jakarta Sans"),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                SvgPicture.asset("assets/Vector4.svg"),
                                SizedBox(width: 5),
                                Text(
                                  txt3,
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: Color(0xff5dadf6),
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Plus Jakarta Sans"),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                SvgPicture.asset("assets/Location.svg"),
                                SizedBox(width: 5),
                                Text(
                                  "Miami",
                                  style: TextStyle(
                                      fontSize: 8,
                                      color: Color(0xffabb1ba),
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Plus Jakarta Sans"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
