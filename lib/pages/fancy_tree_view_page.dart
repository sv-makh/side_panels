import 'package:flutter/material.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';

import '../data/data.dart';
import '../data/fancy_tree_view/my_node.dart';
import '../data/fancy_tree_view/roots.dart';
import '../widgets/fancy_tree_view/my_tree_tile.dart';

class FancyTreeViewPage extends StatefulWidget {
  const FancyTreeViewPage({super.key});

  @override
  State<FancyTreeViewPage> createState() => _FancyTreeViewPageState();
}

class _FancyTreeViewPageState extends State<FancyTreeViewPage> {
  late final TreeController<MyNode> treeController;

  @override
  void initState() {
    super.initState();
    treeController = TreeController(
      roots: roots,
      childrenProvider: (MyNode node) => node.children,
    );
  }

  @override
  void dispose() {
    treeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter_fancy_tree_view'),
      ),
      body: TreeView<MyNode>(
        treeController: treeController,
        nodeBuilder: (BuildContext context, TreeEntry<MyNode> entry) {
          return MyTreeTile(
            key: ValueKey(entry.node),
            controller: treeController,
            entry: entry,
            onTap: () => treeController.toggleExpansion(entry.node),
          );
        },
      ),
    );
  }
}
