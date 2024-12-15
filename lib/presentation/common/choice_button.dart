import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  const ChoiceButton({
    super.key,
    required this.text,
    required this.icon,
    required this.color,
    this.width,
    this.height,
    this.onTap,
  });

  final String text;
  final IconData icon;
  final Color color;
  final Function()? onTap;
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    final BoxDecoration decoration = BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(20.38)),
      border: Border.all(color: color, width: 2),
      color: color,
    );

    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(8.0),
        decoration: decoration,
        child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, size: 35, color: Colors.white),
              Expanded(
                child: Text(
                  text,
                  textAlign: TextAlign.end,
                  softWrap: true,
                  style: themeData.primaryTextTheme.bodyMedium?.copyWith(
                    fontSize: 16,
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
