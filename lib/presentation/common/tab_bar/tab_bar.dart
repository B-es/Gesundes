import 'package:flutter/material.dart';

import 'widgets/tab.dart';

class TabBarCustom extends StatefulWidget implements PreferredSizeWidget {
  const TabBarCustom({super.key, required this.tabNames, this.controller});

  final List<String> tabNames;
  final TabController? controller;

  @override
  State<TabBarCustom> createState() => _TabBarCustomState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _TabBarCustomState extends State<TabBarCustom> {
  late final TabController? _controller;
  late final List<TabCustom> tabs;

  @override
  void initState() {
    _controller = widget.controller;
    tabs = [
      TabCustom(
        text: widget.tabNames[0],
        isActive: true,
      ),
      for (int i = 1; i < widget.tabNames.length; i++)
        TabCustom(
          text: widget.tabNames[i],
        )
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      splashFactory: NoSplash.splashFactory,
      automaticIndicatorColorAdjustment: false,
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
      indicatorColor: Colors.transparent,
      onTap: switchTab,
      tabs: tabs,
      controller: _controller,
    );
  }

  TabCustom generateNewTab(TabCustom tab, bool isActive) {
    return TabCustom(
      text: tab.text,
      isActive: isActive,
      width: tab.width,
      height: tab.height,
    );
  }

  void switchTab(final int index) {
    print(index);
    tabs[index] = generateNewTab(tabs[index], true);

    for (int i = 0; i < tabs.length; i++) {
      if (index != i) tabs[i] = generateNewTab(tabs[i], false);
    }

    setState(() {});
  }
}
