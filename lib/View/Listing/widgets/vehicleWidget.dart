import 'package:brazeellian_community/Validations/validations.dart';
import 'package:brazeellian_community/ViewModel/login/loginViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../ViewModel/VehicleViewModel/VehicleViewModel.dart';
import '../../../Widgets/Widgets.dart';
import '../../../utils/utils.dart';

class VehicleWidget extends StatelessWidget {
  VehicleWidget({Key? key}) : super(key: key);

  final vehicle = Get.put(VehicleViewModel()) ;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Txt("Subcategory"),
        const SizedBox(height: 10),
        Dropdown(items2, vehicle.subcategoryController.value),
        const SizedBox(height: 20),
        Txt("Vehicle Type"),
        const SizedBox(height: 10),
        Box("Suzuki", vehicle.vehicleTypeController.value),
        const SizedBox(height: 20),
        Txt("Approximate value"),
        const SizedBox(height: 10),
        Box("\$180 (hour)", vehicle.approximateValueController.value),
      ],
    );
  }
}