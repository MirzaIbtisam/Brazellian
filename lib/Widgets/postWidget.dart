import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget Multiple_Servicee(
    String Image1,
    String Image2,
    String Image3,
    String Text1,
    String Text2,
    BuildContext context
    ) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Color(0xffedebe9)),
      borderRadius: BorderRadius.circular(15),
    ),
    height: MediaQuery.of(context).size.height / 4.6,
    width: MediaQuery.of(context).size.width / 2.3,
    child: Column(
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            height: 120,
            width: MediaQuery.of(context).size.width / 2.4,
            child: Image.network(Image3,fit: BoxFit.cover,)
        ),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              Text1,
              style: TextStyle(
                  fontSize: 12,
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
                Text2,
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