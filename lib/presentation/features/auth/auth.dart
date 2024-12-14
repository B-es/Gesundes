import 'package:flutter/material.dart';
import 'package:gesundes/presentation/common/tab_bar/tab_bar.dart';
import 'package:gesundes/presentation/features/auth/login.dart';
import 'package:gesundes/presentation/features/auth/registration.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBarCustom(tabNames: [
            'Регистрация',
            'Авторизация',
          ]),
        ),
        body: TabBarView(
          children: [Registration(), Login()],
        ),
      ),
    );
  }
}
