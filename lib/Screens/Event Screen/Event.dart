import 'package:brazeellian_community/Screens/Event%20Screen/Detail.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../ApiServices/ApIServiceForGetAllListings.dart';
import '../../Models/eventModel.dart';
import '../Component/Multiple Service.dart';

class Event extends StatefulWidget {
  const Event({super.key});

  @override
  State<Event> createState() => EventState();
}

class EventState extends State<Event> {



  List<String> Event = [
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialize();
    setState(() {

    });
  }
  EventsResponse? data;
  void initialize()async{
    data =await ApiServicesforGetListing.getAllEvents();
    print(data?.events[0].title);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CarouselSlider.builder(
              itemCount: Event.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: const BoxDecoration(),
                  child: Image.asset(
                    Event[currentIndex],
                    fit: BoxFit.cover,
                  ),
                );
              },
              options: CarouselOptions(
                  viewportFraction: 1.0,
                  aspectRatio: 16 / 15,
                  initialPage: Event.length,
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
              SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
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
                    Text(
                      "Eventos",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: "Plus Jakarta Sans",
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(width: 30),
                  ],
                ),
              ),
              SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "O Poder do networking Miami\nDécima edição",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: "Plus Jakarta Sans",
                        fontWeight: FontWeight.w600),
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
                            "Eventos",
                            style: TextStyle(
                                fontSize: 10,
                                color: Color(0xff7c5a04),
                                fontWeight: FontWeight.w600,
                                fontFamily: "PlusJakarta Sans"),
                          )),
                    ),
                    Text(
                      "10 Julho 2023",
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: "PlusJakarta Sans"),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    physics: ScrollPhysics(),
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
                            dotsCount: Event.length,
                            position: currentIndex,
                            decorator: const DotsDecorator(
                              spacing: EdgeInsets.symmetric(horizontal: 4),
                              size: Size.square(7.5),
                              color: Color(0xffd0d5dd), // Inactive color
                              activeColor: Color(0xff495057),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xfff6f8fb),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          height: 60,
                          width: MediaQuery.of(context).size.width / 1.1,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: TextFormField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(50),
                              ],
                              decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(top: 20, left: 15),
                                  border: InputBorder.none,
                                  hintText: "O que você busca?",
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xffb7bec5)),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: SvgPicture.asset(
                                      "assets/Seacrh.svg",
                                      fit: BoxFit.scaleDown,
                                    ),
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Divider(
                          thickness: 0.5,
                          color: Color(0xffefefef),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              GridView.builder(
                                shrinkWrap: true,
                                itemCount: data?.events.length, // Replace with the actual item count
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, // Number of columns in the grid
                                  crossAxisSpacing: 10.0, // Spacing between columns
                                  mainAxisSpacing: 20.0, // Spacing between rows
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  // Replace with your item widget
                                  return Multiple_Service(
                                      Image1: "assets/Event button.svg",
                                      Image2: "assets/Favorite (1).svg",
                                      Image3: "assets/Events.png",
                                      Text1: "${data?.events[index].title}",
                                      Text2: "\$ 50,00");
                                },
                              ),
                              SizedBox(height: 30),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Destaques da semana",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "PlusJakarta Sans"),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Divider(
                                thickness: 0.5,
                                color: Color(0xffefefef),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: SizedBox(
                                  height: 220,
                                  child: GridView(
                                    scrollDirection: Axis.horizontal,
                                    gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      mainAxisExtent: 185,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                    ),
                                    // itemCount: 4,
                                    shrinkWrap: true,
                                    children: [
                                      Multiple_Service(
                                          Image1: "assets/Event button.svg",
                                          Image2: "assets/Favorite.svg",
                                          Image3: "assets/Events.webp",
                                          Text1:
                                          "O poder do Networking\nSegunda Edição",
                                          Text2: "\$ 50,00"),
                                      Multiple_Service(
                                          Image1: "assets/Event button.svg",
                                          Image2: "assets/Favorite (1).svg",
                                          Image3: "assets/Events.png",
                                          Text1:
                                          "O poder do Networking\nTerceira Edição",
                                          Text2: "\$ 50,00"),
                                      Multiple_Service(
                                          Image1: "assets/Event button.svg",
                                          Image2: "assets/Favorite (1).svg",
                                          Image3: "assets/Events.webp",
                                          Text1:
                                          "O poder do Networking\nTerceira Edição",
                                          Text2: "\$ 50,00"),
                                      Multiple_Service(
                                          Image1: "assets/Event button.svg",
                                          Image2: "assets/Favorite (1).svg",
                                          Image3: "assets/Events.png",
                                          Text1:
                                          "O poder do Networking\nTerceira Edição",
                                          Text2: "\$ 50,00"),
                                      Multiple_Service(
                                          Image1: "assets/Event button.svg",
                                          Image2: "assets/Favorite (1).svg",
                                          Image3: "assets/Events.webp",
                                          Text1:
                                          "O poder do Networking\nTerceira Edição",
                                          Text2: "\$ 50,00"),
                                      Multiple_Service(
                                          Image1: "assets/Event button.svg",
                                          Image2: "assets/Favorite (1).svg",
                                          Image3: "assets/Events.png",
                                          Text1:
                                          "O poder do Networking\nTerceira Edição",
                                          Text2: "\$ 50,00"),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 50),
                              SvgPicture.asset("assets/card.svg"),
                              SizedBox(height: 50),
                            ],
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 15),
                        //   child: GridView(
                        //     scrollDirection: Axis.vertical,
                        //     gridDelegate:
                        //         const SliverGridDelegateWithFixedCrossAxisCount(
                        //       crossAxisCount: 2,
                        //       mainAxisExtent: 215,
                        //       crossAxisSpacing: 10,
                        //       mainAxisSpacing: 10,
                        //     ),
                        //     // itemCount: 4,
                        //     shrinkWrap: true,
                        //     physics: const NeverScrollableScrollPhysics(),
                        //     children: [
                        //       InkWell(onTap: (){Get.to(()=> Detail());},
                        //         child: Multiple_Service(
                        //             Image1: "assets/Event button.svg",
                        //             Image2: "assets/Favorite.svg",
                        //             Image3: "assets/Events.webp",
                        //             Text1:
                        //                 "O poder do Networking\nSegunda Edição",
                        //             Text2: "\$ 50,00"),
                        //       ),
                        //       Multiple_Service(
                        //           Image1: "assets/Event button.svg",
                        //           Image2: "assets/Favorite (1).svg",
                        //           Image3: "assets/Events.png",
                        //           Text1:
                        //               "O poder do Networking\nTerceira Edição",
                        //           Text2: "\$ 50,00"),
                        //       Multiple_Service(
                        //           Image1: "assets/Event button.svg",
                        //           Image2: "assets/Favorite (1).svg",
                        //           Image3: "assets/Events.webp",
                        //           Text1:
                        //               "O poder do Networking\nTerceira Edição",
                        //           Text2: "\$ 50,00"),
                        //       Multiple_Service(
                        //           Image1: "assets/Event button.svg",
                        //           Image2: "assets/Favorite (1).svg",
                        //           Image3: "assets/Events.png",
                        //           Text1:
                        //               "O poder do Networking\nTerceira Edição",
                        //           Text2: "\$ 50,00"),
                        //       Multiple_Service(
                        //           Image1: "assets/Event button.svg",
                        //           Image2: "assets/Favorite (1).svg",
                        //           Image3: "assets/Events.webp",
                        //           Text1:
                        //               "O poder do Networking\nTerceira Edição",
                        //           Text2: "\$ 50,00"),
                        //       Multiple_Service(
                        //           Image1: "assets/Event button.svg",
                        //           Image2: "assets/Favorite (1).svg",
                        //           Image3: "assets/Events.png",
                        //           Text1:
                        //               "O poder do Networking\nTerceira Edição",
                        //           Text2: "\$ 50,00"),
                        //     ],
                        //   ),
                        // ),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
