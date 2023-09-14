import 'dart:io';
import 'package:brazeellian_community/ViewModel/user_preference/userPrefrenceViewModel.dart';
import 'package:brazeellian_community/repository/propertyRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:textfield_tags/textfield_tags.dart';

class PropertyViewModel extends GetxController {

  final _api = propertyRepository();
  UserPreference userPreference = UserPreference();
  final priceController = TextEditingController().obs ;
  final bedroomController = TextEditingController().obs ;
  final bathroomController = TextEditingController().obs ;
  final suitesController = TextfieldTagsController().obs ;
  final priceFocusNode = FocusNode().obs;
  final bedroomFocusNode = FocusNode().obs;
  final bathroomFocusNode = FocusNode().obs;
  final suitesFocusNode = FocusNode().obs;
  final Rx<File?> _image = Rx<File?>(null);
  File? get image => _image.value;
  final Rx<File?> thumbnail = Rx<File?>(null);
  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      _image.value = File(pickedImage.path);
      if (_image.value != null) {
        thumbnail.value = _image.value;
      }
    }
  }
  RxBool loading = false.obs;

  void addProperty(){
    loading.value = true ;

  }
  void getProperty(){
    loading.value = true ;

  }
}