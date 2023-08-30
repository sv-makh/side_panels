import 'attribute_model.dart';

class ClassModel {
  String? name;
  String? metaName;
  String? id;
  bool? shared;
  String? programName;

  //List<RelationModel>? outgoingRelations,
  String? description;
  String? dataCreated;
  String? authorCreated;
  String? dataUpdated;
  String? authorUpdated;
  String? author;
  String? collectionMetaName;
  List<AttributeModel>? attributes;

  ClassModel({
    this.name,
    this.metaName,
    this.id,
    this.shared,
    this.programName,
    //List<RelationModel>? outgoingRelations,
    this.description,
    this.dataCreated,
    this.authorCreated,
    this.dataUpdated,
    this.authorUpdated,
    this.author,
    this.collectionMetaName,
    this.attributes,
  });
}
