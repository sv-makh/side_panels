import 'package:flutter/material.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';

class MyNode {
  const MyNode({
    required this.title,
    this.children = const <MyNode>[],
  });

  final String title;
  final List<MyNode> children;
}

class FancyTreeViewPage extends StatefulWidget {
  const FancyTreeViewPage({super.key});

  @override
  State<FancyTreeViewPage> createState() => _FancyTreeViewPageState();
}

class _FancyTreeViewPageState extends State<FancyTreeViewPage> {
  late final TreeController<MyNode> treeController;



  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
