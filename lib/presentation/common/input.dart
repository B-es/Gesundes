import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  const Input({
    super.key,
    required this.hint,
    this.width,
    this.height,
    this.controller,
    this.align,
    this.keyboardType,
    this.inputForamtters,
    this.obscureText = false,
  });

  final String hint;
  final double? width, height;
  final TextEditingController? controller;
  final TextAlign? align;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputForamtters;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    final InputDecoration decoration = InputDecoration(
      hintText: hint,
    );

    return SizedBox(
      width: width,
      height: height,
      child: TextField(
        obscureText: obscureText,
        inputFormatters: inputForamtters,
        keyboardType: keyboardType,
        textAlign: align ?? TextAlign.start,
        controller: controller,
        decoration: decoration,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
