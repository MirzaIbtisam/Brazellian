import 'dart:io';

import 'package:brazeellian_community/ViewModel/user_preference/userPrefrenceViewModel.dart';
import 'package:brazeellian_community/repository/eventsRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:textfield_tags/textfield_tags.dart';

class EventsViewModel extends GetxController {

  final _api = eventsRepository();
  UserPreference userPreference = UserPreference();
  final dateController = TextEditingController().obs ;
  final timeController = TextEditingController().obs ;
  final startController = TextEditingController().obs ;
  final endController = TextEditingController().obs ;
  final websiteController = TextEditingController().obs ;
  final instagramController = TextfieldTagsController().obs ;
  final facebookController = TextfieldTagsController().obs ;
  final dateFocusNode = FocusNode().obs;
  final timeFocusNode = FocusNode().obs;
  final startFocusNode = FocusNode().obs;
  final endFocusNode = FocusNode().obs;
  final websiteFocusNode = FocusNode().obs;
  final instagramFocusNode = FocusNode().obs;
  final facebookFocusNode = FocusNode().obs;
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

  void addEvents(){
    loading.value = true ;

  }
  void getEvents(){
    loading.value = true ;

  }
}