import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gesundes/presentation/common/appbar_custom.dart';
import 'package:gesundes/presentation/common/card_button.dart';
import 'package:gesundes/presentation/common/recommendation.dart';
import 'package:gesundes/presentation/features/choosing_dishes/ingredient_choose/ingredient_choose.dart';
import 'package:gesundes/presentation/features/choosing_dishes/preference_choose/preference_choose.dart';

class ChoosingDishes extends StatelessWidget {
  const ChoosingDishes({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBarCustom(
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
          "выбор блюд".toUpperCase(),
          style: themeData.textTheme.titleMedium,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CardButton(
              icon: SvgPicture.asset("assets/images/compas.svg"),
              title: "По предпочтениям",
              subtitle: "Пройдите простой опрос и получите рекомендацию",
              width: 300,
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const PreferenceChoose())),
            ),
            CardButton(
              icon: SvgPicture.asset("assets/images/edit.svg"),
              title: "По ингредиентам",
              subtitle: "Введите имеющиеся ингредиенты и получите рекомендацию",
              width: 300,
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const IngredientChoose())),
            ),
            CardButton(
              icon: SvgPicture.asset("assets/images/book.svg"),
              title: "По библиотеке",
              subtitle:
                  "Найдите интересующие вас блюда с помощью поиска по библиотеке блюд",
              width: 300,
            ),
            const Recommendation(),
          ],
        ),
      ),
    );
  }
}
