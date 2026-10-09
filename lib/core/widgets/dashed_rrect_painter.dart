import 'package:flutter/material.dart';

class DashedRRectPainter extends CustomPainter {
  const DashedRRectPainter({
    required this.color,
    this.radius = 999,
    this.dash = 6,
    this.gap = 4,
    this.strokeWidth = 1,
  }) : assert(radius >= 0, 'radius must be greater than or equal to 0'),
       assert(dash > 0, 'dash must be greater than 0'),
       assert(gap >= 0, 'gap must be greater than or equal to 0'),
       assert(strokeWidth > 0, 'strokeWidth must be greater than 0');

  final Color color;
  final double radius;
  final double dash;
  final double gap;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    // 內縮半個線寬，避免外框畫到元件邊界之外
    final rect = (Offset.zero & size).deflate(strokeWidth / 2);
    final path = Path()
      ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(radius)));

    final dashed = Path();
    for (final metric in path.computeMetrics()) {
      for (double d = 0; d < metric.length; d += dash + gap) {
        dashed.addPath(metric.extractPath(d, d + dash), Offset.zero);
      }
    }
    canvas.drawPath(dashed, paint);
  }

  @override
  bool shouldRepaint(covariant DashedRRectPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.radius != radius ||
        oldDelegate.dash != dash ||
        oldDelegate.gap != gap ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
