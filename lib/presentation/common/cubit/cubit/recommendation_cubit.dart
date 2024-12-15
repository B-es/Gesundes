import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gesundes/api/models/dish_model.dart';
import 'package:gesundes/api/repositories/dishes_rep.dart';

part 'recommendation_state.dart';

class RecommendationCubit extends Cubit<RecommendationState> {
  RecommendationCubit({required this.dishesRep})
      : super(RecommendationInitial());

  void getRecommendation() {
    emit(
      RecommendationLoaded(
        dish: dishesRep.dishes[Random().nextInt(dishesRep.dishes.length)],
      ),
    );
  }

  final DishesRep dishesRep;
}
