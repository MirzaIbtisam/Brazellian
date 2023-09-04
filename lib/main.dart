import 'package:brazeellian_community/Screens/Bottom%20Bar/Bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:country_state_city/country_state_city.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/Home Screen/Home_Screen.dart';
import 'Screens/Starting Pages/First_Page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool loggedIn = prefs.getBool('isLoggedIn') ?? false;
  runApp(MyApp(loggedIn: loggedIn));
}

class MyApp extends StatelessWidget {
  final bool loggedIn;
  MyApp({required this.loggedIn});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: loggedIn ?  Bottom_bar(): First_Page(),
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(
            context, widget!), // Use BouncingScrollWrapper if needed
        maxWidth: 1200,
        minWidth: 300,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(300, name: MOBILE),
          ResponsiveBreakpoint.resize(500, name: MOBILE),
          ResponsiveBreakpoint.resize(700, name: TABLET),
          ResponsiveBreakpoint.resize(900, name: TABLET),
          ResponsiveBreakpoint.resize(1200, name: TABLET),
        ],
      ),
    );}
}