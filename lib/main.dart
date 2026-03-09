import 'package:flutter/material.dart';
import '../widgets/pokemon_card.dart';
import '../screens/ChooseTypeScreen.dart';
import '../screens/PokemonScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: ChooseTypeScreen(),
      /*PokemonCard(
        id: 25,
        name: 'Pikachu',
        defence: '90',
        hp: '90',
        attack: '90',
        image:
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/female/25.png',
      ),*/
    );
  }
}
