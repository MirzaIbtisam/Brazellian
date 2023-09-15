import 'package:brazeellian_community/Validations/validations.dart';
import 'package:brazeellian_community/ViewModel/events/eventsViewModel.dart';
import 'package:brazeellian_community/ViewModel/login/loginViewModel.dart';
import 'package:brazeellian_community/Widgets/Widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../utils/utils.dart';

class eventsWidget extends StatelessWidget {
  eventsWidget({Key? key}) : super(key: key);

  final eventsVM = Get.put(EventsViewModel()) ;

  @override
  Widget build(BuildContext context) {

    return  Column(
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(right: 80),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Txt("Date"),
              Txt("Schedule"),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Box1("MM/DD/YYYY", eventsVM.dateController.value,context),
            Box1("4pm", eventsVM.timeController.value,context),
          ],
        ),
        const SizedBox(height: 20),
        Txt("Website"),
        const SizedBox(height: 10),
        Box("587 Braelo Avenue", eventsVM.websiteController.value),
        const SizedBox(height: 20),
        Txt("Instagram"),
        const SizedBox(height: 10),
        Box("@braelo.co", eventsVM.instagramController.value),
        const SizedBox(height: 20),
        Txt("Facebook "),
        const SizedBox(height: 10),
        Box("@braelo.co", eventsVM.facebookController.value),
        const SizedBox(height: 20),
      ],
    );
  }
}