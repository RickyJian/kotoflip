import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotoflip/models/card_tag.dart';

import 'no_emoji_input_formatter.dart';
import 'widget_constant.dart';

class CardTagDialog extends StatefulWidget {
  const CardTagDialog({super.key, required this.title, this.tag, this.onSaved});

  final String title;
  final CardTag? tag;
  final void Function(CardTag tag)? onSaved;

  // private constant
  static const int _headerSize = 28;
  static const int _maxTagLength = 10;
  static const int _tagFontSize = 20;
  static const int _spacing = 4;

  @override
  State<CardTagDialog> createState() => _CardTagDialogState();
}

class _CardTagDialogState extends State<CardTagDialog> {
  late final TextEditingController _tagController = TextEditingController(
    text: widget.tag?.text ?? '',
  );

  @override
  void dispose() {
    _tagController.dispose();
    super.dispose();
  }

  void _save() {
    final text = _tagController.text.trim();
    if (text.isEmpty) return;
    widget.onSaved?.call(CardTag(id: widget.tag?.id ?? '', text: text));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.topCenter,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(WidgetConstant.cardBorderRadius.r),
      ),
      elevation: WidgetConstant.elevation,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: Colors.grey[100],
            padding: EdgeInsets.symmetric(
              vertical: WidgetConstant.verticalPadding.h,
              horizontal: WidgetConstant.horizontalPadding.w,
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              widget.title,
              style: TextStyle(fontSize: CardTagDialog._headerSize.sp),
            ),
          ),
          const Divider(height: 1),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(
              vertical: WidgetConstant.verticalPadding.h,
              horizontal: WidgetConstant.horizontalPadding.w,
            ),
            child: Row(
              spacing: CardTagDialog._spacing.w,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  '#',
                  style: TextStyle(
                    fontSize: CardTagDialog._tagFontSize.sp,
                    color: Colors.black54,
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: _tagController,
                    style: TextStyle(fontSize: CardTagDialog._tagFontSize.sp),
                    autofocus: true,
                    maxLength: CardTagDialog._maxTagLength,
                    inputFormatters: [
                      NoEmojiInputFormatter(),
                      FilteringTextInputFormatter.deny(RegExp('[#＃]')),
                    ],
                    textAlign: TextAlign.left,
                    textAlignVertical: TextAlignVertical.center,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => _save(),
                    decoration: InputDecoration(
                      counterText: '', // 隱藏內建計數器
                      hintText: '請輸入標籤',
                      hintStyle: TextStyle(
                        color: Colors.black38,
                        fontSize: CardTagDialog._tagFontSize.sp,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: _tagController,
                  builder: (context, value, _) => Text(
                    '${value.text.length}/${CardTagDialog._maxTagLength}',
                    style: TextStyle(
                      fontSize: CardTagDialog._tagFontSize.sp,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Container(
            color: Colors.grey[100],
            padding: EdgeInsets.symmetric(
              vertical: WidgetConstant.verticalPadding.h,
              horizontal: WidgetConstant.horizontalPadding.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: const Text('取消'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                ValueListenableBuilder(
                  valueListenable: _tagController,
                  builder: (context, value, _) => TextButton(
                    onPressed: value.text.trim().isEmpty ? null : _save,
                    child: const Text('存檔'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
