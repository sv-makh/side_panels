import 'package:flutter/material.dart';

import '../../data/data.dart';
import '../../data/expansion_tile/constants.dart';

class FieldWidget extends StatefulWidget {
  String title;
  FieldWidget({super.key, required this.title});

  @override
  State<FieldWidget> createState() => _FieldWidgetState();
}

/*class _FieldWidgetState extends State<FieldWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}*/

class _FieldWidgetState extends State<FieldWidget> {
  String? _dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: fieldHeight,
            child: (widget.title == 'Тип')
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
