import '../data.dart';
import 'my_node.dart';

List<MyNode> roots = <MyNode>[
  MyNode(
      title: firstLevel[0],
      children: List.generate(
          primaryData.length, (index) => MyNode(title: primaryData[index]))),
  MyNode(
    title: firstLevel[1],
    children: List.generate(
      qualitiesList.length,
          (index) => MyNode(
        title: qualitiesList[index],
        children: List.generate(
          qualityData.length,
              (index) => MyNode(title: qualityData[index]),
        ),
      ),
    ),
  ),
];