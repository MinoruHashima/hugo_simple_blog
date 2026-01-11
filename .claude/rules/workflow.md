# Claude Code Workflow Rules（絶対遵守）

## プロジェクト管理用ディレクトリ構造

```
project/
├── .claude/              # Claude設定・テンプレート
│   └── rules/           # ワークフロールール・テンプレート
├── context/             # プロジェクトコンテキスト（最重要）
│   ├── current_state.md           # 【優先】今の作業状況（200-500トークン）
│   ├── project_context.md         # プロジェクト概要
│   ├── coding_summary.md          # 構成図+主要決定（500-1000トークン）
│   ├── design_summary.md          # 現行スタイル（500-1000トークン）
│   ├── progress_summary.md        # 直近2週間（500-1000トークン）
│   ├── shared_progress_summary.md # 外部共有用
│   └── archive/                   # 詳細履歴（必要時のみ参照）
│       ├── progress/              # 週次・月次アーカイブ
│       ├── coding/                # 技術的決定・実装詳細
│       ├── design/                # デザイン変遷
│       └── milestones/            # マイルストーン記録
├── diary_log/diary.txt  # 作業ログ（raw data）
├── map/                 # ディレクトリマップ
└── scripts/             # ユーティリティ
    ├── archive_context.sh  # アーカイブ管理
    └── load_context.sh     # コンテキスト読み込み
```

---

## 作業開始時（必須）

### 通常作業
**current_state.md を最優先で確認**
```bash
./scripts/load_context.sh quick
```

### 新機能実装・詳細把握が必要な場合
```bash
./scripts/load_context.sh standard
```

### 確認順序（優先度順）
1. **current_state.md** - 今の作業状況（最優先・毎回必須）
2. **project_context.md** - プロジェクト全体の仕様（初回・久しぶりの場合）
3. **coding_summary.md** - 実装状態・技術的決定（コード変更時）
4. **design_summary.md** - デザイン方針（UI変更時）
5. **progress_summary.md** - 進捗状況（タスク確認時）

### トークン節約のコツ
- 毎回全ファイルを読む必要はない
- current_state.md で作業継続に必要な情報は把握できる
- 詳細が必要な場合のみ該当ファイルを参照
- `./scripts/load_context.sh tokens` でトークン概算を確認

---

## 作業終了時（必須）

### 1. diary_log/diary.txt に作業内容を追記
`.claude/rules/diary_template.md` を参考に

### 2. current_state.md を更新（最重要）
- 今週の作業内容を更新
- 進行中のタスクを更新
- 直近の技術的決定を追記
- 次にやることを明記

### 3. 新規ファイル・構造変更があった場合
`map/directory_map.txt` を更新

### 4. context/shared_progress_summary.md を更新
`.claude/rules/shared_progress_summary_template.md` を参考に

---

## 週次ルーチン（日曜日推奨）

### アーカイブ実行
```bash
./scripts/archive_context.sh weekly
```

### 作業内容
1. progress_summary.md の先週分を archive/progress/ に移動
2. 週次アーカイブファイル（YYYY_Wnn.md）を作成
3. progress_summary.md を今週分にリセット
4. current_state.md の「今週の作業内容」をリセット

---

## 月次ルーチン（月末推奨）

### アーカイブ実行
```bash
./scripts/archive_context.sh monthly
```

### 作業内容
1. 月次サマリー（YYYY-MM_summary.md）を作成
2. coding_summary.md の古い決定を archive/coding/decisions/ に移動
3. design_summary.md の変遷履歴を archive/design/iterations/ に移動
4. 各contextファイルが目安トークン数に収まっているか確認

---

## 手動アーカイブ（随時）

### 重要な技術的決定を記録する場合
```bash
./scripts/archive_context.sh manual
# → 1) 技術的決定 を選択
```

### マイルストーン達成時
```bash
./scripts/archive_context.sh manual
# → 4) マイルストーン を選択
```

---

## contextファイルのサイズ管理

### 目安トークン数
| ファイル | 目安 | 超過時の対応 |
|---------|------|-------------|
| current_state.md | 200-500 | 古い情報を削除 |
| coding_summary.md | 500-1000 | 詳細を archive に移動 |
| design_summary.md | 500-1000 | 変遷を archive に移動 |
| progress_summary.md | 500-1000 | 2週間以前を archive に移動 |

### トークン確認
```bash
./scripts/load_context.sh tokens
```

---

## アーカイブからの復元

過去の詳細情報が必要な場合：

```bash
# 特定の週の進捗を確認
cat context/archive/progress/2026_W01.md

# 技術的決定の経緯を確認
ls context/archive/coding/decisions/
cat context/archive/coding/decisions/2026-01-10_xxx.md
```

---

## トラブルシューティング

### contextが肥大化してきた
1. `./scripts/load_context.sh tokens` で確認
2. `./scripts/archive_context.sh weekly` または `monthly` を実行
3. 手動で古い情報を archive に移動

### アーカイブディレクトリがない
```bash
./scripts/archive_context.sh init
```

### 過去の情報が見つからない
1. まず archive/ 配下を確認
2. なければ diary_log/diary.txt を検索
