import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pets_app/controller/custom_bottom_navbar_controller.dart';
import 'package:my_pets_app/utils/custom_themes/theme_service.dart';

class CustomNavBar extends GetView<CustomBottomNacBarController>{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height/10,
      width: Get.width,
      child: BottomNavigationBar(
          currentIndex: controller.selectedNav.value,
          onTap: (int index) {
            controller.onSelectedTabChanged(index);
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Login',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ThemeService().theme==ThemeMode.light?Colors.black:Colors.white,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          selectedFontSize: 11,
          unselectedFontSize: 11,
          iconSize: 20,
          elevation: 3),
    );
  }

}