import 'package:flutter/material.dart';
import 'package:gesundes/api/models/dish_model.dart';
import 'package:gesundes/presentation/common/appbar_custom.dart';
import 'package:gesundes/presentation/common/star_dish_card.dart';

class Finded extends StatelessWidget {
  const Finded({super.key, required this.dishes});

  final List<DishModel> dishes;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBarCustom(
        withArrow: true,
        toolbarHeight: 80,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Column(
            children: [
              SizedBox(
                width: width - 40,
                child: Divider(
                  color: themeData.primaryColor,
                ),
              ),
            ],
          ),
        ),
        title: Text(
          softWrap: true,
          overflow: TextOverflow.clip,
          textAlign: TextAlign.center,
          "найденные блюда".toUpperCase(),
          style: themeData.textTheme.titleMedium,
        ),
      ),
      body: ListView.separated(
          controller: ScrollController(),
          itemBuilder: (ctx, i) => StarDishCard(dish: dishes[i]),
          separatorBuilder: (ctx, i) => const SizedBox(
                height: 5,
              ),
          itemCount: dishes.length),
    );
  }
}
