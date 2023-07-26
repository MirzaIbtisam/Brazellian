import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:brazeellian_community/Screens/Listing_Screen/View.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Multi_List extends StatefulWidget {
  const Multi_List({super.key});

  @override
  State<Multi_List> createState() => _Multi_ListState();
}

class _Multi_ListState extends State<Multi_List> {
  final List<String> items = [
    'Events',
    'Real State',
    'Adverts',
    'Service',
    'Work',
    'Vehicles'
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

  final TextEditingController controller = TextEditingController(text: '');
  final TextEditingController controller1 = TextEditingController(text: '');
  final TextEditingController controller2 = TextEditingController(text: '');
  final TextEditingController controller3 = TextEditingController(text: '');
  final TextEditingController controller4 = TextEditingController(text: '');
  final TextEditingController controller5 = TextEditingController(text: '');
  final TextEditingController controller6 = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
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
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffcd9403),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      height: 20,
                      width: 20,
                      child: Center(
                        child: Text(
                          "1",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontFamily: "Plus Jakarta Sans",
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "New listing",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff111111),
                          fontFamily: "Plus Jakarta Sans",
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(width: 15),
                SvgPicture.asset("assets/listing_vector.svg"),
                SizedBox(width: 15),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffacb6be),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      height: 20,
                      width: 20,
                      child: Center(
                        child: Text(
                          "2",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontFamily: "Plus Jakarta Sans",
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Confirm listing",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xffb2bcc3),
                          fontFamily: "Plus Jakarta Sans",
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Txt("Select the Listing type"),
                  SizedBox(height: 10),
                  Dropdown(items, controller),
                  SizedBox(height: 20),
                  Txt("Category"),
                  SizedBox(height: 10),
                  Dropdown(items1, controller1),
                  SizedBox(height: 20),
                  Txt("Subcategory"),
                  SizedBox(height: 10),
                  Dropdown(items2, controller2),
                  SizedBox(height: 20),
                  Txt("Vehicle Type"),
                  SizedBox(height: 10),
                  Box("Suzuki"),
                  SizedBox(height: 20),
                  Txt("Listing title"),
                  SizedBox(height: 10),
                  Box("The Power of the Network  |"),
                  SizedBox(height: 20),
                  Txt("Advertiser name"),
                  SizedBox(height: 10),
                  Box("Criss Germano"),
                  SizedBox(height: 20),
                  Txt("Approximate value"),
                  SizedBox(height: 10),
                  Box("\$180 (hour)"),
                  SizedBox(height: 20),
                  Txt("Description"),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Color(0xffc9cdd2))),
                    height: 150,
                    width: Get.width * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 5),
                      child: TextFormField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(50),
                        ],
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText:
                                "Lorem Ipsum is simply dummy text of\nthedd printing and typesetting industry.",
                            hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Plus Jakarta Sans",
                                color: Color(0xffbbc0c4))),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Txt("Keywords"),
                  SizedBox(height: 8),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "(Words or categories related to this item)",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Plus Jakarta Sans",
                          color: Color(0xffbbc0c4)),
                    ),
                  ),
                  SizedBox(height: 10),
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
                                                          : Color(
                                                              0xff868e96)))))))
                                  .toList()),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
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
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Box1(
                        "13/09/2023",
                      ),
                      Box1(
                        "4pm",
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Txt("Start"),
                            SizedBox(width: 5),
                            Text(
                              "(Approximate)",
                              style: TextStyle(
                                  fontSize: 8,
                                  color: Color(0xff78828a),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Plus Jakarta Sans"),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Txt("Finishing"),
                            SizedBox(width: 5),
                            Text(
                              "(Approximate)",
                              style: TextStyle(
                                  fontSize: 8,
                                  color: Color(0xff78828a),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Plus Jakarta Sans"),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Box1(
                        "13pm",
                      ),
                      Box1(
                        "5pm",
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
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
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Dropdown1(items3, controller3),
                      Dropdown1(items4, controller4)
                    ],
                  ),
                  SizedBox(height: 20),
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
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Dropdown1(items5, controller5),
                      Dropdown1(items6, controller6)
                    ],
                  ),
                  SizedBox(height: 20),
                  Txt("Location"),
                  SizedBox(height: 10),
                  Box("Avenida Braelo, 587"),
                  SizedBox(height: 20),
                  Txt("ZIP Code"),
                  SizedBox(height: 10),
                  Box("SE1 7AB"),
                  SizedBox(height: 20),
                  Txt("Price"),
                  SizedBox(height: 10),
                  Box("\$ 900,00"),
                  SizedBox(height: 20),
                  Txt("Website"),
                  SizedBox(height: 10),
                  Box("587 Braelo Avenue"),
                  SizedBox(height: 20),
                  Txt("Whatsapp"),
                  SizedBox(height: 10),
                  Box("https://wa.me/00000000"),
                  SizedBox(height: 20),
                  Txt("Instagram "),
                  SizedBox(height: 10),
                  Box("@braelo.co"),
                  SizedBox(height: 20),
                  Txt("Facebook "),
                  SizedBox(height: 10),
                  Box("@braelo.co"),
                  SizedBox(height: 20),
                  Txt("Add thumbnail"),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Color(0xffc9cdd2))),
                    height: 200,
                    width: Get.width * 0.9,
                    child: SvgPicture.asset(
                      "assets/import pic.svg",
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  SizedBox(height: 20),
                  Txt("Add photos"),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Box2(),
                      Box2(),
                      Box2(),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Box2(),
                      Box2(),
                      Box2(),
                    ],
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 60,
                    width: Get.width * 0.9,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(() => View_Items());
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
                  SizedBox(height: 20),
                ],
              ),
            )
          ],
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
            color: Color(0xff78828a),
            fontFamily: "Plus Jakarta Sans",
            fontWeight: FontWeight.w600),
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
                  color: Color(0xff868e96))),
        ),
      ),
    );
  }

  Widget Box1(
    String txt,
  ) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(0xffc9cdd2))),
      height: 60,
      width: MediaQuery.of(context).size.width / 2.5,
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
                  color: Color(0xff868e96))),
        ),
      ),
    );
  }
  Widget Box2() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xfffdf7e8),
        borderRadius: BorderRadius.circular(15),
      ),
      height: MediaQuery.of(context).size.height / 7.5,
      width: MediaQuery.of(context).size.width / 3.5,
      child: SvgPicture.asset(
        "assets/import_Pic1.svg",
        fit: BoxFit.scaleDown,
      ),
    );
  }

  Widget Dropdown(
    List<String> item,
    TextEditingController control,
  ) {
    return Container(
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
          selectedStyle: TextStyle(fontSize: 16, color: Color(0xff78828a)),
          items: item,
          controller: control,
          onChanged: (value) {
            // Update the controller value when the selection changes
            control.text = value!;
          },
        ),
      ),
    );
  }

  Widget Dropdown1(
    List<String> item,
    TextEditingController control,
  ) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width / 2.5,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(0xffb8bec4))),
      child: Padding(
        padding: const EdgeInsets.only(left: 2, top: 5),
        child: CustomDropdown(
          fillColor: Colors.white,
          selectedStyle: TextStyle(fontSize: 16, color: Color(0xff78828a)),
          items: item,
          controller: control,
          onChanged: (value) {
            // Update the controller value when the selection changes
            control.text = value!;
          },
        ),
      ),
    );
  }
}
