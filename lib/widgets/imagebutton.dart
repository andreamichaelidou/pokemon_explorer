import 'package:flutter/material.dart';
import '../screens/PokemonScreen.dart';

class CustomImageButton extends StatelessWidget {
  final int id;
  final String image;
  final String type;
  //final VoidCallback? onTap;

  const CustomImageButton({
    super.key,
    required this.id,
    required this.type,
    required this.image,
    //this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    //getting the height size of the screen to adjust the image size
    double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PokemonScreen(typeid: id, typename: type),
          ),
        );
      },
      child: Image.network(
        image,
        height: screenHeight * 0.07,
        fit: BoxFit.cover,
      ),
    );
  }
}
