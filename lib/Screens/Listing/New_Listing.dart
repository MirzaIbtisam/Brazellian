import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:brazeellian_community/Screens/Listing/Multi_List.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class New_Listing extends StatefulWidget {
  const New_Listing({super.key});

  @override
  State<New_Listing> createState() => _New_ListingState();
}

class _New_ListingState extends State<New_Listing> {
  final List<String> items = [
    'Event',
    'Property',
    'Advert',
    'Service',
    'Work',
    'Vehicle'
  ];
  final TextEditingController controller = TextEditingController(text: '');

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
                    "New Listing",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Plus Jakarta Sans",
                        color: Color(0xff111111)),
                  ),
                  SizedBox(width: 20),
                ],
              ),
              SizedBox(height: 20),
              SvgPicture.asset("assets/Listing.svg"),
              SizedBox(height: 20),
              Text(
                "Hmm... Listing has\nnew item arriving \n    in the area!",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Plus Jakarta Sans",
                    color: Color(0xff141414)),
              ),
              SizedBox(height: 15),
              Text(
                "Select the type of listing\n   you want to register.",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Plus Jakarta Sans",
                    color: Color(0xff9ca4ab)),
              ),
              SizedBox(height: 15),
              Text(
                "Select the Listing type",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Plus Jakarta Sans",
                    color: Color(0xff78828a)),
              ),
              SizedBox(height: 10),
              Container(
                height: 60,
                width: Get.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Color(0xffb8bec4))),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: CustomDropdown(
                    hintText: "Select Type",
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
              SizedBox(
                height: 60,
                width: Get.width * 0.9,
                child: ElevatedButton(
                    onPressed: () {
                      if (controller.text.isNotEmpty) {
                        Get.to(() => Multi_List(
                              type: controller.text.toString(),
                          page: 0,
                            ));
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return CupertinoAlertDialog(
                                title: Text('Error Message'),
                                content: Text('Please select the type'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context); //close Dialog
                                    },
                                    child: Text('Close'),
                                  )
                                ],
                              );
                            });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xfffcd9403),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 0),
                    child: Text(
                      "Next",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontFamily: "Plus Jakarta Sans"),
                    )),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
