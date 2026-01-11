# 技術的決定：Context管理システムのリファクタリング

- 日付：2026-01-11
- 決定者：ユーザー / Claude
- 状態：確定

## 背景
- contextファイルが際限なく増大する設計だった
- 全履歴を保持すると数万トークンに到達する可能性があった
- 作業開始時に毎回全文読み込みで非効率だった

## 選択肢
1. **現状維持**
   - メリット：変更コストなし
   - デメリット：トークン肥大化が続く

2. **アーカイブ構造の導入**
   - メリット：トークン数を制御可能、履歴も保持
   - デメリット：運用ルールの追加

## 決定
案2（アーカイブ構造の導入）を採用

## 理由
- トークン肥大化を防ぎつつ、過去の履歴も失わない
- current_state.md による作業効率の向上
- 週次・月次ルーチンで自動的に整理できる

## 実装内容

### 新規作成ファイル
- `.claude/rules/current_state_template.md` - 作業状況テンプレート
- `.claude/rules/archive_template.md` - アーカイブテンプレート集
- `scripts/archive_context.sh` - アーカイブ管理スクリプト
- `scripts/load_context.sh` - コンテキスト読み込みスクリプト
- `context/current_state.md` - 作業状況ファイル
- `context/archive/` - アーカイブディレクトリ構造

### 更新ファイル
- `.claude/rules/workflow.md` - ワークフロールール全面改訂
- `.claude/rules/coding_summary_template.md` - 簡潔版に変更
- `.claude/rules/design_summary_template.md` - 簡潔版に変更
- `.claude/rules/progress_summary_template.md` - 簡潔版に変更
- `context/` 配下の全ファイル - 新テンプレートで再作成

### 目安トークン数
| ファイル | 目安 |
|---------|------|
| current_state.md | 200-500 |
| coding_summary.md | 500-1000 |
| design_summary.md | 500-1000 |
| progress_summary.md | 500-1000 |

## 影響範囲
- context/ 配下全体
- .claude/rules/ のテンプレート
- scripts/ のユーティリティ
- 日常のワークフロー
