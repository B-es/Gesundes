import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gesundes/api/repositories/ingredient_rep.dart';
import 'package:gesundes/presentation/common/appbar_custom.dart';
import 'package:gesundes/presentation/common/choice_button.dart';
import 'package:gesundes/presentation/common/dialogs/input_count.dart';

import '../../common/ingredient.dart';
import 'cubit/cubit/ingredient_cubit.dart';

class IngredientList extends StatelessWidget {
  IngredientList({super.key});

  final List<String> items = ['Молоко', 'Маргарин'];

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBarCustom(
          toolbarHeight: 100,
          withArrow: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(10),
            child: SizedBox(
              width: width - 40,
              child: Divider(
                color: themeData.primaryColor,
              ),
            ),
          ),
          title: Text(
            softWrap: true,
            overflow: TextOverflow.clip,
            textAlign: TextAlign.center,
            "список ингредиентов".toUpperCase(),
            style: themeData.textTheme.titleMedium,
          ),
        ),
        body: Center(
          child: SizedBox(
            width: 300,
            child: BlocBuilder<IngredientCubit, IngredientState>(
              builder: (context, state) {
                if (state is IngredientLoaded) {
                  return ListView.builder(
                      itemCount: state.ingredients.length,
                      itemBuilder: (_, i) => Ingredient(
                            number: i + 1,
                            ingredientModel: state.ingredients[i],
                          ));
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: width - 40,
                child: Divider(
                  color: themeData.primaryColor,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ChoiceButton(
                text: "Добавить ингредиент",
                icon: Icons.add,
                color: themeData.disabledColor,
                width: 180,
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (_) => InputCount(
                            onTap: (name, count) {
                              RepositoryProvider.of<IngredientRep>(context)
                                  .add(name, "шт", count);
                              BlocProvider.of<IngredientCubit>(context)
                                  .loadIngredient();
                              Navigator.maybePop(context);
                            },
                          ));
                },
              )
            ],
          ),
        ));
  }
}
