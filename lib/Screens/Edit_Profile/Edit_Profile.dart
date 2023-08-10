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
    'Rather not say',
    'Rather say',
    'Rather',
  ];
  final TextEditingController controller = TextEditingController(text: '');
  final List<String> items1 = [
    'Pakistan',
    'America',
    'United State',
    'French',
  ];
  final TextEditingController controller1 = TextEditingController(text: '');
  final List<String> items2 = [
    'Florida',
    'California',
    'Georgia',
  ];
  final TextEditingController controller2 = TextEditingController(text: '');
  final List<String> items3 = [
    'Lahore',
    'Islamabad',
    'Karachi',
  ];
  final TextEditingController controller3 = TextEditingController(text: '');
  double a = 60.0;

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
                        child: InkWell(
                          onTap: () {
                            Get.defaultDialog(
                              title: "",
                              content: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: InkWell(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: SvgPicture.asset(
                                            "assets/Delete, Disabled.svg"),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "Selecionar imagem",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "Plus Jakarta Sans",
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                  SizedBox(height: 15),
                                  Divider(
                                    thickness: 0.5,
                                    color: Color(0xffececec),
                                  ),
                                  SizedBox(height: 15),
                                  Elevated("assets/camera.svg", "Usar câmera",
                                      (0xff111111)),
                                  SizedBox(height: 15),
                                  Elevated("assets/gallery.svg",
                                      "Select from gallery", (0xff111111)),
                                  SizedBox(height: 15),
                                  Elevated("assets/Trash, Delete, Remove.svg",
                                      "Delete image", (0xffFF0000)),
                                  SizedBox(height: 10),
                                ],
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xffcd9403),
                                borderRadius: BorderRadius.circular(100),
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
              Dropdown(items, controller),
              SizedBox(height: 15),
              text("Addres"),
              SizedBox(height: 8),
              Textfield("777 Test Street"),
              SizedBox(height: 15),
              text("Complement (optional)"),
              SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Color(0xffb8bec4))),
                height: a,
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, left: 15),
                  child: TextFormField(
                    onChanged: (value) {
                      value.length >= 10 ? a = 120.0 : 60.0;
                      setState(() {});
                    },
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(200),
                    ],
                    decoration: InputDecoration(
                        hintText:
                            "Lorem Ipsum is simply dummy text of\nthedd printing and typesetting industry.",
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
              text("Country"),
              SizedBox(height: 8),
              Dropdown(items1, controller1),
              SizedBox(height: 15),
              text("State"),
              SizedBox(height: 8),
              Dropdown(items2, controller2),
              SizedBox(height: 15),
              text("City"),
              SizedBox(height: 8),
              Dropdown(items3, controller3),
              SizedBox(
                height: 15,
              ),
              text("ZIP Code"),
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
                      LengthLimitingTextInputFormatter(6),
                    ],
                    decoration: InputDecoration(
                        hintText: "SE1 7AB",
                        hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Plus Jakarta Sana",
                            color: Color(0xff78828a)),
                        border: InputBorder.none),
                  ),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: Get.width,
                height: 60,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xffcd9403),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: Text(
                      "Save",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Plus Jakarta Sans"),
                    )),
              ),
              SizedBox(height: 15),
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

  Widget Dropdown(List<String> items, TextEditingController controller) {
    return Container(
      height: 60,
      width: Get.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(0xffb8bec4))),
      child: Padding(
        padding: const EdgeInsets.only(left: 2, top: 8),
        child: CustomDropdown(
          fillColor: Colors.white,
          selectedStyle: TextStyle(fontSize: 16, color: Color(0xff78828a)),
          items: items,
          controller: controller,
          onChanged: (value) {
            // Update the controller value when the selection changes
            controller.text = value!;
          },
        ),
      ),
    );
  }

  Widget Elevated(
    String img,
    String txt,
    int color,
  ) {
    return SizedBox(
      height: 60,
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: Color(0xfff5f5f5),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 0,
          ),
          child: Row(
            children: [
              SvgPicture.asset(img),
              SizedBox(width: 10),
              Text(
                txt,
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Plus Jakarta Sans",
                    fontWeight: FontWeight.w600,
                    color: Color(color as int)),
              )
            ],
          )),
    );
  }
}
