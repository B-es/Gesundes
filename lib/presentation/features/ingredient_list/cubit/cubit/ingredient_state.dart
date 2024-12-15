part of 'ingredient_cubit.dart';

sealed class IngredientState {
  const IngredientState();
}

final class IngredientInitial extends IngredientState {}

final class IngredientLoaded extends IngredientState {
  final List<IngredientModel> ingredients;
  const IngredientLoaded({required this.ingredients});
}
