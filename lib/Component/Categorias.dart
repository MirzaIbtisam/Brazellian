import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class Categorias extends StatefulWidget {
  String Image;
  String Text;
  Categorias({super.key,required this.Text,required this.Image});

  @override
  State<Categorias> createState() => _Select_InterestState();
}

class _Select_InterestState extends State<Categorias> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xfffdefca),
        borderRadius: BorderRadius.circular(15),
      ),
      height: 95,
      width: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(widget.Image),
          SizedBox(height: 15),
          Text(
            widget.Text,
            style: TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}


