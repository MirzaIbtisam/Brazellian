import 'package:brazeellian_community/View/Bottom%20Bar/Bottom_bar.dart';
import 'package:brazeellian_community/View/Language/language.dart';
import 'package:brazeellian_community/View/Location/location.dart';
import 'package:brazeellian_community/View/Selecione%20o%20seu%20perfil/Selecione.dart';
import 'package:brazeellian_community/View/Select%20your%20interests/Interests.dart';
import 'package:brazeellian_community/View/Starting%20Pages/Brazellian.dart';
import 'package:brazeellian_community/View/Starting%20Pages/Login.dart';
import 'package:brazeellian_community/View/Verification/verification.dart';
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
      page: () => Bottom_bar() ,
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ) ,
    GetPage(
      name: RouteName.verification,
      page: () => verification() ,
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ) ,
    GetPage(
      name: RouteName.AccountType,
      page: () => Selecione() ,
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ) ,
    GetPage(
      name: RouteName.location,
      page: () => location() ,
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ) ,
    GetPage(
      name: RouteName.language,
      page: () => language() ,
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ) ,
    GetPage(
      name: RouteName.interests,
      page: () => Interests() ,
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ) ,
  ];

}