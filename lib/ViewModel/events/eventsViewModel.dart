import 'dart:io';

import 'package:brazeellian_community/Models/signUpModel.dart';
import 'package:brazeellian_community/ViewModel/DefaultViewModel/DefaultViewModel.dart';
import 'package:brazeellian_community/ViewModel/user_preference/userPrefrenceViewModel.dart';
import 'package:brazeellian_community/repository/eventsRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:textfield_tags/textfield_tags.dart';

class EventsViewModel extends GetxController {
  DefaultViewModel defaultViewModel = Get.put(DefaultViewModel());

  final _api = eventsRepository();
  UserPreference userPreference = UserPreference();
  final dateController = TextEditingController().obs ;
  final timeController = TextEditingController().obs ;
  final startController = TextEditingController().obs ;
  final endController = TextEditingController().obs ;
  final websiteController = TextEditingController().obs ;
  final instagramController = TextEditingController().obs ;
  final facebookController = TextEditingController().obs ;
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

  void addEvents()async{
    loading.value = true ;
    UserLoginResponse user=await userPreference.getUser();
    Map body = {
      "userId": user.id.toString(),
      "title": defaultViewModel.titleController.value.toString(),
      "description":defaultViewModel. descriptionController.value.toString(),
      "local":defaultViewModel. localController.value.toString(),
      "postalCode": defaultViewModel. postalCodeController.value.toString(),
      "whatsapp":defaultViewModel. whatsappController.value.toString(),
      "keywords":defaultViewModel.listOfTags.value,
      "thumbnail": thumbnail,
      "multiplePictures": [

      ],
      "date":dateController.value.toString(),
      "time": timeController.value.toString(),
      "start":startController.value.toString(),
      "end": endController.value.toString(),
      "instagram": instagramController.value.toString(),
      "facebook": facebookController.value.toString(),
    };
    _api.addApi(body).then((value){

    });

  }
  void getEvents(){
    loading.value = true ;

  }
}