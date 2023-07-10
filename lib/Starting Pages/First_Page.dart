import 'dart:async';
import 'package:brazeellian_community/Create%20Account/Create_Account.dart';
import 'package:brazeellian_community/Home%20Screen/Home_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class First_Page extends StatefulWidget {
  const First_Page({super.key});

  @override
  State<First_Page> createState() => _First_PageState();
}

class _First_PageState extends State<First_Page> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(context as BuildContext,
            MaterialPageRoute(builder: (context) => Home_Screen())));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFBBC1B),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/Group.svg"),
            Transform.translate(
              offset: Offset(0, 200),
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ),
            Transform.translate(
              offset: Offset(0, 250),
              child: Text(
                "Version 1.0.2",
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
