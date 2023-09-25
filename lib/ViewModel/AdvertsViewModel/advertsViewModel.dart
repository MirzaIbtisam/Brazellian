import 'package:brazeellian_community/Models/advertModel.dart';
import 'package:brazeellian_community/Utils/utils.dart';
import 'package:brazeellian_community/ViewModel/DefaultViewModel/DefaultViewModel.dart';
import 'package:brazeellian_community/ViewModel/user_preference/userPrefrenceViewModel.dart';
import 'package:brazeellian_community/constant/routes/routes_name.dart';
import 'package:brazeellian_community/data/response/status.dart';
import 'package:brazeellian_community/repository/advertsRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
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
  RxBool loading = false.obs;

  void addAdverts()async{
    loading.value = true;
    UserLoginResponse user=await userPreference.getUser();
    Map data = {
      "userId": user.id.toString(),
      "title": defaultViewModel.titleController.value.text.toString(),
      "description":defaultViewModel. descriptionController.value.text.toString(),
      "local":defaultViewModel. localController.value.text.toString(),
      "postalCode": defaultViewModel. postalCodeController.value.text.toString(),
      "whatsapp":defaultViewModel. whatsappController.value.text.toString(),
      "keywords":defaultViewModel.tags.value,
    "category":categoryController.value.text.toString(),
    "subcategory": subcategoryController.value.text.toString(),
    "instagram": instagramController.value.text.toString(),
    "facebook": facebookController.value.text.toString(),
    };
    _api.addApi(data ,defaultViewModel.image , defaultViewModel.images).then((value) {
      if(value['message']=="success"){
        Get.delete<DefaultViewModel>();
        Get.delete<AdvertsViewModel>();
        Get.toNamed(RouteName.homeView)!.then((value){});
        Utils.snackBar('Note', 'Data uploaded successfully');
      }
      else{
        Utils.snackBar('Error', value["error"]);
      }
    });
  }
  final rxRequestStatus = Status.LOADING.obs ;
  final advertsList =AdvertsResponse().obs ;
  RxString error = ''.obs;
  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void setEventList(AdvertsResponse _value) => advertsList.value = _value ;
  void setError(String _value) => error.value = _value ;
  void getAdverts(){
    _api.getApi().then((value){
      setRxRequestStatus(Status.COMPLETED);
      setEventList(AdvertsResponse.fromJson(value));
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }
  void refreshApi(){
    setRxRequestStatus(Status.LOADING);
    _api.getApi().then((value){
      setRxRequestStatus(Status.COMPLETED);
      setEventList(AdvertsResponse.fromJson(value));
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }
}