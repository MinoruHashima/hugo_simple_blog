# プロジェクトコンテキスト

## プロジェクト名
Hugo Simple Blog

## 概要
Hugoを使用した静的ブログサイト。世界中のポジティブなニュースや情報を厳選して紹介する情報キュレーションメディア。暗いニュースは扱わず、明るく前向きな情報を国境を越えて届ける「情報のセレクトショップ」。
新聞の情報をメインにしたいので、デザインも新聞をベースに

---

## ターゲットユーザー
- ポジティブな情報を求める人
- 国際的なニュースに関心がある人
- 暗いニュースに疲れた人
- 厳選された質の高い情報を効率的に得たい人

---

## 実装方針
1. Hugoで静的サイト生成（高速・セキュア）
2. 外部URLの記事を紹介する形式
3. シンプルで読みやすいデザイン
4. GitHub Actions による自動デプロイ
5. 記事はMarkdownで管理

---

## 主要機能（MVP）
- [ ] 記事カード一覧表示（タイトル・要約・タグ・外部リンク）
- [ ] タグフィルタリング（オプション）
- [ ] RSS フィード
- [ ] レスポンシブデザイン
- [ ] ページネーション（記事数が増えた場合）
---

## 技術スタック
- **静的サイトジェネレーター**: Hugo (Go)
- **フロントエンド**: 自作Hugoテンプレート（シンプルなHTML構造）
- **スタイリング**: カスタムCSS（static/css/style.css）
- **テーマ**: 不使用（layouts/に自作テンプレートを配置）
- **ホスティング**: AWS EC2 + Nginx
- **SSL**: Let's Encrypt
- **CI/CD**: GitHub Actions
- **バージョン管理**: Git / GitHub

---

## デプロイ構成
```
GitHub Repository
  ↓ (push)
GitHub Actions
  ↓ (build & deploy)
EC2 (Amazon Linux 2)
  └─ Nginx (/var/www/blog)
```

---

## ディレクトリ構成
```
hugo_simple_blog/
├── content/          # Markdown記事
│   └── posts/        # ブログ記事
├── layouts/          # 自作テンプレート（テーマ不使用）
│   ├── index.html    # トップページ（記事一覧）
│   └── _default/     # デフォルトレイアウト
├── static/           # 静的アセット
│   └── css/
│       └── style.css # カスタムCSS
├── public/           # ビルド出力（Git管理外）
├── context/          # プロジェクト管理ファイル
│   ├── project_context.md
│   ├── coding_summary.md
│   ├── design_summary.md
│   └── progress_summary.md
├── .github/
│   └── workflows/
│       └── deploy.yml  # 自動デプロイ設定
├── .claude/          # Claude設定
├── config.toml       # Hugo設定ファイル
└── README.md
```

---

## 環境セットアップ

### ローカル開発
```bash
# Hugoインストール（Mac）
brew install hugo

# 開発サーバー起動
hugo server -D

# 本番ビルド
hugo --minify
```

### EC2環境
- **OS**: Amazon Linux 2
- **Webサーバー**: Nginx
- **デプロイディレクトリ**: /var/www/blog
- **デプロイユーザー**: deploy

---

## 開発フロー
1. ローカルで記事作成 (`hugo new posts/article-name.md`)
2. 記事編集（Markdown）
3. ローカル確認 (`hugo server -D`)
4. Git commit & push
5. GitHub Actions が自動ビルド・デプロイ

---

## 今後の拡張予定
- [ ] コメント機能（Disqus等）
- [ ] Google Analytics 連携
- [ ] ニュースレター購読機能
- [ ] ソーシャルシェアボタン
- [ ] 多言語対応
- [ ] ダークモード

---

## 更新履歴
- 2026-01-18: プロジェクト開始、Context管理システム構築