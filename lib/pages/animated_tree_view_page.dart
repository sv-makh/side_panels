import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:animated_tree_view/animated_tree_view.dart';

import '../data/data.dart';

//https://pub.dev/packages/animated_tree_view/example

const showSnackBar = false;
const expandChildrenOnReady = true;

class AnimatedTreeViewPage extends StatefulWidget {
  const AnimatedTreeViewPage({super.key});

  @override
  State<AnimatedTreeViewPage> createState() => _AnimatedTreeViewState();
}

class _AnimatedTreeViewState extends State<AnimatedTreeViewPage> {
  TreeViewController? _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('animated_tree_view')),
      body: TreeView.simple(
        tree: sampleTree,
        showRootNode: false,
        expansionIndicatorBuilder: (context, node) =>
            ChevronIndicator.rightDown(
          tree: node,
          color: Colors.blue[700],
          padding: const EdgeInsets.all(8),
        ),
        indentation: const Indentation(style: IndentStyle.squareJoint),
        onItemTap: (item) {
          //if (kDebugMode) print("Item tapped: ${item.key}");

          if (showSnackBar) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Item tapped: ${item.key}"),
                duration: const Duration(milliseconds: 750),
              ),
            );
          }
        },
        onTreeReady: (controller) {
          _controller = controller;
          //if (expandChildrenOnReady) controller.expandAllChildren(sampleTree);
        },
        builder: (context, node) => Card(
          child: ListTile(
            title: Text('${node.key}'),
          ),
        ),
      ),
    );
  }
}

TreeNode sampleTree = TreeNode.root()
  ..addAll([
    TreeNode(key: firstLevel[0])
      ..addAll(List.generate(
          primaryData.length, (index) => TreeNode(key: primaryData[index]))),
    TreeNode(key: firstLevel[1])
      ..addAll(List.generate(
          qualitiesList.length,
          (index) => TreeNode(key: qualitiesList[index])
            ..addAll(List.generate(attributeData.length,
                (index) => TreeNode(key: attributeData[index])))))
  ]);
