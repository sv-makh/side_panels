class MyNode {
  MyNode({
    required this.title,
    this.children = const <MyNode>[],
  });

  String title;
  List<MyNode> children;
}