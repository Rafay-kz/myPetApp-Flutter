import 'package:get/get.dart';
import 'package:my_pets_app/screens/home_screen.dart';
import 'package:my_pets_app/screens/login_screen.dart';

import '../screens/setting_screen.dart';
import 'constants.dart';
import 'screen_bindings.dart';

class RouteGenerator {
  static List<GetPage> getPages() {
    return [
      GetPage(
        name: kHomeScreen,
        page: () => HomeScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kSettingScreen,
        page: () => SettingScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kLoginScreen,
        page: () => LoginScreen(),
        binding: ScreenBindings(),
      ),
    ];
  }


}