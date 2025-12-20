# Claude Code Workflow Rules（絶対遵守）

# 作業前に把握把握しておくこと
このプロジェクトで制作している以外の、claudeCodeプロジェクト管理用ディレクトリ構造

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

## 作業開始時（必須）
作業前に必ず確認：
1. **project_context.md** - プロジェクト全体の仕様・構成
2. **coding_summary.md** - 実装状態・技術的決定
3. **design_summary.md** - デザイン方針・スタイル定義
4. **progress_summary.md** - 進捗状況・タスク管理


## 作業終了時（必須）
1. diary_log/diary.txt に作業内容を追記(.claude/rules/diary_template.md)を参考に
2. 新規ファイル・構造変更があった場合は
   map/directory_map.txt を更新
3. context/shared_progress_summary.md に
   .claude/rules/shared_progress_summary_template.md
   を参考に、人間向けの要約を更新


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


