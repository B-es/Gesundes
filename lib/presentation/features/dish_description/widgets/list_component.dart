import 'package:flutter/material.dart';

class ListComponent extends StatelessWidget {
  const ListComponent({
    super.key,
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final BoxDecoration decoration = BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(20.38)),
      border: Border.all(color: themeData.primaryColor, width: 2),
      color: Colors.white,
    );
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: decoration,
      child: Column(
        children: [
          Text(
            title,
            style: themeData.textTheme.titleMedium,
          ),
          SizedBox(
            width: width - 40,
            child: Divider(
              color: themeData.primaryColor,
            ),
          ),
          ...children
        ],
      ),
    );
  }
}
