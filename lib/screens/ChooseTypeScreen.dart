import 'package:flutter/material.dart';
import '../widgets/imagebutton.dart';

class ChooseTypeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 3, 21, 112),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 138, 4, 4),
        elevation: 0,
      ),

      body: Column(
        children: [
          SizedBox(height: 10),
          Center(
            child: Text(
              "Choose a Pokemon Type",
              style: TextStyle(
                fontSize: 30.0,
                color: const Color.fromARGB(255, 230, 201, 13),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),
          CustomImageButton(
            id: 10,
            image:
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/types/generation-vii/lets-go-pikachu-lets-go-eevee/10.png',
            type: 'fire',
          ),
          SizedBox(height: 10),
          CustomImageButton(
            id: 11,
            image:
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/types/generation-vii/lets-go-pikachu-lets-go-eevee/11.png',
            type: 'Water',
          ),
          SizedBox(height: 10),
          CustomImageButton(
            id: 12,
            image:
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/types/generation-vii/lets-go-pikachu-lets-go-eevee/12.png',
            type: 'Grass',
          ),
          SizedBox(height: 10),
          CustomImageButton(
            id: 13,
            image:
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/types/generation-vii/lets-go-pikachu-lets-go-eevee/13.png',
            type: 'Electric',
          ),
          SizedBox(height: 10),
          CustomImageButton(
            id: 14,
            image:
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/types/generation-vii/lets-go-pikachu-lets-go-eevee/14.png',
            type: 'Phychic',
          ),
          SizedBox(height: 10),
          CustomImageButton(
            id: 16,
            image:
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/types/generation-vii/lets-go-pikachu-lets-go-eevee/16.png',
            type: 'Dragon',
          ),
          SizedBox(height: 10),
          CustomImageButton(
            id: 17,
            image:
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/types/generation-vii/lets-go-pikachu-lets-go-eevee/17.png',
            type: 'Dark',
          ),
          SizedBox(height: 10),
          CustomImageButton(
            id: 18,
            image:
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/types/generation-vii/lets-go-pikachu-lets-go-eevee/18.png',
            type: 'Fairy',
          ),
        ],
      ),
    );
  }
}
