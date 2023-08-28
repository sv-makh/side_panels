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

  TextStyle firstLevelTextStyle =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  TextStyle qualitiesTextStyle =
      TextStyle(fontSize: 14, fontWeight: FontWeight.bold);
  Color nodeColor = Color(0xffECF2F9);
  double indentation = 20;
  Radius radius = Radius.circular(5);

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
            color: Color(0xffE8ECED),
            highlightedColor: Color(0xffE9EDF5),
          ),
        ),
        child: MultiSplitView(
          controller: _controller,
          children: [
            Container(
              color: Colors.white,
              child: _panel(),
            ),
            Container(color: Color(0xffF7FCFE))
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
      margin: EdgeInsets.only(left: 2.5 * indentation),
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
        style: qualitiesTextStyle,
      ),
    );
  }

  Widget _primaryDataWidget(String element) {
    return Container(
      padding: EdgeInsets.all(10),
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
        Container(
          height: 30,
          child: TextField(
            decoration: InputDecoration(border: InputBorder.none),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
