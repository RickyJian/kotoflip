import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedLabel extends StatelessWidget {
  const RoundedLabel({
    super.key,
    required this.text,
    this.backgroundColor = Colors.black12,
    this.textColor = Colors.black45,
  });

  final String text;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(text, style: TextStyle(color: textColor)),
    );
  }
}
