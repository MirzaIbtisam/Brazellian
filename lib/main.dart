import 'package:brazeellian_community/constant/getx_localization/languages.dart';
import 'package:brazeellian_community/constant/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Languages(),
      locale: const Locale('en' ,'US'),
      fallbackLocale: const Locale('en' ,'US'),
      getPages: AppRoutes.appRoutes(),
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