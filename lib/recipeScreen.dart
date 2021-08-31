import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:test_flutter/favoriteWidget.dart';

class RecipeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text("Pizza facile",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                Text("Par Aboulaye Toure",
                    style: TextStyle(color: Colors.grey[500], fontSize: 20)),
              ],
            )),
            FavoriteWidget(
              isFavorited: true,
              favoriteCount: 44,
            )
          ],
        ));
    Widget buttonSection = Container(
        padding: const EdgeInsets.all(8),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          _buildButtonColumn(Colors.blue, Icons.message, "Commenter"),
          _buildButtonColumn(Colors.blue, Icons.share, "Partager"),
        ]));
    Widget descriptionSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        "Faire cuire dans une pêle les larbons et les champignons. \n Dans un bol, verser la boite de concentré de tomate,y ajouter un demi-verre d'eau,ensuite mettre un carré de sucre(pour enlever l'acidité de la tomate) une pincée de sel de poivre,et une pincée d'herbe de Provence \n Faire cuire dans une pêle les larbons et les champignons.\n Faire cuire dans une pêle les larbons et les champignons.\n Faire cuire dans une pêle les larbons et les champignons.\n Faire cuire dans une pêle les larbons et les champignons.\n Faire cuire dans une pêle les larbons et les champignons.\n Faire cuire dans une pêle les larbons et les champignons.",
        softWrap: true,
      ),
    );
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Mes Recettes"),
        ),
        body: ListView(children: [
          CachedNetworkImage(
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
            imageUrl:
                "https://assets.afcdn.com/recipe/20160519/15342_w1024h768c1cx3504cy2338.webp",
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          titleSection,
          buttonSection,
          descriptionSection,
        ]));
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: Icon(icon, color: color)),
        Text(label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: color,
            ))
      ],
    );
  }
}
