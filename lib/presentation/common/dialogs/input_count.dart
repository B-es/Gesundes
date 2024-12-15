import 'package:flutter/material.dart';
import 'package:gesundes/presentation/common/button.dart';
import 'package:gesundes/presentation/common/dropdown.dart';
import 'package:gesundes/presentation/common/plus_minus.dart';

class InputCount extends StatelessWidget {
  const InputCount({super.key, this.onTap});

  final Function(String, int)? onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final BoxDecoration decoration = BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(20.38)),
      border: Border.all(
        color: themeData.primaryColor,
        width: 2,
      ),
      color: Colors.white,
    );

    ValueNotifier<int> countNotif = ValueNotifier(0);
    ValueNotifier<String> nameNotif = ValueNotifier("");

    return Dialog(
      child: IntrinsicHeight(
        child: Container(
          decoration: decoration,
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropDown(
                items: [
                  'Чечевица',
                  'Вода',
                  'Лук репчатый',
                  'Морковь',
                  'Куриное филе',
                  'Брокколи',
                  'Цветная капуста',
                  'Оливковое масло'
                ],
                initValue: "Название",
                width: 250,
                height: 50,
                notif: nameNotif,
              ),
              SizedBox(
                height: 25,
              ),
              PlusMinus(initValue: 1, notif: countNotif),
              SizedBox(
                height: 25,
              ),
              Button(
                text: "Добавить",
                width: 250,
                height: 50,
                onTap: () => onTap != null && nameNotif.value != ''
                    ? onTap!(nameNotif.value, countNotif.value)
                    : () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
