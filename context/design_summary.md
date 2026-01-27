# デザインサマリー

## 1. デザインコンセプト

- ターゲット：ポジティブな情報を求める人、国際ニュースに関心がある人
- 雰囲気：ミニマル / シンプル / 新聞の紙面に近づける
- 重視点：読みやすさ / 視認性 / 情報の厳選感

---

## 2. 現行デザインシステム

### カラーパレット
```css
/* Header */
--color-header-bg: #6B5F50;      /* グレーブラウン */
--color-header-text: #EFECE9;    /* オフホワイト */

/* Background */
--color-bg: #F2EADC;             /* 全体背景（ベージュ）*/
--color-container-bg: #FDF7ED;   /* コンテナ背景 */
--color-article-bg: #FFFBF5;     /* 記事エリア背景（ライトベージュ）*/

/* Text */
--color-text: rgba(56, 44, 43, 0.85);  /* #382C2B 85%不透明度 */

/* Border */
--color-border: #6b6660;
```

### 不透明度の指定方法
```css
/* Adobe XDの「塗りの不透明度」はrgbaで指定 */
/* NG: opacity: 0.85（要素全体が半透明になる） */
/* OK: color: rgba(56, 44, 43, 0.85)（色だけ半透明） */
```

### タイポグラフィ
```css
/* 日本語 */
--font-ja: 'Klee One', serif;

/* 英語（ヘッダー・フッター） */
--font-en: 'Times New Roman', Times, serif;

/* サイズ */
--font-size-title: 18px;
--font-size-body: 14px;
--font-size-header: 24px;
--font-size-footer: 13px;

/* ウェイト */
--font-weight-title: 600;        /* semi-bold */
--font-weight-body: normal;

/* 行間 */
--line-height: 1.7;
--line-height-title: 1.5;
--line-height-summary: 1.4;
```

### レイアウト（PC）
```css
/* 幅 */
--width-container: 539px;        /* 最外側 */
--width-content: 498px;          /* ヘッダー・記事エリア */
--width-text: 446px;             /* テキストボックス */

/* 高さ */
--height-container: 100vh;       /* コンテナ最小高さ */
--height-header: 45px;
--height-summary: 140px;         /* 本文エリア固定高さ */

/* 余白 */
--margin-container: 40px auto 0; /* 上40px、左右auto、下0 */
--padding-container: 30px 19px 30px 22px;
--space-header-title: 33px;      /* ヘッダーとタイトル間 */
--space-title-body: 7px;         /* タイトルと本文間 */
--space-article-gap: 16px;       /* 記事と記事の間隔 */
```

### 背景グリッド
```css
/* 200pxグリッド線 */
background-image:
  linear-gradient(rgba(0,0,0,0.03) 1px, transparent 1px),
  linear-gradient(90deg, rgba(0,0,0,0.03) 1px, transparent 1px);
background-size: 200px 200px;
```

---

## 3. コンポーネント規約

| コンポーネント | 仕様 |
|--------------|------|
| ヘッダー | 背景#6B5F50, テキスト#EFECE9, Times New Roman, 高さ45px |
| 記事エリア | 背景#FFFBF5, padding: 33px 26px 40px |
| 記事タイトル | Klee One, 18px, font-weight: 600, color: rgba(56,44,43,0.85) |
| 記事本文 | Klee One, 14px, height: 140px, line-height: 1.4, text-align: justify |
| フッター | 右寄せ, Times New Roman, border-top: 1px solid #6b6660 |

---

## 4. レスポンシブ

| 名前 | ブレークポイント | 対応 |
|------|-----------------|------|
| Mobile | 〜480px | 幅100%, グリッド100px, コンパクト |
| Tablet | 481〜768px | 幅100%, 適切な余白調整 |
| Desktop | 769px〜 | 固定幅539px |

---

## 5. 使用リソース

- フォント：Google Fonts（日本語: Klee One, 英語: Times New Roman）
- テンプレート：自作（テーマ不使用）
- ヘッダーテキスト：「Good Eyes S.S」
- フッターテキスト：「@Goodeyes s.s 2026」

## 6. アイデア（まだ実装はしなくて良い）
- 日本語は縦書き、英語は横書きにする
- 言語によって背景の新聞とレイアウトが変えられる仕組み

---

**注意**: デザイン変遷の詳細は `archive/design/iterations/` を参照

## 更新履歴
- 2026-01-18：カラーパレット更新、rgba不透明度指定に変更、本文高さ140px追加
- 2026-01-18：新デザイン仕様に全面更新（カラー・レイアウト・レスポンシブ）
- 2026-01-18：テーマ不使用・自作テンプレート方針を明記
- 2026-01-11：簡潔版テンプレートで初版作成
