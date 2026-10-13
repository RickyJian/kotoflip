// analyzer 不認得 unicode 模式下的 \p{...}，但 Dart 執行期可正常解析
// ignore_for_file: valid_regexps

import 'package:flutter/services.dart';

class NoEmojiInputFormatter extends FilteringTextInputFormatter {
  NoEmojiInputFormatter()
    : super.deny(
        RegExp(
          r'[\u{1F1E6}-\u{1F1FF}\u{1F3FB}-\u{1F3FF}]' // 旗幟、膚色修飾
          r'|\p{Extended_Pictographic}' // 大多數 emoji 與圖形符號
          r'|\p{Emoji_Presentation}'
          r'|[‍️⃣]', // 連接符、變體選擇符、鍵帽
          unicode: true,
        ),
      );
}
