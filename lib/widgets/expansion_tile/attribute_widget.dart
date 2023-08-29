import 'package:flutter/material.dart';

import '../../data/data.dart';
import '../../data/expansion_tile/constants.dart';
import '../../data/expansion_tile/trash_icon_icons.dart';
import 'field_widget.dart';

//виджет, отображающий одно свойство
//поля ввода для него отображает виджет FieldWidget

class AttributeWidget extends StatefulWidget {
  String title;
  VoidCallback onDelete;

  AttributeWidget({super.key, required this.title, required this.onDelete});

  @override
  State<AttributeWidget> createState() => _AttributeWidgetState();
}

class _AttributeWidgetState extends State<AttributeWidget> {
  bool isExpanded = false;
  String shownTitle = '';

  @override
  void initState() {
    super.initState();
    shownTitle = widget.title;
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      padding: EdgeInsets.only(left: indentationLeft, right: indentationRight),
      //ListTileTheme нужна чтобы убрать зазор между title и children у ExpansionTile
      child: ListTileTheme(
        minVerticalPadding: 0,
        contentPadding: EdgeInsets.zero,
        dense: true,
        child: ExpansionTile(
          onExpansionChanged: (value) {
            setState(() {
              isExpanded = value;
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
          title: _qualityTitle(shownTitle, isExpanded),
          children: [
            Container(
              margin: EdgeInsets.only(left: indentationLeft),
              padding: EdgeInsets.only(left: sidePadding, right: sidePadding),
              color: nodeColor,
              child: Column(
                children: [
                  Container(
                    height: 1,
                    color: dividerColor,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 8, bottom: 10),
                    child: SizedBox(
                      height: fieldHeight,
                      child: TextField(
                        onChanged: (value) => setState(() {
                          shownTitle = value;
                        }),
                        controller: TextEditingController()
                          ..text = shownTitle,
                        style: inter14,
                        decoration: fieldDecoration,
                      ),
                    ),
                  ),
                  for (var el in attributeData) FieldWidget(title: el),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 7.0, bottom: 17.0),
                      child: _deleteIconButton(widget.title),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _deleteIconButton(String el) {
    return IconButton(
      icon: Icon(
        TrashIcon.curved_trash,
        color: buttonColor,
      ),
      onPressed: () {
        _deleteQuality(el);
        setState(() {});
      },
    );
  }

  void _deleteQuality(String quality) {
    widget.onDelete();
  }

  Widget _qualityTitle(String title, bool isExpanded) {
    return Container(
      height: 54,
      margin: const EdgeInsets.only(left: 5),
      padding: EdgeInsets.only(
          left: sidePadding, bottom: 17, top: 17),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: radius,
          topRight: radius,
        ),
        color: nodeColor,
      ),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: helvetica16,
          ),
        ],
      ),
    );
  }
}
