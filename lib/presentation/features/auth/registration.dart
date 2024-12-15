import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gesundes/presentation/common/button.dart';
import 'package:gesundes/presentation/common/input.dart';
import 'package:gesundes/presentation/features/auth/widgets/oauth2.dart';
import 'package:gesundes/presentation/features/main_screen/main_screen.dart';
import 'package:gesundes/presentation/features/parameters_input/parameters_input.dart';

class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    const double inputLen = 300;

    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        SvgPicture.asset('assets/images/cherries.svg'),
        const SizedBox(
          height: 30,
        ),
        const Input(
          hint: "Имя...",
          width: inputLen,
          keyboardType: TextInputType.name,
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
          height: 30,
        ),
        const Input(
          hint: "Повторите пароль...",
          width: inputLen,
          obscureText: true,
        ),
        const SizedBox(
          height: 40,
        ),
        Button(
          text: "Зарегистрировать",
          width: inputLen,
          height: 50,
          onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (_) => const ParametersInput(
                        withArrow: false,
                        toMain: true,
                      ))),
        ),
        const SizedBox(
          height: 30,
        ),
        const OAuth2()
      ],
    );
  }
}
