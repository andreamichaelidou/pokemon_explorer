import 'package:flutter/material.dart';
import '../model/pokemon_model.dart';
import '../services/services.dart';
import '../widgets/pokemon_card.dart';

//Pokemon Screen where you can scroll

class PokemonScreen extends StatefulWidget {
  final int typeid;
  final String typename;
  const PokemonScreen({
    super.key,
    required this.typeid,
    required this.typename, //use it to add the type name as a title on the screen
  });

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  List<PokemonModel> pokemons = [];
  List<PokemonModel> filteredPokemons = [];

  //keep track of where we are for the pagination in service.dart
  final PokemonService service = PokemonService();

  int offset = 0;
  bool isLoading = false;
  bool allLoaded = false; // Stop loading when no more Pokémon

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadPokemons(); // Load the first 10 Pokémon
  }

  // SEARCH FUNCTION
  void searchPokemon(String query) {
    final results = pokemons.where((pokemon) {
      return pokemon.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredPokemons = results;
    });
  }

  //FETCH DATA
  Future<void> loadPokemons() async {
    if (isLoading || allLoaded) return;

    setState(() {
      isLoading = true;
    });

    try {
      List<PokemonModel> newPokemons = await service.getTypePokemons(
        widget.typeid,
        offset,
      );

      setState(() {
        if (newPokemons.isEmpty) {
          allLoaded = true; // No more Pokemon to load
        } else {
          pokemons.addAll(newPokemons);
          filteredPokemons = pokemons;
          offset += 10; // increase offset for the next 10 Pokemon
        }
      });
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to load Pokémon: $e')));
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 3, 21, 112),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 138, 4, 4),
        title: TextField(
          controller: searchController,
          onChanged: searchPokemon,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: "Search Pokémon...",
            hintStyle: TextStyle(color: Colors.white70),
            border: InputBorder.none,
          ),
        ),
      ),

      body:
          //Text("Pokémon" + typename), //na valw px Grass Type pokemon
          ListView.builder(
            itemCount: filteredPokemons.length + (allLoaded ? 0 : 1),
            itemBuilder: (context, index) {
              //function call repeatedly , index = position in the list
              if (index < filteredPokemons.length) {
                final poke =
                    filteredPokemons[index]; //poke = one pokemon from the List

                return PokemonCard(
                  id: poke.id,
                  name: poke.name,
                  defence: poke.defence,
                  hp: poke.hp,
                  attack: poke.attack,
                  image: poke.image,
                );
              }
              //LOAD MORE
              else {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Center(
                    child: isLoading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: loadPokemons,
                            child: const Text("Load More"),
                          ),
                  ),
                );
              }
            },
          ),
    );
  }
}
