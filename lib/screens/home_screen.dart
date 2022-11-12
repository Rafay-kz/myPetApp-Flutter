import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pets_app/controller/home_screen_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_pets_app/utils/app_colors.dart';

import 'custom_widget/custom_bottom_navbar.dart';
//Created by Abdul Rafay
class HomeScreen extends GetView<HomeScreenController>{
  @override
  Widget build(BuildContext context) {
   return  Scaffold(
     backgroundColor: const Color(kBackgroundColor),
     appBar:  PreferredSize(
         preferredSize:  Size.fromHeight(200), // here the desired height
         child: Container(
           height:200,
           width: Get.width,
           color: Colors.white,
           child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 30),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: const [
                     Icon(Icons.search,color: Colors.black45,size: 35,),
                     Icon(Icons.menu,color: Colors.black45,size: 35,)
                   ],
                 ),
                 const SizedBox(height: 20,),
                 const Text('Discover',style: TextStyle(fontSize: 50,color:  Color(kBlackColor)),),
               ],
             ),
           ),
         )
     ),
     body: SizedBox(
       height: Get.height,
       width: Get.width,
       child: Obx(()=>
       controller.animalsList.isNotEmpty?
       ListView.builder(
         physics: const BouncingScrollPhysics(),
         itemCount: controller.animalsList.length,
         shrinkWrap: true,
         itemBuilder: (BuildContext context, int index) {
           return detailCard(index);
         },):
       const Center(child: CircularProgressIndicator()),
       ),
     ),
     bottomNavigationBar: CustomNavBar(),
   );
  }
Widget detailCard(int index){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 8),
      child: Container(
        width: Get.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
             // spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0.0, 1.0), //(x,y)
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
             child: Padding(
               padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 12),
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(controller.animalsList[index].name,style: const TextStyle(fontSize: 17,color:  Color(kBlackColor),fontWeight: FontWeight.bold),),
                   const SizedBox(height: 7,),
                   Text('Diet: ${controller.animalsList[index].diet}',style: const TextStyle(fontSize: 15,color: Color(kBlackColor))),
                   const SizedBox(height: 7,),
                   Text('Habitat: ${controller.animalsList[index].habitat}',style: const TextStyle(fontSize: 15,color:  Color(kBlackColor))),

                 ],
               ),
             ),
           ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),

                  ),
                  child: CachedNetworkImage(imageUrl: controller.animalsList[index].imageLink, width: 180,height: 180,fit: BoxFit.fill,)),
            ),
          ],
        ),
      ),
    );

}

}