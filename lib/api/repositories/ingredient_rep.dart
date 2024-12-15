import 'package:gesundes/api/models/ingredient_model.dart';

class IngredientRep {
  void add(name, unit, count) {
    ingredients.add(IngredientModel(name: name, unit: unit, count: count));
  }

  void remove(model) {
    ingredients.remove(model);
  }

  bool checkIsEnough(IngredientModel ingredient) {
    final toCompare =
        ingredients.where((element) => element.name == ingredient.name);
    if (toCompare.isEmpty) return false;
    return toCompare.first.count >= ingredient.count;
  }

  List<IngredientModel> ingredients = [
    IngredientModel(name: "Молоко", unit: "шт", count: 2),
    IngredientModel(name: "Сахар", unit: "шт", count: 14),
  ];
}
