import 'package:flutter/material.dart';

import 'back_arrow.dart';

class AppBarCustom extends AppBar {
  AppBarCustom({
    super.key,
    super.title,
    PreferredSize? super.bottom,
    double super.toolbarHeight = 50,
    bool withArrow = false,
  }) : super(
            leading: withArrow
                ? const BackArrow()
                : const SizedBox(
                    width: 50,
                  ),
            centerTitle: true,
            actions: [
              const SizedBox(
                width: 50,
              )
            ]);
}
