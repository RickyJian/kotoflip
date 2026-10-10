import 'package:flutter/material.dart';

class CardTagChip extends StatelessWidget {
  const CardTagChip({
    super.key,
    required this.id,
    required this.text,
    required this.borderRadius,
    required this.borderWidth,
    required this.horizontalPadding,
    required this.verticalPadding,
    required this.fontSize,
    required this.contentHeight,
    this.textColor = Colors.green,
    this.borderColor = Colors.green,
    this.editMode = false,
    this.onDeleted,
  });

  final String id;
  final String text;
  final double borderRadius;
  final double borderWidth;
  final double horizontalPadding;
  final double verticalPadding;
  final double fontSize;
  final double contentHeight;
  final Color borderColor;
  final Color textColor;
  final bool editMode;
  final void Function(String id)? onDeleted;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: borderColor, width: borderWidth),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: contentHeight,
            child: Center(
              widthFactor: 1,
              child: Text(
                text,
                style: TextStyle(fontSize: fontSize, color: textColor),
              ),
            ),
          ),
          if (editMode && onDeleted != null)
            SizedBox.square(
              dimension: contentHeight,
              child: IconButton(
                icon: Icon(Icons.clear, size: fontSize),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                style: IconButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  minimumSize: Size(contentHeight, contentHeight),
                ),
                onPressed: () => onDeleted?.call(id),
              ),
            ),
        ],
      ),
    );
  }
}
