import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key, required this.text, this.onTap, this.width, this.height});

  final String text;
  final Function()? onTap;
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    final ButtonStyle buttonStyle = ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(themeData.colorScheme.primary),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(45),
        ),
      ),
    );

    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onTap,
        style: buttonStyle,
        child: Text(
          text,
          style: themeData.primaryTextTheme.bodyMedium,
        ),
      ),
    );
  }
}
