import 'widgets/rest_password_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResetPasswordview extends StatelessWidget {
  const ResetPasswordview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        actions: const [
          Icon(CupertinoIcons.clear),
        ],
      ),
      body: const ResetPasswordBody(),
    );
  }
}
