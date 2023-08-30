import 'package:flutter/material.dart';

import '../../data/expansion_tile/constants.dart';
import '../../data/expansion_tile/property_type.dart';

//виджет для отображения полей свойства
//либо TextField, либо выпадающий список (для поля 'Тип')

class FieldWidget extends StatefulWidget {
  String title;
  String value;
  bool bigField;
  bool propertyType;

  FieldWidget({
    super.key,
    required this.title,
    required this.value,
    this.bigField = false,
    this.propertyType = false,
  });

  @override
  State<FieldWidget> createState() => _FieldWidgetState();
}

class _FieldWidgetState extends State<FieldWidget> {
  String? _dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: inter14title,
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: widget.bigField ? bigFieldHeight : fieldHeight,
            child: widget.propertyType
                ? DropdownButtonFormField(
                    icon: Icon(Icons.keyboard_arrow_down, size: 14),
                    decoration: fieldDecoration,
                    dropdownColor: Colors.white,
                    style: inter14,
                    hint: (_dropdownValue == null)
                        ? Text(widget.value)
                        : Text(_dropdownValue!),
                    items: PropertyType.values.map((e) {
                      return DropdownMenuItem(
                        child: Text(e.name),
                        value: e.name,
                      );
                    }).toList(),
                    onChanged: (value) {
                      _dropdownValue = value;
                      setState(() {});
                    })
                : TextField(
                    controller: TextEditingController()..text = widget.value,
                    style: inter14Field,
                    decoration:
                        widget.bigField ? bigFieldDecoration : fieldDecoration,
                    maxLines: widget.bigField ? 4 : 1,
                  ),
          ),
        ],
      ),
    );
  }
}
