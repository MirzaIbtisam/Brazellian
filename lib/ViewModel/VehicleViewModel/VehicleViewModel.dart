import 'package:brazeellian_community/Models/vehiclemodel.dart';
import 'package:brazeellian_community/Utils/utils.dart';
import 'package:brazeellian_community/ViewModel/user_preference/userPrefrenceViewModel.dart';
import 'package:brazeellian_community/constant/routes/routes_name.dart';
import 'package:brazeellian_community/data/response/status.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../Models/signUpModel.dart';
import '../../repository/VehicleListingRepository.dart';
import '../DefaultViewModel/DefaultViewModel.dart';

class VehicleViewModel extends GetxController {
  DefaultViewModel defaultViewModel = Get.put(DefaultViewModel());
  final _api = VehicleRepository();
  UserPreference userPreference = UserPreference();
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

  RxBool loading = false.obs;
  Future<void> addVehicle() async {
    loading.value = true ;
    UserLoginResponse user = await  userPreference.getUser();

    Map data = {
      "userId": user.id,
      "title": defaultViewModel.titleController.value.text.toString(),
      "description":defaultViewModel. descriptionController.value.text.toString(),
      "local":defaultViewModel. localController.value.text.toString(),
      "postalCode": defaultViewModel. postalCodeController.value.text.toString(),
      "whatsapp":defaultViewModel. whatsappController.value.text.toString(),
      "vehicleType":vehicleTypeController.value.text.toString(),
      "category": categoryController.value.text.toString(),
      "subcategory": subcategoryController.value.text.toString(),
      "advertiserName": advertiserNameController.value.text.toString(),
      "approximateValue": approximateValueController.value.text.toString(),
      "keywords":defaultViewModel.tags.value,
    };
    _api.addApi(data ,defaultViewModel.image , defaultViewModel.images).then((value) {
      if(value['message']=="success"){
        Get.delete<DefaultViewModel>();
        Get.delete<VehicleViewModel>();
        Get.toNamed(RouteName.homeView)!.then((value){});
        Utils.snackBar('Note', 'Data uploaded successfully');
      }
      else{
        Utils.snackBar('Error', value["error"]);
      }
    });

  }
  final rxRequestStatus = Status.LOADING.obs ;
  final vehiclesList =VehiclesResponse().obs ;
  RxString error = ''.obs;
  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void setEventList(VehiclesResponse _value) => vehiclesList.value = _value ;
  void setError(String _value) => error.value = _value ;
  void getVehicle(){
    _api.getApi().then((value){
      setEventList(VehiclesResponse.fromJson(value));
      setRxRequestStatus(Status.COMPLETED);
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
  void refreshApi(){
    setRxRequestStatus(Status.LOADING);
    _api.getApi().then((value){
      setRxRequestStatus(Status.COMPLETED);
      setEventList(VehiclesResponse.fromJson(value));
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }
}