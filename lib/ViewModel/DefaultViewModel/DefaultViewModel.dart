import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:textfield_tags/textfield_tags.dart';

class DefaultViewModel extends GetxController {

  final titleController = TextEditingController().obs ;
  final type = TextEditingController().obs ;
  final descriptionController = TextEditingController().obs ;
  final localController = TextEditingController().obs ;
  final postalCodeController = TextEditingController().obs ;
  final whatsappController = TextEditingController().obs ;
  final Rx<File?> _image = Rx<File?>(null);
  File? get image => _image.value;
  List<File?> get images => _images.value;
  final Rx<File?> thumbnail = Rx<File?>(null);
  final Rx<List<File?>> _images = Rx<List<File?>>(List.generate(6, (index) => null));
  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      _image.value = File(pickedImage.path);
    }
  }
  Future<void> pickImages(int index_) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null&&index_<6) {
      _images.value.insert(index_,File(pickedImage.path));
    }
  }
  Rx<TextfieldTagsController> tags=TextfieldTagsController().obs;
  void clearImages(int index){
    _images.value[index]=null;
  }
  void clearImage(){
    _image.value=null;
  }

}
