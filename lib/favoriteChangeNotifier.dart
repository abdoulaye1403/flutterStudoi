import 'package:flutter/foundation.dart';
import 'package:test_flutter/recipe.dart';
import 'package:test_flutter/recipeBox.dart';

class FavoriteChangeNotifier with ChangeNotifier {
  Recipe recipe;

  FavoriteChangeNotifier(this.recipe);

  bool get isFavorited => recipe.isFavorite;

  int get favoriteCount => recipe.favoriteCount + (recipe.isFavorite ? 1 : 0);

  set isFavorited(bool isFavorited) {
    recipe.isFavorite = isFavorited;
    RecipeBox.box.put(recipe.key(), recipe);
    notifyListeners();
  }
}
