import 'dart:developer';

import 'package:get/get.dart';
import 'package:my_pets_app/helper/services/animal_information.dart';
import 'package:my_pets_app/model/animal_model.dart';

class HomeScreenController extends GetxController{
  RxList<AnimalModel> animalsList=<AnimalModel>[].obs;
@override
  void onInit() {
   fetchAnimals();
  }

Future<void> fetchAnimals() async{
  animalsList.value=await AnimalDetail().getAnimals();
}
}
