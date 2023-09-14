import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DefaultViewModel extends GetxController {
  final titleController = TextEditingController().obs ;
  final descriptionController = TextEditingController().obs ;
  final localController = TextEditingController().obs ;
  final postalCodeController = TextEditingController().obs ;
  final whatsappController = TextEditingController().obs ;
  final listOfTags = <String>[].obs;
  void addTag( Iterable<String> tag) {
    listOfTags.addAll(tag);
  }
}
