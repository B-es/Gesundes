import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/button.dart';
import '../../common/input.dart';
import 'widgets/oauth2.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    const double inputLen = 300;

    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        SvgPicture.asset('assets/images/cake.svg'),
        const SizedBox(
          height: 30,
        ),
        const SizedBox(
          height: 30,
        ),
        const Input(
          hint: "Почта...",
          width: inputLen,
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(
          height: 30,
        ),
        const Input(
          hint: "Пароль...",
          width: inputLen,
          obscureText: true,
        ),
        const SizedBox(
          height: 40,
        ),
        const Button(
          text: "Войти",
          width: inputLen,
          height: 50,
        ),
        const SizedBox(
          height: 30,
        ),
        const OAuth2()
      ],
    );
  }
}