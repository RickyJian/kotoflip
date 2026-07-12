# Specs

## 基本功能

**第一階段**

1. 新增單字卡
2. 編輯單字卡
3. 刪除單字卡
4. 單字卡列表
5. 單字卡群組（根據 label 群組自己 focus 的單字項目）

**後續階段**

1. 單字卡群組統計資訊
2. 匯入/匯出單字卡

## 單字卡功能

**第一階段**

1. label（最多 10 組；補充：代替群組功能，為了更靈活地將單字分群，而不是在各個群組都新增一樣的項目）

**後續階段**

1. 統計資訊
2. 發音

## 挑戰功能

**第一階段**

1. 全部
2. 單字卡群組

> shuffle 全部 or 單字卡群組

**後續階段**

1. 進階 shuffle 功能（根據統計將最少練習的排在最上方、最新的排序在最上方）

## 設定

**第一階段**

1. i18n：台灣繁體中文、日文、英文
2. theme：dark、light

## Project Structure

採用 feature-first 架構：

```
lib/
  repositories/   # 共用資料存取層（跨功能重用）
  models/         # 共用 domain model
  widgets/        # 跨功能共用元件
  features/
    <feature>/    # 各功能自成一包（bloc、view、widgets）
```
