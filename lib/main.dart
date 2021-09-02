import 'package:flutter/material.dart';
import 'package:test_flutter/recipeScreen.dart';
import 'package:test_flutter/recipe.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: RecipeScreen(
          recipe: Recipe(
              "Pizza Facile",
              "Par Abdoulaye Toure",
              "https://assets.afcdn.com/recipe/20160519/15342_w1024h768c1cx3504cy2338.webp",
              "Faire cuire dans une pêle les larbons et les champignons. \n Dans un bol, verser la boite de concentré de tomate,y ajouter un demi-verre d'eau,ensuite mettre un carré de sucre(pour enlever l'acidité de la tomate) une pincée de sel de poivre,et une pincée d'herbe de Provence \n Faire cuire dans une pêle les larbons et les champignons.\n Faire cuire dans une pêle les larbons et les champignons.\n Faire cuire dans une pêle les larbons et les champignons.\n Faire cuire dans une pêle les larbons et les champignons.\n Faire cuire dans une pêle les larbons et les champignons.\n Faire cuire dans une pêle les larbons et les champignons.",
              false,
              50)),
    );
  }
}
