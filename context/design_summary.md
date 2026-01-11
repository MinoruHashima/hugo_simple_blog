# デザインサマリー

## 1. デザインコンセプト

- ターゲット：（記載予定）
- 雰囲気：ミニマル / シンプル
- 重視点：読みやすさ / 視認性

---

## 2. 現行デザインシステム

### カラーパレット
```css
/* Primary */
--color-primary: #333333;
--color-primary-light: #555555;

/* Background & Text */
--color-bg: #ffffff;
--color-text: #1a1a1a;
--color-text-muted: #666666;

/* Accent */
--color-accent: #0066cc;
--color-error: #dc3545;
--color-success: #28a745;
```

### タイポグラフィ
```css
--font-primary: 'Noto Sans JP', sans-serif;
--font-size-base: 16px;
--font-size-sm: 14px;
--font-size-lg: 18px;
--font-size-xl: 24px;
--line-height: 1.6;
```

### スペーシング
```css
--space-xs: 4px;
--space-sm: 8px;
--space-md: 16px;
--space-lg: 24px;
--space-xl: 32px;
```

### ボーダー・シャドウ
```css
--radius-sm: 4px;
--radius-md: 8px;
--shadow-sm: 0 1px 3px rgba(0,0,0,0.1);
--shadow-md: 0 4px 6px rgba(0,0,0,0.1);
```

---

## 3. コンポーネント規約

| コンポーネント | 仕様 |
|--------------|------|
| 記事カード | radius-md, shadow-sm |
| ボタン | radius-sm, padding: space-sm space-md |
| 入力欄 | border: 1px solid, radius-sm |

---

## 4. レスポンシブ

| 名前 | ブレークポイント |
|------|-----------------|
| Mobile | 〜639px |
| Tablet | 640〜1023px |
| Desktop | 1024px〜 |

---

## 5. 使用リソース

- アイコン：（検討中）
- フォント：Google Fonts（Noto Sans JP）

---

**注意**: デザイン変遷の詳細は `archive/design/iterations/` を参照

## 更新履歴
- 2026-01-11：簡潔版テンプレートで初版作成
