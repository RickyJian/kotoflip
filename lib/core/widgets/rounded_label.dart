import 'package:flutter/material.dart';

class RoundedLabel extends StatelessWidget {
  const RoundedLabel({
    super.key,
    required this.text,
    required this.horizontalPadding,
    required this.verticalPadding,
    this.backgroundColor = Colors.black12,
    this.textColor = Colors.black45,
  });

  final String text;
  final double horizontalPadding;
  final double verticalPadding;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(text, style: TextStyle(color: textColor)),
    );
  }
}
