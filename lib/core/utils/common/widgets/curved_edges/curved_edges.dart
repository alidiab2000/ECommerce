import 'package:flutter/material.dart';

class CustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final h = size.height;
    final w = size.width;
    path.lineTo(0, h);
    //First Curve
    path.quadraticBezierTo(
      0,
      h - 20,
      30,
      h - 20,
    );
    //Sce Liner
    path.quadraticBezierTo(
      0,
      h - 20,
      w - 30,
      h - 20,
    );
    //Third Curve
    path.quadraticBezierTo(
      w,
      h - 20,
      w,
      h,
    );

    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
