import 'dart:convert';

//converting JSON into structured objects
//help from: https://www.codecademy.com/article/rest-api-in-flutter
//help from: https://docs.flutter.dev/cookbook/networking/fetch-data

class PokemonModel {
  final int id;
  final String name;
  final int defence;
  final int hp;
  final int attack;
  final String image;

  PokemonModel({
    required this.id,
    required this.name,
    required this.defence,
    required this.hp,
    required this.attack,
    required this.image,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    //constructor
    return PokemonModel(
      id: json["id"],
      name: json["name"],
      defence: json["stats"][2]["base_stat"],
      hp: json["stats"][0]["base_stat"],
      attack: json["stats"][1]["base_stat"],
      image: json["sprites"]["front_default"],
    );
  }
}
