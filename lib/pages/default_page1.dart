import 'package:flutter/material.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:side_panels/data/data.dart';
import 'package:side_panels/widgets/expansion_tile/class_widget.dart';

import '../data/expansion_tile/constants.dart';
import '../widgets/expansion_tile/attribute_widget.dart';

class DefaultPage1 extends StatefulWidget {
  const DefaultPage1({super.key});

  @override
  State<DefaultPage1> createState() => _DefaultPage1State();
}

class _DefaultPage1State extends State<DefaultPage1> {
  final MultiSplitViewController _controller = MultiSplitViewController(
    areas: [
      Area(weight: 0.8),
    ],
  );

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
                    for (var el in classData) ClassWidget(title: el)
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
                    _addAttribute();
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
                for (var el in attributes)
                  AttributeWidget(
                    title: el,
                    onDelete: () {
                      _deleteAttribute(el);
                    },
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _addAttribute() {
    attributes.add('${attributes.length + 1} свойство');
  }

  void _deleteAttribute(String quality) {
    attributes.remove(quality);
    setState(() { });
  }
}
