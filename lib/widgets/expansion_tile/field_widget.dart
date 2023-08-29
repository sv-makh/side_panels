import 'package:flutter/material.dart';

import '../../data/data.dart';
import '../../data/expansion_tile/constants.dart';

//виджет для отображения полей свойства
//либо TextField, либо выпадающий список (для поля 'Тип')

class FieldWidget extends StatefulWidget {
  String title;

  FieldWidget({super.key, required this.title});

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
            height: (widget.title == 'Описание') ? bigFieldHeight : fieldHeight,
            child: (widget.title == 'Тип')
                ? DropdownButtonFormField(
                    icon: Icon(Icons.keyboard_arrow_down, size: 14),
                    decoration: fieldDecoration,
                    dropdownColor: Colors.white,
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
                : TextField(
                    style: inter14Field,
                    decoration: (widget.title == 'Описание')
                        ? bigFieldDecoration
                        : fieldDecoration,
                    maxLines: (widget.title == 'Описание') ? 4 : 1,
                  ),
          ),
        ],
      ),
    );
  }
}
