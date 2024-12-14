import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gesundes/presentation/common/input.dart';

class PlusMinus extends StatefulWidget {
  const PlusMinus({super.key, required this.initValue});

  final int initValue;

  @override
  State<PlusMinus> createState() => _PlusMinusState();
}

class _PlusMinusState extends State<PlusMinus> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.initValue.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return SizedBox(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed: add,
              icon: Icon(
                Icons.add,
                color: themeData.primaryColor,
                size: 50,
              )),
          Input(
            hint: '...',
            controller: _controller,
            width: 100,
            align: TextAlign.center,
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
              signed: false,
            ),
            inputForamtters: [
              FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
              TextInputFormatter.withFunction((oldValue, newValue) {
                final text = newValue.text;
                return text.isEmpty
                    ? newValue
                    : double.tryParse(text) == null
                        ? oldValue
                        : newValue;
              }),
            ],
          ),
          IconButton(
              onPressed: sub,
              icon: Icon(
                Icons.remove,
                color: themeData.primaryColor,
                size: 50,
              ))
        ],
      ),
    );
  }

  void add() {
    setState(() {
      _controller.text = (int.parse(_controller.text) + 1).toString();
    });
  }

  void sub() {
    if (_controller.text != '0') {
      setState(() {
        _controller.text = (int.parse(_controller.text) - 1).toString();
      });
    }
  }
}
