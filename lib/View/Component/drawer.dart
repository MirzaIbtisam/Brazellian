import 'package:brazeellian_community/Models/signUpModel.dart';
import 'package:brazeellian_community/ViewModel/UserViewModel/userViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Services/ApiServices/deleteApi.dart';
import '../../Services/ApiServices/logoutApi.dart';
import '../Edit_Profile/Edit_Profile.dart';
import '../Forgot Password/Forgot_Password.dart';
import '../High Lights/High_Lights.dart';
import '../Itens Salvos/Itnes_Salvos.dart';
import '../Listing/Listings.dart';
import '../Manage/Manage_Plan.dart';
import '../Messages/Messages.dart';
import '../Notícias/Notícias.dart';
import '../Pin Screen/Pin.dart';
import '../Privacy/Privacy.dart';
import '../Question/Question.dart';
import '../Starting Pages/Login.dart';
import '../Statistics Screen/Statistics.dart';
import '../Support/Support.dart';
import '../Tutorials/Tutorial.dart';

class drawer extends StatefulWidget {


  const drawer({super.key, });

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  bool loading = false;
  final userVm = Get.put(UserViewModel()) ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userVm.getUserInfo();
  }
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator: const CupertinoActivityIndicator(),
      inAsyncCall: loading,
      child: Drawer(
        backgroundColor: Color(0xffedaa00),
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 90),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color(0xffffd600), width: 2.5),
                        image: const DecorationImage(
                            image: AssetImage("assets/profile.jpg"),
                            fit: BoxFit.cover),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    width: 60,
                    height: 60,
                    alignment: Alignment.center,
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${userVm.userInfo.value.name}",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Plus jakarta Sans"),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "${userVm.userInfo.value.email}",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(height: 30),
                        Heading("Comunicação"),
                        SizedBox(height: 15),
                        InkWell(
                            onTap: () {
                              Get.to(Notcias());
                            },
                            child: drawer("assets/news paper.svg", "News")),
                        SizedBox(height: 20),
                        InkWell(
                            onTap: () {
                              Get.to(Tutorial());
                            },
                            child: drawer("assets/tutorials.svg", "Tutorials")),
                        SizedBox(height: 40),
                        Heading("Profile"),
                        SizedBox(height: 15),
                        InkWell(
                            onTap: () {
                              Get.to(Edit_Profile());
                            },
                            child: drawer(
                                "assets/User, Profile.svg", "Edit Profile")),
                        SizedBox(height: 20),
                        InkWell(
                            onTap: () {
                              Get.to(Forgot_Password());
                            },
                            child: drawer("assets/Key.svg", "Change password")),
                        SizedBox(height: 50),
                        Heading("Personal Info"),
                        SizedBox(height: 15),
                        InkWell(
                            onTap: () {
                              Get.to(Messages());
                            },
                            child: drawer("assets/message.svg", "Messages")),
                        SizedBox(height: 20),
                        InkWell(
                            onTap: () {
                              // Get.to(History());
                            },
                            child: drawer("assets/phone.svg", "Calls")),
                        SizedBox(height: 20),
                        InkWell(
                            onTap: () {
                              Get.to(Itens_Salvos());
                            },
                            child: drawer("assets/itens.svg", "Saved Items")),
                        SizedBox(height: 20),
                        InkWell(
                            onTap: () {
                              Get.to(Manage_Plan());
                            },
                            child: drawer(
                                "assets/browser-web-windows.svg",
                                "Manage Plan")),
                        SizedBox(height: 20),
                        InkWell(
                            onTap: () {
                              Get.to(Pin());
                            },
                            child: drawer("assets/pin.svg", "My pin")),
                        SizedBox(height: 40),
                        Heading("Reports"),
                        SizedBox(height: 15),
                        InkWell(
                            onTap: () {
                              Get.to(Statistics());
                            },
                            child: drawer("assets/estatics.svg", "Statistics")),
                        SizedBox(height: 20),
                        InkWell(
                            onTap: () {
                              Get.to(() => Listings());
                            },
                            child: drawer("assets/Meus.svg", "My Ads")),
                        SizedBox(height: 20),
                        InkWell(
                            onTap: () {
                              Get.to(High_Lights());
                            },
                            child: drawer("assets/Destaques.svg",
                                "Highlights")),
                        SizedBox(height: 40),
                        Heading("Help and Support"),
                        SizedBox(height: 15),
                        InkWell(
                            onTap: () {
                              Get.to(Privacy());
                            },
                            child:
                            drawer("assets/Politcs.svg", "Privacy Policy")),
                        SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            Get.to(() => Question());
                          },
                          child: drawer("assets/tasklist-document-group_1.svg",
                              "Ask questions"),
                        ),
                        SizedBox(height: 20),
                        InkWell(
                            onTap: () {
                              Get.to(() => Support());
                            },
                            child: drawer("assets/suporte.svg", "Suport")),
                        SizedBox(height: 40),
                        SizedBox(
                          height: 60,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 1.1,
                          child: ElevatedButton(
                              onPressed: () {
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      ModalProgressHUD(
                                        progressIndicator: const CupertinoActivityIndicator(),
                                        inAsyncCall: loading,
                                        child: AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius
                                                  .circular(15)),
                                          title: SvgPicture.asset(
                                              "assets/deleteAccount.svg"),
                                          content: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 30),
                                            child: Text(
                                              "Are you sure you want to\n  delete your account ?",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Color(0xff232f30),
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: "Plus Jakarta Sans"),
                                            ),
                                          ),
                                          actions: <Widget>[
                                            SizedBox(
                                              height: 50,
                                              width: Get.width * 0.9,
                                              child: ElevatedButton(
                                                  onPressed: () async {
                                                    setState(() {
                                                      loading = true;
                                                    });

                                                    // Simulate a delay of 3 seconds
                                                    await Future.delayed(
                                                        Duration(seconds: 3));

                                                    setState(() {
                                                      loading = false;
                                                    });
                                                    final response = await ApiServicesforDelete
                                                        .delete();
                                                    if (response.message ==
                                                        "User deleted successfully") {
                                                      print("object");
                                                      Get.snackbar(
                                                        'BARELO',
                                                        'Your Account is successfully deleted',
                                                        icon: Icon(Icons.person,
                                                            color: Colors
                                                                .white),
                                                        snackPosition: SnackPosition
                                                            .TOP,
                                                        backgroundColor: Colors
                                                            .grey,
                                                        colorText: Colors.black,
                                                        isDismissible: true,
                                                        dismissDirection: DismissDirection
                                                            .horizontal,
                                                        forwardAnimationCurve: Curves
                                                            .easeOutBack,
                                                        duration: Duration(
                                                            seconds: 5),
                                                      );
                                                      Get.to(() => Login());
                                                    }
                                                    else {
                                                      print("object");
                                                      showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return CupertinoAlertDialog(
                                                              title: Text(
                                                                  'Error Message'),
                                                              content: response
                                                                  .error != null
                                                                  ? Text(
                                                                  response.error
                                                                      .toString())
                                                                  : Text(
                                                                  response
                                                                      .message
                                                                      .toString()),
                                                              actions: <Widget>[
                                                                TextButton(
                                                                  onPressed: () {
                                                                    Navigator
                                                                        .pop(
                                                                        context); //close Dialog
                                                                  },
                                                                  child: Text(
                                                                      'Close'),
                                                                )
                                                              ],
                                                            );
                                                          });
                                                    }
                                                  },
                                                  style: ElevatedButton
                                                      .styleFrom(
                                                      primary: Color(
                                                          0xfffeecec),
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                      elevation: 0),
                                                  child: Text(
                                                    "Yes, I do",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Color(
                                                            0xffd43718),
                                                        fontWeight: FontWeight
                                                            .w600,
                                                        fontFamily:
                                                        "Plus Jakarta Sans"),
                                                  )),
                                            ),
                                            SizedBox(height: 10),
                                            Center(
                                              child: TextButton(
                                                child: Text(
                                                  "Cancel",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Color(0xff7b8792),
                                                      fontWeight: FontWeight
                                                          .w600,
                                                      fontFamily: "Plus Jakarta Sans"),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ),
                                            SizedBox(height: 20),
                                          ],
                                        ),
                                      ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xffFFFFFF),
                                  elevation: 0.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: BorderSide(
                                          color: Color(0xfffbbeb9), width: 1))),
                              child: Text(
                                "Deletar conta",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xfffbbeb9),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "PlusJakarta Sans"),
                              )),
                        ),
                        SizedBox(height: 15),
                        SizedBox(
                          height: 60,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 1.1,
                          child: ElevatedButton(
                              onPressed: () {
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                15)),
                                        title: SvgPicture.asset(
                                            "assets/Logout.svg"),
                                        content: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 30),
                                          child: Text(
                                            "Are you sure you want to\n to leave your account ?",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Color(0xff232f30),
                                                fontWeight: FontWeight.w700,
                                                fontFamily: "Plus Jakarta Sans"),
                                          ),
                                        ),
                                        actions: <Widget>[
                                          SizedBox(
                                            height: 50,
                                            width: Get.width * 0.9,
                                            child: ElevatedButton(
                                                onPressed: () async {
                                                  UserLoginResponse response = await ApiServicesforlogout
                                                      .logout();
                                                  if (response.message ==
                                                      "User logged out successfully") {
                                                    final SharedPreferences prefs = await SharedPreferences.getInstance();
                                                    prefs.remove("id");
                                                    Get.snackbar(
                                                      'BARELO',
                                                      'Your Account has been successfully logout',
                                                      icon: Icon(Icons.person,
                                                          color: Colors.white),
                                                      snackPosition: SnackPosition
                                                          .TOP,
                                                      backgroundColor: Colors
                                                          .grey,
                                                      colorText: Colors.black,
                                                      isDismissible: true,
                                                      dismissDirection: DismissDirection
                                                          .horizontal,
                                                      forwardAnimationCurve: Curves
                                                          .easeOutBack,
                                                      duration: Duration(
                                                          seconds: 5),
                                                    );
                                                    Get.to(() => Login());
                                                  }
                                                  else {
                                                    showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return CupertinoAlertDialog(
                                                            title: Text(
                                                                'Error Message'),
                                                            content: response
                                                                .error != null
                                                                ? Text(
                                                                response.error
                                                                    .toString())
                                                                : Text(response
                                                                .message
                                                                .toString()),
                                                            actions: <Widget>[
                                                              TextButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context); //close Dialog
                                                                },
                                                                child: Text(
                                                                    'Close'),
                                                              )
                                                            ],
                                                          );
                                                        });
                                                  }
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    primary: Color(0xffe8eaec),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                    elevation: 0),
                                                child: Text(
                                                  "Yes, I do",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Color(0xff4b5259),
                                                      fontWeight: FontWeight
                                                          .w600,
                                                      fontFamily:
                                                      "Plus Jakarta Sans"),
                                                )),
                                          ),
                                          SizedBox(height: 10),
                                          Center(
                                            child: TextButton(
                                              child: Text(
                                                "Cancel",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xff7b8792),
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: "Plus Jakarta Sans"),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                        ],
                                      ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xffFFFFFF),
                                  elevation: 0.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: BorderSide(
                                          color: Color(0xffa1a8ae), width: 1))),
                              child: Text(
                                "Sair",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xffa1a8ae),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "PlusJakarta Sans"),
                              )),
                        ),
                        SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget drawer(String img,
      String txt,) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(img),
            SizedBox(width: 10),
            Text(
              txt,
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff111111),
                  fontWeight: FontWeight.w600,
                  fontFamily: "Plus Jakarta Sans"),
            )
          ],
        ),
        SvgPicture.asset("assets/Icon - Next.svg")
      ],
    );
  }

  Widget Heading(String txt,) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        txt,
        style: TextStyle(
            fontSize: 13,
            color: Color(0xff111111),
            fontWeight: FontWeight.w500,
            fontFamily: "Plus Jakarta Sans"),
      ),
    );
  }
}
