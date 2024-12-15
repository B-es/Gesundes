import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gesundes/api/models/dish_model.dart';
import 'package:gesundes/api/repositories/dishes_rep.dart';
import 'package:gesundes/api/repositories/ingredient_rep.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc({required this.dishesRep, required this.ingredientRep})
      : super(FavoriteInitial()) {
    on<FavoriteEvent>(onFavoriteLoad);
  }

  bool _checkIsEnougthAllIngredients(final dish) {
    bool isEnough = true;
    for (final dishIngredient in dish.ingredients) {
      isEnough = isEnough && ingredientRep.checkIsEnough(dishIngredient);
    }
    return isEnough;
  }

  void onFavoriteLoad(event, emit) {
    List<DishModel> dishes =
        dishesRep.dishes.where((element) => element.isFavorite).toList();

    List<bool> isEnoughs = dishes.map(_checkIsEnougthAllIngredients).toList();

    if (byIngredients) {
      List<DishModel> dishesByIngredients = [];
      for (final dish in dishes) {
        bool isEnough = _checkIsEnougthAllIngredients(dish);
        if (isEnough) {
          dishesByIngredients.add(dish);
        }
      }
      List<bool> isEnoughs =
          dishesByIngredients.map(_checkIsEnougthAllIngredients).toList();
      emit(FavoriteLoaded(dishes: dishesByIngredients, isEnoughs: isEnoughs));
    } else {
      emit(FavoriteLoaded(dishes: dishes, isEnoughs: isEnoughs));
    }
  }

  void setByIngredients(val) {
    byIngredients = val;
  }

  bool byIngredients = false;
  final DishesRep dishesRep;
  final IngredientRep ingredientRep;
}
