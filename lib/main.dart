import 'package:e_commerce/data/repositories/auth/auth_repo.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
 
import 'app.dart';

Future<void> main() async {
  //Add Widget binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();


  //  Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //Initialize FireBase && Initialize Authenication
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((_) => Get.put(AuthenticationRepository()));

  runApp(const ECommerce());
}
