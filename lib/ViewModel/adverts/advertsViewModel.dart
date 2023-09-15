import 'dart:io';
import 'package:brazeellian_community/ViewModel/DefaultViewModel/DefaultViewModel.dart';
import 'package:brazeellian_community/ViewModel/user_preference/userPrefrenceViewModel.dart';
import 'package:brazeellian_community/repository/advertsRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:textfield_tags/textfield_tags.dart';

import '../../Models/signUpModel.dart';

class AdvertsViewModel extends GetxController {
  DefaultViewModel defaultViewModel = Get.put(DefaultViewModel());

  final _api = advertsRepository();
  UserPreference userPreference = UserPreference();
  final instagramController = TextEditingController().obs;
  final facebookController = TextEditingController().obs;
  final categoryController = TextEditingController().obs;
  final subcategoryController = TextEditingController().obs ;
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
      "title": defaultViewModel.titleController.value.toString(),
      "description":defaultViewModel. descriptionController.value.toString(),
      "local":defaultViewModel. localController.value.toString(),
      "postalCode": defaultViewModel. postalCodeController.value.toString(),
      "whatsapp":defaultViewModel. whatsappController.value.toString(),
      "keywords":defaultViewModel.listOfTags.value,
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