import 'package:flutter/material.dart';

class OAuth2 extends StatelessWidget {
  const OAuth2({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset('assets/images/vk.png'),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset('assets/images/ya.png'),
        ),
      ],
    );
  }
}
