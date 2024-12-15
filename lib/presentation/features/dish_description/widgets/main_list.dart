import 'package:flutter/material.dart';

class MainList extends StatelessWidget {
  const MainList({
    super.key,
    required this.children,
    required this.title,
  });

  final List<Widget> children;
  final String title;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return ExpansionTile(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      collapsedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),

      //backgroundColor: themeData.primaryColor,
      collapsedBackgroundColor: themeData.primaryColor,
      title: Text(title),
      children: children,
    );
  }
}
