import 'dart:ui';
import 'package:brazeellian_community/ViewModel/AdvertsViewModel/advertsViewModel.dart';
import 'package:brazeellian_community/Widgets/postWidget.dart';
import 'package:brazeellian_community/constant/components/general_exception.dart';
import 'package:brazeellian_community/constant/components/internet_exceptions_widget.dart';
import 'package:brazeellian_community/data/response/status.dart';
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

class Listing_Screen extends StatefulWidget {
  const Listing_Screen({Key? key}) : super(key: key);

  @override
  State<Listing_Screen> createState() => Listing_ScreenState();
}

class Listing_ScreenState extends State<Listing_Screen> {



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
  final advertsVm = Get.put(AdvertsViewModel()) ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    super.initState();
    setState(() {
      advertsVm.getAdverts();
    });
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Obx((){
          switch(advertsVm.rxRequestStatus.value){
            case Status.LOADING:
              return const Center(child: CircularProgressIndicator());
            case Status.ERROR:
              if(advertsVm.error.value =='No internet'){
                return InterNetExceptionWidget(onPress: () {
                  advertsVm.refreshApi();
                },);
              }else {
                return GeneralExceptionWidget(onPress: (){
                  advertsVm.refreshApi();
                });
              }
            case Status.COMPLETED:
              return Stack(
                children: [
                  CarouselSlider.builder(
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index, int realIndex) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: const BoxDecoration(),
                          child: Image.network(
                            advertsVm.advertsList.value!.Adverts![0].thumbnail,
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
                              "Adverts",
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
                            "${advertsVm.advertsList.value!.Adverts![0].title}",
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
                                    "Adverts",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Color(0xff7c5a04),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "PlusJakarta Sans"),
                                  )),
                            ),
                            Text(
                              "${advertsVm.advertsList.value!.Adverts![0].local}",
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
                      SizedBox(
                        height: 400,
                        child: Obx((){
                          switch(advertsVm.rxRequestStatus.value){
                            case Status.LOADING:
                              return const Center(child: CircularProgressIndicator());
                            case Status.ERROR:
                              if(advertsVm.error.value =='No internet'){
                                return InterNetExceptionWidget(onPress: () {
                                  advertsVm.refreshApi();
                                },);
                              }else {
                                return GeneralExceptionWidget(onPress: (){
                                  advertsVm.refreshApi();
                                });
                              }
                            case Status.COMPLETED:
                              return ListView.builder(
                                  itemCount: advertsVm.advertsList.value.Adverts!.length,
                                  itemBuilder: (context, index){
                                    return GridView.builder(
                                      physics: ScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: advertsVm.advertsList.value!.Adverts!.isNotEmpty&&advertsVm.advertsList.value!.Adverts!.length<6?advertsVm.advertsList.value!.Adverts!.length:6, // Replace with the actual item count
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2, // Number of columns in the grid
                                        crossAxisSpacing: 10.0, // Spacing between columns
                                        mainAxisSpacing: 20.0, // Spacing between rows
                                      ),
                                      itemBuilder: (BuildContext context, int index) {
                                        // Replace with your item widget
                                        return InkWell(
                                          onTap: ()async{
                                            // Get.to( ()=> Detail(data: advertsVm.advertsList.value!.Adverts![index],));
                                          },
                                          child: Multiple_Servicee(
                                              "assets/Event button.svg",
                                              "assets/Favorite (1).svg",
                                              advertsVm.advertsList.value!.Adverts![index].thumbnail,
                                              "${advertsVm.advertsList.value?.Adverts?[index].title}",
                                              "\$ 50,00",context),
                                        );
                                      },
                                    );
                                  }
                              );
                          }
                        }),
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
                                  Image3: "assets/Events.webp",
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
                                  Image3: "assets/Events.webp",
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
                                  Image3: "assets/Events.webp",
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
                ],
              );
          }
        }),
      ),
    );
  }


}
