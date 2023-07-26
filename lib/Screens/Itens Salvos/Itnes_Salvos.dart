import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Itens_Salvos extends StatefulWidget {
  const Itens_Salvos({super.key});

  @override
  State<Itens_Salvos> createState() => _Itens_SalvosState();
}

class _Itens_SalvosState extends State<Itens_Salvos> {
  List Salvos = [
    {'title': 'All', 'isActive': false},
    {'title': 'Eventos', 'isActive': false},
    {'title': 'Imóveis', 'isActive': false},
    {'title': 'Anúncios', 'isActive': false},
    {'title': 'Service', 'isActive': false},
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
      body: Column(
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
                Text(
                  "Itens Salvos",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Plus Jakarta Sans",
                      color: Color(0xff111111)),
                ),
                SizedBox(width: 20),
              ],
            ),
          ),
          SizedBox(height: 30),
          Wrap(
              direction: Axis.horizontal,
              spacing: 10.0,
              runSpacing: 10.0,
              children: Salvos.map((option) => new Container(
                  child: InkWell(
                      onTap: () {
                        changeState(option);
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            color: option['isActive']
                                ? Color(0xff868e96)
                                : Colors.white,
                            border: Border.all(
                                color: Color(0xff868e96), width: 1.3),
                            borderRadius: BorderRadius.circular(32),
                          ),
                          height: 40,
                          padding: EdgeInsets.all(10),
                          child: Text('${option['title']}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: option['isActive']
                                      ? Colors.white
                                      : Color(0xff868e96))))))).toList()),
          SizedBox(height: 15),
          Flexible(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView(
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 195,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15,
                  ),
                  // itemCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    for (int i = 0; i < items.length; i++)
                      container(
                        items[i]['image']!,
                        items[i]['favoriteIcon']!,
                        items[i]['title']!,
                        items[i]['price']!,
                      )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  final List<Map<String, String>> items = [
    {
      'image': 'assets/hair styling.jpg',
      'favoriteIcon': 'assets/Favorite (2).svg',
      'title': 'Cabeleireira',
      'price': '\$ 58',
    },
    {
      'image': 'assets/mechanics.jpg',
      'favoriteIcon': 'assets/Favorite (2).svg',
      'title': 'Mecânico',
      'price': '\$ 120',
    },
    {
      'image': 'assets/barber.jpg',
      'favoriteIcon': 'assets/Favorite (2).svg',
      'title': 'Barber',
      'price': '\$ 30',
    },
    {
      'image': 'assets/house clean.jpg',
      'favoriteIcon': 'assets/Favorite (2).svg',
      'title': 'House Cleaning',
      'price': '\$ 98',
    },
    {
      'image': 'assets/skuter.webp',
      'favoriteIcon': 'assets/Favorite (2).svg',
      'title': 'Vespa Spring',
      'price': '\$ 2898.00',
    },
    {
      'image': 'assets/mercedes.jpg',
      'favoriteIcon': 'assets/Favorite (2).svg',
      'title': 'Mercedes-Benz',
      'price': '\$ 2300.00',
    },
    {
      'image': 'assets/Gardener.jpg',
      'favoriteIcon': 'assets/Favorite (2).svg',
      'title': 'Gardener',
      'price': '\$ 58',
    },
    {
      'image': 'assets/head chef.jpg',
      'favoriteIcon': 'assets/Favorite (2).svg',
      'title': 'Cookman',
      'price': '\$ 120',
    },
    {
      'image': 'assets/brick helper.jpg',
      'favoriteIcon': 'assets/Favorite (2).svg',
      'title': 'Bricklayer',
      'price': '\$ 30',
    },
    {
      'image': 'assets/Electrician.jpg',
      'favoriteIcon': 'assets/Favorite (2).svg',
      'title': 'Electrician',
      'price': '\$ 98',
    },
  ];

  Widget container(
    String img,
    String img1,
    String txt,
    String txt1,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xffedebe9)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(10),
            ),
            height: 135,
            width: MediaQuery.of(context).size.width / 2.5,
            child: InkWell(
              onTap: () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    title: SvgPicture.asset("assets/unsaved.svg"),
                    content: Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        "Are you sure you want\nto disfavor this item?",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff232f30),
                            fontWeight: FontWeight.w700,
                            fontFamily: "Plus Jakarta Sans"),
                      ),
                    ),
                    actions: <Widget>[
                      SizedBox(
                        height: 50,
                        width: Get.width * 0.9,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xffcd9403),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            child: Text(
                              "Yes, I do",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Plus Jakarta Sans"),
                            )),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: TextButton(
                          child:  Text("Cancel",style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff97a0a9),
                              fontWeight: FontWeight.w600,
                              fontFamily: "Plus Jakarta Sans"),),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                );
              },
              child: Column(
                children: [
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: SvgPicture.asset(img1)),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                txt,
                style: TextStyle(
                    fontSize: 11,
                    color: Color(0xff101828),
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Plus Jakarta Sans'),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset("assets/Location.svg"),
                    SizedBox(width: 3),
                    Text(
                      "Miami",
                      style: TextStyle(fontSize: 9, color: Color(0xff475467)),
                    )
                  ],
                ),
                Text(
                  txt1,
                  style: TextStyle(
                      fontSize: 12,
                      color: Color(0xffee9e03),
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
