import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Detail_Screen.dart';

class Notcias extends StatefulWidget {
  const Notcias({super.key});

  @override
  State<Notcias> createState() => _NotciasState();
}

class _NotciasState extends State<Notcias> {
  List<String> President = [
    "assets/president eua.webp",
    "assets/president eua.webp",
    "assets/president eua.webp",
    "assets/president eua.webp",
    "assets/president eua.webp",
    "assets/president eua.webp",
    "assets/president eua.webp",
    "assets/president eua.webp",
    "assets/president eua.webp",
    "assets/president eua.webp",
  ];
  int currentIndex = 0;
  List<String> Imge = [
    "assets/president eua.webp",
    "assets/army.webp",
    "assets/trump.webp",
    "assets/capital of america.webp",
    "assets/historical place.webp",
  ];
  List<String> Txt = [
    "Ex-vice-presidente dos\nEUA, Mike Pence planeja\nlançar campanha às..",
    "Ele ficou sem países para\nvisitar, então criou o seu:\nConheça o DJ WIlliams..",
    "Trump foi gravado\nfalando sobre\ndocumento confidenc..",
    "Número de empresas de\ncapital aberto caiu à\nmetade nos EUA..",
    "Decisão da Suprema\nCorte dos EUA\nimpulsiona mapa eleit..",
  ];
  List<String> txt1 = [
    "Junho 2023",
    "Junho 2023",
    "Agosto 2023",
    "Setembro 2023",
    "Outubro 2023",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CarouselSlider.builder(
              itemCount: President.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: const BoxDecoration(),
                  child: Image.asset(
                    President[currentIndex],
                    fit: BoxFit.cover,
                  ),
                );
              },
              options: CarouselOptions(
                  viewportFraction: 1.0,
                  aspectRatio: 16 / 15,
                  initialPage: President.length,
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
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80, left: 30),
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
              SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Ex-vice-presidente dos EUA, Mike Pence\nplaneja lançar campanha às eleições..",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: "Plus Jakarta Sans",
                        fontWeight: FontWeight.bold),
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
                              primary: Color(0xffe2aa19),
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                              )),
                          child: Text(
                            "Notícias",
                            style: TextStyle(
                                fontSize: 10,
                                color: Color(0xff7c5a04),
                                fontWeight: FontWeight.w600,
                                fontFamily: "PlusJakarta Sans"),
                          )),
                    ),
                    SizedBox(
                      height: 25,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: Colors.black12,
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                  side: BorderSide(color: Colors.white))),
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/miami fl.svg"),
                              SizedBox(width: 1),
                              Text(
                                "Miami, FL",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "PlusJakarta Sans"),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Container(
                        height: 15,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xffeaecf0), width: 1),
                            borderRadius: BorderRadius.circular(32)),
                        child: DotsIndicator(
                          dotsCount: President.length,
                          position: currentIndex,
                          decorator: const DotsDecorator(
                            spacing: EdgeInsets.symmetric(horizontal: 4),
                            size: Size.square(7.5),
                            color: Color(0xffd0d5dd), // Inactive color
                            activeColor: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Flexible(
                        child: ListView.builder(
                          itemCount: Txt.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                something(index);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(bottom: 20),
                                  child: BraeloNews(
                                      Imge[index], Txt[index], txt1[index])),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget BraeloNews(
    String img,
    String Text1,
    String Text2,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(15),
            ),
            height: MediaQuery.of(context).size.height / 6.3,
            width: MediaQuery.of(context).size.width / 2.7,
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Text1,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Plus Jakarta Sans",
                    color: Color(0xff495057)),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Image.asset("assets/icon.png"),
                  SizedBox(width: 3),
                  Text(
                    "Braelo News",
                    style: TextStyle(
                        fontSize: 10,
                        fontFamily: "Plus Jakarta Sans",
                        fontWeight: FontWeight.w500,
                        color: Color(0xffdfbb60)),
                  )
                ],
              ),
              SizedBox(height: 10),
              Text(
                Text2,
                style: TextStyle(
                    fontSize: 10,
                    color: Color(0xff8a8a8a),
                    fontWeight: FontWeight.w500,
                    fontFamily: "Plus Jakarta Sans"),
              )
            ],
          ),
        ],
      ),
    );
  }

  something(int index) {
    if (index == 0) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
        return Detail_Screen();
      }));
    }
  }
}
