import 'dart:html';

import 'package:flutter/material.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:side_panels/data/data.dart';
import 'package:side_panels/data/trash_icon_icons.dart';

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

  TextStyle helvetica24 = const TextStyle(
      fontSize: 24, fontFamily: 'HelveticaNeue', fontWeight: FontWeight.bold);
  TextStyle inter14 = const TextStyle(
      fontSize: 14, fontFamily: 'Inter', color: Color(0xff464F60));
  TextStyle inter12 = const TextStyle(
    fontSize: 12,
    fontFamily: 'Inter',
  );
  TextStyle helvetica16 = const TextStyle(
      fontSize: 16, fontFamily: 'HelveticaNeue', fontWeight: FontWeight.bold);

  Color nodeColor = const Color(0xffECF2F9);
  Color borderColor = const Color(0xffDADDE5);
  Color buttonColor = const Color(0xff5A6376);
  Color dividerColor = const Color(0xffD1D3D6);
  double indentationLeft = 41;
  double indentationRight = 27;
  double sidePadding = 21;
  Radius radius = const Radius.circular(6);
  OutlineInputBorder border = OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xffDADDE5)),
      borderRadius: BorderRadius.circular(6));

  InputDecoration fieldDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    border: InputBorder.none,
    enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xffDADDE5)),
        borderRadius: BorderRadius.circular(6)),
    focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xffDADDE5)),
        borderRadius: BorderRadius.circular(6)),
    contentPadding: const EdgeInsets.symmetric(
      vertical: 6,
      horizontal: 12,
    ),
  );
  double fieldHeight = 32;

  String? _dropdownValue;

  List<String> qualities = List.from(qualitiesList);

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
                for (var el in qualities)
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 20,
                    ),
                    padding: EdgeInsets.only(
                        left: indentationLeft, right: indentationRight),
                    child: ListTileTheme(
                      minVerticalPadding: 0,
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      child: ExpansionTile(
                        onExpansionChanged: (value) {},
                        //tilePadding: EdgeInsets.zero,
                        //backgroundColor: nodeColor,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: _qualityTitle(el),
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: indentationLeft),
                            padding: EdgeInsets.only(
                                left: sidePadding, right: sidePadding),
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
                                        style: inter14,
                                        decoration: fieldDecoration),
                                  ),
                                ),
                                for (var el in attributeData)
                                  _field(el), //_qualityDataWidget(el),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: IconButton(
                                    icon: Icon(
                                      TrashIcon.curved_trash,
                                      color: buttonColor,
                                    ),
                                    onPressed: () {
                                      _deleteQuality(el);
                                      setState(() {});
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _addQuality() {
    qualities.add('${qualities.length + 1}th quality');
  }

  void _deleteQuality(String quality) {
    qualities.remove(quality);
  }

  Widget _qualityTitle(String title) {
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
      child: Text(
        title,
        style: helvetica16,
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
      child: _field(element),
    );
  }

  Widget _field(String title) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: fieldHeight,
            child: (title == 'Тип')
                ? DropdownButtonFormField(
                    decoration: fieldDecoration,
                    style: inter14,
                    hint: (_dropdownValue == null)
                        ? Text('')
                        : Text(_dropdownValue!),
                    items: PropertyTypes.values.map((e) {
                      return DropdownMenuItem(
                        child: Text(e.name),
                        value: e.name,
                      );
                    }).toList(),
                    onChanged: (value) {
                      _dropdownValue = value;
                      setState(() {});
                    })
                : TextField(style: inter14, decoration: fieldDecoration),
          ),
        ],
      ),
    );
  }
}
