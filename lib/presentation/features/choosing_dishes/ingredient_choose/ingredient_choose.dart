import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gesundes/api/repositories/dishes_rep.dart';
import 'package:gesundes/api/repositories/ingredient_rep.dart';
import 'package:gesundes/presentation/common/appbar_custom.dart';
import 'package:gesundes/presentation/common/choice_button.dart';
import 'package:gesundes/presentation/common/dialogs/input_count.dart';
import 'package:gesundes/presentation/common/ingredient.dart';
import 'package:gesundes/presentation/features/finded/finded.dart';
import 'package:gesundes/presentation/features/ingredient_list/cubit/cubit/ingredient_cubit.dart';

class IngredientChoose extends StatelessWidget {
  const IngredientChoose({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBarCustom(
        toolbarHeight: 80,
        withArrow: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(15),
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
          "выбор по ингредиентам".toUpperCase(),
          style: themeData.textTheme.titleMedium,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 400,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 60.0, vertical: 0),
              child: BlocBuilder<IngredientCubit, IngredientState>(
                builder: (context, state) {
                  if (state is IngredientLoaded) {
                    return ListView.builder(
                      itemCount: state.ingredients.length,
                      itemBuilder: (_, i) => Ingredient(
                        number: i + 1,
                        ingredientModel: state.ingredients[i],
                      ),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            child: Column(
              children: [
                // SizedBox(
                //   width: 380,
                //   child: Row(
                //     mainAxisSize: MainAxisSize.min,
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       ChoiceButton(
                //         text: "Добавить сохранённые ингредиенты",
                //         icon: Icons.add,
                //         color: themeData.disabledColor,
                //         width: 170,
                //         height: 70,
                //       ),
                //     ],
                //   ),
                // ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 380,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ChoiceButton(
                        text: "Подбор",
                        icon: Icons.add,
                        color: themeData.primaryColor,
                        width: 170,
                        height: 70,
                        onTap: () {
                          final ingredientRep =
                              RepositoryProvider.of<IngredientRep>(context);
                          final dishesRep =
                              RepositoryProvider.of<DishesRep>(context);

                          bool _checkIsEnougthAllIngredients(final dish) {
                            bool isEnough = true;
                            for (final dishIngredient in dish.ingredients) {
                              isEnough = isEnough &&
                                  ingredientRep.checkIsEnough(dishIngredient);
                            }
                            return isEnough;
                          }

                          final correct = dishesRep.dishes
                              .where((element) =>
                                  _checkIsEnougthAllIngredients(element))
                              .toList();

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => Finded(dishes: correct)));
                        },
                      ),
                      ChoiceButton(
                        text: "Добавить ингредиент",
                        icon: Icons.add,
                        color: themeData.disabledColor,
                        width: 170,
                        height: 70,
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (_) => InputCount(
                                    onTap: (name, count) {
                                      RepositoryProvider.of<IngredientRep>(
                                              context)
                                          .add(name, "шт", count);
                                      BlocProvider.of<IngredientCubit>(context)
                                          .loadIngredient();
                                      Navigator.maybePop(context);
                                    },
                                  ));
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // SizedBox(
                //   width: 380,
                //   child: Row(
                //     mainAxisSize: MainAxisSize.min,
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       ChoiceButton(
                //         text: "Подбор по сохранённым",
                //         icon: Icons.add,
                //         color: themeData.primaryColor,
                //         width: 170,
                //         height: 70,
                //       ),
                //       ChoiceButton(
                //         text: "Сохранить ингредиенты",
                //         icon: Icons.add,
                //         color: themeData.disabledColor,
                //         width: 170,
                //         height: 70,
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
