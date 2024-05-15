import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  String id;
  
  String name;
  String image;
  String parentId;
  bool isFeatured;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    this.parentId = '',
    required this.isFeatured,
  });
  static CategoryModel empty() => CategoryModel(
        id: "",
        name: "",
        image: "",
        isFeatured: false,
      );

  factory CategoryModel.fromJson(
          DocumentSnapshot<Map<String, dynamic>> decument) =>
      _$CategoryModelFromJson(decument);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
