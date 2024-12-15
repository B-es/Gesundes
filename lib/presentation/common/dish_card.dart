import 'package:flutter/material.dart';

class DishCard extends StatelessWidget {
  const DishCard({
    super.key,
    required this.title,
    required this.img,
    required this.icon,
    this.tapDetail,
  });

  final String title, img;
  final Widget icon;
  final Function()? tapDetail;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final BoxDecoration decoration = BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(20.38)),
      border: Border.all(
        color: themeData.primaryColor,
        width: 2,
      ),
      color: themeData.primaryColor,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: Container(
        decoration: decoration,
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: themeData.primaryTextTheme.bodyMedium,
                    ),
                  ),
                  icon,
                ],
              ),
            ),
            Stack(children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 100,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(9.37)),
                        child: Image.asset(
                          img,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned.fill(
                bottom: -10,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    onPressed: tapDetail,
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(themeData.primaryColor)),
                    child: Text(
                      "Подробнее",
                      style: themeData.textTheme.bodyMedium?.copyWith(
                        color: themeData.disabledColor,
                      ),
                    ),
                  ),
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
