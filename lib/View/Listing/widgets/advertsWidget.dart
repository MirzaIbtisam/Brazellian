import 'package:brazeellian_community/ViewModel/AdvertsViewModel/advertsViewModel.dart';
import 'package:brazeellian_community/Widgets/Widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class advertsWidget extends StatelessWidget {
  advertsWidget({Key? key}) : super(key: key);

  final advertsVM = Get.put(AdvertsViewModel()) ;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Txt("Category"),
        const SizedBox(height: 10),
        Dropdown(items1, advertsVM.categoryController.value),
        const SizedBox(height: 20),
        Txt("Subcategory"),
        const SizedBox(height: 10),
        Dropdown(items2, advertsVM.subcategoryController.value),
        const SizedBox(height: 20),
        Txt("Instagram "),
        const SizedBox(height: 10),
        Box("@braelo.co", advertsVM.instagramController.value),
        const SizedBox(height: 20),
        Txt("Facebook "),
        const SizedBox(height: 10),
        Box("@braelo.co", advertsVM.facebookController.value),
        const SizedBox(height: 20),
      ],
    );
  }
}