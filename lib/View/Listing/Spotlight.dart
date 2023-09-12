import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Spotlight extends StatelessWidget {
  const Spotlight({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      'Makrup kit',
      'Hair cut',
      'Haydra Facial',
    ];
    final TextEditingController controller = TextEditingController(text: '');
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
                    "New Spotlight",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Plus Jakarta Sans",
                        color: Color(0xff111111)),
                  ),
                  SizedBox(width: 20),
                ],
              ),
              SizedBox(height: 40),
              Txt("Highlight Title"),
              SizedBox(height: 10),
              Box("Makeup Kit"),
              SizedBox(height: 20),
              Txt("Price"),
              SizedBox(height: 10),
              Box("\$ 92,00"),
              SizedBox(height: 20),
              Txt("Choose listing"),
              SizedBox(height: 10),
              Container(
                height: 60,
                width: Get.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Color(0xffb8bec4))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 2, top: 5),
                  child: CustomDropdown(
                    fillColor: Colors.white,
                    selectedStyle:
                        TextStyle(fontSize: 16, color: Color(0xff78828a)),
                    items: items,
                    controller: controller,
                    onChanged: (value) {
                      // Update the controller value when the selection changes
                      controller.text = value!;
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Txt("Vertical video"),
                  Text(
                    "   (Required dimensions 1080x1920 pixels)",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Plus Jakarta Sans",
                        color: Color(0xff78828A)),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Color(0xffeedbaa))),
                height: 120,
                width: Get.width * 0.9,
                child: Center(
                  child: SizedBox(
                    height: 60,
                    width: 60,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xfffef0cb),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100)),
                          elevation: 0),
                      child: Icon(
                        Icons.play_circle_outline_sharp,
                        color: Color(0xffcf9709),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Txt("Cover spotlight"),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Color(0xffeedbaa))),
                height: 180,
                width: Get.width * 0.9,
                child: Center(
                  child: SizedBox(
                    height: 60,
                    width: 60,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xfffef0cb),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)),
                            elevation: 0),
                        child: SvgPicture.asset("assets/Gallery1.svg")),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Txt("Button Link"),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Color(0xffc9cdd2))),
                height: 60,
                width: Get.width * 0.9,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "wa.me/+1 389XXXXXXXXXXX  |",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Plus Jakarta Sans",
                        color: Color(0xff78828a)),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget Txt(
    String txt,
  ) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        txt,
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: "Plus Jakarta Sans",
            color: Color(0xff78828a)),
      ),
    );
  }

  Widget Box(
    String txt,
  ) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(0xffc9cdd2))),
      height: 60,
      width: Get.width * 0.9,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 5),
        child: TextFormField(
          inputFormatters: [
            LengthLimitingTextInputFormatter(50),
          ],
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: txt,
              hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Plus Jakarta Sans",
                  color: Color(0xff9198a0))),
        ),
      ),
    );
  }
}
