import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FirebaseStorageServices extends GetxService {
  static FirebaseStorageServices get instance => Get.find();
  final _firebaseStorage = FirebaseStorage.instance;
  Future<Uint8List> getImageFromAssets({required String path}) async {
    try {
      final ByteData bytes = await rootBundle.load(path);
      final Uint8List imageData =
          bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
      return imageData;
    } catch (e) {
      throw "Failed to load image from asset: $e";
    }
  }

  Future<String> uploadImageData(
      {required String path,
      required Uint8List image,
      required String name}) async {
    try {
      final ref = _firebaseStorage.ref(path).child(name);
      await ref.putData(image);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      if (e is FirebaseException) {
        throw "Firebase Exception: $e";
      } else if (e is SocketException) {
        throw "Network Error Exception: $e";
      } else if (e is PlatformException) {
        throw "Platform Exception: $e";
      } else {
        throw "Failed to upload image: $e";
      }
    }
  }

  Future<String> uploadImageFile(
      {required String path, required XFile image}) async {
    try {
      final ref = _firebaseStorage.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      if (e is FirebaseException) {
        throw "Firebase Exception: $e";
      } else if (e is SocketException) {
        throw "Network Error Exception: $e";
      } else if (e is PlatformException) {
        throw "Platform Exception: $e";
      } else {
        throw "Failed to upload image: $e";
      }
    }
  }
}
