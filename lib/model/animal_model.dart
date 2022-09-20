class AnimalModel{
  int id=-1;
  String name='';
  String latinName='';
  String animalType='';
  String activeTime='';
  String habitat='';
  String diet='';
  String imageLink='';
  String geoRange='';

  AnimalModel(
      {required this.id,
        required this.name,
        required this.latinName,
        required this.animalType,
        required this.activeTime,
        required this.habitat,
        required this.diet,
        required this.imageLink,
        required this.geoRange});
  AnimalModel.empty();

  factory AnimalModel.fromJson(Map<String, dynamic> json){
    return AnimalModel(
        id: json["id"] ?? -1,
        name: json['name']??'',
        latinName: json['latin_name']??'',
        animalType: json['animal_type']??'',
        activeTime: json['active_time']??'',
        habitat: json['habitat']??'',
        diet: json['diet']??'',
        imageLink: json['image_link']??'',
        geoRange: json['geo_range']??'');
  }
}