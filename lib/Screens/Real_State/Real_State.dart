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

import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../Component/MultiService_extended.dart';

import '../FilterScreen.dart';
import 'ReaslStateDetail.dart';

class RealState extends StatefulWidget {
  const RealState({Key? key}) : super(key: key);

  @override
  State<RealState> createState() => RealStateState();
}

class RealStateState extends State<RealState> {
  List<String> RealState = [
    "assets/Real_state.webp",
    "assets/Real_state.webp",
    "assets/Real_state.webp",
    "assets/Real_state.webp",
    "assets/Real_state.webp",
    "assets/Real_state.webp",
    "assets/Real_state.webp",
    "assets/Real_state.webp",
    "assets/Real_state.webp",
    "assets/Real_state.webp",
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

  SfRangeValues _currentRangeValues = SfRangeValues(100.0, 900.0);
  bool slelected = false;

  void dropdown() {
    setState(() {
      slelected = !slelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      body: Stack(
        children: [
          CarouselSlider.builder(
            itemCount: RealState.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(),
                child: Image.asset(
                  RealState[realIndex],
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
                    "Studio Compacto 2 Dormitórios\nPalm Beach",
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
                          "Imóveis",
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
                            dotsCount: RealState.length,
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
                                hintText: "O que você está buscando?",
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
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Valor aproximado",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "PlusJakarta Sans",
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  dropdown();
                                },
                                icon: Icon(
                                  slelected
                                      ? CupertinoIcons
                                          .chevron_down // Show the icon in the opposite direction when it's pressed
                                      : CupertinoIcons.chevron_up,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (slelected) dropdownslider(),
                        Divider(
                          thickness: 0.5,
                          color: Color(0xffefefef),
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
                              InkWell(
                                onTap: () {
                                  Get.to(() => ReaslStateDetail());
                                },
                                child: MultiService_extends(
                                    Image1: "assets/Real_state_button.svg",
                                    Image2: "assets/Favorite.svg",
                                    Image3: "assets/Real_state.webp",
                                    Text1:
                                        "Aluguel Studio compacto\npara estudantes",
                                    Text2: "\$ 950,00"),
                              ),
                              MultiService_extends(
                                  Image1: "assets/Real_state_button.svg",
                                  Image2: "assets/Favorite (1).svg",
                                  Image3: "assets/Real_state.webp",
                                  Text1:
                                      "Apartamento compacto\nStudio Comercial",
                                  Text2: "\$ 950,00"),
                              MultiService_extends(
                                  Image1: "assets/Real_state_button.svg",
                                  Image2: "assets/Favorite (1).svg",
                                  Image3: "assets/Real_state.webp",
                                  Text1: "Studio 2 Dormitórios\nInfra completa",
                                  Text2: "\$ 950,00"),
                              MultiService_extends(
                                  Image1: "assets/Real_state_button.svg",
                                  Image2: "assets/Favorite (1).svg",
                                  Image3: "assets/Real_state.webp",
                                  Text1: "Flat para solteiro\nTemporada Maio",
                                  Text2: "\$ 950,00"),
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
                                mainAxisExtent: 185,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              // itemCount: 4,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                MultiService_extends(
                                    Image1: "assets/Real_state_button.svg",
                                    Image2: "assets/Favorite.svg",
                                    Image3: "assets/Real_state.webp",
                                    Text1:
                                    "Aluguel Studio compacto\npara estudantes",
                                    Text2: "\$ 950,00"),
                                MultiService_extends(
                                    Image1: "assets/Real_state_button.svg",
                                    Image2: "assets/Favorite (1).svg",
                                    Image3: "assets/Real_state.webp",
                                    Text1:
                                    "Apartamento compacto\nStudio Comercial",
                                    Text2: "\$ 950,00"),
                                MultiService_extends(
                                    Image1: "assets/Real_state_button.svg",
                                    Image2: "assets/Favorite (1).svg",
                                    Image3: "assets/Real_state.webp",
                                    Text1: "Studio 2 Dormitórios\nInfra completa",
                                    Text2: "\$ 950,00"),
                                MultiService_extends(
                                    Image1: "assets/Real_state_button.svg",
                                    Image2: "assets/Favorite (1).svg",
                                    Image3: "assets/Real_state.webp",
                                    Text1: "Flat para solteiro\nTemporada Maio",
                                    Text2: "\$ 950,00"),
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

  Widget dropdownslider() {
    double startValue = _currentRangeValues.start;
    double endValue = _currentRangeValues.end;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width / 2.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Color(0xffb8bec4)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Text(
                    '\$${startValue.round()}',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: "plus Jakarta Sans",
                        color: Color(0xff75818d)),
                  ),
                ),
              ),
              SvgPicture.asset("assets/divider.svg"),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width / 2.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Color(0xffb8bec4)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Text(
                    '\$${endValue.round()}',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: "plus Jakarta Sans",
                        color: Color(0xff75818d)),
                  ),
                ),
              ),
            ],
          ),
        ),
        SfRangeSlider(
          activeColor: Color(0xffcd9403),
          inactiveColor: Color(0xffefefef),
          min: 0.0,
          max: 1000.0,
          values: _currentRangeValues,
          onChanged: (SfRangeValues values) {
            setState(() {
              _currentRangeValues = values;
            });
          },
        ),
        Text(
          'Start: ${_currentRangeValues.start.round()} - End: ${_currentRangeValues.end.round()}',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
