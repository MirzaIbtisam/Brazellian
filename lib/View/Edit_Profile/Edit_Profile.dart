import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../Models/userModel.dart';
import '../../Services/ApiServices/getUserInfo.dart';
import '../../Services/ApiServices/updateUserProfile.dart';
import '../Home Screen/Home_Screen.dart';

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
  final List<TextEditingController> controllers = [TextEditingController(text: ''),TextEditingController(text: ''),TextEditingController(text: ''),
    TextEditingController(text: ''),TextEditingController(text: ''),TextEditingController(text: ''),TextEditingController(text: ''),];
  final TextEditingController controller = TextEditingController(text: '');
  final TextEditingController controller1 = TextEditingController(text: '');
  final TextEditingController controller2 = TextEditingController(text: '');
  final List<String> country = [
    'Pakistan',
    'America',
    'United States',
    'France',
    'Canada',
    'Germany',
    'Australia',
  ];

  final List<String> state = [
    'Florida',
    'California',
    'Georgia',
    'Texas',
    'New York',
    'Illinois',
    'Washington',
  ];

  final List<String> city = [
    'Lahore',
    'Islamabad',
    'Karachi',
    'New York City',
    'Los Angeles',
    'Berlin',
    'Sydney',
  ];
  final TextEditingController controller3 = TextEditingController(text: '');
  double a = 60.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialize();
  }
  void initialize()async {
    print(11);
    UserProfile user=await ApiServicesforGetUserInfo.getUserInfo();
    controllers[0].text=user.name!.split(' ')[0];
    if(user.name.toString().contains(' ')){
      controllers[1].text=user.name!.split(' ')[1];
    }
    controllers[2].text=user.email!;
    controllers[3].text=user.dateOfBirth!;
    controllers[4].text=user.address!;
    controllers[5].text=user.complement!;
    controllers[6].text=user.zipCode!;
    controller.text=user.gender!;
    controller2.text=user.state!;
    controller1.text=user.location!;
    controller3.text=user.city!;
    setState(() {

    });
  }
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
              Textfield("Criss",controllers[0]),
              SizedBox(height: 15),
              text("Last name"),
              SizedBox(height: 8),
              Textfield("Germano",controllers[1]),
              SizedBox(height: 15),
              text("E-mail"),
              SizedBox(height: 8),
              Textfield("crissgermano@gmail.com",controllers[2]),
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
                    controller: controllers[6],
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
              Textfield("777 Test Street",controllers[3]),
              SizedBox(height: 15),
              text("Complement (optional)"),
              SizedBox(height: 8),
              Textfield("Lorem Ipsum is simply dummy text of\nthedd printing and typesetting industry.",controllers[4]),
              SizedBox(height: 15),
              text("Country"),
              SizedBox(height: 8),
              Dropdown(country, controller1),
              SizedBox(height: 15),
              text("State"),
              SizedBox(height: 8),
              Dropdown(state, controller2),
              SizedBox(height: 15),
              text("City"),
              SizedBox(height: 8),
              Dropdown(city, controller3),
              SizedBox(
                height: 15,
              ),
              text("ZIP Code"),
              SizedBox(height: 8),
              Textfield("SE1 7AB",controllers[5]),
              SizedBox(height: 30),
              SizedBox(
                width: Get.width,
                height: 60,
                child: ElevatedButton(
                    onPressed: () async{
                      Map<String, dynamic> body = {
                        'name': controllers[0].text.trim()+" "+controllers[1].text.trim(),
                        'email': controllers[2].text.trim(),
                        'dateOfBirth': controllers[3].text.trim(),
                        'address': controllers[4].text.trim(),
                        'complement': controllers[5].text.trim(),
                        'zipCode': controllers[6].text.trim(),
                        "gender":controller.text,
                        "location":controller1.text,
                        "state":controller2.text,
                        "city":controller3.text,
                      };
                      ApiServicesforUpdateUserProfile.UpdateUserProfile(body).then((response) {
                        if(response.message=="User information updated successfully"){
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (BuildContext context) {
                                return Home_Screen();
                              }));
                        }
                        else{
                          showDialog(
                              context: context,
                              builder: (context) {
                                return CupertinoAlertDialog(
                                  title: Text('Error Message'),
                                  content:response.error!=null? Text(response.error.toString()):Text(response.message.toString()),
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
                      });
                    },
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
      TextEditingController controllerr

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
          controller: controllerr,
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
