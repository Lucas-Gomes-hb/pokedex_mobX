import 'dart:math';

import 'package:flutter/material.dart';

class PixelCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pixelSize = 10.0; // Tamanho de cada "pixel"
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - pixelSize / 2;

    final paintFill = Paint()..color = const Color(0xFFC0B088);
    final paintBorder = Paint()..color = const Color(0xFFC0B088);

    canvas.drawCircle(center, radius , paintFill);

    for (double angle = 0; angle < 360; angle += 5) {
      final rad = angle * 3.14159 / 180;

      final x = center.dx + radius * cos(rad);
      final y = center.dy + radius * sin(rad);

      canvas.drawRect(
        Rect.fromCenter(center: Offset(x, y), width: pixelSize, height: pixelSize),
        paintBorder,
      );
    }


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}