import 'package:flutter/material.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';

import '../../data/data.dart';
import '../../data/fancy_tree_view/my_node.dart';
import '../../data/fancy_tree_view/roots.dart';

class MyTreeTile extends StatelessWidget {
  const MyTreeTile({
    super.key,
    required this.entry,
    required this.onTap,
    required this.controller,
  });

  final TreeEntry<MyNode> entry;
  final VoidCallback onTap;
  final TreeController controller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: TreeIndentation(
        entry: entry,
        guide: const IndentGuide.connectingLines(indent: 48),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(4, 8, 8, 8),
          child: Row(
            children: [
              FolderButton(
                isOpen: entry.hasChildren ? entry.isExpanded : null,
                onPressed: entry.hasChildren ? onTap : null,
              ),
              Text(entry.node.title),
              SizedBox(
                width: 20,
              ),
              ((entry.level == 1) && (entry.hasChildren))
                  ? IconButton(
                      onPressed: () {
                        roots[1].children.remove(entry.node);
                        controller.rebuild();
                      },
                      icon: Icon(Icons.delete))
                  : Container(),
              ((entry.level == 0) && (entry.node.title == 'Свойства'))
                  ? OutlinedButton(
                      onPressed: () {
                        roots[1].children.add(
                              MyNode(
                                title:
                                    '${roots[1].children.length + 1} свойство',
                                children: List.generate(
                                  attributeData.length,
                                  (index) => MyNode(title: attributeData[index]),
                                ),
                              ),
                            );
                        controller.rebuild();
                      },
                      child: Text('+ Добавить свойство'))
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
