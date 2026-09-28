import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardLabel extends StatelessWidget {
  const CardLabel({
    super.key,
    required this.text,
    this.textColor = Colors.lightGreen,
    this.borderColor = Colors.green,
    this.canEdit = false,
    this.onDeleted,
  });

  final String text;
  final Color borderColor;
  final Color textColor;
  final bool canEdit;
  final void Function(String name)? onDeleted;

  static const int _borderRadius = 8;
  static const int _horizontalPadding = 8;
  static const int _verticalPadding = 4;
  static const double _fontSize = 14;
  static const double _contentHeight = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_borderRadius.r),
          border: Border.all(color: borderColor),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: _horizontalPadding.w,
          vertical: _verticalPadding.h,
        ),
        child: canEdit
            ? Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            content(text),
            SizedBox.square(
              dimension: _contentHeight.r,
              child: IconButton(
                icon: Icon(Icons.clear, size: _fontSize.sp),
                onPressed: () => onDeleted?.call(text),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                style: IconButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  minimumSize: Size(_contentHeight.r, _contentHeight.r),
                ),
              ),
            ),
          ],
        )
            : content(text)
    );
  }

  Widget content(String text) {
    return SizedBox(
      height: _contentHeight.r,
      child: Center(
        child: Text(
          '#$text',
          style: TextStyle(
            fontSize: _fontSize.sp,
            color: textColor,
          ),
        ),
      ),
    );
  }

}
