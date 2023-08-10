import 'dart:ui';
import 'package:brazeellian_community/Screens/Event%20Screen/Event.dart';
import 'package:brazeellian_community/Screens/High%20Lights/High_Lights.dart';
import 'package:brazeellian_community/Screens/Job%20Screen/Job_Screen.dart';
import 'package:brazeellian_community/Screens/Listing_Screen/Listing_Screen.dart';
import 'package:brazeellian_community/Screens/Notification%20Screen/Notifications.dart';
import 'package:brazeellian_community/Screens/Real_State/Real_State.dart';
import 'package:brazeellian_community/Screens/Search/Search.dart';
import 'package:brazeellian_community/Screens/Vehicles/Vehicle_Service.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Component/Beauty_Tips.dart';
import '../Component/Categorias.dart';
import '../Component/Multiple Service.dart';
import '../Component/drawer.dart';
import '../Explorer/PageMapView.dart';
import '../FilterScreen.dart';
import '../House Cleaning/House_Cleaning.dart';
import '../Itens Salvos/Itnes_Salvos.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  List<String> files = [
    "assets/Slider pic.svg",
    "assets/Slider pic.svg",
    "assets/Slider pic.svg",
    "assets/Slider pic.svg",
    "assets/Slider pic.svg",
    "assets/Slider pic.svg",
  ];
  List<String> images = [
    "assets/hair styling.jpg",
    "assets/palour.jpg",
    "assets/hair styling.jpg",
    "assets/PLANTS.jpg",
    "assets/manicure pedicure.jpeg",
    "assets/hair styling.jpg",
    "assets/palour.jpg",
    "assets/hair styling.jpg",
    "assets/PLANTS.jpg",
    "assets/manicure pedicure.jpeg"
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

  int currentIndex = 1;

  Future<String> fetchLoginInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = prefs.getString("id").toString();
    return id;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        drawer: Drawer(
          width: double.infinity,
          child: drawer(id: fetchLoginInfo()),
        ),
        backgroundColor: const Color(0xfff1a408),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Builder(builder: (context) {
                      return InkWell(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: SvgPicture.asset("assets/Drawer.svg"));
                    }),
                    Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xfffdf6e4),
                            Color(0xfffbc231),
                          ],
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage("assets/profile.jpg"),
                                fit: BoxFit.cover),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100)),
                        width: 35,
                        height: 35,
                        alignment: Alignment.center,
                      ),
                    ),
                    const Column(
                      children: [
                        Text(
                          "Bom te ver por aqui, 👋",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Criss Germano",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    InkWell(
                        onTap: () {
                          Get.to(() => Notifications());
                        },
                        child: SvgPicture.asset("assets/Notification.svg")),
                    InkWell(
                        onTap: () {
                          Get.to(() => Itens_Salvos());
                        },
                        child: SvgPicture.asset("assets/Svae.svg"))
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 50,
                width: MediaQuery.of(context).size.width / 1.1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: TextFormField(
                    onTap: () {
                      Get.to(() => Search());
                    },
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
                            color: Color(0xffa6aeb7)),
                        suffixIcon: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset("assets/Vector (1).svg"),
                            SizedBox(width: 15),
                            SvgPicture.asset("assets/Vector 2.svg"),
                            IconButton(
                                onPressed: () {
                                  showBottomSheet(
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 8, sigmaY: 8),
                                        // Adjust blur intensity as needed
                                        child: Filter(context),
                                      );
                                    },
                                  );
                                },
                                icon: SvgPicture.asset("assets/shape.svg")),
                          ],
                        )),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                height: MediaQuery.of(context).size.height / 4.3,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Categorias",
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff212121),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        height: 95,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          children: [
                            InkWell(
                                onTap: () {
                                  if (mounted) {
                                    final RenderObject? inkwellRenderObject =
                                        context.findRenderObject();
                                  }
                                },
                                child: InkWell(
                                  onTap: () {
                                    Get.to(() => Event());
                                  },
                                  child: Categorias(
                                      Text: "Events",
                                      Image: "assets/Events.svg"),
                                )),
                            SizedBox(width: 10),
                            InkWell(
                              onTap: () {
                                Get.to(() => RealState());
                              },
                              child: Categorias(
                                  Text: "Real State",
                                  Image: "assets/moives.svg"),
                            ),
                            SizedBox(width: 10),
                            InkWell(
                              onTap: () {
                                Get.to(() => Listing_Screen());
                              },
                              child: Categorias(
                                  Text: "Listings",
                                  Image: "assets/Anúncios.svg"),
                            ),
                            SizedBox(width: 10),
                            InkWell(
                              onTap: () {
                                Get.to(() => House_Cleaning());
                              },
                              child: Categorias(
                                  Text: "Services",
                                  Image: "assets/services.svg"),
                            ),
                            SizedBox(width: 10),
                            InkWell(
                                onTap: () {
                                  Get.to(() => Job_Screen());
                                },
                                child: Categorias(
                                    Text: "Jobs", Image: "assets/Jobs.svg")),
                            SizedBox(width: 10),
                            InkWell(
                              onTap: () {
                                Get.to(() => Vehicle_Service());
                              },
                              child: Categorias(
                                  Text: "Vehicles",
                                  Image: "assets/Vehicles.svg"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: const Color(0xfffff9e8),
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 4,
                      child: CarouselSlider.builder(
                          itemCount: files.length,
                          itemBuilder:
                              (BuildContext context, int index, int realIndex) {
                            return SvgPicture.asset(
                              files[currentIndex],
                              height: MediaQuery.of(context).size.height / 5,
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
                              onPageChanged: (int index,
                                  CarouselPageChangedReason reason) {
                                setState(() {
                                  currentIndex =
                                      index; // Update currentIndex when the carousel index changes
                                });
                              })),
                    ),
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
              Container(
                color: Colors.white,
                child: const TabBar(
                  indicatorColor: Colors.orange,
                  indicatorWeight: 2.5,
                  tabs: <Widget>[
                    Tab(
                      icon: Text(
                        "Mais populares",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Tab(
                      icon: Text(
                        "Recomendações",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Tab(
                      icon: Text(
                        "Recentes",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                height: 1400,
                child: TabBarView(
                  children: [
                    tabBarView(),
                    tabBarView(),
                    tabBarView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget tabBarView() {
    return Column(
      children: [
        Flexible(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
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
                      Image1: "assets/service.svg",
                      Image2: "assets/Favorite (1).svg",
                      Image3: "assets/brick helper.jpg",
                      Text1: "Bricklayer's\nHelper",
                      Text2: "\$ 98,00"),
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
        ),
        const SizedBox(height: 40),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Destaques da semana",
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff212121),
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "Ver tudo",
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff9da5ac),
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
        const SizedBox(height: 5),
        const Divider(
          thickness: 0.5,
          color: Color(0xffefefef),
        ),
        const SizedBox(height: 10),
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
                return InkWell(
                  onTap: () {
                    Highlight(index);
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 8),
                    child: Beauty_Tips(Image: images[index]),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 30),
        const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Próximo de você",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff212121)),
            ),
          ),
        ),
        const SizedBox(height: 5),
        const Divider(
          thickness: 0.5,
          color: Color(0xffefefef),
        ),
        const SizedBox(height: 15),
        SvgPicture.asset("assets/B Card.svg"),
        const SizedBox(height: 8),
        SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width / 1.150,
          child: ElevatedButton(
              onPressed: () {
                Get.to(() => ExplorePageMapView());
              },
              style: ElevatedButton.styleFrom(
                  primary: const Color(0xffCD9403),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              child: const Text(
                "Explorar",
                style: TextStyle(fontSize: 14, color: Colors.white),
              )),
        ),
        const SizedBox(height: 50),
        SvgPicture.asset("assets/card.svg"),
        const SizedBox(height: 50),
        Container(
          decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage("assets/brasilcoms_0051.jpg"),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(15),
          ),
          height: MediaQuery.of(context).size.height / 4.5,
          width: MediaQuery.of(context).size.width / 1.1,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 15, top: 15),
            child: SvgPicture.asset(
              "assets/TEXT.svg",
            ),
          ),
        ),
      ],
    );
  }

  Highlight(index) {
    Get.to(High_Lights());
  }
}
