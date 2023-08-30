import 'package:flutter/material.dart';

import '../../data/expansion_tile/constants.dart';
import '../../data/expansion_tile/trash_icon_icons.dart';

class DeleteIcon extends StatelessWidget {
  const DeleteIcon({super.key});

  @override
  Widget build(BuildContext context) {
    //иконка из макета в фигме
/*    return Icon(
      TrashIcon.curved_trash,
      color: buttonColor,
    );*/
    return Icon(Icons.delete);
  }
}
