import 'package:flutter/material.dart';

class TabCustom extends StatelessWidget {
  const TabCustom({
    super.key,
    required this.text,
    this.isActive = false,
    this.width,
    this.height,
  });

  final String text;
  final bool isActive;
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Tab(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          color: isActive ? themeData.primaryColor : themeData.disabledColor,
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: themeData.primaryTextTheme.bodyMedium,
        ),
      ),
    );
  }
}
