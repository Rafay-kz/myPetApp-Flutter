import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pets_app/screens/custom_widget/custom_bottom_navbar.dart';
import 'package:my_pets_app/utils/constants.dart';
import 'package:my_pets_app/utils/custom_themes/theme_service.dart';
import '../controller/setting_screen_controller.dart';

class SettingScreen extends GetView<SettingScreenController>{
  @override
  Widget build(BuildContext context) {
   return  Scaffold(
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20),
             child: Text('Choose Your Desire Theme \nDark/Light',textAlign: TextAlign.center,style: TextStyle(fontSize: 35,color:
               ThemeService().theme==ThemeMode.light ? Colors.black:Colors.white),),
           ),
           const SizedBox(height: 20,),
           GestureDetector(
             child: Obx(()=>Icon(
                 controller.isLightTheme.value ?
                 Icons.light_mode_outlined:Icons.dark_mode,
               size: 100,
             ),),
             onTap: (){
               controller.onChange();
             },
           ),
         ],
       ),
     ),
     bottomNavigationBar: CustomNavBar(),

   );
  }

}