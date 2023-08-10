

import 'package:brazeellian_community/Screens/Bottom%20Bar/Bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'Screens/Home Screen/Home_Screen.dart';
import 'Screens/Starting Pages/First_Page.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  final bool loggedIn = prefs.getBool('isLoggedIn') ?? false;
  // String id = prefs.getString("accounttype").toString();
  runApp(MyApp(loggedIn: loggedIn));
}

class MyApp extends StatelessWidget {
  final bool loggedIn;
  // final String accounttype;

  MyApp({required this.loggedIn});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // print(accounttype);
    //
    // int check=-1 ;// Default value
    //
    // if (accounttype == 'Canvasser') {
    //   check = 1;
    // } else if (accounttype == 'Political Campaigns') {
    //   check = 0;
    // } else if (accounttype == 'Cooperate Account') {
    //   check = 2;
    // }
    // print(check);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: loggedIn ?  Bottom_bar(): First_Page(),
    );}}