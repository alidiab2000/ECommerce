import 'package:e_commerce/data/repositories/auth/auth_repo.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app.dart';

Future<void> main() async {
  //Add Widget binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  //Init Local Storag
  await GetStorage.init();
  //  Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  //Initialize FireBase && Initialize Authenication
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((widgetsBinding) => Get.put(AuthenticationRepository()));

  runApp(const ECommerce());
}
