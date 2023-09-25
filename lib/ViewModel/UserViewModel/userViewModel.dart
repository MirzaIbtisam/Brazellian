import 'package:brazeellian_community/Models/signUpModel.dart';
import 'package:brazeellian_community/Models/userModel.dart';
import 'package:brazeellian_community/ViewModel/user_preference/userPrefrenceViewModel.dart';
import 'package:brazeellian_community/data/response/status.dart';
import 'package:brazeellian_community/repository/userRepository.dart';
import 'package:get/get.dart';

class UserViewModel extends GetxController {

  final _api = UserRepository();
  final rxRequestStatus = Status.LOADING.obs ;
  Rx<UserProfile> userInfo =UserProfile().obs ;
  UserPreference userPreference = UserPreference();
  RxString error = ''.obs;
  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void setUser(UserProfile _value) => userInfo.value = _value ;

  void setError(String _value) => error.value = _value ;
  void getUserInfo()async{
    UserLoginResponse user=await userPreference.getUser();
    _api.getUserInfo(user.id.toString()).then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUser(UserProfile.fromJson(value['message']));
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }

}