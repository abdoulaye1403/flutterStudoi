import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/recipe.dart';
import 'package:test_flutter/recipeBox.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RecipeListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RecipeListScreenState();
  }
}

class RecipeListScreenState extends State<RecipeListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mes recettes"),
      ),
      body: ValueListenableBuilder(
          valueListenable: RecipeBox.box.listenable(),
          builder: (context, Box items, _) {
            List<String> keys = items.keys.cast<String>().toList();
            return ListView.builder(
              itemCount: keys.length,
              itemBuilder: (context, index) {
                final recipe = items.get(keys[index]);
                return Dismissible(
                    key: Key(recipe.title),
                    onDismissed: (direction) {
                      setState(() {
                        RecipeBox.box.delete(recipe.key());
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("${recipe.title} supprimé")));
                    },
                    background: Container(color: Colors.red),
                    child: RecipeItemWidget(recipe: recipe));
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/newRecipe');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class RecipeItemWidget extends StatelessWidget {
  const RecipeItemWidget({Key key, @required this.recipe}) : super(key: key);
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/recipe',
          arguments: recipe,
        );
      },
      child: Card(
        margin: EdgeInsets.all(8),
        elevation: 8,
        child: Row(
          children: [
            Hero(
              tag: "imageRecipe" + recipe.title,
              child: CachedNetworkImage(
                imageUrl: recipe.imageUrl,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(recipe.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                  Text(recipe.user,
                      style: TextStyle(color: Colors.grey[500], fontSize: 16))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
