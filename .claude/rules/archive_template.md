# Archive Template
# アーカイブ用テンプレート集

## ディレクトリ構造
```
context/archive/
├── progress/
│   ├── YYYY_Wnn.md        # 週次アーカイブ
│   └── YYYY-MM_summary.md # 月次サマリー
├── coding/
│   ├── decisions/
│   │   └── YYYY-MM-DD_decision_name.md
│   └── implementations/
│       └── YYYY-MM-DD_feature_name.md
├── design/
│   └── iterations/
│       └── YYYY-MM-DD_design_name.md
└── milestones/
    └── YYYY-MM-DD_milestone_name.md
```

---

## 週次進捗アーカイブ（progress/YYYY_Wnn.md）

```markdown
# Week nn - YYYY年MM月

## 期間
YYYY-MM-DD 〜 YYYY-MM-DD

## 作業時間
- 合計：XX時間
- 日別：
  - MM-DD（月）：Xh
  - MM-DD（火）：Xh
  - ...

## 完了タスク
- [x] タスク1
- [x] タスク2

## 主な変更
- 〇〇機能を追加
- 〇〇を修正

## 技術的決定
- 【決定内容】：【理由】

## 課題・振り返り
- よかった点：
- 改善点：
```

---

## 月次サマリー（progress/YYYY-MM_summary.md）

```markdown
# YYYY年MM月 サマリー

## 概要
- 作業日数：XX日
- 合計時間：XX時間
- 主な成果：

## 週別サマリー
| 週 | 主な作業 | 時間 |
|----|---------|------|
| W01 | 〇〇 | Xh |
| W02 | 〇〇 | Xh |

## 技術的決定（月次）
1. 【決定1】
2. 【決定2】

## 進捗率の変化
- 月初：XX%
- 月末：XX%
- 進捗：+XX%
```

---

## 技術的決定アーカイブ（coding/decisions/）

```markdown
# 技術的決定：【タイトル】

- 日付：YYYY-MM-DD
- 決定者：〇〇
- 状態：確定 / 暫定 / 廃止

## 背景
なぜこの決定が必要になったか

## 選択肢
1. **案A**：内容
   - メリット：
   - デメリット：

2. **案B**：内容
   - メリット：
   - デメリット：

## 決定
案〇を採用

## 理由
なぜその案を選んだか

## 影響範囲
- ファイル：
- 機能：

## 関連
- Issue: #XX
- PR: #XX
```

---

## 実装詳細アーカイブ（coding/implementations/）

```markdown
# 実装詳細：【機能名】

- 日付：YYYY-MM-DD
- 担当：〇〇

## 概要
何を実装したか

## 実装場所
- メイン：`path/to/file`
- 関連：`path/to/related`

## 技術的ポイント
- 使用ライブラリ：
- 工夫した点：
- 注意点：

## 経緯
1. 最初のアプローチ：〇〇（問題：△△）
2. 改善：〇〇
3. 最終形：〇〇

## コード例
（必要に応じて）
```

---

## デザイン変遷アーカイブ（design/iterations/）

```markdown
# デザイン変遷：【対象】

- 日付：YYYY-MM-DD

## バージョン履歴

### v1（YYYY-MM-DD）
- 内容：
- 問題点：

### v2（YYYY-MM-DD）
- 変更点：
- 改善理由：

## 最終決定
- 採用バージョン：vX
- 確定日：YYYY-MM-DD
```

---

## マイルストーン記録（milestones/）

```markdown
# マイルストーン：【名前】

- 達成日：YYYY-MM-DD
- フェーズ：Phase X

## 達成内容
- [x] 条件1
- [x] 条件2

## 振り返り
- 予定工数：XXh
- 実績工数：XXh
- 差分理由：

## 学び
- よかった点：
- 次に活かすこと：
```
