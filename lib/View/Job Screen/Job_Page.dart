import 'package:brazeellian_community/constant/colors/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';

class Job_Page extends StatefulWidget {
  const Job_Page({super.key});

  @override
  State<Job_Page> createState() => Job_PageState();
}

class Job_PageState extends State<Job_Page> {
  List<String> Imge = [
    "assets/Flag.svg",
    "assets/Group 1000004549.svg",
    "assets/facebook.svg",
    "assets/Instagram.svg",
    "assets/Whatsup.svg",
  ];

  List<Color> color = [
    const Color(0xffffdbd9),
    ColorValues.darkBgColor,
    const Color(0xff0066da),
    const Color(0xffd5299b),
    const Color(0xff4cd964),
  ];
  List<String> Gardener = [
    "assets/Gardener.jpg",
    "assets/Gardener.jpg",
    "assets/Gardener.jpg",
    "assets/Gardener.jpg",
    "assets/Gardener.jpg",
    "assets/Gardener.jpg",
    "assets/Gardener.jpg",
    "assets/Gardener.jpg",
    "assets/Gardener.jpg",
    "assets/Gardener.jpg",
  ];
  int currentIndex = 0;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CarouselSlider.builder(
              itemCount: Gardener.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: const BoxDecoration(),
                  child: Image.asset(
                    Gardener[currentIndex],
                    fit: BoxFit.cover,
                  ),
                );
              },
              options: CarouselOptions(
                  viewportFraction: 1.0,
                  aspectRatio: 16 / 15,
                  initialPage: Gardener.length,
                  enableInfiniteScroll: false,
                  reverse: false,
                  autoPlay: true,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (int index, CarouselPageChangedReason reason) {
                    setState(() {
                      currentIndex =
                          index; // Update currentIndex when the carousel index changes
                    });
                  })),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 30),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white54,
                            borderRadius: BorderRadius.circular(100)),
                        height: 45,
                        width: 45,
                        child: SvgPicture.asset(
                          "assets/Arrow - Left.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 110),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Auxiliar de Serviços\nGerais pra obra",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: "Plus Jakarta Sans",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 25,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                primary: const Color(0xffe2aa19),
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                )),
                            child: const Text(
                              "Trabalho",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xff7c5a04),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "PlusJakarta Sans"),
                            )),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Linsting id  BRLO9623",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontFamily: "Plus Jakarta Sans",
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Container(
                          height: 15,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0xffeaecf0), width: 1),
                              borderRadius: BorderRadius.circular(32)),
                          child: DotsIndicator(
                            dotsCount: Gardener.length,
                            position: currentIndex,
                            decorator: const DotsDecorator(
                              spacing: EdgeInsets.symmetric(horizontal: 4),
                              size: Size.square(7.5),
                              color: Color(0xffd0d5dd), // Inactive color
                              activeColor: Color(0xff495057),
                            ),
                          ),
                        ),
                        Column(children: [
                          const SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 40,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        elevation: 0.0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(32),
                                            side: const BorderSide(
                                                color: Color(0xffeaecf0)))),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/miami fl.svg",
                                          color: const Color(0xff1d2939),
                                        ),
                                        const SizedBox(width: 5),
                                        const Text(
                                          "Miami, FL",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Color(0xff475467),
                                              fontWeight: FontWeight.w400,
                                              fontFamily: "PlusJakarta Sans"),
                                        ),
                                      ],
                                    )),
                              ),
                              Row(
                                children: [
                                  RatingBar.builder(
                                    unratedColor: const Color(0xfffed79f),
                                    initialRating: 3,
                                    minRating: 1,
                                    allowHalfRating: true,
                                    itemCount: 1,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 3.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star_half_rounded,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  const Text(
                                    "4.6 ",
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontFamily: "Plus Jakarta Sans",
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xff282928)),
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Auxiliar de Serviços\nGerais pra obra",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xff101828),
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Plus Jakarta Sans"),
                              ),
                              SvgPicture.asset("assets/Favorite.svg")
                            ],
                          ),
                          SizedBox(height: 10),
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              "\$ 50",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff75818d),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Plus Jakarta Sans"),
                            ),
                          ),
                          SizedBox(height: 10),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "About",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff75818d),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Plus Jakarta Sans"),
                            ),
                          ),
                          SizedBox(height: 10),
                          Divider(
                            thickness: 0.5,
                            color: Color(0xffefefef),
                          ),
                          SizedBox(height: 10),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Amet minim mollit non deserunt ullamco est sit\naliqua dolor do amet sint. Velit officia consequat\nduis enim velit mollit. Exercitation ...",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff828a9b),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Plus Jakarta Sans"),
                            ),
                          ),
                          const SizedBox(height: 20),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isExpanded = !isExpanded;
                              });
                            },
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                isExpanded ? 'Show Less' : 'Read More',
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                          if (isExpanded)
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                'This is the expanded text that will be shown when you click "Read More".\nYou can add more content here!',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff828a9b),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Plus Jakarta Sans"),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          const SizedBox(height: 20),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Address",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff818a9b),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Plus Jakarta Sans"),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "City Hall Square, Florida   |    Miami    |    EUA",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff8990a1),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Plus Jakarta Sans"),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Contact",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff818a9b),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Plus Jakarta Sans"),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "+1 (339) 215-9749",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff8990a1),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Plus Jakarta Sans"),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          SizedBox(height: 20),
                          SvgPicture.asset("assets/map.svg"),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 50,
                                width: MediaQuery.of(context).size.width / 2.4,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        primary: Color(0xff868e96),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15))),
                                    child: Text(
                                      "Message",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "Plus Jakarta Sans",
                                          color: Colors.white),
                                    )),
                              ),
                              SizedBox(
                                height: 50,
                                width: MediaQuery.of(context).size.width / 2.4,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        primary: Color(0xffcd9403),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15))),
                                    child: Text(
                                      "Rate",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "Plus Jakarta Sans",
                                          color: Colors.white),
                                    )),
                              )
                            ],
                          ),
                          SizedBox(height: 40),
                          SizedBox(
                            height: 55,
                            child: Center(
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: Imge.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child:
                                        Button(Imge[index], color[index], () {
                                      share(index);
                                    }),
                                  );
                                },
                              ),
                            ),
                          ),
                        ]),
                        SizedBox(height: 20),
                        SvgPicture.asset("assets/card.svg"),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget Button(
    String img,
    Color text,
    void Function() onPressed,
  ) {
    return SizedBox(
      height: 55,
      width: 55,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              primary: text,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(360)),
              elevation: 0),
          child: SvgPicture.asset(img)),
    );
  }

  share(int index) async {
    if (index == 1) {
      print("object");
      final box = context.findRenderObject() as RenderBox?;
      final shareContent = "Your text to share";
      final subject = "Subject of the share";
      final position = box!.localToGlobal(Offset.zero);
      final size = box.size;

      Share.share(
        shareContent,
        subject: subject,
        sharePositionOrigin: position & size,
      );
    }
  }
}
