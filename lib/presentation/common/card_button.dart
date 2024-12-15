import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardButton extends StatelessWidget {
  const CardButton({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.width,
    this.height,
    this.onTap,
  });

  final Widget icon;
  final String title;
  final String subtitle;
  final double? width, height;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    final BoxDecoration decoration = BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(24)),
      border: Border.all(color: themeData.primaryColor, width: 2),
      color: themeData.primaryColor,
    );

    return InkWell(
      onTap: onTap,
      child: Container(
          width: width,
          height: height,
          decoration: decoration,
          margin: const EdgeInsets.all(7),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  icon,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: themeData.primaryTextTheme.bodyMedium,
                      //textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      textAlign: TextAlign.start,
                      subtitle,
                      softWrap: true,
                      style: themeData.primaryTextTheme.bodyMedium?.copyWith(
                          color: themeData.disabledColor, fontSize: 11.2),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
