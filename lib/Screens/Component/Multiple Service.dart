import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Multiple_Service extends StatefulWidget {
  String Image1;
  String Image2;
  String Image3;
  String Text1;
  String Text2;


  Multiple_Service(
      {super.key,
      required this.Image1,
      required this.Image2,
      required this.Image3,
      required this.Text1,
      required this.Text2});

  @override
  State<Multiple_Service> createState() => _Multiple_ServiceState();
}

class _Multiple_ServiceState extends State<Multiple_Service> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xffedebe9)),
        borderRadius: BorderRadius.circular(15),
      ),
      height: MediaQuery.of(context).size.height / 3.6,
      width: MediaQuery.of(context).size.width / 2.3,
      child: Column(
        children: [
          SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(widget.Image3), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(10),
            ),
            height: 140,
            width: MediaQuery.of(context).size.width / 2.4,
            child: Column(
              children: [
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(widget.Image1),
                      SvgPicture.asset(widget.Image2)
                    ],
                  ),
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
                widget.Text1,
                style: TextStyle(
                    fontSize: 11,
                    color: Color(0xff101828),
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Plus Jakarta Sans'),
              ),
            ),
          ),
          SizedBox(height: 15),
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
                  widget.Text2,
                  style: TextStyle(
                      fontSize: 12,
                      color: Color(0xffee9e03),
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}
