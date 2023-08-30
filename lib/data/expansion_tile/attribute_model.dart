import 'package:side_panels/data/expansion_tile/property_type.dart';

class AttributeModel {
  String? id;
  int? importance;
  PropertyType? type;
  String? name;
  String? programName;
  String? description;
  String? format;
  String? example;
  String? dataCreated;
  String? authorCreated;
  String? dateUpdated;
  String? authorUpdated;
  String? author;

  AttributeModel({
    this.id,
    this.importance,
    this.type,
    this.name,
    this.programName,
    this.description,
    this.format,
    this.example,
    this.dataCreated,
    this.authorCreated,
    this.dateUpdated,
    this.authorUpdated,
    this.author,
  });
}
