import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Inbox/Inbox.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  List<String> Imge = [
    "assets/picture.jpg",
    "assets/jurandir.jpg",
    "assets/blog-header-3.webp",
    "assets/blue shirt.jpg",
    "assets/Male-Poses-Studio.webp",
    "assets/photoshoot.jpg",
    "assets/profile2.jpg",
    "assets/profile3.jpg",
  ];
  List<String> txt = [
    "Marly Rodrigues",
    "Jurandir Peçanha",
    "Christiano Salton",
    "Jemmy Fox",
    "Paulo Germano",
    "Cristian Silva",
    "Paulo Germano",
    "Cristian Silva",
  ];

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
                  "Messages",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Plus Jakarta Sans",
                      color: Color(0xff111111)),
                ),
                SizedBox(width: 40),
              ],
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xfff6f8fe),
                borderRadius: BorderRadius.circular(15),
              ),
              height: 55,
              width: Get.width,
              child: TextFormField(
                inputFormatters: [LengthLimitingTextInputFormatter(25)],
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 18),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(top: 9),
                      child: SvgPicture.asset(
                        "assets/Seacrh.svg",
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    hintText: "Search...",
                    hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Plus Jakarta Sans",
                        color: Color(0xffa3aab1)),
                    border: InputBorder.none),
              ),
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: txt.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                    key: Key('item ${txt[index]}'),
                    onDismissed: (DismissDirection direction) {
                      if (direction == DismissDirection.endToStart) {
                        print("Remove item");
                        setState(() {
                          txt.removeAt(index);
                        });
                      }
                    },
                    background: Container(),
                    secondaryBackground: Container(
                      color: Color(0xfffff5f5),
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: SvgPicture.asset("assets/Delete.svg"),
                      ),
                    ),
                    child: InkWell(
                        onTap: (){
                          OpenChat(index);

                        },
                        child: Message(txt[index], Imge[index])));
              },
            ),
          )
        ],
      ),
    );
  }

  Widget Message(
    String txt,
    String Imge,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      height: 90,
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(Imge), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    height: 60,
                    width: 60,
                    child: txt == "Marly Rodrigues"
                        ? Stack(
                            children: [
                              Transform.translate(
                                offset: Offset(43, 43),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xff00c566),
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  height: 15,
                                  width: 15,
                                ),
                              ),
                            ],
                          )
                        : SizedBox()),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      txt,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Plus Jakarta Sans",
                          color: Color(0xff111111)),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Lorem ipsum dolor sit amet...",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Plus Jakarta Sans",
                          color: Color(0xff66707a)),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 5),
            Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "10:20",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Plus Jakarta Sans",
                      color: Color(0xff66707a)),
                ),
                SizedBox(height: 15),
                if (txt == "Marly Rodrigues" || txt == "Jurandir Peçanha")
                  Align(
                      alignment: Alignment.center,
                      child: SvgPicture.asset("assets/number1.svg")),
                if (txt == "Christiano Salton" ||
                    txt == "Jemmy Fox" ||
                    txt == "Paulo Germano" ||
                    txt == "Cristian Silva" ||
                    txt == "Paulo Germano" ||
                    txt == "Cristian Silva")
                  Text(
                    "5/7/23",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Plus Jakarta Sans",
                        color: Color(0xff9ca4ab)),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
  OpenChat(index){
    Get.to(Inbox());
  }
}
