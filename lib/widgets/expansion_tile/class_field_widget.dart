import 'package:flutter/material.dart';

import '../../data/expansion_tile/constants.dart';
import 'field_widget.dart';

//виджет, отображающий одно свойство класса
//поле ввода для него отображает виджет FieldWidget

class ClassFieldWidget extends StatelessWidget {
  String title;
  String value;
  bool bigField;
  ClassFieldWidget({super.key, required this.title, required this.value, this.bigField = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          right: sidePadding, left: sidePadding, bottom: 12, top: 18),
      margin: EdgeInsets.only(
          top: 5, bottom: 5, right: indentationRight, left: indentationLeft),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: nodeColor,
      ),
      child: FieldWidget(title: title, value: value, bigField: bigField),
    );
  }
}
