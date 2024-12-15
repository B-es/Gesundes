import 'package:flutter/material.dart';
import 'package:gesundes/presentation/features/main_screen/main_screen.dart';

class OAuth2 extends StatelessWidget {
  const OAuth2({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: InkWell(
            child: Image.asset('assets/images/vk.png'),
            onTap: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const MainScreen())),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: InkWell(
            child: Image.asset('assets/images/ya.png'),
            onTap: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const MainScreen())),
          ),
        ),
      ],
    );
  }
}
