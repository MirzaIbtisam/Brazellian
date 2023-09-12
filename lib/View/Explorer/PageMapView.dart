import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'DetailsRealEstate.dart';

class ExplorePageMapView extends StatefulWidget {
  const ExplorePageMapView({Key? key}) : super(key: key);

  @override
  State<ExplorePageMapView> createState() => _ExplorePageMapViewState();
}

class _ExplorePageMapViewState extends State<ExplorePageMapView> {
  final List<String> locationcategories = [
    "All",
    "Events",
    "Real Estate",
    "Shop",
    "Services",
    "Jobs",
    "Vehicles",
  ];
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Padding(
        padding: EdgeInsets.only(top: 60, left: 20, right: 20),
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
            Text(
              "Explorar",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 30,
            )
          ],
        ),
      ),
      SizedBox(
        height: 30,
      ),
      Expanded(
          // height: MediaQuery.of(context).size.height*0.84,
          child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
            image: DecorationImage(
                image: AssetImage(
                  'assets/map.png',
                ),
                fit: BoxFit.cover)),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search on braelo",
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Transform.scale(
                        scale: 0.4,
                        child: SvgPicture.asset(
                          'assets/Seacrh.svg',
                          height: 20,
                          width: 20,
                        )),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                            child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.close),
                          iconSize: 16,
                        )),
                        Container(
                          height: 15,
                          width: 1,
                          color: Colors.grey.withOpacity(0.2),
                        ),
                        Flexible(
                            child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            "assets/Filter.svg",
                          ),
                          iconSize: 16,
                        )),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 35,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(color: Color(0xff78828A)),
                        color: Color(0xff78828A),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsRealEstate()),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset("assets/grid view.svg"),
                            SizedBox(width: 10),
                            Text('Grid View',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 35,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border:
                            Border.all(color: Color(0xff78828A), width: 1.5),
                        color: Colors.white,
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset("assets/local.svg"),
                            SizedBox(width: 3.0),
                            Text('Map View',
                                style: TextStyle(
                                    color: Color(0xff78828A), fontSize: 14)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (selectedIndex == 0)
                Center(
                  child: Image.asset(
                    "assets/p1.jpg",
                    height: 90,
                    width: 90,
                  ),
                ),
              Row(
                children: [
                  if (selectedIndex == 0)
                    Transform.scale(
                        scale: 0.7,
                        child: SvgPicture.asset(
                          "assets/l1.svg",
                        )),
                  if (selectedIndex == 0)
                    SizedBox(
                      width: 20,
                    ),
                  if (selectedIndex == 0 || selectedIndex == 4)
                    Transform.scale(
                        scale: 0.7, child: SvgPicture.asset("assets/l2.svg")),
                  if (selectedIndex == 1)
                    Image.asset(
                      "assets/e1.png",
                      height: 90,
                      width: 90,
                    ),
                ],
              ),
              if (selectedIndex == 0 || selectedIndex == 3)
                Align(
                  alignment: Alignment.centerRight,
                  child: SvgPicture.asset("assets/l3.svg"),
                ),
              SizedBox(
                height: 20,
              ),
              if (selectedIndex == 0 || selectedIndex == 1)
                Align(
                  alignment: Alignment.centerRight,
                  child: SvgPicture.asset("assets/l4.svg"),
                ),
              if (selectedIndex == 6)
                Align(
                  alignment: Alignment.centerRight,
                  child: SvgPicture.asset("assets/l5.svg"),
                ),
              if (selectedIndex == 0 || selectedIndex == 2)
                SvgPicture.asset("assets/l6.svg"),
              if (selectedIndex == 3)
                Center(
                  child: Image.asset(
                    "assets/shop1.png",
                    height: 90,
                    width: 90,
                  ),
                ),
              if (selectedIndex == 2)
                Center(
                  child: Image.asset(
                    "assets/state1.png",
                    height: 90,
                    width: 90,
                  ),
                ),
              if (selectedIndex == 6)
                Center(
                  child: Image.asset(
                    "assets/vehicle1.jpg",
                    height: 90,
                    width: 90,
                  ),
                ),
              if (selectedIndex == 4)
                Image.asset(
                  "assets/services1.png",
                  height: 90,
                  width: 90,
                ),
              Flexible(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 80,
                    // Adjust the height as per your requirement
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 25),
                      // Add padding between the items
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: locationcategories.length,
                        itemBuilder: (BuildContext, int index) {
                          return categories(
                            locationcategories[index],
                            selectedIndex == index,
                            (isSelected) {
                              setState(() {
                                if (isSelected) {
                                  selectedIndex = index;
                                } else {
                                  selectedIndex = 0;
                                }
                              });
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    ]));
  }

  Widget categories(String category, bool isSelected, Function(bool) onSelect) {
    return Container(
      height: 15,
      width: category == "Real Estate" ? 90 : 70,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
            color: isSelected ? Color(0xff78828a) : Color(0xff78828a),
            width: 1.5),
        color: isSelected ? Color(0xff78828a) : Colors.white,
      ),
      child: InkWell(
        onTap: () {
          onSelect(!isSelected);
        },
        child: Align(
          alignment: Alignment.center,
          child: Text(
            category,
            style: TextStyle(
                color: isSelected ? Colors.white : Color(0xff78828A),
                fontSize: 11),
          ),
        ),
      ),
    );
  }
}
