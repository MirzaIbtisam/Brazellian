import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'Call_Screen.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<String> Imge = [
    "assets/picture.jpg",
    "assets/jurandir.jpg",
    "assets/blog-header-3.webp",
    "assets/blue shirt.jpg",
    "assets/Male-Poses-Studio.webp",
    "assets/photoshoot.jpg",
    "assets/profile2.jpg",
    "assets/profile3.jpg",
    "assets/blue shirt.jpg",
    "assets/profile2.jpg",
  ];
  List<String> txt1 = [
    "Ricardo Rocha",
    "Rute Amorin",
    "Jose Oliveira",
    "Neto Silveira",
    "Afonso Ribeiro",
    "Cristian Silva",
    "Jessica Rodrigues",
    "Paulo Germano",
    "Afonso Ribeiro",
    "Cristian Silva",
  ];
  List<String> txt2 = [
    "10:20",
    "Yesterday",
    "May 8",
    "April 15",
    "April 9",
    "Mar 19",
    "Mar 13",
    "Mar 13",
    "April 9",
    "Mar 19",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 40),
            Row(
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
                  "History",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Plus Jakarta Sans",
                      color: Color(0xff111111)),
                ),
                SizedBox(width: 40),
              ],
            ),
            SizedBox(height: 20),
            Flexible(
              child: ListView.builder(
                itemCount: txt1.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: (){
                      Call(index);
                    },
                    child: Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child:
                            CallHistory(Imge[index], txt1[index], txt2[index])),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget CallHistory(
    String Imge,
    String txt1,
    String txt2,
  ) {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Imge), fit: BoxFit.cover),
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(100),
                ),
                height: 60,
                width: 60,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    txt1,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Plus Jakarta Sans",
                        fontWeight: FontWeight.w600,
                        color: Color(0xff111111)),
                  ),
                  SizedBox(height: 8),
                  Text(
                    txt2,
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Plus Jakarta Sans",
                        fontWeight: FontWeight.w600,
                        color: Color(0xff66707a)),
                  )
                ],
              ),
            ],
          ),
          SvgPicture.asset("assets/Call.svg")
        ],
      ),
    );
  }
  Call(index){
    Get.to(Call_Screen());
  }
}
