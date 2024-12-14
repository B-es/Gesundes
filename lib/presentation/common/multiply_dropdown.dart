// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DropDownMultiply extends StatefulWidget {
  final Function(List<String>) selectedList;
  final List<String> listOFStrings;
  final String initValue;

  const DropDownMultiply({
    super.key,
    required this.selectedList,
    required this.listOFStrings,
    required this.initValue,
  });

  @override
  createState() {
    return _DropDownMultiplyState();
  }
}

class _DropDownMultiplyState extends State<DropDownMultiply> {
  List<String> selectedItems = [];
  String selectedText = "";

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    final BoxDecoration boxDecoration = BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(45)),
      border: Border.all(color: Theme.of(context).primaryColor, width: 2),
    );

    return Container(
      width: 300,
      decoration: boxDecoration,
      alignment: Alignment.center,
      child: ExpansionTile(
        collapsedBackgroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        iconColor: Colors.white,
        expandedAlignment: Alignment.center,
        expandedCrossAxisAlignment: CrossAxisAlignment.center,
        leading: Icon(
          Icons.keyboard_arrow_down,
          color: themeData.primaryColor,
          size: 30,
        ),
        shape: Border.all(color: Colors.transparent),
        title: Text(
          selectedItems.isEmpty ? widget.initValue : selectedItems.join(', '),
          style: themeData.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        subtitle: selectedItems.isNotEmpty
            ? Text(
                widget.initValue,
                style: themeData.textTheme.bodyMedium?.copyWith(
                  fontSize: 12,
                  color: themeData.disabledColor,
                ),
                textAlign: TextAlign.center,
              )
            : null,
        children: <Widget>[
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.listOFStrings.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 8.0),
                child: _ViewItem(
                    item: widget.listOFStrings[index],
                    selected: (val) {
                      selectedText = val;
                      if (selectedItems.contains(val)) {
                        selectedItems.remove(val);
                      } else {
                        selectedItems.add(val);
                      }
                      widget.selectedList(selectedItems);
                      setState(() {});
                    },
                    itemSelected:
                        selectedItems.contains(widget.listOFStrings[index])),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ViewItem extends StatelessWidget {
  final String item;
  final bool itemSelected;
  final Function(String) selected;

  const _ViewItem({
    required this.item,
    required this.itemSelected,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    return Padding(
      padding:
          EdgeInsets.only(left: size.width * .032, right: size.width * .098),
      child: Row(
        children: [
          SizedBox(
            height: 30.0,
            width: 50.0,
            child: Checkbox(
              side: BorderSide(color: themeData.primaryColor, width: 1),
              value: itemSelected,
              onChanged: (val) {
                selected(item);
              },
              activeColor: Colors.white,
            ),
          ),
          SizedBox(
            width: size.width * .025,
          ),
          Text(
            item,
            style: themeData.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
