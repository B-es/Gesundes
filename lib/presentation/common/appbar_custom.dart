import 'package:flutter/material.dart';

import 'back_arrow.dart';

class AppBarCustom extends AppBar {
  AppBarCustom({super.key, final Widget? title, final PreferredSize? bottom})
      : super(
            leading: BackArrow(),
            centerTitle: true,
            title: title,
            toolbarHeight: 100,
            bottom: bottom,
            actions: [
              SizedBox(
                width: 50,
              )
            ]);
}
