import 'package:brazeellian_community/Models/eventModel.dart';
import 'package:brazeellian_community/Models/signUpModel.dart';
import 'package:brazeellian_community/Utils/utils.dart';
import 'package:brazeellian_community/ViewModel/DefaultViewModel/DefaultViewModel.dart';
import 'package:brazeellian_community/ViewModel/user_preference/userPrefrenceViewModel.dart';
import 'package:brazeellian_community/constant/routes/routes_name.dart';
import 'package:brazeellian_community/data/response/status.dart';
import 'package:brazeellian_community/repository/eventsRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

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
  RxBool loading = false.obs;
  final rxRequestStatus = Status.LOADING.obs ;
  final eventsList =EventsResponse().obs ;
  RxString error = ''.obs;
  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void setEventList(EventsResponse _value) => eventsList.value = _value ;
  void setError(String _value) => error.value = _value ;
  void addEvents()async{
    print("HELLO");
    loading.value = true ;
    UserLoginResponse user=await userPreference.getUser();
    Map data = {
      "userId": user.id.toString(),
      "title": defaultViewModel.titleController.value.text.toString(),
      "description":defaultViewModel. descriptionController.value.text.toString(),
      "local":defaultViewModel. localController.value.text.toString(),
      "postalCode": defaultViewModel. postalCodeController.value.text.toString(),
      "whatsapp":defaultViewModel. whatsappController.value.text.toString(),
      "keywords":defaultViewModel.tags.value.getTags,
      "date":dateController.value.text.toString(),
      "time": timeController.value.text.toString(),
      "start":"startController.value.text.toString()",
      "end": "endController.value.text.toString()",
      "instagram": instagramController.value.text.toString(),
      "facebook": facebookController.value.text.toString(),
    };
    _api.addApi(data ,defaultViewModel.image , defaultViewModel.images).then((value) {
      if(value['message']=="success"){
        Get.delete<EventsViewModel>();
        Get.delete<DefaultViewModel>();
        Get.toNamed(RouteName.homeView)!.then((value){});
        Utils.snackBar('Note', 'Data uploaded successfully');
      }
      else{
        Utils.snackBar('Error', value["error"]);
      }
    });

  }
  void getEvents(){
    _api.getApi().then((value){
      setRxRequestStatus(Status.COMPLETED);
      setEventList(EventsResponse.fromJson(value));
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }
  void refreshApi(){
    setRxRequestStatus(Status.LOADING);
    _api.getApi().then((value){
      setRxRequestStatus(Status.COMPLETED);
      setEventList(EventsResponse.fromJson(value));
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }
}