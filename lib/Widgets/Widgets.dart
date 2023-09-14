import 'dart:io';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

final List<String> items = [
  'Event',
  'Property',
  'Advert',
  'Service',
  'Work',
  'Vehicle',
];
final List<String> items1 = [
  'Feed',
  'Cleaning',
  'Construção',
  'Feed',
  'Cleaning',
  'Construção',
];
final List<String> items2 = [
  'Coffeshop',
  'House Cleaning',
  'Electricista',
  'Barco',
  'Coffeshop',
];
final List<String> items3 = [
  '1 Drom',
  '2 Drom',
  '3 Drom',
  '4 Drom',
  '5 Drom',
];
final List<String> items4 = [
  '1 Bathroom',
  '2 Bathroom',
  '3 Bathroom',
  '4 Bathroom',
  '5 Bathroom',
];
final List<String> items5 = [
  '1 Suite',
  '2 Suite',
  '3 Suite',
  '4 Suite',
  '5 Suite',
];
final List<String> items6 = [
  '1 vagas',
  '2 vagas',
  '3 vagas',
  '4 vagas',
  '5 vagas',
];

 List<File?> pickedImages = List.generate(6, (index) => null);




  Widget getTypeSpecificWidgets(List<TextEditingController> controllers ,String type ,TextEditingController controller1,
      TextEditingController controller2,
      TextEditingController controller3,
      TextEditingController controller4,
      TextEditingController controller5,
      TextEditingController controller6 ,
      BuildContext context,
      ) {
    print(type);
    if (type == 'Event') {
      return Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Txt("Date"),
                Txt("Schedule"),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Box1("MM/DD/YYYY", controllers[8],context),
              Box1("4pm", controllers[9],context),
            ],
          ),
          const SizedBox(height: 20),
          Txt("Website"),
          const SizedBox(height: 10),
          Box("587 Braelo Avenue", controllers[5]),
          const SizedBox(height: 20),
          Txt("Instagram"),
          const SizedBox(height: 10),
          Box("@braelo.co", controllers[6]),
          const SizedBox(height: 20),
          Txt("Facebook "),
          const SizedBox(height: 10),
          Box("@braelo.co", controllers[7]),
          const SizedBox(height: 20),
        ],
      );
    } else if (type == 'Property') {
      return Column(
        children: [
          const SizedBox(height: 20),
          Txt("Price"),
          const SizedBox(height: 10),
          Box("\$ 900,00", controllers[5]),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Txt("Dorms"),
                Txt("Bathrooms"),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Dropdown(items3, controller3,type)),
              const SizedBox(
                width: 30,
              ),
              Expanded(child: Dropdown(items4, controller4,type))
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Txt("Suites"),
                Txt("Jobs"),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Dropdown(items5, controller5,type)),
              const SizedBox(
                width: 30,
              ),
              Expanded(child: Dropdown(items6, controller6,type))
            ],
          ),
          const SizedBox(height: 20),
        ],
      );
    } else if (type == 'Advert') {
      return Column(
        children: [
          Txt("Category"),
          const SizedBox(height: 10),
          Dropdown(items1, controller1,type),
          const SizedBox(height: 20),
          Txt("Subcategory"),
          const SizedBox(height: 10),
          Dropdown(items2, controller2,type),
          const SizedBox(height: 20),
          Txt("Instagram "),
          const SizedBox(height: 10),
          Box("@braelo.co", controllers[5]),
          const SizedBox(height: 20),
          Txt("Facebook "),
          const SizedBox(height: 10),
          Box("@braelo.co", controllers[6]),
          const SizedBox(height: 20),
        ],
      );
    } else if (type == 'Service' || type == 'Work') {
      return Column(
        children: [
          Txt("Category"),
          const SizedBox(height: 10),
          Dropdown(items1, controller1,type),
          const SizedBox(height: 20),
          Txt("Subcategory"),
          const SizedBox(height: 10),
          Dropdown(items2, controller2,type),
          const SizedBox(height: 20),
          const SizedBox(height: 20),
          Txt("Advertiser name"),
          const SizedBox(height: 10),
          Box("Criss Germano", controllers[5]),
          const SizedBox(height: 20),
          Txt("Approximate value"),
          const SizedBox(height: 10),
          Box("\$180 (hour)", controllers[6]),
        ],
      );
    } else if (type == 'Vehicle') {
      return Column(
        children: [
          Txt("Subcategory"),
          const SizedBox(height: 10),
          Dropdown(items2, controller2,type),
          const SizedBox(height: 20),
          Txt("Vehicle Type"),
          const SizedBox(height: 10),
          Box("Suzuki", controllers[5]),
          const SizedBox(height: 20),
          Txt("Approximate value"),
          const SizedBox(height: 10),
          Box("\$180 (hour)", controllers[6]),
        ],
      );
    } else {
      return Container(); // Default empty container
    }
  }

  Widget Txt(
      String txt,
      ) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        txt,
        style: const TextStyle(
            fontSize: 16,
            color: Color(0xff78828a),
            fontFamily: "Plus Jakarta Sans",
            fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget Box(String txt, TextEditingController a) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: const Color(0xffc9cdd2))),
      height: 60,
      width: Get.width * 0.9,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 5),
        child: TextFormField(
          keyboardType: txt == "SE1 7AB" || txt == "\$ 900,00"
              ? TextInputType.number
              : TextInputType.name,
          controller: a,
          inputFormatters: [
            LengthLimitingTextInputFormatter(50),
          ],
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: txt,
              hintStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Plus Jakarta Sans",
                  color: Color(0xff868e96))),
        ),
      ),
    );
  }

  Widget Box1(String txt, TextEditingController dateController , BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: const Color(0xffc9cdd2))),
      height: 60,
      width: MediaQuery.of(context).size.width / 2.5,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 5),
        child: TextFormField(
          keyboardType: TextInputType.number,
          onChanged: (value) {
            if (value.length == 2) {
              int? month = int.tryParse(value);
              if (month != null && month >= 1 && month <= 12) {
                dateController.text = value + "/";
                dateController.selection = TextSelection.fromPosition(
                    TextPosition(offset: dateController.text.length));
              }
            } else if (value.length == 5) {
              int? day = int.tryParse(value.substring(3, 5));
              int? month = int.tryParse(value.substring(0, 2));

              if (day != null && month != null && month >= 1 && month <= 12) {
                int maxDaysInMonth;

                if (month == 2) {
                  // February
                  maxDaysInMonth = 28; // Leap years are not considered here
                } else if (month == 4 ||
                    month == 6 ||
                    month == 9 ||
                    month == 11) {
                  maxDaysInMonth = 30; // Months with 30 days
                } else {
                  maxDaysInMonth = 31; // Months with 31 days
                }

                if (day >= 1 && day <= maxDaysInMonth) {
                  dateController.text = value + "/";
                  dateController.selection = TextSelection.fromPosition(
                      TextPosition(offset: dateController.text.length));
                }
              }
            }
          },
          controller: dateController,
          inputFormatters: [
            LengthLimitingTextInputFormatter(50),
          ],
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: txt,
              hintStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Plus Jakarta Sans",
                  color: Color(0xff868e96))),
        ),
      ),
    );
  }

  Widget Box2(BuildContext context, File? edImage, int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xfffdf7e8),
            ),
            height: MediaQuery.of(context).size.height / 7.5,
            width: MediaQuery.of(context).size.width / 3.5,
            child: GestureDetector(
              onTap: () {
                // _showImagePickerDialog(context, index);
              },
              child: edImage != null
                  ? Image.file(
                edImage,
                fit: BoxFit.cover,
              )
                  : SvgPicture.asset(
                "assets/import_Pic1.svg",
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          if (edImage != null)
            Positioned(
              top: 5,
              right: 5,
              child: GestureDetector(
                onTap: () {

                    pickedImages[index] = null; // Remove the selected image

                },
                child: SvgPicture.asset(
                  "assets/delete_pic.svg",
                  height: 20,
                ),
              ),
            ),
        ],
      ),
    );
  }




  Widget Dropdown(List<String> item, TextEditingController control,
      String type,
      {bool flag = false}) {
    return Container(
      height: 60,
      width: Get.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: const Color(0xffb8bec4))),
      child: Padding(
        padding: const EdgeInsets.only(left: 2, top: 5),
        child: AbsorbPointer(
          absorbing: flag,
          child: CustomDropdown(
            fillColor: Colors.white,
            selectedStyle: const TextStyle(fontSize: 16, color: Color(0xff78828a)),
            items: item,
            controller: control,
            onChanged: (value) {
              control.text = value;
              if (flag == true) {
                type = value;
              }

            },
          ),
        ),
      ),
    );
  }

