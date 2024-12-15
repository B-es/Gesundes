import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gesundes/presentation/common/appbar_custom.dart';
import 'package:gesundes/presentation/common/button.dart';
import 'package:gesundes/presentation/common/card_button.dart';
import 'package:gesundes/presentation/common/label.dart';
import 'package:gesundes/presentation/common/recommendation.dart';
import 'package:gesundes/presentation/features/auth/auth.dart';
import 'package:gesundes/presentation/features/ingredient_list/ingredient_list.dart';
import 'package:gesundes/presentation/features/parameters_input/parameters_input.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBarCustom(
        toolbarHeight: 50,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
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
          "профиль".toUpperCase(),
          style: themeData.textTheme.titleMedium,
        ),
      ),
      body: Center(
        child: RawScrollbar(
          thumbColor: themeData.primaryColor.withAlpha(100),
          thumbVisibility: true,
          trackVisibility: true,
          thickness: 5,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Label(
                  text: "Имя: Влан Наганов",
                  width: 300,
                  padding: EdgeInsets.all(8),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Label(
                  text: "Почта: vlan.hairlover@misako.jp",
                  width: 300,
                  padding: EdgeInsets.all(8),
                ),
                const SizedBox(
                  height: 3,
                ),
                const Recommendation(),
                CardButton(
                  icon: SvgPicture.asset("assets/images/input.svg"),
                  title: "Ввод ингредиентов",
                  subtitle:
                      "Здесь вы можете ввести имеющиеся у вас ингредиенты для подбора и подсказок.",
                  width: 300,
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => IngredientList())),
                ),
                CardButton(
                  icon: SvgPicture.asset("assets/images/export.svg"),
                  title: "Экспорт блюд",
                  subtitle:
                      "Здесь вы сможете экспортировать блюда в удобном вам виде: pdf, txt, md.",
                  width: 300,
                ),
                CardButton(
                  icon: SvgPicture.asset("assets/images/book.svg"),
                  title: "Параметры",
                  subtitle:
                      "Здесь вы сможете изменить свои параметры организма.",
                  width: 300,
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const ParametersInput())),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Button(
                    text: "Выйти",
                    width: 300,
                    height: 50,
                    onTap: () => Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => const Auth())),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
