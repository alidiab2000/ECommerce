import 'package:e_commerce/core/utils/common/widgets/containers/circular_container.dart';
import 'package:e_commerce/core/utils/common/widgets/curved_edges/curved_edges.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/core/utils/constants/colors.dart';

class HeaderCurveEdgeContainer extends StatelessWidget {
  const HeaderCurveEdgeContainer({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCurvedEdges(),
      child: Container(
        color: AppColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 360,
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
