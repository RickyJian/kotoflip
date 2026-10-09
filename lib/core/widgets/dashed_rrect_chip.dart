import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dashed_rrect_painter.dart';

class DashedRRectChip extends StatelessWidget {
  const DashedRRectChip({
    super.key,
    required this.height,
    required this.text,
    required this.fontSize,
    required this.color,
    this.radius = 999,
    this.strokeWidth = 1,
    this.onTap,
  });

  final double height;
  final String text;
  final double fontSize;
  final Color color;
  final double radius;
  final double strokeWidth;
  final GestureTapCallback? onTap;
  static const int _dash = 6;
  static const int _gap = 4;
  static const int _chipHorizontal = 8;

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
            dash: _dash.w,
            gap: _gap.w,
            radius: radius,
            strokeWidth: strokeWidth,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: _chipHorizontal.w),
            child: Center(
              widthFactor: 1,
              child: Text(
                text,
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: TextStyle(color: color, fontSize: fontSize.sp),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
