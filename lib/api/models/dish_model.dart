import 'package:gesundes/api/models/ingredient_model.dart';

class DishModel {
  String name;
  String description;
  bool isFavorite;
  String img;
  List<IngredientModel> ingredients;
  String recipe;
  DishModel({
    required this.name,
    required this.description,
    required this.isFavorite,
    required this.img,
    required this.ingredients,
    required this.recipe,
  });
}
