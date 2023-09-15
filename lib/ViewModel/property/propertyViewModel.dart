import 'dart:io';
import 'package:brazeellian_community/Models/signUpModel.dart';
import 'package:brazeellian_community/ViewModel/user_preference/userPrefrenceViewModel.dart';
import 'package:brazeellian_community/repository/propertyRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:textfield_tags/textfield_tags.dart';

import '../DefaultViewModel/DefaultViewModel.dart';

class PropertyViewModel extends GetxController {
  DefaultViewModel defaultViewModel = Get.put(DefaultViewModel());

  final _api = propertyRepository();
  UserPreference userPreference = UserPreference();
  final priceController = TextEditingController().obs ;
  final bedroomController = TextEditingController().obs ;
  final jobsController = TextEditingController().obs ;
  final bathroomController = TextEditingController().obs ;
  final suitesController = TextEditingController().obs ;
  final priceFocusNode = FocusNode().obs;
  final jobsFocusNode = FocusNode().obs;
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

  void addProperty()async{
    loading.value = true ;
    UserLoginResponse user = await  userPreference.getUser();
    Map data = {
      "userId": user.id,
      "title": defaultViewModel.titleController.value.toString(),
      "description":defaultViewModel. descriptionController.value.toString(),
      "local":defaultViewModel. localController.value.toString(),
      "postalCode": defaultViewModel. postalCodeController.value.toString(),
      "whatsapp":defaultViewModel. whatsappController.value.toString(),
      "keywords":defaultViewModel.listOfTags.value,
      "price": priceController.value.toString(),
      "bedroom": bedroomController.value.toString(),
      "vaccancies":jobsController.value.toString(),
      "bathroom": bathroomController.value.toString(),
      "suites": suitesController.value.toString(),
      "thumbnail": _image,
    };
    _api.addApi(data).then((value) => {
      print(value)
    });
  }
  void getProperty(){
    loading.value = true ;

  }
}