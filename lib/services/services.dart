import 'package:http/http.dart' as http;
import '../model/pokemon_model.dart';
import 'dart:convert';

//handles all HTTP requests

class PokemonService {
  // will be calling it with PokemonService().getTypePokemons();

  //GET ALL POKEMONS FROM THE SAME TYPE
  Future<List<PokemonModel>> getTypePokemons(int id, int offset) async {
    //it will return a list of characters created from model
    final response = await http.get(
      Uri.parse("https://pokeapi.co/api/v2/type/$id"),
    );
    if (response.statusCode == 200) {
      //200=OK
      //returns a map
      final data = jsonDecode(response.body);

      List results =
          data['pokemon']; //'pokemon' is the name of the section we need the info from

      // take only 10
      List paginated = results.skip(offset).take(10).toList();

      List<PokemonModel> pokemons = [];

      for (var item in paginated) {
        String url = item["pokemon"]["url"];
        //get from the pokemon url
        final pokemonResponse = await http.get(Uri.parse(url));

        if (pokemonResponse.statusCode == 200) {
          final pokemonData = jsonDecode(pokemonResponse.body);

          pokemons.add(PokemonModel.fromJson(pokemonData));
        }
      }

      return pokemons;
    } else {
      throw Exception('Failed to load character');
    }
  }
}
