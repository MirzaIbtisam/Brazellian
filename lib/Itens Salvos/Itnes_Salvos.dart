import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                    container("assets/hair styling.jpg",
                        "assets/Favorite (2).svg", "Cabeleireira", "\$ 58"),
                    container("assets/mechanics.jpg", "assets/Favorite (2).svg",
                        "Mecânico", "\$ 120"),
                    container("assets/barber.jpg", "assets/Favorite (2).svg",
                        "Barber", "\$ 30"),
                    container("assets/house clean.jpg",
                        "assets/Favorite (2).svg", "House Cleaning", "\$ 98"),
                    container("assets/skuter.webp", "assets/Favorite (2).svg",
                        "Vespa Spring", "\$ 2898,00"),
                    container("assets/mercedes.jpg", "assets/Favorite (2).svg",
                        "Mercedes-Benz", "\$ 2300,00"),
                    container("assets/Gardener.jpg", "assets/Favorite (2).svg",
                        "Gardener", "\$ 58"),
                    container("assets/head chef.jpg", "assets/Favorite (2).svg",
                        "Cookman", "\$ 120"),
                    container("assets/brick helper.jpg",
                        "assets/Favorite (2).svg", "Bricklayer", "\$ 30"),
                    container("assets/Electrician.jpg",
                        "assets/Favorite (2).svg", "Electrician", "\$ 98"),
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
