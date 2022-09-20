import 'package:get/get.dart';
import 'package:my_pets_app/utils/constants.dart';

class CustomBottomNacBarController extends GetxController{
  RxInt selectedNav = 0.obs;
  void onSelectedTabChanged(int index) {
    if (selectedNav.value != index) {
      selectedNav.value = index;
      if(index==0){
        if(Get.currentRoute!=kHomeScreen){
          Get.offAllNamed(kHomeScreen);
        }
      }else if(index==1){
        Get.offNamedUntil(kLoginScreen, (route) => route.isFirst);
      }else if(index==2){
        Get.offNamedUntil(kSettingScreen, (route) => route.isFirst);
      }
    }
  }

}