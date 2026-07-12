# 新增單字卡 Page UI

> 對應 [plan.md](plan.md) 「待執行」項目：新增單字卡 Page UI（卡片正反翻轉、堆疊視覺效果、label 輸入含 autocomplete）

執行前需參閱 `decision.md` 檔案才可開始執行。

## Home 頁面整備（新增進入點）

檔案：[lib/main.dart](../../../lib/main.dart)。目前是預設 counter 範例程式碼，先清理成只保留新增進入點，實際導頁邏輯留待串接階段處理。

- [x] 移除 `_counter` 狀態與 `_incrementCounter()` 邏輯，`body` 內的 `Center`/`Column`/文字顯示全部移除
- [x] `MyHomePage` 由 `StatefulWidget` 改為 `StatelessWidget`（無殘留狀態）
- [x] 保留 `AppBar`；保留 `floatingActionButton`（icon 維持 `Icons.add`，`onPressed` 先留空／TODO）

## RWD 基礎設定（screenutil）

參閱 `decision.md`「RWD 套件選型」。`flutter_screenutil` 套件已加入 [pubspec.yaml](../../../pubspec.yaml)。

- [x] `main.dart` 以 `ScreenUtilInit` 包住 App，設定 `designSize`
- [x] 確認 `designSize` 基準（依設計稿或以常見手機解析度為基準）

## 卡片翻轉元件

正方形卡片，正面顯示「原文」輸入區、背面顯示「譯文」輸入區，皆以左上角淡色文字作為 placeholder。

- [ ] 建立正方形卡片元件，支援正/背面翻轉動畫
- [ ] 正面輸入完成送出 → 自動翻至背面
- [ ] 背面輸入完成 → 停留在背面（不自動翻回正面）
- [ ] readonly / edit 狀態切換的視覺呈現（本次僅涵蓋新增流程下的 read-only 完成態，不含編輯功能）
- [ ] 卡片尺寸、內距、字體改用 `flutter_screenutil` 單位（`.w`/`.h`/`.sp`）

## 堆疊視覺效果

- [ ] 點擊「新增」按鈕時，目前卡片 swipe 至左側、疊在新卡片下方
- [ ] 視覺堆疊最多顯示 3 張（最上層為編輯中卡片 + 往下疊 2 張），超過部分不再增加堆疊層
- [ ] swipe 手勢限制：僅 read mode（已存檔）卡片可被 swipe；尚未存檔的卡片不可 swipe
- [ ] 堆疊位移量（swipe 位移、疊卡間距）改用 `flutter_screenutil` 單位（`.w`/`.h`）

## label 輸入區塊

卡片下方（卡片範圍外）顯示，必填，20 字元內。

- [ ] 手動輸入欄位
- [ ] autocomplete：依已輸入過的 label 歷史紀錄提供建議清單
- [ ] 預設值規則：第一張卡片預設「預設群組」；第二張起預設帶入「上一張卡片的 label」
- [ ] 總 label 數上限 10 組的前端提示（例如已達上限時 autocomplete 建議清單以外不可再建立新 label）
- [ ] 區塊尺寸、間距、字體改用 `flutter_screenutil` 單位（`.w`/`.h`/`.sp`）

## 總結

「Home 頁面整備」「RWD 基礎設定（screenutil）」已完成待審閱。接下來進行「卡片翻轉元件」。
