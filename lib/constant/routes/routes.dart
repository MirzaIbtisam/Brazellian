import 'package:brazeellian_community/View/Home%20Screen/ui/homeScreenUi.dart';
import 'package:brazeellian_community/View/Starting%20Pages/Brazellian.dart';
import 'package:brazeellian_community/View/Starting%20Pages/Login.dart';
import 'package:brazeellian_community/constant/routes/routes_name.dart';
import 'package:get/get.dart';

class AppRoutes {

  static appRoutes() => [
    GetPage(
      name: RouteName.splashScreen,
      page: () => Brazellian() ,
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ) ,
    GetPage(
      name: RouteName.loginView,
      page: () => Login() ,
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ) ,
    GetPage(
      name: RouteName.homeView,
      page: () => homeScreenUi() ,
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ) ,
  ];

}