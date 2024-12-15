import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gesundes/api/models/dish_model.dart';
import 'package:gesundes/presentation/common/dish_card.dart';
import 'package:gesundes/presentation/features/dish_description/dish_description.dart';
import 'package:gesundes/presentation/features/favorite/bloc/bloc/favorite_bloc.dart';
import 'package:gesundes/presentation/features/library/bloc/bloc/library_bloc.dart';

class InfoDishCard extends StatelessWidget {
  const InfoDishCard({super.key, required this.dish, required this.isEnough});

  final DishModel dish;
  final bool isEnough;

  @override
  Widget build(BuildContext context) {
    return DishCard(
        title: dish.name,
        img: dish.img,
        tapDetail: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => DishDescription(dish: dish)));
        },
        icon: Row(
          children: [
            Icon(
              Icons.menu,
              size: 45,
              color: isEnough ? Colors.white : Theme.of(context).disabledColor,
            ),
            IconButton(
              onPressed: () {
                dish.isFavorite = false;
                BlocProvider.of<LibraryBloc>(context).add(LoadLibraryEvent());
                BlocProvider.of<FavoriteBloc>(context).add(LoadFavoriteEvent());
              },
              icon: const Icon(
                Icons.close,
                size: 45,
              ),
            ),
          ],
        ));
  }
}
