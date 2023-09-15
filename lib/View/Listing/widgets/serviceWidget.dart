import 'package:brazeellian_community/Validations/validations.dart';
import 'package:brazeellian_community/ViewModel/login/loginViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../ViewModel/ServiceViewModel/ServiceViewModel.dart';
import '../../../Widgets/Widgets.dart';
import '../../../utils/utils.dart';

class ServiceWidget extends StatelessWidget {
  ServiceWidget({Key? key}) : super(key: key);

  final service = Get.put(ServiceViewModel()) ;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Txt("Category"),
        const SizedBox(height: 10),
        Dropdown(items1,service.categoryController.value),
        const SizedBox(height: 20),
        Txt("Subcategory"),
        const SizedBox(height: 10),
        Dropdown(items2, service.subcategoryController.value),
        const SizedBox(height: 20),
        const SizedBox(height: 20),
        Txt("Advertiser name"),
        const SizedBox(height: 10),
        Box("Criss Germano",  service.advertiserNameController.value),
        const SizedBox(height: 20),
        Txt("Approximate value"),
        const SizedBox(height: 10),
        Box("\$180 (hour)", service.approximateValueController.value),
      ],
    );
  }
}