import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';

import '../../Models/eventModel.dart';
import '../../constant/colors/colors.dart';

class Detail extends StatefulWidget {
  Event data;
  Detail({super.key,required this.data});

  @override
  State<Detail> createState() => DetailState();
}

class DetailState extends State<Detail> {

  List<String> Imge = [
    "assets/Group 1000004549.svg",
    "assets/facebook.svg",
    "assets/Instagram.svg",
    "assets/Whatsup.svg",
  ];

  List<Color> color = [
    ColorValues.darkBgColor,
    const Color(0xff0066da),
    const Color(0xffd5299b),
    const Color(0xff4cd964),
  ];
  List<String> shoes = [
    "assets/Events.webp",
    "assets/Events.webp",
    "assets/Events.webp",
    "assets/Events.webp",
    "assets/Events.webp",
    "assets/Events.webp",
    "assets/Events.webp",
    "assets/Events.webp",
    "assets/Events.webp",
    "assets/Events.webp",
  ];
  int currentIndex = 0;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CarouselSlider.builder(
              itemCount: shoes.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: const BoxDecoration(),
                  child: Image.asset(
                    shoes[currentIndex],
                    fit: BoxFit.cover,
                  ),
                );
              },
              options: CarouselOptions(
                  viewportFraction: 1.0,
                  aspectRatio: 16 / 15,
                  initialPage: shoes.length,
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
                const SizedBox(height: 200),
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
                              "Events",
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
                SizedBox(height: 15),
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
                            dotsCount: shoes.length,
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
                                         Text(
                                          "${widget.data.local}",
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Color(0xff475467),
                                              fontWeight: FontWeight.w400,
                                              fontFamily: "PlusJakarta Sans"),
                                        ),
                                      ],
                                    )),
                              ),
                              Text(
                                "${widget.data.date}".split('T')[0],
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff78828a),
                                    fontFamily: "Plus Jakarta Sans",
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "${widget?.data.title}",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff101828),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Plus Jakarta Sans"),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "${widget.data.description}",
                              style: TextStyle(
                                  fontSize: 12,
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
                                style: const TextStyle(
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
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Imigrante há 18 anos, já residiu em 5 países, é cidadão\nportuguês e residente nos Estados Unidos, onde seu Green\nCard foi aprovado por habilidade extraordinária em\nempreendedorismo. Atualmente mora em Orlando na\nFlórida, de onde coordena suas empresas pelo mundo.\nBruno sempre teve o dom das conexões e percebeu que\npoderia ensinar essa habilidade para os outros. Assim,\nnasceu o “O Poder do Network”, que é hoje o maior evento\nde Networking do Mundo.',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff828a9b),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Plus Jakarta Sans"),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          SizedBox(height: 30),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Data",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff667085),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Plus Jakarta Sans"),
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    "${widget.data.date}",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff667085),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Plus Jakarta Sans"),
                                  ),
                                ],
                              ),
                              SizedBox(width: 50),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Horário",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff667085),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Plus Jakarta Sans"),
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    "16h30min",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff667085),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Plus Jakarta Sans"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Duração",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff667085),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Plus Jakarta Sans"),
                            ),
                          ),
                          SizedBox(height: 15),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "8:00 pm - 11:00 pm",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff667085),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Plus Jakarta Sans"),
                            ),
                          ),
                          SizedBox(height: 20),
                          Align(
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
                          SizedBox(height: 10),
                          Align(
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
                          SizedBox(height: 20),
                          SvgPicture.asset("assets/map.svg"),
                          SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Contact",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff818a9b),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Plus Jakarta Sans"),
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "+1 (339) 215-9749",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff8990a1),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Plus Jakarta Sans"),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 55,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: Imge.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 3),
                                      child:
                                          Button(Imge[index], color[index], () {
                                        share(index);
                                      }),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
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
                                        primary: Color(0xffcd9403),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15))),
                                    child: Text(
                                      "Mensagem",
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
                                      "Avaliar",
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
                        ]),
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
    return PhysicalModel(
      elevation: 0, // You can adjust the elevation if you want a shadow effect
      shape: BoxShape.circle,
      color: Colors.transparent, // Set a transparent color to the circle
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: text, // Set the desired background color
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            primary: text,
            // Set a transparent background color for the ElevatedButton
            shape: CircleBorder(), // Ensure the ElevatedButton is a circle too
          ),
          child: SvgPicture.asset(img),
        ),
      ),
    );
  }

  share(int index) async {
    if (index == 0) {
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
