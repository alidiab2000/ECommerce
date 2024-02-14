import 'package:e_commerce/Feature/auth/views/password_configration/widgets/forget_password_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              CupertinoIcons.clear,
            ),
          )
        ],
      ),
      body: const ForgetPasswordViewBody(),
    );
  }
}
