import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  GetStorage getStorage = GetStorage();
  String mode = 'isThemeMode';

  ThemeMode get theme => getThemeFromStorage() ? ThemeMode.dark : ThemeMode.light;

  bool getThemeFromStorage() => getStorage.read(mode) ?? false;
  saveThemeToStorage(bool isDarkMode) => getStorage.write(mode, isDarkMode);

  void switchTheme() {
    Get.changeThemeMode(getThemeFromStorage() ? ThemeMode.light : ThemeMode.dark);
    saveThemeToStorage(!getThemeFromStorage());
  }
}