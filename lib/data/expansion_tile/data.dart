import 'package:side_panels/data/expansion_tile/attribute_model.dart';
import 'package:side_panels/data/expansion_tile/class_model.dart';
import 'package:side_panels/data/expansion_tile/property_type.dart';

ClassModel class1 = ClassModel(
  name: 'name',
  metaName: 'metaName',
  id: 'id',
  description: 'description',
  attributes: [
    AttributeModel(
      id: 'id',
      importance: 1,
      type: PropertyType.array,
      name: 'name',
      format: 'format',
      example: 'example',
    )
  ],
);
