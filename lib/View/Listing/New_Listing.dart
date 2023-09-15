import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'Multi_List.dart';

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
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffececec),
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
                  const Text(
                    "New Listing",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Plus Jakarta Sans",
                        color: Color(0xff111111)),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
              const SizedBox(height: 20),
              SvgPicture.asset("assets/Listing.svg",height: MediaQuery.of(context).size.height / 3,),
              const SizedBox(height: 20),
              const Text(
                "Hmm...Listing has\nnew item arriving \n  in the area!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Plus Jakarta Sans",
                    color: Color(0xff141414)),
              ),
              const SizedBox(height: 15),
              const Text(
                "Select the type of listing\n   you want to register.",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Plus Jakarta Sans",
                    color: Color(0xff9ca4ab)),
              ),
              const SizedBox(height: 15),
              const Text(
                "Select the Listing type",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Plus Jakarta Sans",
                    color: Color(0xff78828a)),
              ),
              const SizedBox(height: 10),
              Container(
                height: 60,
                width: Get.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: const Color(0xffb8bec4))),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: CustomDropdown(
                    hintText: "Select Type",
                    fillColor: Colors.white,
                    selectedStyle:
                        const TextStyle(fontSize: 16, color: Color(0xff78828a)),
                    items: items,
                    controller: controller,
                    onChanged: (value) {
                      // Update the controller value when the selection changes
                      controller.text = value!;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
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
                                title: const Text('Error Message'),
                                content: const Text('Please select the type'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context); //close Dialog
                                    },
                                    child: const Text('Close'),
                                  )
                                ],
                              );
                            });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        primary: const Color(0xfffcd9403),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 0),
                    child: const Text(
                      "Next",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontFamily: "Plus Jakarta Sans"),
                    )),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
