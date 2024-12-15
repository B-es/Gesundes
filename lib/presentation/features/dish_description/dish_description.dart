import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gesundes/api/models/dish_model.dart';
import 'package:gesundes/api/repositories/ingredient_rep.dart';
import 'package:gesundes/presentation/common/appbar_custom.dart';

import 'widgets/list_component.dart';
import 'widgets/list_item.dart';
import 'widgets/main_list.dart';

class DishDescription extends StatelessWidget {
  const DishDescription({super.key, required this.dish});

  final DishModel dish;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBarCustom(
          toolbarHeight: 80,
          withArrow: true,
          title: Text(
            softWrap: true,
            overflow: TextOverflow.clip,
            textAlign: TextAlign.center,
            dish.name.toUpperCase(),
            style: themeData.textTheme.titleMedium,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(9.37)),
                    child: Image.asset(
                      dish.img,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: width - 40,
                    child: Divider(
                      color: themeData.primaryColor,
                    ),
                  ),
                  MainList(
                    title: 'Ингредиенты',
                    children: <Widget>[
                      ListComponent(
                        title: "Все",
                        children: [
                          for (final i in dish.ingredients)
                            ListItem(
                              text: i.name,
                              isEnough:
                                  RepositoryProvider.of<IngredientRep>(context)
                                      .checkIsEnough(i),
                              count: i.count,
                              unit: i.unit,
                            ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  MainList(
                    title: 'Описание и приготовление',
                    children: <Widget>[
                      ListComponent(
                        title: "Рецепт",
                        children: [Text(dish.recipe)],
                      ),
                      ListComponent(
                        title: "Описание",
                        children: [Text(dish.description)],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
