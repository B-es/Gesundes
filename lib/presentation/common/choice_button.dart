import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  const ChoiceButton({
    super.key,
    required this.text,
    required this.icon,
    required this.color,
    this.width,
  });

  final String text;
  final IconData icon;
  final Color color;
  final double? width;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    final BoxDecoration decoration = BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(20.38)),
      border: Border.all(color: Theme.of(context).primaryColor, width: 2),
      color: color,
    );

    return Container(
      width: width,
      decoration: decoration,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Icon(icon, size: 35, color: Colors.white),
          Text(
            text,
            style: themeData.primaryTextTheme.bodyMedium?.copyWith(
              fontSize: 25,
            ),
          )
        ]),
      ),
    );
  }
}
