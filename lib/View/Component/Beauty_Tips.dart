import 'package:flutter/material.dart';


class Beauty_Tips extends StatefulWidget {
  String Image;
   Beauty_Tips({super.key,required this.Image});

  @override
  State<Beauty_Tips> createState() => _Beauty_TipsState();
}

class _Beauty_TipsState extends State<Beauty_Tips> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xffeeac04),width: 2),
        borderRadius: BorderRadius.circular(100),
      ),
      height: 70,
      width: 70,
      child: Padding(
        padding: const EdgeInsets.all(1.5),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(widget.Image),fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}
