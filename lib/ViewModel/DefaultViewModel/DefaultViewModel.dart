import 'package:brazeellian_community/ViewModel/JobsViewModel/JobsViewModel.dart';
import 'package:brazeellian_community/ViewModel/ServiceViewModel/ServiceViewModel.dart';
import 'package:brazeellian_community/ViewModel/VehicleViewModel/VehicleViewModel.dart';
import 'package:brazeellian_community/ViewModel/adverts/advertsViewModel.dart';
import 'package:brazeellian_community/ViewModel/events/eventsViewModel.dart';
import 'package:brazeellian_community/ViewModel/property/propertyViewModel.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DefaultViewModel extends GetxController {
  final titleController = TextEditingController().obs ;
  final descriptionController = TextEditingController().obs ;
  final localController = TextEditingController().obs ;
  final postalCodeController = TextEditingController().obs ;
  final whatsappController = TextEditingController().obs ;
  final Rx<File?> _image = Rx<File?>(null);
  File? get image => thumbnail.value;
  final Rx<File?> thumbnail = Rx<File?>(null);
  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      _image.value = File(pickedImage.path);
      if (_image.value != null) {
        thumbnail.value = _image.value;
        print("Helllo");
        print(thumbnail.value);
      }
    }
  }
  final listOfTags = <String>[].obs;
  void addTag( Iterable<String> tag) {
    listOfTags.addAll(tag);
  }

  void clearImage(){
    _image.value=null;
  }
}
