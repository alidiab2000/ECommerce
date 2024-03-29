import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../curved_edges/curved_edges.dart';
import 'circular_container.dart';

class HeaderCurveEdgeContainer extends StatelessWidget {
  const HeaderCurveEdgeContainer(
      {super.key, required this.child, this.color = AppColors.primary});
  final Widget child;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCurvedEdges(),
      child: Container(
        color: color,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: CustomCircularContainer(
                  backgroundColor: AppColors.textWhite.withOpacity(0.1),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: CustomCircularContainer(
                  backgroundColor: AppColors.textWhite.withOpacity(0.1),
                ),
              ),
              child
            ],
          ),
        ),
      ),
    );
  }
}
