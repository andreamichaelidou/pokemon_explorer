import 'package:flutter/material.dart';

//Character Card for First Screen (paginated list)

class PokemonCard extends StatelessWidget {
  final int id; //pokemon number
  final String name;
  final int defence;
  final int hp;
  final int attack;
  final String image;

  const PokemonCard({
    super.key,
    required this.id, //required = upoxrewtiko na mou to dwseis
    required this.name,
    required this.defence,
    required this.hp,
    required this.attack,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    //getting the width size of the screen to adjust the image size
    double screenWidth = MediaQuery.of(context).size.width;
    return Card(
      color: const Color.fromARGB(255, 230, 201, 13),
      //marging around the card
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),

      child: Row(
        children: [
          //photo of pokemon
          Image.network(
            image,
            width: screenWidth * 0.4,
            height: screenWidth * 0.4,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 5),

          //TEXT DETAILS of pokemon
          //make screen more flexible
          Expanded(
            child: Column(
              //align text to start(right) of the Column
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 15), //adding space after text
                Text(
                  'HP: $hp',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),

                SizedBox(height: 15), //adding space after text
                Text(
                  'Attack: $attack',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Defence: $defence',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                SizedBox(height: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
