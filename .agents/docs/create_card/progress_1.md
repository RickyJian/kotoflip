# sqlite 資料模型設計

> 對應 [plan.md](plan.md) 「待執行」項目：sqlite 資料模型設計（單字卡 / label 資料表與關聯）

執行前需參閱 `decision.md` 檔案才可開始執行。

## label 資料表設計

label 為全域共用資源（總數上限 10 組，見 decision.md「欄位驗證規則」），每張單字卡僅能歸屬 1 個 label。

- [ ] 定義 `labels` 資料表欄位：`id`（PK）、`name`（TEXT, UNIQUE, 長度 ≤ 20 字元）、`created_at`
- [ ] 決定「總數上限 10 組」的檢查層級：由 app 端邏輯檢查（新增前先 count），DB 層不加額外 constraint
- [ ] 決定 autocomplete 查詢方式（依 decision.md：從曾輸入過的 label 歷史紀錄帶出建議）→ 對應查詢 `SELECT name FROM labels`

## 單字卡資料表設計

- [ ] 定義 `word_cards` 資料表欄位：`id`（PK）、`original_text`（TEXT, NOT NULL, 長度 ≤ 100 字元）、`translation_text`（TEXT, NOT NULL, 長度 ≤ 100 字元）、`label_id`（FK → labels.id, NOT NULL）、`created_at`
- [ ] 確認 `label_id` 的外鍵行為：刪除 label 時的處理策略（本次僅設計欄位與關聯，實際刪除規則留待「刪除單字卡/label」相關 spec 處理，此處先標記 `ON DELETE RESTRICT` 或待確認）

## sqlite 套件與初始化

- [ ] 確認 Flutter 專案採用的 sqlite 套件（如 `sqflite`），並確認專案內尚未有既有的資料庫初始化程式碼
- [ ] 建立資料庫初始化/migration 檔案（建表語句、版本管理）

## 總結

尚未開始執行，待審閱本檔案任務拆分後依序進行。
