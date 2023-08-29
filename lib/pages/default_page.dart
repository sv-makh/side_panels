import 'package:flutter/material.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:side_panels/data/data.dart';
import 'package:side_panels/data/expansion_tile/trash_icon_icons.dart';

import '../data/expansion_tile/constants.dart';
import '../widgets/expansion_tile/attribute_widget.dart';
import '../widgets/expansion_tile/field_widget.dart';

class DefaultPage extends StatefulWidget {
  const DefaultPage({super.key});

  @override
  State<DefaultPage> createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  final MultiSplitViewController _controller = MultiSplitViewController(
    areas: [
      Area(weight: 0.8),
    ],
  );

  String? _dropdownValue;

  List<String> attributes = List.from(attributesList);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExpansionTile'),
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
            Container(color: const Color(0xffF7FCFE))
          ],
        ),
      ),
    );
  }

  Widget _panel() {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ExpansionTile(
              initiallyExpanded: true,
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(
                firstLevel[0],
                style: helvetica24,
              ),
              children: [
                Column(
                  children: [
                    for (var el in primaryData) _primaryDataWidget(el)
                  ],
                )
              ],
            ),
            ExpansionTile(
              initiallyExpanded: true,
              controlAffinity: ListTileControlAffinity.leading,
              trailing: Container(
                margin: EdgeInsets.only(right: indentationRight),
                height: 28,
                width: 149,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.only(right: 8, left: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    foregroundColor: buttonColor,
                    textStyle: inter12,
                    side: BorderSide(color: borderColor),
                  ),
                  onPressed: () {
                    _addQuality();
                    setState(() {});
                  },
                  child: const Text('+ Добавить свойство'),
                ),
              ),
              title: Text(
                firstLevel[1],
                style: helvetica24,
              ),
              children: [
                for (var el in attributes) _attributeWidget(el),//AttributeWidget(title: el, onDelete: () { _deleteQuality(el); },),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _attributeWidget(String el) {
    bool isExpanded = false;

    return Container(
      margin: EdgeInsets.only(
        bottom: 20,
      ),
      padding: EdgeInsets.only(left: indentationLeft, right: indentationRight),
      child: ListTileTheme(
        minVerticalPadding: 0,
        contentPadding: EdgeInsets.zero,
        dense: true,
        child: ExpansionTile(
          onExpansionChanged: (value) {
            isExpanded = value;
            setState(() {

            });
          },
          controlAffinity: ListTileControlAffinity.leading,
          title: _qualityTitle(el, isExpanded),
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
                    padding: EdgeInsets.only(top: 8, bottom: 10),
                    child: SizedBox(
                      height: fieldHeight,
                      child: TextField(
                          controller: TextEditingController()..text = el,
                          style: inter14, decoration: fieldDecoration),
                    ),
                  ),
                  for (var el in attributeData)
                    FieldWidget(title: el), //_qualityDataWidget(el),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: _deleteIconButton(el),
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

  void _addQuality() {
    attributes.add('${attributes.length + 1} свойство');
  }

  void _deleteQuality(String quality) {
    attributes.remove(quality);
  }

  Widget _qualityTitle(String title, bool isExpanded) {
    return Container(
      height: 54,
      margin: const EdgeInsets.only(left: 5),
      padding: EdgeInsets.only(left: sidePadding, bottom: 17, top: 17),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: radius,
          topRight: radius,
        ),
        color: nodeColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: helvetica16,
          ),
          //isExpanded ? SizedBox() : _deleteIconButton(title),
        ],
      ),
    );
  }

  Widget _primaryDataWidget(String element) {
    return Container(
      padding: EdgeInsets.only(
          right: sidePadding, left: sidePadding, bottom: 12, top: 18),
      margin: EdgeInsets.only(
          top: 5, bottom: 5, right: indentationRight, left: indentationLeft),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: nodeColor,
      ),
      child: FieldWidget(title: element),
    );
  }

}
