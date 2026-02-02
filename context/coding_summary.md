# コーディングサマリー

## 1. システム全体構造

### アーキテクチャ
- システムタイプ：Hugo静的サイト（外部記事キュレーション型）
- フロントエンド：HTML/CSS/JS（Hugo テンプレート）
- バックエンド：なし（静的サイト）
- データベース：なし
- ページ構成：**一覧ページのみ（詳細ページなし）**

### ディレクトリ構成（主要のみ）
```
hugo_simple_blog/
├── content/posts/  # Markdown記事（要約+外部URL）
├── layouts/        # 自作テンプレート（テーマ不使用）
│   └── index.html  # トップページ（記事一覧）
├── static/         # 静的アセット
│   └── css/style.css  # カスタムCSS
├── public/         # ビルド出力（Git管理外）
└── .github/        # CI/CD設定
    └── workflows/
        └── deploy.yml
```

### データフロー
```
Markdown（要約+外部URL） 
  ↓
Hugo Build 
  ↓
静的HTML（記事カード一覧） 
  ↓
ブラウザ表示 → 外部リンククリック → 外部サイトへ
```

---

## 2. 主要モジュール（概要のみ）

| モジュール | 目的 | 場所 |
|-----------|------|------|
| 記事コンテンツ | タイトル・要約・外部URL・タグ | `content/posts/*.md` |
| 一覧テンプレート | 記事カード表示 | `layouts/index.html` |
| スタイル | カードデザイン・レスポンシブ | `static/css/` |
| デプロイ自動化 | GitHub Actions → EC2 | `.github/workflows/deploy.yml` |

---

## 3. 重要な技術的決定（最新5件）

| 日付 | 決定内容 | 理由 |
|------|---------|------|
| 2026-01-18 | テーマ不使用・自作レイアウト | シンプルさ優先、sampleLayout.html参照 |
| 2026-01-18 | 日本語フォントに Klee One を採用 | 柔らかく読みやすい印象 |
| 2026-01-18 | 詳細ページを作らず一覧のみ | 外部記事紹介型のため、シンプルに |
| 2026-01-18 | EC2 + GitHub Actions でデプロイ | AWS学習・コスト最適化 |
| 2026-01-18 | Hugoを採用 | 静的サイト・高速・DB不要 |

※ 詳細・経緯は `archive/coding/decisions/` を参照

---

## 4. コーディング規約（主要のみ）

### ファイル・コード規約
- ファイル名：kebab-case（例：`positive-news-01.md`）
- テンプレート：Go template記法
- インデント：2スペース

### デザイン規約
- **日本語フォント**: `Klee One`（Google Fonts）


### Markdown frontmatter必須項目
- `title`, `date`, `external_url`, `summary`, `tags`

---

## 5. 記事フォーマット例
```markdown
---
title: "記事タイトル"
date: 2025-01-18
tags: ["タグ1", "タグ2"]
external_url: "https://example.com/article"
summary: "記事の要約（2-3行程度）"
---
```

---

## 6. 既知の課題（対応予定）

| 課題 | 影響 | 優先度 |
|------|------|--------|
| タグフィルタリング未実装 | UX | 中 |
| 日付表示を出す | UX | 高 |
| 背景画像を作って適用する | UX | 高 |
| 国を表示する | UX | 高 |
| 新聞社名を表示する | UX | 高 |

---

**注意**:
- 詳細な実装経緯 → `archive/coding/implementations/`
- 過去の決定詳細 → `archive/coding/decisions/`

## 更新履歴
- 2026-01-18：テーマ不使用・自作レイアウト方針に変更
- 2026-01-18：Klee Oneフォント追加、一覧のみ方式・外部記事キュレーション型に更新
- 2026-01-11：簡潔版テンプレートで初版作成