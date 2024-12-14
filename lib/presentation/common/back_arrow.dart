import 'package:flutter/material.dart';

class BackArrow extends StatelessWidget {
  const BackArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.arrow_back,
      color: Theme.of(context).primaryColor,
    );
  }
}
