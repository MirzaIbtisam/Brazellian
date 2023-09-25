import 'package:brazeellian_community/Models/propertyModel.dart';
import 'package:brazeellian_community/Models/signUpModel.dart';
import 'package:brazeellian_community/Utils/utils.dart';
import 'package:brazeellian_community/ViewModel/user_preference/userPrefrenceViewModel.dart';
import 'package:brazeellian_community/constant/routes/routes_name.dart';
import 'package:brazeellian_community/data/response/status.dart';
import 'package:brazeellian_community/repository/propertyRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
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
  RxBool loading = false.obs;

  void addProperty()async{
    loading.value = true ;
    UserLoginResponse user = await  userPreference.getUser();
    Map data = {
      "userId": user.id,
      "title": defaultViewModel.titleController.value.text.toString(),
      "description":defaultViewModel. descriptionController.value.text.toString(),
      "local":defaultViewModel. localController.value.text.toString(),
      "postalCode": defaultViewModel. postalCodeController.value.text.toString(),
      "whatsapp":defaultViewModel. whatsappController.value.text.toString(),
      "keywords":defaultViewModel.tags.value,
      "price": priceController.value.text.toString(),
      "bedroom": bedroomController.value.text.toString(),
      "vaccancies":jobsController.value.text.toString(),
      "bathroom": bathroomController.value.text.toString(),
      "suites": suitesController.value.text.toString(),
    };
    _api.addApi(data ,defaultViewModel.image , defaultViewModel.images).then((value) {
      if(value['message']=="success"){
        Get.delete<DefaultViewModel>();
        Get.delete<PropertyViewModel>();
        Get.toNamed(RouteName.homeView)!.then((value){});
        Utils.snackBar('Note', 'Data uploaded successfully');
      }
      else{
        Utils.snackBar('Error', value["error"]);
      }
    });
  }
  final rxRequestStatus = Status.LOADING.obs ;
  final propertysList =PropertysResponse().obs ;
  RxString error = ''.obs;
  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void setEventList(PropertysResponse _value) => propertysList.value = _value ;
  void setError(String _value) => error.value = _value ;
  void getProperty(){
    _api.getApi().then((value){
      setRxRequestStatus(Status.COMPLETED);
      setEventList(PropertysResponse.fromJson(value));
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }
  void refreshApi(){
    setRxRequestStatus(Status.LOADING);
    _api.getApi().then((value){
      setRxRequestStatus(Status.COMPLETED);
      setEventList(PropertysResponse.fromJson(value));
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }
}