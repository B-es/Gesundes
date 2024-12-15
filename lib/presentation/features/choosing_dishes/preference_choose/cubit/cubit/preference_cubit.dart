import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gesundes/api/models/dish_model.dart';
import 'package:gesundes/api/repositories/dishes_rep.dart';

part 'preference_state.dart';

class PreferenceCubit extends Cubit<PreferenceState> {
  PreferenceCubit({required this.dishesRep}) : super(PreferenceInitial());

  void next(isAdd) {
    if (isAdd) addPref();
    if (currentIndex == dishesRep.dishes.length) {
      emit(PreferenceAll(dishes: prefs));
      currentIndex = 0;
      emit(PreferenceOne(dish: dishesRep.dishes[currentIndex++]));
    } else {
      emit(PreferenceOne(dish: dishesRep.dishes[currentIndex++]));
    }
  }

  void addPref() {
    prefs.add(dishesRep.dishes[currentIndex - 1]);
  }

  int currentIndex = 0;
  final DishesRep dishesRep;
  final List<DishModel> prefs = [];
}
