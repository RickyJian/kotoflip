import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'rounded_label.dart';
import '../../models/models.dart' as model;

class FlipCard extends StatefulWidget {
  const FlipCard({
    super.key,
    required this.frontLabel,
    required this.backLabel,
    this.isFront = true,
    this.frontController,
    this.backController,
    this.onFlip,
    this.onSave,
  });

  final String frontLabel;
  final String backLabel;
  final bool isFront;
  final VoidCallback? onFlip;
  final void Function(String front, String back, List<String> labels)? onSave;
  final TextEditingController? frontController;
  final TextEditingController? backController;

  static const int _horizontalPadding = 20;
  static const int _maxTextLength = 50;
  static const int _labelSpacing = 8;

  @override
  State<FlipCard> createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard> {
  late final TextEditingController _frontController;
  late final TextEditingController _backController;
  late final bool _isFrontControllerInit;
  late final bool _isBackControllerInit;

  @override
  void initState() {
    super.initState();
    _isFrontControllerInit = widget.frontController == null;
    _frontController = widget.frontController ?? TextEditingController();
    _isBackControllerInit = widget.backController == null;
    _backController = widget.backController ?? TextEditingController();
  }

  @override
  void dispose() {
    if (_isFrontControllerInit) {
      _frontController.dispose();
    }
    if (_isBackControllerInit) {
      _backController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          // header
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: FlipCard._horizontalPadding.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundedLabel(
                    text: widget.isFront ? widget.frontLabel : widget.backLabel,
                  ),
                  IconButton.filledTonal(
                    icon: const Icon(Icons.flip),
                    onPressed: widget.onFlip,
                  ),
                ],
              ),
            ),
          ),
          // content
          Expanded(
            flex: 6,
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: FlipCard._horizontalPadding.w,
              ),
              child: TextField(
                controller: widget.isFront ? _frontController : _backController,
                style: TextStyle(fontSize: 40.sp),
                expands: true,
                maxLines: null,
                maxLength: FlipCard._maxTextLength,
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: widget.isFront
                      ? widget.frontLabel
                      : widget.backLabel,
                  hintStyle: TextStyle(color: Colors.black26, fontSize: 40.sp),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          // footer
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: FlipCard._horizontalPadding.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: Text('清除'),
                    onPressed: () => widget.isFront
                        ? _frontController.clear()
                        : _backController.clear(),
                  ),
                  TextButton(
                    child: const Text('存檔'),
                    onPressed: () => widget.onSave?.call(
                      _frontController.text,
                      _backController.text,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
