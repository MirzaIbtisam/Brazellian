import 'dart:io';
import 'package:brazeellian_community/ViewModel/user_preference/userPrefrenceViewModel.dart';
import 'package:brazeellian_community/repository/advertsRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:textfield_tags/textfield_tags.dart';

import '../../Models/signUpModel.dart';

class AdvertsViewModel extends GetxController {

  final _api = advertsRepository();
  UserPreference userPreference = UserPreference();
  final instagramController = TextfieldTagsController().obs ;
  final facebookController = TextfieldTagsController().obs ;
  final categoryController = TextfieldTagsController().obs ;
  final subcategoryController = TextfieldTagsController().obs ;
  final instagramFocusNode = FocusNode().obs;
  final facebookFocusNode = FocusNode().obs;
  final categoryFocusNode = FocusNode().obs;
  final subcategoryFocusNode = FocusNode().obs;
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

  void addAdverts()async{
    loading.value = true;
    UserLoginResponse user=await userPreference.getUser();
    Map body = {
      "userId": user.id.toString(),
      // "title": titleController.value.toString(),
      // "description": descriptionController.value.toString(),
      // "local": localController.value.toString(),
      // "postalCode": postalCodeController.value.toString(),
      // "whatsapp": whatsappController.value.toString(),
      // "keywords": keywordsController.value.getTags,
      "thumbnail": thumbnail,
      "multiplePictures": [

      ],
    "category":categoryController.value.toString(),
    "subcategory": subcategoryController.value.toString(),
    "instagram": instagramController.value.toString(),
    "facebook": facebookController.value.toString(),
    };
    _api.addApi(body).then((value){

    });
  }
  void getAdverts(){
    loading.value = true ;
  }
}