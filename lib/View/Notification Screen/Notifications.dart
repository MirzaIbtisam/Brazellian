import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<String> img = [
    "assets/profile2.jpg",
    "assets/profile3.jpg",
    "assets/profile2.jpg",
    "assets/profile3.jpg",
    "assets/profile2.jpg",
    "assets/profile3.jpg",
    "assets/profile2.jpg",
    "assets/profile3.jpg",
  ];
  List<String> txt = [
    "There's an incoming message from\nMarly Silva",
    "There's an incoming message from\nCriss Germano",
    "There's an incoming message from\nMarly Silva",
    "There's an incoming message from\nCriss Germano",
    "There's an incoming message from\nMarly Silva",
    "There's an incoming message from\nCriss Germano",
    "There's an incoming message from\nMarly Silva",
    "There's an incoming message from\nCriss Germano",
  ];
  List<String> txt1 = [
    "2 hours Ago",
    "4 hours Ago",
    "2 hours Ago",
    "4 hours Ago",
    "2 hours Ago",
    "4 hours Ago",
    "2 hours Ago",
    "4 hours Ago",

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
                  "Notifications",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Plus Jakarta Sans",
                      color: Color(0xff111111)),
                ),
                SizedBox(width: 20),
              ],
            ),
            SizedBox(height: 30),
            Align(alignment: Alignment.topLeft,
              child: Text(
                "Today",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Plus Jakarta Sans",
                    color: Color(0xff171717)),
              ),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: img.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 30),
                    child: Alert(img[index],txt[index],txt1[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Alert (
      String img,
      String txt,
      String txt1,
      ){
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(img),fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(100),
          ),
          height: 50,
          width: 50,
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              txt,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Plus Jakarta Sans",
                  color: Color(0xff171717)),
            ),
            SizedBox(height: 5),
            Text(
              txt1,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Plus Jakarta Sans",
                  color: Color(0xff78828a)),
            ),

          ],
        )
      ],
    );
  }
}
