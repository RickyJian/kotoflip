import 'package:flutter/material.dart';

import 'dashed_rrect_painter.dart';

class DashedRRectChip extends StatelessWidget {
  const DashedRRectChip({
    super.key,
    required this.height,
    required this.text,
    required this.fontSize,
    required this.color,
    required this.dash,
    required this.gap,
    required this.horizontalPadding,
    this.radius = 999,
    this.strokeWidth = 1,
    this.onTap,
  });

  final double height;
  final String text;
  final double fontSize;
  final Color color;
  final double dash;
  final double gap;
  final double horizontalPadding;
  final double radius;
  final double strokeWidth;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(radius),
        child: CustomPaint(
          painter: DashedRRectPainter(
            color: color,
            dash: dash,
            gap: gap,
            radius: radius,
            strokeWidth: strokeWidth,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Center(
              widthFactor: 1,
              child: Text(
                text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: color, fontSize: fontSize),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
