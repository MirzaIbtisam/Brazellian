import 'package:brazeellian_community/Validations/validations.dart';
import 'package:brazeellian_community/ViewModel/login/loginViewModel.dart';
import 'package:brazeellian_community/ViewModel/property/propertyViewModel.dart';
import 'package:brazeellian_community/Widgets/Widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../utils/utils.dart';

class propertyWidget extends StatelessWidget {
  propertyWidget({Key? key}) : super(key: key);

  final propertyVM = Get.put(PropertyViewModel()) ;

  @override
  Widget build(BuildContext context) {

    return  Column(
      children: [
        const SizedBox(height: 20),
        Txt("Price"),
        const SizedBox(height: 10),
        Box("\$ 900,00", propertyVM.priceController.value),
        const SizedBox(height: 20),
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
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Dropdown(items3, propertyVM.bedroomController.value)),
            const SizedBox(
              width: 30,
            ),
            Expanded(child: Dropdown(items4, propertyVM.bathroomController.value))
          ],
        ),
        const SizedBox(height: 20),
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
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Dropdown(items5, propertyVM.suitesController.value)),
            const SizedBox(
              width: 30,
            ),
            Expanded(child: Dropdown(items6, propertyVM.jobsController.value))
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}