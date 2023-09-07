import 'dart:ui';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Component/Multiple Service.dart';
import '../FilterScreen.dart';
import 'House_Detail.dart';

class House_Cleaning extends StatefulWidget {
  const House_Cleaning({Key? key}) : super(key: key);

  @override
  State<House_Cleaning> createState() => House_CleaningState();
}

class House_CleaningState extends State<House_Cleaning> {
  List Salvos = [
    {'title': 'House cleaning', 'isActive': false},
    {'title': 'Handyman', 'isActive': false},
    {'title': 'Beauty Salon', 'isActive': false},
    {'title': 'Gardener', 'isActive': false},
    {'title': 'Bricklayer', 'isActive': false},
    {'title': 'Carpenter', 'isActive': false},
    {'title': 'Electrician', 'isActive': false},
    {'title': 'Financial Assistant', 'isActive': false},
    {'title': 'Immigration consultant', 'isActive': false},
  ];

  void changeState(Map<String, dynamic> selectedItem) {
    setState(() {
      for (var item in Salvos) {
        item['isActive'] = (item == selectedItem);
      }
    });
  }

  List<String> cafteria = [
    "assets/cleaning_1111.webp",
    "assets/cleaning_1111.webp",
    "assets/cleaning_1111.webp",
    "assets/cleaning_1111.webp",
    "assets/cleaning_1111.webp",
    "assets/cleaning_1111.webp",
    "assets/cleaning_1111.webp",
    "assets/cleaning_1111.webp",
    "assets/cleaning_1111.webp",
    "assets/cleaning_1111.webp",
  ];
  bool _showBottomSheet = false;

  void _showPersistentBottomSheet() {
    setState(() {
      _showBottomSheet = true;
    });
  }

  void _hidePersistentBottomSheet() {
    setState(() {
      _showBottomSheet = false;
    });
  }

  int currentIndex = 0;
  final scaffoldState = GlobalKey<ScaffoldState>();

  _showSheet() {
    print("hello");

    // Show BottomSheet here using the Scaffold state instead of the Scaffold context
    scaffoldState.currentState?.showBottomSheet((context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        // Adjust blur intensity as needed
        child: Filter(context),
      );
    });

    print("Something");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      body: Stack(
        children: [
          CarouselSlider.builder(
            itemCount: cafteria.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(),
                child: Image.asset(
                  cafteria[realIndex],
                  fit: BoxFit.cover,
                ),
              );
            },
            options: CarouselOptions(
              viewportFraction: 1.0,
              aspectRatio: 16 / 15,
              initialPage: 0,
              // Set initial page to 0
              enableInfiniteScroll: false,
              reverse: false,
              autoPlay: false,
              // Set autoPlay to false for debugging
              scrollDirection: Axis.horizontal,
              onPageChanged: (int index, CarouselPageChangedReason reason) {
                setState(() {
                  currentIndex =
                      index; // Update currentIndex when the carousel index changes
                });
              },
            ),
          ),
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
                    "House Cleaning\nBoca Raton ",
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
                          primary: Color(0xffe2aa19),
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                        ),
                        child: Text(
                          "Serviços",
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xff7c5a04),
                            fontWeight: FontWeight.w600,
                            fontFamily: "PlusJakarta Sans",
                          ),
                        ),
                      ),
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
                            side: BorderSide(color: Colors.white),
                          ),
                        ),
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
                                fontFamily: "PlusJakarta Sans",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
                      topRight: Radius.circular(20),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Container(
                          height: 15,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xffeaecf0),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: DotsIndicator(
                            dotsCount: cafteria.length,
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
                          height: 50,
                          width: MediaQuery.of(context).size.width / 1.1,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: TextFormField(
                              onTap: () {},
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(50),
                              ],
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(top: 15),
                                border: InputBorder.none,
                                prefixIcon: SvgPicture.asset(
                                  "assets/Seacrh.svg",
                                  fit: BoxFit.scaleDown,
                                ),
                                hintText: "search on braelo",
                                hintStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffa6aeb7),
                                ),
                                suffixIcon: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset("assets/Vector (1).svg"),
                                    SizedBox(width: 15),
                                    SvgPicture.asset("assets/Vector 2.svg"),
                                    IconButton(
                                      onPressed: () {
                                        print("object");
                                        _showSheet();
                                      },
                                      icon:
                                          SvgPicture.asset("assets/shape.svg"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Divider(
                          thickness: 0.5,
                          color: Color(0xffefefef),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Most searched categories",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff232f30),
                                fontWeight: FontWeight.w700,
                                fontFamily: "PlusJakarta Sans",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Wrap(
                              direction: Axis.horizontal,
                              spacing: 5,
                              runSpacing: 5,
                              children: Salvos.map((option) => new Container(
                                      child: InkWell(
                                          onTap: () {
                                            changeState(option);
                                          },
                                          child: Container(
                                              decoration: BoxDecoration(
                                                color: option['isActive']
                                                    ? Color(0xffefefef)
                                                    : Color(0xffefefef),
                                                borderRadius:
                                                    BorderRadius.circular(32),
                                              ),
                                              height: 40,
                                              padding: EdgeInsets.all(10),
                                              child: Text('${option['title']}',
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      TextStyle(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: option[
                                                                  'isActive']
                                                              ? Color(0xff4d5867)
                                                              : Color(
                                                                  0xff868e96)))))))
                                  .toList()),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: GridView(
                            scrollDirection: Axis.vertical,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 215,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            // itemCount: 4,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              InkWell(onTap: (){Get.to(() => House_Detail());},
                                child: Multiple_Service(
                                    Image1: "assets/Cleaning_1.svg",
                                    Image2: "assets/Favorite.svg",
                                    Image3: "assets/cleaning_1111.webp",
                                    Text1: "House\nCleaning",
                                    Text2: "\$ 180,00"),
                              ),
                              Multiple_Service(
                                  Image1: "assets/Cleaning_1.svg",
                                  Image2: "assets/Favorite.svg",
                                  Image3: "assets/house-cleaning-services1.jpg",
                                  Text1: "House\nCleaning",
                                  Text2: "\$ 180,00"),
                              Multiple_Service(
                                  Image1: "assets/Cleaning_1.svg",
                                  Image2: "assets/Favorite.svg",
                                  Image3: "assets/house_clean.jpg",
                                  Text1: "House\nCleaning",
                                  Text2: "\$ 180,00"),
                              Multiple_Service(
                                  Image1: "assets/Cleaning_1.svg",
                                  Image2: "assets/Favorite.svg",
                                  Image3: "assets/cleaning_1111.webp",
                                  Text1: "House\nCleaning",
                                  Text2: "\$ 180,00"),
                              Multiple_Service(
                                  Image1: "assets/Cleaning_1.svg",
                                  Image2: "assets/Favorite.svg",
                                  Image3: "assets/house-cleaning-services1.jpg",
                                  Text1: "House\nCleaning",
                                  Text2: "\$ 180,00"),
                              Multiple_Service(
                                  Image1: "assets/Cleaning_1.svg",
                                  Image2: "assets/Favorite.svg",
                                  Image3: "assets/house_clean.jpg",
                                  Text1: "House\nCleaning",
                                  Text2: "\$ 180,00"),
                              Multiple_Service(
                                  Image1: "assets/Cleaning_1.svg",
                                  Image2: "assets/Favorite.svg",
                                  Image3: "assets/house-cleaning-services1.jpg",
                                  Text1: "House\nCleaning",
                                  Text2: "\$ 180,00"),
                              Multiple_Service(
                                  Image1: "assets/Cleaning_1.svg",
                                  Image2: "assets/Favorite.svg",
                                  Image3: "assets/house_clean.jpg",
                                  Text1: "House\nCleaning",
                                  Text2: "\$ 180,00"),
                            ],
                          ),
                        ),
                        SizedBox(height: 50),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Recomendações",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontFamily: "PlusJakarta Sans",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Divider(
                          thickness: 0.5,
                          color: Color(0xffefefef),
                        ),
                        SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: SizedBox(
                            height: 220,
                            child: GridView(
                              scrollDirection: Axis.horizontal,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                mainAxisExtent: 160,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              // itemCount: 4,
                              shrinkWrap: true,
                              children: [
                                Multiple_Service(
                                    Image1: "assets/service.svg",
                                    Image2: "assets/Favorite (1).svg",
                                    Image3: "assets/brick helper.jpg",
                                    Text1: "Bricklayer's\nHelper",
                                    Text2: "\$ 98,00"),
                                Multiple_Service(
                                    Image1: "assets/service.svg",
                                    Image2: "assets/Favorite.svg",
                                    Image3: "assets/Gardener.jpg",
                                    Text1: "House\nGardener",
                                    Text2: "\$ 180,00"),
                                Multiple_Service(
                                    Image1: "assets/feed.svg",
                                    Image2: "assets/Favorite (1).svg",
                                    Image3: "assets/head chef.jpg",
                                    Text1: "Head Chef\n",
                                    Text2: "\$ 80,00"),
                                Multiple_Service(
                                    Image1: "assets/building.svg",
                                    Image2: "assets/Favorite (1).svg",
                                    Image3: "assets/Electrician.jpg",
                                    Text1: "Eletrician\nConstruction",
                                    Text2: "\$ 99,00"),
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
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
