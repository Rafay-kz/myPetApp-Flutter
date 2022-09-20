import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pets_app/utils/custom_themes/theme_service.dart';

class SettingScreenController extends GetxController{
RxBool isLightTheme=false.obs;
void onChange(){
  if(isLightTheme.value){
    isLightTheme.value = false;
  }
  else{
    isLightTheme.value = true;
  }
  Get.changeThemeMode(
    isLightTheme.value ? ThemeMode.light : ThemeMode.dark,
  );
  ThemeService().switchTheme();
}


}