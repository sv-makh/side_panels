import 'package:flutter/material.dart';
import 'package:side_panels/data/expansion_tile/attribute_model.dart';
import 'package:side_panels/data/expansion_tile/property_type.dart';
import 'package:side_panels/widgets/expansion_tile/delete_icon.dart';

import '../../data/data.dart';
import '../../data/expansion_tile/constants.dart';
import 'field_widget.dart';

//виджет, отображающий одно свойство
//поля ввода для него отображает виджет FieldWidget

class AttributeWidget extends StatefulWidget {
  AttributeModel attribute;
  VoidCallback onDelete;

  AttributeWidget({super.key, required this.attribute, required this.onDelete});

  @override
  State<AttributeWidget> createState() => _AttributeWidgetState();
}

class _AttributeWidgetState extends State<AttributeWidget> {
  bool isExpanded = false;
  String shownTitle = '';

  @override
  void initState() {
    super.initState();
    shownTitle = widget.attribute.name ?? '';
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
          iconColor: iconColor,
          collapsedIconColor: iconColor,
          onExpansionChanged: (value) {
            setState(() {
              isExpanded = value;
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
          title: _attributeTitle(shownTitle, isExpanded),
          children: [
            Container(
              margin: EdgeInsets.only(left: indentationLeft - 9),
              padding: EdgeInsets.only(left: sidePadding, right: sidePadding),
              color: nodeColor,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 2, bottom: 10),
                    child: SizedBox(
                      height: fieldHeight,
                      child: TextField(
                        onChanged: (value) => setState(() {
                          shownTitle = value;
                        }),
                        controller: TextEditingController()..text = shownTitle,
                        style: inter14,
                        decoration: fieldDecoration,
                      ),
                    ),
                  ),
                  FieldWidget(title: 'ID', value: widget.attribute.id ?? ''),
                  FieldWidget(
                    title: 'Тип',
                    value: (widget.attribute.type == null)
                        ? PropertyType.string.name
                        : widget.attribute.type!.name,
                    propertyType: true,
                  ),
                  FieldWidget(
                      title: 'Формат', value: widget.attribute.format ?? ''),
                  FieldWidget(
                      title: 'Пример', value: widget.attribute.example ?? ''),
                  FieldWidget(
                    title: 'Значимость',
                    value: widget.attribute.importance == null
                        ? ''
                        : widget.attribute.importance!.toString(),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 7.0, bottom: 17.0),
                      child: _buttonDeleteAttribute(widget.attribute),
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

  Widget _buttonDeleteAttribute(AttributeModel el) {
    return IconButton(
      icon: DeleteIcon(),
      onPressed: () {
        _deleteAttribute(el);
        setState(() {});
      },
    );
  }

  void _deleteAttribute(AttributeModel el) {
    widget.onDelete();
  }

  Widget _attributeTitle(String title, bool isExpanded) {
    return Container(
      height: 54,
      margin: const EdgeInsets.only(left: 5),
      padding: EdgeInsets.only(left: sidePadding, top: 17),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: radius,
          topRight: radius,
        ),
        color: nodeColor,
      ),
      child: Container(
        margin: EdgeInsets.only(right: sidePadding, bottom: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
                color: isExpanded ? dividerColor : Colors.transparent),
          ),
        ),
        child: Text(
          title,
          style: helvetica16,
        ),
      ),
    );
  }
}
