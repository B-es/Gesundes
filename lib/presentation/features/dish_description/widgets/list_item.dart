import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.text,
    required this.isEnough,
    required this.count,
    required this.unit,
  });

  final String text, unit;
  final bool isEnough;
  final int count;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return ListTile(
      textColor: themeData.primaryColor,
      iconColor: isEnough ? Colors.green : Colors.orange,
      leading: const Icon(
        Icons.donut_small_rounded,
      ),
      title: Text(
        text,
        style: themeData.textTheme.bodyMedium,
      ),
      trailing: Text(
        "$count $unit.",
        style: themeData.textTheme.bodyMedium,
      ),
    );
  }
}
