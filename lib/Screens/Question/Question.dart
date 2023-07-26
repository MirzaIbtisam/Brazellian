import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class Question extends StatelessWidget {
  const Question({Key? key}); // Corrected the parameter type to 'Key?'.

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
                  "Help and Support",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Plus Jakarta Sans",
                    color: Color(0xff111111),
                  ),
                ),
                SizedBox(width: 40),
              ],
            ),
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                color: Color(0xfff6f8fe),
                borderRadius: BorderRadius.circular(12),
              ),
              height: 50,
              width: MediaQuery.of(context).size.width / 1.1,
              child: TextFormField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(20),
                ],
                decoration: InputDecoration(
                  prefixIcon: SvgPicture.asset(
                    "assets/Seacrh.svg",
                    fit: BoxFit.scaleDown,
                  ),
                  hintText: "Search...",
                  hintStyle: TextStyle(
                    fontSize: 16,
                    color: Color(0xff9ca4ab),
                    fontWeight: FontWeight.w500,
                    fontFamily: "Plus Jakarta Sans",
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 15),
                ),
              ),
            ),
            SizedBox(height: 20),
            DropDown("How can I become a member?", context),
            divider(),
            DropDown("Can I advertise my business on Braelo?", context),
            divider(),
            DropDown("How does it work for influencers?", context),
            divider(),
            DropDown("What are the service hours?", context),
            divider(),
            DropDown("I want to work at Braelo, how do I do it?", context),
          ],
        ),
      ),
    );
  }

  Widget divider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Divider(
        thickness: 0.5,
        color: Color(0xffe3e7ec),
      ),
    );
  }

  Widget DropDown(String txt, BuildContext context) {
    return Card(
      elevation: 0,
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent, // Remove the divider
        ),
        child: ExpansionTile(
          collapsedIconColor: Colors.black,
          iconColor: Colors.black,
          title: Text(
            txt,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: "Plus Jakarta Sans",
              color: Color(0xff111111),
            ),
          ),
          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: Text(
                "Amet minim mollit non deserunt ullamco est sit\naliqua dolor do amet sint. Velit officia consequat\nduis enim velit mollit. Exercitation veniam\nconsequat sunt nostrud amet.",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
