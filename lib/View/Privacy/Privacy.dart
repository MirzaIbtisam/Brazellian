import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
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
                    "Privacy policies",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Plus Jakarta Sans",
                        color: Color(0xff111111)),
                  ),
                  SizedBox(width: 40),
                ],
              ),
              SizedBox(height: 50),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "1. YOUR AGREEMENT",
                  style: TextStyle(
                      fontSize: 19,
                      fontFamily: "Plus Jakarta Sans",
                      fontWeight: FontWeight.w800,
                      color: Color(0xff332218)),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "By using this Site, you agree to be bound by, and\nto comply with, these Terms and Conditions. If\nyou do not agree to these Terms and Conditions,\nplease do not use this site.\n\nPLEASE NOTE: We reserve the right, at our sole\ndiscretion, to change, modify or otherwise alter\nthese Terms and Conditions at any time. Unless\notherwise indicated, amendments will become\neffective immediately. Please review these\nTerms and Conditions periodically. Your\ncontinued use of the Site following the posting\nof changes and/or modifications will constitute\nyour acceptance of the revised Terms and\nConditions and the reasonableness of these\nstandards for notice of changes. For your\ninformation, this page was last updated as of the\ndate at the top of these terms and conditions.",
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Plus Jakarta Sans",
                      fontWeight: FontWeight.w400,
                      color: Color(0xff857a75)),
                ),
              ),
              SizedBox(height: 35),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "2. PRIVACY",
                  style: TextStyle(
                      fontSize: 19,
                      fontFamily: "Plus Jakarta Sans",
                      fontWeight: FontWeight.w800,
                      color: Color(0xff332218)),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Please review our Privacy Policy, which also\ngoverns your visit to this Site, to understand our\npractices.",
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Plus Jakarta Sans",
                      fontWeight: FontWeight.w400,
                      color: Color(0xff857a75)),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "3. LINKED SITES",
                  style: TextStyle(
                      fontSize: 19,
                      fontFamily: "Plus Jakarta Sans",
                      fontWeight: FontWeight.w800,
                      color: Color(0xff332218)),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "This Site may contain links to other independent\nthird-party Web sites (''Linked Sites''). provided\nsolely as a convenience to our visitors.",
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Plus Jakarta Sans",
                      fontWeight: FontWeight.w400,
                      color: Color(0xff857a75)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
