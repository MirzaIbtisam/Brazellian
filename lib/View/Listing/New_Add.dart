import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class New_Add extends StatefulWidget {
  const New_Add({super.key});

  @override
  State<New_Add> createState() => _New_AddState();
}

class _New_AddState extends State<New_Add> {
  List Salvos = [
    {'title': 'Pub', 'isActive': false},
    {'title': 'Restaurant', 'isActive': false},
    {'title': 'Beauty Salon', 'isActive': false},
    {'title': 'Bar', 'isActive': false},
    {'title': 'DJ', 'isActive': false},
    {'title': 'Coffeshop', 'isActive': false},
    {'title': 'Bakery', 'isActive': false},
    {'title': 'Party Room', 'isActive': false},
    {'title': 'Studio', 'isActive': false},
    {'title': 'Language School', 'isActive': false},
    {'title': 'Technical Course', 'isActive': false},
    {'title': 'Barbershop', 'isActive': false},
  ];

  void changeState(Map<String, dynamic> selectedItem) {
    setState(() {
      for (var item in Salvos) {
        item['isActive'] = (item == selectedItem);
      }
    });
  }

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
                    "New Add",
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
              Txt("Ad title"),
              SizedBox(height: 10),
              Box(60, "Immigration Paralegal Services", 16),
              SizedBox(height: 20),
              Txt("Description"),
              SizedBox(height: 10),
              Box(
                  100,
                  "Get to know Legally and Co's services\nand ask your questions I",
                  12),
              SizedBox(height: 20),
              Txt("Button Link"),
              SizedBox(height: 10),
              Box(60, "wa.me/+1 389XXXXXXXXXXX  |", 12),
              SizedBox(height: 20),
              Txt("Keywords"),
              SizedBox(height: 5),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "(Words or categories related to this item)",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Plus Jakarta Sans",
                      color: Color(0xffa6adb2)),
                ),
              ),
              SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Color(0xffc9cdd2))),
                height: 250,
                width: Get.width * 0.9,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 5),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0, top: 10),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Restaurante |",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Plus Jakarta Sans",
                                color: Color(0xffa6adb2)),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Wrap(
                          direction: Axis.horizontal,
                          spacing: 10.0,
                          runSpacing: 10.0,
                          children: Salvos.map((option) => new Container(
                                  child: InkWell(
                                      onTap: () {
                                        changeState(option);
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                            color: option['isActive']
                                                ? Color(0xffffd25e)
                                                : Color(0xfffbd35c),
                                            borderRadius:
                                                BorderRadius.circular(32),
                                          ),
                                          height: 40,
                                          padding: EdgeInsets.all(10),
                                          child: Text('${option['title']}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: option['isActive']
                                                      ? Color(0xff4d5867)
                                                      : Color(0xff868e96)))))))
                              .toList()),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Txt("Add cover"),
                  SizedBox(width: 15),
                  Text(
                    "'(Dimensions 327x189 pixels),",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        fontFamily: "Pls Jakarta Sans",
                        color: Color(0xffa6adb2)),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Color(0xffeedbaa))),
                height: 200,
                width: Get.width * 0.9,
                child: SvgPicture.asset(
                  "assets/import pic.svg",
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: Get.width * 0.9,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        backgroundColor: Colors.transparent,
                        // Add a transparent background color
                        contentPadding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        content: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors
                                .white10, // If you want a white background for the dialog
                          ),
                          height: MediaQuery.of(context).size.height / 1.5,
                          child: Column(
                            children: [
                              SizedBox(height: 150),
                              SvgPicture.asset("assets/immigration.svg"),
                              Spacer(),
                              SizedBox(
                                height: 50,
                                width: Get.width * 0.9,
                                child: ElevatedButton(
                                  onPressed: () {
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        title: SvgPicture.asset(
                                            "assets/Vector.svg"),
                                        content: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 80),
                                          child: Text(
                                            "Great!",
                                            style: TextStyle(
                                                fontSize: 24,
                                                color: Color(0xff343A40),
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        actions: <Widget>[
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Your ad was successfully registered!\nNow all you have to do is cross your\n        fingers and stay positive!",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xff6C6C6C)),
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                        ],
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xffcd9403),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                  child: Text(
                                    "Finish",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Plus Jakarta Sans",
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xffcd9403),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  child: Text(
                    "View",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        fontFamily: "Pls Jakarta Sans",
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 10),
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
    double height,
    String txt,
    double size,
  ) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(0xffc9cdd2))),
      height: height,
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
                  fontSize: size,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Plus Jakarta Sans",
                  color: Color(0xff9198a0))),
        ),
      ),
    );
  }
}
