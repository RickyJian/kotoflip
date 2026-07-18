import 'package:flutter/material.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'rounded_label.dart';

class FlipCard extends StatefulWidget {
  const FlipCard({super.key, required this.name, this.controller});

  final String name;
  final TextEditingController? controller;
  static const int _horizontalPadding = 20;
  static const int _maxTextLength = 50;
  static const double _minFontSize = 30;

  @override
  State<FlipCard> createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard> {
  late final TextEditingController _controller;
  late final bool _isControllerInit;

  @override
  void initState() {
    super.initState();
    _isControllerInit = widget.controller == null;
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    if (_isControllerInit) {
      _controller.dispose();
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
                  RoundedLabel(text: widget.name),
                  IconButton.filledTonal(
                    icon: const Icon(Icons.flip),
                    onPressed: () {}, // TODO: flip action
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
              child: AutoSizeTextField(
                controller: _controller,
                style: TextStyle(fontSize: 100.sp), // 設定很大讓系統自動縮放
                expands: true,
                minLines: null,
                maxLines: null,
                minFontSize: FlipCard._minFontSize,
                maxLength: FlipCard._maxTextLength,
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: widget.name,
                  hintStyle: TextStyle(color: Colors.black26, fontSize: 100.sp),
                  // border: InputBorder.none,
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
                  Row(
                    children: [
                      TextButton(child: Text('取消'), onPressed: () => {}),
                      TextButton(child: Text('清除'), onPressed: () => {}),
                    ],
                  ),
                  TextButton(child: Text('存檔'), onPressed: () => {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
