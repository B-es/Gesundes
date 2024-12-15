import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gesundes/api/models/ingredient_model.dart';
import 'package:gesundes/api/repositories/ingredient_rep.dart';

part 'ingredient_state.dart';

class IngredientCubit extends Cubit<IngredientState> {
  IngredientCubit({required this.ingredientRep}) : super(IngredientInitial());

  void loadIngredient() {
    final ingredients = ingredientRep.ingredients;
    emit(IngredientLoaded(ingredients: ingredients));
  }

  final IngredientRep ingredientRep;
}
