import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gesundes/presentation/features/choosing_dishes/choosing_dishes.dart';
import 'package:gesundes/presentation/features/favorite/favorite.dart';
import 'package:gesundes/presentation/features/library/library.dart';
import 'package:gesundes/presentation/features/profile/profile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final List<Widget> pages;
  int _selectedIndex = 0;

  @override
  void initState() {
    pages = [Profile(), ChoosingDishes(), Library(), Favorite()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 10,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: themeData.primaryColor,
        items: <BottomNavigationBarItem>[
          NavigatorItem(
            name: "profile",
            activeColor: Colors.white,
            disabledColor: themeData.disabledColor,
          ),
          NavigatorItem(
            name: "main",
            activeColor: Colors.white,
            disabledColor: themeData.disabledColor,
          ),
          NavigatorItem(
            name: "library",
            activeColor: Colors.white,
            disabledColor: themeData.disabledColor,
          ),
          NavigatorItem(
            name: "favorite",
            activeColor: Colors.white,
            disabledColor: themeData.disabledColor,
          ),
        ],
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class NavigatorItem extends BottomNavigationBarItem {
  NavigatorItem({
    super.key,
    required String name,
    required Color activeColor,
    required Color disabledColor,
  }) : super(
          icon:
              ImgIconBar(path: "assets/images/$name.svg", color: disabledColor),
          activeIcon:
              ImgIconBar(path: "assets/images/$name.svg", color: activeColor),
          label: name,
        );
}

class ImgIconBar extends StatelessWidget {
  const ImgIconBar({super.key, required this.path, required this.color});

  final String path;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(60)),
          border: Border.all(color: color)),
      child: SvgPicture.asset(
        path,
        width: 15,
        color: color,
      ),
    );
  }
}
