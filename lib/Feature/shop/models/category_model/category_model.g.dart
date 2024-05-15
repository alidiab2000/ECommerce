// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(
    DocumentSnapshot<Map<String, dynamic>> decument) {
  if (decument.data() != null) {
    final data = decument.data()!;
    return CategoryModel(
      id: decument.id,
      name: data['name'] as String,
      image: data['image'] as String,
      parentId: data['parentId'] as String? ?? '',
      isFeatured: data['isFeatured'] as bool,
    );
  } else {
    return CategoryModel.empty();
  }
}

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'parentId': instance.parentId,
      'isFeatured': instance.isFeatured,
    };
