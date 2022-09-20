import 'package:get/get.dart';
import 'package:my_pets_app/controller/custom_bottom_navbar_controller.dart';
import 'package:my_pets_app/controller/home_screen_controller.dart';
import 'package:my_pets_app/controller/login_screen_controller.dart';
import 'package:my_pets_app/controller/setting_screen_controller.dart';


class ScreenBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SettingScreenController());
    Get.lazyPut(() => HomeScreenController());
    Get.lazyPut(() => LoginScreenController());
    Get.lazyPut(() => CustomBottomNacBarController());
  }
}