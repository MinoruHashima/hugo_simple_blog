# Claude Code Prime Directive
- 作業前に必ず .claude/rules/内のフォルダをすべて読むこと

## 1. プロジェクト構造

```
newClaude/
├── .claude/              # Claude設定・テンプレート
├── context/             # プロジェクトコンテキスト（最重要）
│   ├── coding_summary.md
│   ├── design_summary.md
│   ├── progress_summary.md
│   ├── project_context.md
│   └── shared_progress_summary.md
├── diary_log/diary.txt  # 作業ログ
├── map/                 # ディレクトリマップ
└── scripts/             # ユーティリティ
```

## 2. contextファイル（必読）

### 常に参照すべきファイル
作業前に必ず確認：

1. **project_context.md** - プロジェクト全体の仕様・構成
2. **coding_summary.md** - 実装状態・技術的決定
3. **design_summary.md** - デザイン方針・スタイル定義
4. **progress_summary.md** - 進捗状況・タスク管理
