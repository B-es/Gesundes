import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  const Label({
    super.key,
    required this.text,
    this.width,
    this.height,
    this.align,
    this.padding,
  });

  final String text;
  final double? width, height;
  final Alignment? align;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final BoxDecoration decoration = BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      border: Border.all(color: Theme.of(context).primaryColor, width: 2),
    );

    return Container(
      decoration: decoration,
      width: width,
      height: height,
      alignment: align,
      padding: padding,
      child: Text(
        style: Theme.of(context).textTheme.bodyMedium,
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
