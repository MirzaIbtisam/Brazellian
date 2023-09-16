import 'dart:io';
import 'package:brazeellian_community/ViewModel/user_preference/userPrefrenceViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:textfield_tags/textfield_tags.dart';
import '../../Models/signUpModel.dart';
import '../../repository/ServiceListingRepository.dart';
import '../DefaultViewModel/DefaultViewModel.dart';

class ServiceViewModel extends GetxController {
  DefaultViewModel defaultViewModel = Get.put(DefaultViewModel());

  final Rx<File?> _image = Rx<File?>(null);
  File? get image => _image.value;
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
  final _api = ServiceRepository();
  UserPreference userPreference = UserPreference();

  final categoryController = TextEditingController().obs;
  final subcategoryController = TextEditingController().obs;
  final advertiserNameController = TextEditingController().obs ;
  final approximateValueController = TextEditingController().obs ;
  final userIdFocusNode = FocusNode().obs;
  final titleFocusNode = FocusNode().obs;
  final descriptionFocusNode = FocusNode().obs;
  final postalCodeFocusNode = FocusNode().obs;
  final whatsappFocusNode = FocusNode().obs;
  final keywordsFocusNode = FocusNode().obs;
  final categoryFocusNode = FocusNode().obs;
  final subcategoryFocusNode = FocusNode().obs;
  final advertiserNameFocusNode = FocusNode().obs;
  final approximateValueFocusNode = FocusNode().obs;
  final Rx<File?> thumbnail = Rx<File?>(null);

  RxBool loading = false.obs;
  void addService()async {
    loading.value = true ;
    UserLoginResponse user = await  userPreference.getUser();
    Map data = {
          "userId": user.id,
          "title": defaultViewModel.titleController.value.text.toString(),
          "description":defaultViewModel. descriptionController.value.text.toString(),
          "local":defaultViewModel. localController.value.text.toString(),
          "postalCode": defaultViewModel. postalCodeController.value.text.toString(),
          "whatsapp":defaultViewModel. whatsappController.value.text.toString(),
          "category": categoryController.value.text.toString(),
          "subcategory": subcategoryController.value.text.toString(),
          "advertiserName": advertiserNameController.value.text.toString(),
          "approximateValue": int.parse(approximateValueController.value.text),
          // "keywords":defaultViewModel.listOfTags.value,

    };
    print(thumbnail.value);

    _api.addApi(data ,defaultViewModel.image , ).then((value) => {
      print(value)
    });

  }
  void getService(){
    loading.value = true ;
    _api.getApi().then((value){

    });
  }
}