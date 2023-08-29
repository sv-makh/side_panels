import '../data.dart';
import 'my_node.dart';

List<MyNode> roots = <MyNode>[
  MyNode(
      title: firstLevel[0],
      children: List.generate(
          classData.length, (index) => MyNode(title: classData[index]))),
  MyNode(
    title: firstLevel[1],
    children: List.generate(
      attributesList.length,
          (index) => MyNode(
        title: attributesList[index],
        children: List.generate(
          attributeData.length,
              (index) => MyNode(title: attributeData[index]),
        ),
      ),
    ),
  ),
];