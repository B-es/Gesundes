import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gesundes/presentation/common/appbar_custom.dart';
import 'package:gesundes/presentation/common/button.dart';
import 'package:gesundes/presentation/common/dropdown.dart';
import 'package:gesundes/presentation/common/input.dart';
import 'package:gesundes/presentation/common/multiply_dropdown.dart';

class ParametersInput extends StatelessWidget {
  const ParametersInput({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    const double inputLen = 300;
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
          "введите параметры организма".toUpperCase(),
          style: themeData.textTheme.titleMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Input(
                hint: "Вес...",
                width: inputLen,
                keyboardType: TextInputType.number,
                inputForamtters: [
                  FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                  TextInputFormatter.withFunction((oldValue, newValue) {
                    final text = newValue.text;
                    return text.isEmpty
                        ? newValue
                        : double.tryParse(text) == null
                            ? oldValue
                            : newValue;
                  }),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Input(
                  hint: "Рост...",
                  width: inputLen,
                  keyboardType: TextInputType.number,
                  inputForamtters: [
                    FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                    TextInputFormatter.withFunction((oldValue, newValue) {
                      final text = newValue.text;
                      return text.isEmpty
                          ? newValue
                          : double.tryParse(text) == null
                              ? oldValue
                              : newValue;
                    }),
                  ]),
              const SizedBox(
                height: 20,
              ),
              Input(
                hint: "Возраст...",
                width: inputLen,
                keyboardType: TextInputType.number,
                inputForamtters: [
                  FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                  TextInputFormatter.withFunction((oldValue, newValue) {
                    final text = newValue.text;
                    return text.isEmpty
                        ? newValue
                        : double.tryParse(text) == null
                            ? oldValue
                            : newValue;
                  }),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const DropDown(
                items: ["Мужской", "Женский"],
                initValue: "Пол",
              ),
              const SizedBox(
                height: 20,
              ),
              const DropDown(
                items: ["Мужской", "Женский"],
                initValue: "Хронические заболевания",
              ),
              const SizedBox(
                height: 20,
              ),
              DropDownMultiply(
                listOFStrings: ["Мужской", "Женский"],
                selectedList: (List<String> p0) {},
                initValue: "Аллергия",
              ),
              const SizedBox(
                height: 20,
              ),
              DropDownMultiply(
                listOFStrings: ["Мужской", "Женский", '1', '2', '4'],
                selectedList: (List<String> p0) {},
                initValue: "Предпочитаемые продукты",
              ),
              const SizedBox(
                height: 50,
              ),
              const Button(
                text: "Сохранить",
                width: inputLen,
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
