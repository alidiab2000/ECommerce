import 'package:flutter/material.dart';

import 'widgets/success_screen_body.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SuccessScreenBody(),
    );
  }
}
