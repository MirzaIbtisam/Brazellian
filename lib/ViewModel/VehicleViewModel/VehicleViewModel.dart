import 'dart:io';
import 'package:brazeellian_community/ViewModel/user_preference/userPrefrenceViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:textfield_tags/textfield_tags.dart';
import '../../Models/signUpModel.dart';
import '../../repository/VehicleListingRepository.dart';
import '../DefaultViewModel/DefaultViewModel.dart';

class VehicleViewModel extends GetxController {
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
  final _api = VehicleRepository();
  UserPreference userPreference = UserPreference();
  // final userIdController = TextEditingController().obs ;
  // final titleController = TextEditingController().obs ;
  // final descriptionController = TextEditingController().obs ;
  // final localController = TextEditingController().obs ;
  // final postalCodeController = TextEditingController().obs ;
  // final whatsappController = TextEditingController().obs ;
  // final keywordsController = TextfieldTagsController().obs ;
  final subcategoryController = TextEditingController().obs ;
  final categoryController = TextEditingController().obs ;
  final approximateValueController = TextEditingController().obs ;
  final vehicleTypeController = TextEditingController().obs ;
  final advertiserNameController = TextEditingController().obs ;
  final typeController = TextEditingController().obs ;
  final userIdFocusNode = FocusNode().obs;
  final titleFocusNode = FocusNode().obs;
  final descriptionFocusNode = FocusNode().obs;
  final postalCodeFocusNode = FocusNode().obs;
  final whatsappFocusNode = FocusNode().obs;
  final keywordsFocusNode = FocusNode().obs;
  final subcategoryFocusNode = FocusNode().obs;
  final approximateValueFocusNode = FocusNode().obs;
  final typesFocusNode = FocusNode().obs;
  final Rx<File?> thumbnail = Rx<File?>(null);

  RxBool loading = false.obs;
  Future<void> addVehicle() async {
    loading.value = true ;
    UserLoginResponse user = await  userPreference.getUser();

    Map data = {
      "userId": user.id,
      "title": defaultViewModel.titleController.value.toString(),
      "description":defaultViewModel. descriptionController.value.toString(),
      "local":defaultViewModel. localController.value.toString(),
      "postalCode": defaultViewModel. postalCodeController.value.toString(),
      "whatsapp":defaultViewModel. whatsappController.value.toString(),
      "vehicleType":vehicleTypeController.value.toString(),
      "category": categoryController.value.toString(),
      "subcategory": subcategoryController.value.toString(),
      "advertiserName": advertiserNameController.value.toString(),
      "approximateValue": approximateValueController.value.toString(),
      "keywords":defaultViewModel.listOfTags,
      "thumbnail": _image,
    };

  }
  void getVehicle(){
    loading.value = true ;

  }
}