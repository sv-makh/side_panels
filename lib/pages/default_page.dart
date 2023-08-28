import 'package:flutter/material.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:side_panels/data/data.dart';

class DefaultPage extends StatefulWidget {
  const DefaultPage({super.key});

  @override
  State<DefaultPage> createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  final MultiSplitViewController _controller = MultiSplitViewController();

  TextStyle firstLevelTextStyle = const TextStyle(
      fontSize: 24, fontFamily: 'HelveticaNeue', fontWeight: FontWeight.bold);
  TextStyle qualitiesTextStyle =
      const TextStyle(fontSize: 14, fontFamily: 'Inter',);// fontWeight: FontWeight.bold);
  TextStyle subQuantitiesTextStyle = const TextStyle(
      fontSize: 16, fontFamily: 'HelveticaNeue', fontWeight: FontWeight.bold);

  Color nodeColor = const Color(0xffECF2F9);
  Color borderColor = const Color(0xffDADDE5);
  double indentation = 41;
  Radius radius = const Radius.circular(6);
  OutlineInputBorder border = OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xffDADDE5)),
      borderRadius: BorderRadius.circular(6));

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
        title: Text('ExpansionTile'),
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
                style: firstLevelTextStyle,
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
              trailing: OutlinedButton(
                onPressed: () {
                  _addQuality();
                  setState(() {});
                },
                child: Text('+ Добавить свойство'),
              ),
              title: Text(
                firstLevel[1],
                style: firstLevelTextStyle,
              ),
              children: [
                for (var el in qualities)
                  Container(
                    margin: EdgeInsets.only(left: 2 * indentation),
                    child: ExpansionTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _deleteQuality(el);
                          setState(() {});
                        },
                      ),
                      title: _qualityTitle(el),
                      children: [
                        Column(
                          children: [
                            for (var el in qualityData) _qualityDataWidget(el)
                          ],
                        )
                      ],
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

  Widget _qualityDataWidget(String element) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(left: indentation),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: radius,
          bottomRight: radius,
        ),
        color: nodeColor,
      ),
      child: _field(element),
    );
  }

  Widget _qualityTitle(String title) {
    return Container(
      //margin: EdgeInsets.only(left: 2 * leftMargin),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: radius,
          topRight: radius,
        ),
        color: nodeColor,
      ),
      child: Text(
        title,
        style: subQuantitiesTextStyle,
      ),
    );
  }

  Widget _primaryDataWidget(String element) {
    return Container(
      padding: EdgeInsets.only(right: 21, left: 21, bottom: 12, top: 18),
      margin: EdgeInsets.only(top: 5, bottom: 5, right: 5, left: indentation),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: nodeColor,
      ),
      child: _field(element),
    );
  }

  Widget _field(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 32,
          child: TextField(
            style: qualitiesTextStyle,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: InputBorder.none,
              enabledBorder: border,
              focusedBorder: border,
              contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            ),
          ),
        ),
      ],
    );
  }
}
