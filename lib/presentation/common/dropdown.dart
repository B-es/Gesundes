import 'dart:ffi';

import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown({
    super.key,
    required this.items,
    required this.initValue,
    this.notif,
    this.width = 300,
    this.height = 60,
  });

  final List<String> items;
  final String initValue;
  final double width, height;
  final ValueNotifier<String>? notif;

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  late final List<String> items;
  late String dropdownValue;
  bool isFirst = true;
  @override
  void initState() {
    items = widget.items;
    dropdownValue = items.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    final InputDecoration decoration = InputDecoration(
      fillColor: themeData.primaryColor,
      focusColor: themeData.primaryColor,
    );

    final BoxDecoration boxDecoration = BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(45)),
        border: Border.all(color: Theme.of(context).primaryColor, width: 2),
        color: themeData.primaryColor);

    return Container(
      decoration: boxDecoration,
      width: widget.width,
      height: widget.height,
      alignment: Alignment.center,
      child: DropdownButtonFormField<String>(
        decoration: decoration,
        value: dropdownValue,
        alignment: Alignment.center,
        dropdownColor: themeData.primaryColor,
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: Colors.white,
        ),
        iconSize: 30,
        style: themeData.primaryTextTheme.bodyMedium,
        onChanged: (String? value) {
          setState(() {
            dropdownValue = value!;
            widget.notif?.value = value;
          });
        },
        isDense: true,
        isExpanded: true,
        selectedItemBuilder: isFirst
            ? (context) {
                isFirst = false;
                return [
                  DropdownMenuItem<String>(
                    value: dropdownValue,
                    alignment: Alignment.center,
                    child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          widget.initValue,
                          textAlign: TextAlign.center,
                        )),
                  )
                ];
              }
            : (context) => items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    alignment: Alignment.center,
                    child: Container(
                        alignment: Alignment.center, child: Text(value)),
                  );
                }).toList(),
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            alignment: Alignment.center,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
