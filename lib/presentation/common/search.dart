import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gesundes/presentation/common/dropdown.dart';
import 'package:gesundes/presentation/common/input.dart';
import 'package:gesundes/presentation/common/label.dart';
import 'package:gesundes/presentation/features/favorite/bloc/bloc/favorite_bloc.dart';
import 'package:gesundes/presentation/features/library/bloc/bloc/library_bloc.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class Search extends StatelessWidget {
  const Search({super.key, required this.bloc});

  final Bloc bloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Input(hint: "Введите название блюда..."),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DropDown(
                items: ['1', '2'],
                initValue: 'Категория',
                width: 140,
                height: 30,
              ),
              Column(
                children: [
                  Text("Под ингредиенты"),
                  RoundCheckBox(
                    checkedColor: Theme.of(context).primaryColor,
                    onTap: (val) {
                      if (bloc is LibraryBloc) {
                        (bloc as LibraryBloc).setByIngredients(val);
                        bloc.add(LoadLibraryEvent());
                      }
                      if (bloc is FavoriteBloc) {
                        (bloc as FavoriteBloc).setByIngredients(val);
                        bloc.add(LoadFavoriteEvent());
                      }
                    },
                    animationDuration: Duration.zero,
                  ),
                ],
              ),
              BlocBuilder(
                bloc: bloc,
                builder: (context, state) {
                  if (state is LibraryLoaded) {
                    return Label(
                      text: "Кол-во: ${state.dishes.length}",
                      width: 100,
                    );
                  }
                  if (state is FavoriteLoaded) {
                    return Label(
                      text: "Кол-во: ${state.dishes.length}",
                      width: 100,
                    );
                  }
                  return const Label(
                    text: "Кол-во: 0",
                    width: 100,
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
