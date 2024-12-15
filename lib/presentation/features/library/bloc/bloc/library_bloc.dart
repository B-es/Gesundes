import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gesundes/api/models/dish_model.dart';
import 'package:gesundes/api/repositories/dishes_rep.dart';
import 'package:gesundes/api/repositories/ingredient_rep.dart';

part 'library_event.dart';
part 'library_state.dart';

class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  LibraryBloc({required this.dishesRep, required this.ingredientRep})
      : super(LibraryInitial()) {
    on<LoadLibraryEvent>(onLibraryLoad);
  }

  void onLibraryLoad(LoadLibraryEvent event, emit) {
    List<DishModel> dishes = dishesRep.dishes;

    if (byIngredients) {
      List<DishModel> dishesByIngredients = [];
      for (final dish in dishes) {
        bool isEnough = true;
        for (final dishIngredient in dish.ingredients) {
          isEnough = isEnough && ingredientRep.checkIsEnough(dishIngredient);
        }
        if (isEnough) {
          dishesByIngredients.add(dish);
        }
      }
      emit(LibraryLoaded(dishes: dishesByIngredients));
    } else {
      emit(LibraryLoaded(dishes: dishes));
    }
  }

  void setByIngredients(val) {
    byIngredients = val;
  }

  bool byIngredients = false;
  final DishesRep dishesRep;
  final IngredientRep ingredientRep;
}
