import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../Component/Multiple Service.dart';

class Adds extends StatefulWidget {
  const Adds({super.key});

  @override
  State<Adds> createState() => _AddsState();
}

class _AddsState extends State<Adds> {
  List Salvos = [
    {'title': 'Events', 'isActive': false},
    {'title': 'Real State', 'isActive': false},
    {'title': 'Stores', 'isActive': false},
    {'title': 'Services', 'isActive': false},
    {'title': 'Jobs', 'isActive': false},
    {'title': 'Vehicles', 'isActive': false},
    {'title': 'Food', 'isActive': false},
    {'title': 'Finance', 'isActive': false},
    {'title': 'Imigration', 'isActive': false},
    {'title': 'Beauty', 'isActive': false},
    {'title': 'Education', 'isActive': false},
    {'title': 'Health', 'isActive': false},
    {'title': 'Home services', 'isActive': false},
    {'title': 'Construction', 'isActive': false},
  ];

  void changeState(Map<String, dynamic> selectedItem) {
    setState(() {
      for (var item in Salvos) {
        item['isActive'] = (item == selectedItem);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),
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
                  SvgPicture.asset("assets/black logo.svg"),
                  SizedBox(width: 30),
                ],
              ),
            ),
            SizedBox(height: 40),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset("assets/Vector (1).svg"),
                        SizedBox(width: 15),
                        SvgPicture.asset("assets/Vector 2.svg"),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset("assets/shape.svg"),
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
            Wrap(
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
                              borderRadius: BorderRadius.circular(32),
                            ),
                            height: 40,
                            padding: EdgeInsets.all(10),
                            child: Text('${option['title']}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: option['isActive']
                                        ? Color(0xff4d5867)
                                        : Color(0xff868e96))))))).toList()),
            SizedBox(height: 20),
            SvgPicture.asset("assets/map.svg"),
            SizedBox(height: 20),
            Padding(
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
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
