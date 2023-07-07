import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Edit_Profile extends StatefulWidget {
  const Edit_Profile({super.key});

  @override
  State<Edit_Profile> createState() => _Edit_ProfileState();
}

class _Edit_ProfileState extends State<Edit_Profile> {
  final List<String> items = [
    'English',
    'Urdu',
    'Arabic',
    'French',
    'Português do Brasil'
  ];
  final TextEditingController controller = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
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
                    "Profile",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Plus Jakarta Sans",
                        color: Color(0xff111111)),
                  ),
                  SizedBox(width: 40),
                ],
              ),
              SizedBox(height: 30),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                          image: AssetImage("assets/profile.jpg"),
                          fit: BoxFit.cover),
                      border: Border.all(color: Color(0xffcd9403), width: 4.5)),
                  height: 100,
                  width: 100,
                  child: Stack(
                    children: [
                      Transform.translate(
                        offset: Offset(65, 65),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xffcd9403),
                              borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(
                                  image: AssetImage(""), fit: BoxFit.cover),
                              border:
                                  Border.all(color: Colors.white, width: 2)),
                          height: 30,
                          width: 30,
                          child: SvgPicture.asset(
                            "assets/editing.svg",
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ],
                  )),
              SizedBox(height: 20),
              text("Name"),
              SizedBox(height: 8),
              Textfield("Criss"),
              SizedBox(height: 15),
              text("Last name"),
              SizedBox(height: 8),
              Textfield("Germano"),
              SizedBox(height: 15),
              Row(
                children: [
                  text("SNN"),
                  Text(
                    " (Social Security Number)",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Plus Jakarta Sana",
                        color: Color(0xff78828a)),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Textfield("crissgermano@gmail.com"),
              SizedBox(height: 15),
              text("E-mail"),
              SizedBox(height: 8),
              Textfield("crissgermano@gmail.com"),
              SizedBox(height: 15),
              text("Date of birth"),
              SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Color(0xffb8bec4))),
                height: 60,
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, left: 15),
                  child: TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(25),
                    ],
                    decoration: InputDecoration(
                        suffixIcon: SvgPicture.asset(
                          "assets/Calendar.svg",
                          fit: BoxFit.scaleDown,
                        ),
                        hintText: "1 January 1988",
                        hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Plus Jakarta Sana",
                            color: Color(0xff78828a)),
                        border: InputBorder.none),
                  ),
                ),
              ),
              SizedBox(height: 15),
              text("Genre"),
              SizedBox(height: 8),
              CustomDropdown(

                selectedStyle:
                    TextStyle(fontSize: 16, color: Color(0xff78828a)),
                items: items,
                controller: controller,
                onChanged: (value) {
                  // Update the controller value when the selection changes
                  controller.text = value!;
                },
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget text(
    String Name,
  ) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        Name,
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: "Plus Jakarta Sana",
            color: Color(0xff78828a)),
      ),
    );
  }

  Widget Textfield(
    String Name,
  ) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(0xffb8bec4))),
      height: 60,
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.only(top: 5, left: 15),
        child: TextFormField(
          inputFormatters: [
            LengthLimitingTextInputFormatter(25),
          ],
          decoration: InputDecoration(
              hintText: Name,
              hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Plus Jakarta Sana",
                  color: Color(0xff78828a)),
              border: InputBorder.none),
        ),
      ),
    );
  }
}
