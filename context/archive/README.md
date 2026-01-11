# Archive ディレクトリ

詳細な履歴情報を保存するためのアーカイブ領域です。
通常の作業では参照不要。必要な場合のみ閲覧してください。

## ディレクトリ構成

```
archive/
├── progress/              # 週次・月次の進捗アーカイブ
│   ├── YYYY_Wnn.md       # 週次アーカイブ
│   └── YYYY-MM_summary.md # 月次サマリー
├── coding/
│   ├── decisions/         # 技術的決定の詳細記録
│   └── implementations/   # 実装詳細の記録
├── design/
│   └── iterations/        # デザイン変遷の記録
└── milestones/            # マイルストーン達成記録
```

## 使い方

### アーカイブの作成
```bash
# 週次アーカイブ（毎週日曜日推奨）
./scripts/archive_context.sh weekly

# 月次アーカイブ（毎月末推奨）
./scripts/archive_context.sh monthly

# 手動アーカイブ（技術的決定、マイルストーン等）
./scripts/archive_context.sh manual
```

### アーカイブの参照
```bash
# 特定の週の進捗
cat context/archive/progress/2026_W01.md

# 技術的決定の一覧
ls context/archive/coding/decisions/

# 詳細読み込み
./scripts/load_context.sh detailed
```

## テンプレート

各種アーカイブのテンプレートは `.claude/rules/archive_template.md` を参照してください。
