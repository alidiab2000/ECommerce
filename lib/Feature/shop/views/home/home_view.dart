import 'package:e_commerce/Feature/shop/views/home/widgets/curve_edge.dart';
import 'package:e_commerce/Feature/shop/views/home/widgets/home_appbar.dart';

import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CurveEdgeWidget(
              child: HomeAppBar(),
            ),
          ],
        ),
      ),
    );
  }
}
