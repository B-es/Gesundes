import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gesundes/api/models/dish_model.dart';
import 'package:gesundes/presentation/common/cubit/cubit/recommendation_cubit.dart';
import 'package:gesundes/presentation/common/dish_card.dart';
import 'package:gesundes/presentation/features/dish_description/dish_description.dart';
import 'package:gesundes/presentation/features/favorite/bloc/bloc/favorite_bloc.dart';
import 'package:gesundes/presentation/features/library/bloc/bloc/library_bloc.dart';

class StarDishCard extends StatelessWidget {
  const StarDishCard({super.key, required this.dish});

  final DishModel dish;

  @override
  Widget build(BuildContext context) {
    return DishCard(
        title: dish.name,
        img: dish.img,
        tapDetail: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => DishDescription(dish: dish)));
        },
        icon: IconButton(
          onPressed: () {
            dish.isFavorite = true;
            BlocProvider.of<LibraryBloc>(context).add(LoadLibraryEvent());
            BlocProvider.of<FavoriteBloc>(context).add(LoadFavoriteEvent());
            BlocProvider.of<RecommendationCubit>(context).getRecommendation();
          },
          icon: Icon(
            Icons.star,
            size: 45,
            color: dish.isFavorite ? Colors.red : Colors.white,
          ),
        ));
  }
}
