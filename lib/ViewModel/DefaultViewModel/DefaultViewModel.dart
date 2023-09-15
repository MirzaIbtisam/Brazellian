import 'package:brazeellian_community/ViewModel/JobsViewModel/JobsViewModel.dart';
import 'package:brazeellian_community/ViewModel/ServiceViewModel/ServiceViewModel.dart';
import 'package:brazeellian_community/ViewModel/VehicleViewModel/VehicleViewModel.dart';
import 'package:brazeellian_community/ViewModel/adverts/advertsViewModel.dart';
import 'package:brazeellian_community/ViewModel/events/eventsViewModel.dart';
import 'package:brazeellian_community/ViewModel/property/propertyViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DefaultViewModel extends GetxController {
  final titleController = TextEditingController().obs ;
  final descriptionController = TextEditingController().obs ;
  final localController = TextEditingController().obs ;
  final postalCodeController = TextEditingController().obs ;
  final whatsappController = TextEditingController().obs ;
  late JobsViewModel jobsVm;
  final listOfTags = <String>[].obs;
  void addTag( Iterable<String> tag) {
    listOfTags.addAll(tag);
  }
  
  
}
