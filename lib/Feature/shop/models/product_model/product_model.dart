// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  BrandModel? brand;
  bool? isFeatured;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  ProductModel({
    required this.id,
    required this.price,
    required this.title,
    required this.thumbnail,
    required this.productType,
    this.brand,
    this.productAttributes,
    this.productVariations,
    this.isFeatured,
    this.description,
    this.categoryId,
    this.images,
    this.date,
    this.stock = 0,
    this.sku,
    this.salePrice = 0.0,
  });

  static ProductModel empty() => ProductModel(
        id: '',
        price: 0.0,
        title: '',
        thumbnail: '',
        productType: '',
      );

  toJson() {
    return {
      'Id': id,
      'Price': price,
      'Title': title,
      'Brand': brand!.toJson(),
      'Thumbnail': thumbnail,
      'ProductType': productType,
      'ProductAttributes': productAttributes != null
          ? productAttributes!.map((e) => e.toJson()).toList()
          : [],
      'ProductVariations': productVariations != null
          ? productVariations!.map((e) => e.toJson()).toList()
          : [],
      'IsFeatured': isFeatured,
      'Description': description,
      'CategoryId': categoryId,
      'Images': images ?? [],
      'Date': date,
      'Stock': stock,
      'Sku': sku,
      'SalePrice': salePrice,
    };
  }

  factory ProductModel.formSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return ProductModel.empty();
    final json = document.data()!;
    return ProductModel(
      id: document.id,
      price: double.parse((json['Price'] ?? 0.0).toString()),
      brand: BrandModel.formJson(json['Brand']),
      title: json['Title'] ?? "",
      thumbnail: json['Thumbnail'] ?? "",
      productType: json['ProductType'] ?? "",
      isFeatured: json['IsFeatured'] ?? false,
      description: json['Description'] ?? "",
      categoryId: json['CategoryId'] ?? "",
      images: (json['Images'] != null ? List<String>.from(json['Images']) : []),
      stock: json['Stock'] ?? 0,
      sku: json['Sku'],
      salePrice: (double.parse((json['SalePrice'] ?? 0.0).toString())),
      productAttributes: (json['ProductAttributes'] as List<dynamic>)
          .map((e) => ProductAttributeModel.formJson(e))
          .toList(),
      productVariations: (json['ProductVariations'] as List<dynamic>)
          .map((e) => ProductVariationModel.formJson(e))
          .toList(),
    );
  }
  factory ProductModel.formQuerySnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> document) {
    final json = document.data();
    return ProductModel(
      id: document.id,
      price: double.parse((json['Price'] ?? 0.0).toString()),
      title: json['Title'] ?? "",
      brand: BrandModel.formJson(json['Brand'] as Map<String, dynamic>),
      thumbnail: json['Thumbnail'] ?? "",
      productType: json['ProductType'] ?? "",
      isFeatured: json['IsFeatured'] ?? false,
      description: json['Description'] ?? "",
      categoryId: json['CategoryId'] ?? "",
      images: (json['Images'] != null ? List<String>.from(json['Images']) : []),
      date: json['Date'],
      stock: json['Stock'] ?? 0,
      sku: json['Sku'],
      salePrice: (double.parse((json['SalePrice'] ?? 0.0).toString())),
      productAttributes: (json['ProductAttributes'] as List<dynamic>)
          .map((e) => ProductAttributeModel.formJson(e))
          .toList(),
      productVariations: (json['ProductVariations'] as List<dynamic>)
          .map((e) => ProductVariationModel.formJson(e))
          .toList(),
    );
  }
}

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;

  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured,
    this.productsCount,
  });

  static BrandModel empty() => BrandModel(
        id: '',
        name: '',
        image: '',
      );
  toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'IsFeatured': isFeatured,
      'ProductsCount': productsCount,
    };
  }

  factory BrandModel.formJson(Map<String, dynamic> json) {
    if (json.isEmpty) return BrandModel.empty();
    return BrandModel(
      id: json['Id'] ?? "",
      name: json['Name'] ?? "",
      image: json['Image'] ?? "",
      isFeatured: json['IsFeatured'],
      productsCount: json['ProductsCount'],
    );
  }
}

class ProductVariationModel {
  final String id;
  String suk;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attriubuteValue;

  ProductVariationModel({
    required this.id,
    this.suk = '',
    this.image = '',
    this.description = '',
    this.price = 0.0,
    this.salePrice = 0.0,
    this.stock = 0,
    required this.attriubuteValue,
  });
  static ProductVariationModel empty() =>
      ProductVariationModel(id: '', attriubuteValue: {});

  toJson() {
    return {
      'Id': id,
      'SUK': suk,
      'Image': image,
      'Description': description,
      'Price': price,
      'SalePrice': salePrice,
      'Stock': stock,
      'AttriubuteValue': attriubuteValue,
    };
  }

  factory ProductVariationModel.formJson(Map<String, dynamic> json) {
    if (json.isEmpty) return ProductVariationModel.empty();
    return ProductVariationModel(
      id: json['Id'] ?? "",
      suk: json['SUK'] ?? "",
      image: json['Image'] ?? "",
      description: json['Description'] ?? "",
      price: double.parse((json['Price'] ?? 0.0).toString()),
      salePrice: double.parse((json['SalePrice'] ?? 0.0).toString()),
      stock: json['Stock'] ?? 0,
      attriubuteValue: Map<String, String>.from(json['AttriubuteValue']),
    );
  }
}

class ProductAttributeModel {
  String? name;
  final List<String>? values;

  ProductAttributeModel({this.name, this.values});
  toJson() {
    return {
      'Name': name,
      'Values': values,
    };
  }

  factory ProductAttributeModel.formJson(Map<String, dynamic> json) {
    if (json.isEmpty) return ProductAttributeModel();
    return ProductAttributeModel(
      name: json.containsKey("Name") ? json['Name'] : "",
      values: List<String>.from(json['Values']),
    );
  }
}
