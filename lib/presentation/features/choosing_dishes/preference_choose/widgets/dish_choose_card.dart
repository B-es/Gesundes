import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gesundes/api/models/dish_model.dart';

class DishChooseCard extends StatelessWidget {
  const DishChooseCard({
    super.key,
    required this.dish,
  });

  final DishModel dish;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final BoxDecoration decoration = BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(20.38)),
      border: Border.all(
        color: themeData.primaryColor,
        width: 2,
      ),
      color: Colors.transparent,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: Container(
        decoration: decoration,
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(children: [
              Row(
                //mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 100,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(9.37)),
                        child: Image.asset(
                          dish.img,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned.fill(
                bottom: -3,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      decoration:
                          decoration.copyWith(color: themeData.primaryColor),
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        dish.name,
                        style: themeData.textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                        ),
                      )),
                ),
              )
            ]),
            SizedBox(
              height: 35,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Подробнее",
                  style: themeData.textTheme.bodyMedium?.copyWith(
                    color: themeData.disabledColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              child: Divider(
                color: themeData.primaryColor,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    dish.description,
                    textAlign: TextAlign.start,
                    maxLines: 11,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
