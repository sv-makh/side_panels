import 'package:flutter/material.dart';
import 'package:multi_split_view/multi_split_view.dart';

//import 'package:side_panels/data/data.dart';
import 'package:side_panels/data/expansion_tile/attribute_model.dart';
import 'package:side_panels/data/expansion_tile/data.dart';
import 'package:side_panels/widgets/expansion_tile/class_widget.dart';
import 'package:side_panels/widgets/expansion_tile/delete_icon.dart';

import '../../data/expansion_tile/class_model.dart';
import '../../data/expansion_tile/constants.dart';
import '../../data/expansion_tile/property_type.dart';
import '../../widgets/expansion_tile/attribute_widget.dart';

class DefaultPage1 extends StatefulWidget {
  const DefaultPage1({super.key});

  @override
  State<DefaultPage1> createState() => _DefaultPage1State();
}

class _DefaultPage1State extends State<DefaultPage1> {
  final MultiSplitViewController _controller = MultiSplitViewController(
    areas: [
      Area(weight: 0.8, minimalSize: 280),
    ],
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExpansionTile1'),
      ),
      body: MultiSplitViewTheme(
        data: MultiSplitViewThemeData(
          dividerPainter: DividerPainters.background(
            color: const Color(0xffE8ECED),
            highlightedColor: const Color(0xffE9EDF5),
          ),
        ),
        child: MultiSplitView(
          controller: _controller,
          children: [
            Container(
              color: Colors.white,
              child: _panel(),
            ),
            Container(color: const Color(0xffF7FCFE)),
          ],
        ),
      ),
    );
  }

  Widget _bottomPanel() {
    return Container(
      height: bottomPanelHeight,
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: borderColor)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(right: indentationRight),
            child: IconButton(onPressed: () {}, icon: const DeleteIcon()),
          ),
        ],
      ),
    );
  }

  Widget _panel() {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ExpansionTile(
                    iconColor: iconColor,
                    collapsedIconColor: iconColor,
                    initiallyExpanded: true,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(
                      'Основные данные',
                      style: helvetica24,
                    ),
                    children: [
                      ClassFieldWidget(
                          title: 'Имя класса', value: class1.name ?? ''),
                      ClassFieldWidget(
                          title: 'Класс ID', value: class1.id ?? ''),
                      ClassFieldWidget(
                          title: 'Метаимя', value: class1.metaName ?? ''),
                      ClassFieldWidget(
                        title: 'Описание',
                        value: class1.description ?? '',
                        bigField: true,
                      ),
                    ],
                  ),
                  ExpansionTile(
                    iconColor: iconColor,
                    collapsedIconColor: iconColor,
                    initiallyExpanded: true,
                    controlAffinity: ListTileControlAffinity.leading,
                    trailing: _buttonAttributeAdding(),
                    title: Text(
                      'Свойства',
                      style: helvetica24,
                    ),
                    children: [
                      for (var el in class1.attributes ?? [])
                        AttributeWidget(
                          attribute: el,
                          onDelete: () {
                            _deleteAttribute(el);
                          },
                        ),
                    ],
                  )
                ],
              ),
            ),
          ),
          _bottomPanel(),
        ],
      ),
    );
  }

  Widget _buttonAttributeAdding() {
    return Container(
      margin: EdgeInsets.only(right: indentationRight - 23),
      height: 28,
      width: 149,
      child: OutlinedButton(
        style: addButtonStyle,
        onPressed: () {
          _addAttribute();
          setState(() {});
        },
        child: const Text('+ Добавить свойство'),
      ),
    );
  }

  void _addAttribute() {
    AttributeModel newAttr =
        AttributeModel(name: '${class1.attributes!.length + 1} свойство');
    if (class1.attributes != null) {
      class1.attributes!.add(newAttr);
    } else {
      class1.attributes = [newAttr];
    }
    setState(() {});
  }

  void _deleteAttribute(AttributeModel attribute) {
    if (class1.attributes != null) {
      class1.attributes!.remove(attribute);
      setState(() {});
    }
  }
}
