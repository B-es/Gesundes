import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  const Label({
    super.key,
    required this.text,
    this.width,
    this.height,
    this.align,
  });

  final String text;
  final double? width, height;
  final Alignment? align;

  @override
  Widget build(BuildContext context) {
    final BoxDecoration decoration = BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(20.38)),
      border: Border.all(color: Theme.of(context).primaryColor, width: 2),
    );

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: decoration,
      width: width,
      height: height,
      alignment: align,
      child: Text(
        style: Theme.of(context).textTheme.bodyMedium,
        text,
      ),
    );
  }
}
