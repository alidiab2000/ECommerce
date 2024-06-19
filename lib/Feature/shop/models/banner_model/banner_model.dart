import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  String imageURL;
  final String targetScreen;
  final bool active;

  BannerModel({
    required this.imageURL,
    required this.targetScreen,
    required this.active,
  });

  factory BannerModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return BannerModel(
      imageURL: data['imageURL'] ?? "",
      targetScreen: data['targetScreen'] ?? "",
      active: data['active'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageURL': imageURL,
      'targetScreen': targetScreen,
      'active': active,
    };
  }
}
