import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:my_pets_app/model/animal_model.dart';

class AnimalDetail{

  static final AnimalDetail _instance = AnimalDetail._internal();
  AnimalDetail._internal();

  factory AnimalDetail() => _instance;

  Future <List<AnimalModel>> getAnimals() async{
    Response response=await get(Uri.parse('https://zoo-animal-api.herokuapp.com/animals/rand/10'));
    List animalData=jsonDecode(response.body);
    return animalData.map((e) => AnimalModel.fromJson(e)).toList();
  }


}