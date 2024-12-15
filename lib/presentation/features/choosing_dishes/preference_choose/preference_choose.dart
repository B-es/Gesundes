import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gesundes/presentation/common/appbar_custom.dart';
import 'package:gesundes/presentation/common/choice_button.dart';
import 'package:gesundes/presentation/features/choosing_dishes/preference_choose/cubit/cubit/preference_cubit.dart';
import 'package:gesundes/presentation/features/choosing_dishes/preference_choose/widgets/dish_choose_card.dart';
import 'package:gesundes/presentation/features/finded/finded.dart';
import 'package:gesundes/presentation/features/library/library.dart';

class PreferenceChoose extends StatelessWidget {
  const PreferenceChoose({super.key});

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
          "выбор по предпочтениям".toUpperCase(),
          style: themeData.textTheme.titleMedium,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocConsumer<PreferenceCubit, PreferenceState>(
              listener: (context, state) {
                if (state is PreferenceAll) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => Finded(dishes: state.dishes)));
                }
              },
              builder: (context, state) {
                if (state is PreferenceOne) {
                  return DishChooseCard(
                    dish: state.dish,
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            SizedBox(
              height: 100,
            ),
            SizedBox(
              width: 380,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ChoiceButton(
                    text: "Подходит",
                    icon: Icons.add,
                    color: themeData.primaryColor,
                    width: 170,
                    onTap: () =>
                        BlocProvider.of<PreferenceCubit>(context).next(true),
                  ),
                  ChoiceButton(
                    text: "Не подходит",
                    icon: Icons.add,
                    color: themeData.disabledColor,
                    width: 170,
                    onTap: () =>
                        BlocProvider.of<PreferenceCubit>(context).next(false),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
