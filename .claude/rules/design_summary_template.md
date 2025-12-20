# Design Summary Template
# デザインサマリー

## 1. デザインコンセプト

### プロジェクトのデザイン方針
- ターゲットユーザー：
- デザインの雰囲気：（例：モダン、ミニマル、カラフル等）
- 重視する点：（例：使いやすさ、視認性、ブランド感等）

---

## 2. デザイン変遷

### v1.0（初期案）- YYYY-MM-DD
#### 概要
- どんなデザインだったか

#### 問題点
- なぜ変更したか

#### スクリーンショット/メモ
```
（画像パスや説明）
```

---

### v2.0（改善案）- YYYY-MM-DD
#### 変更点
- v1.0からの主な変更

#### 改善理由
- 何を解決したか

---

### 現在のデザイン（vX.X）- YYYY-MM-DD
#### 特徴
- 現在採用しているデザインの特徴

#### 確定した要素
- これ以上変更しない要素

---

## 3. デザインシステム（コード実装用）

### カラーパレット
```css
/* Primary Colors */
--color-primary: #000000;
--color-primary-light: #000000;
--color-primary-dark: #000000;

/* Secondary Colors */
--color-secondary: #000000;

/* Neutral Colors */
--color-background: #ffffff;
--color-text: #000000;
--color-border: #000000;

/* Status Colors */
--color-success: #000000;
--color-error: #000000;
--color-warning: #000000;
```

### タイポグラフィ
```css
/* Font Family */
--font-primary: 'Font Name', sans-serif;
--font-secondary: 'Font Name', serif;

/* Font Sizes */
--font-size-xs: 12px;
--font-size-sm: 14px;
--font-size-md: 16px;
--font-size-lg: 18px;
--font-size-xl: 24px;
--font-size-2xl: 32px;

/* Line Heights */
--line-height-tight: 1.2;
--line-height-normal: 1.5;
--line-height-loose: 1.8;
```

### スペーシング
```css
/* Spacing Scale */
--space-xs: 4px;
--space-sm: 8px;
--space-md: 16px;
--space-lg: 24px;
--space-xl: 32px;
--space-2xl: 48px;
```

### ボーダー・シャドウ
```css
/* Border Radius */
--radius-sm: 4px;
--radius-md: 8px;
--radius-lg: 12px;
--radius-full: 9999px;

/* Shadows */
--shadow-sm: 0 1px 2px rgba(0,0,0,0.1);
--shadow-md: 0 4px 6px rgba(0,0,0,0.1);
--shadow-lg: 0 10px 15px rgba(0,0,0,0.1);
```

---

## 4. コンポーネント別デザイン仕様

### ボタン
- **Primary Button**
  - 背景色：
  - テキスト色：
  - ホバー時：
  - サイズバリエーション：

- **Secondary Button**
  - （同様）

### フォーム
- **Input Field**
  - ボーダー：
  - フォーカス時：
  - エラー時：

### カード
- 角丸：
- シャドウ：
- パディング：

---

## 5. レスポンシブ対応

### ブレークポイント
```css
/* Mobile */
--breakpoint-sm: 640px;

/* Tablet */
--breakpoint-md: 768px;

/* Desktop */
--breakpoint-lg: 1024px;

/* Large Desktop */
--breakpoint-xl: 1280px;
```

### 各デバイスでの主な違い
- モバイル：
- タブレット：
- デスクトップ：

---

## 6. 対話型デザイン試作ログ

### セッション 1 - YYYY-MM-DD
#### 試したこと
- 配色パターンA, B, C

#### フィードバック
- Aは暗すぎる
- Bが一番しっくりくる

#### 決定事項
- パターンBを採用

---

### セッション 2 - YYYY-MM-DD
（同様の構成）

---

## 7. デザインリソース

### 使用ツール
- デザインツール：（例：Figma, Adobe XD）
- アイコン：（例：Heroicons, Font Awesome）
- イラスト：

### 参考サイト
- URL 1：理由
- URL 2：理由

---

## 更新履歴
- YYYY-MM-DD：初版作成
- YYYY-MM-DD：カラーパレット確定