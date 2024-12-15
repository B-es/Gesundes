import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gesundes/api/models/ingredient_model.dart';
import 'package:gesundes/api/repositories/ingredient_rep.dart';
import 'package:gesundes/presentation/features/ingredient_list/cubit/cubit/ingredient_cubit.dart';

class Ingredient extends StatelessWidget {
  const Ingredient({
    super.key,
    required this.ingredientModel,
    required this.number,
  });

  final IngredientModel ingredientModel;
  final int number;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextStyle? textStyle = themeData.primaryTextTheme.bodyMedium;

    final BoxDecoration decoration = BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(45)),
      border: Border.all(color: themeData.primaryColor, width: 2),
      color: themeData.primaryColor,
    );

    return Container(
      decoration: decoration,
      margin: const EdgeInsets.all(7),
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 20, right: 0),
        leading: Text(
          number.toString(),
          style: textStyle,
        ),
        title: Text(
          ingredientModel.name,
          style: textStyle,
          textAlign: TextAlign.center,
        ),
        trailing: SizedBox(
          width: 90,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ('${ingredientModel.count} ${ingredientModel.unit}.'),
                style: textStyle,
              ),
              IconButton(
                  onPressed: () {
                    RepositoryProvider.of<IngredientRep>(context)
                        .remove(ingredientModel);
                    BlocProvider.of<IngredientCubit>(context).loadIngredient();
                  },
                  icon: SvgPicture.asset(
                    "assets/images/cross.svg",
                    width: 20,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
