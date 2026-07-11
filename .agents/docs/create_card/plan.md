# Plan: 新增單字卡

## 背景介紹
根據 [SPECS.md](../SPECS.md)，「新增單字卡」是第一階段基本功能之一，也是單字卡相關功能（編輯、刪除、列表、群組）的前置基礎。單字卡本身在第一階段需支援 label（最多 10 組），用來取代群組功能、讓使用者能更靈活地將單字分類。詳細 UI/UX 流程與規格決策見 [decision.md](decision.md)。

本次 plan **僅涵蓋「新增」流程**；剛新增卡片的「編輯」（decision.md 中的流程 1）不列入範圍，留待後續「編輯單字卡」spec 處理。

## 目標
在 Home 頁提供新增按鈕，導向獨立的新增單字卡 Page：使用者可依序輸入原文、譯文（正反卡片翻轉呈現），並標上 label（必填，支援 autocomplete，最多 10 組），可連續新增多張卡片（視覺堆疊最多 3 張），點擊完成後存入 sqlite 並導回 Home。

## 現況

### 待執行
- [ ] sqlite 資料模型設計（單字卡 / label 資料表與關聯）（[progress_1.md](progress_1.md)）
- [ ] 新增單字卡 Page UI（卡片正反翻轉、堆疊視覺效果、label 輸入含 autocomplete）（[progress_2.md](progress_2.md)）
- [ ] 儲存與驗證邏輯整合（必填/長度檢查、label 預設規則、完成後導回 Home）（[progress_3.md](progress_3.md)）

### 已完成
（無）

## 總結
規格討論已完成並記錄於 `decision.md`。待確認上述任務拆分方式後，即可建立對應的 `progress_N.md` 並開始逐項實作。

### 影響範圍
- 新增：sqlite schema（單字卡表、label 表、關聯表）
- 新增：新增單字卡 Page 與相關元件（卡片翻轉、堆疊效果、label 輸入/autocomplete）
- 新增：Home 頁「新增」按鈕導頁邏輯
- 不影響：既有編輯/刪除/列表/群組功能（尚未實作或不在本次範圍）
