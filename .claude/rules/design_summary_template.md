# Design Summary Template（簡潔版）
# デザインサマリー（目安：500-1000トークン）

## 1. デザインコンセプト

- ターゲット：
- 雰囲気：（モダン / ミニマル / カラフル等）
- 重視点：（使いやすさ / 視認性 / ブランド感等）

---

## 2. 現行デザインシステム

### カラーパレット
```css
/* Primary */
--color-primary: #000000;
--color-primary-light: #333333;

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
| ボタン | radius-sm, padding: space-sm space-md |
| カード | radius-md, shadow-sm, padding: space-md |
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

- アイコン：Heroicons / Font Awesome
- フォント：Google Fonts

---

**注意**: デザイン変遷の詳細は `archive/design/iterations/` を参照

## 更新履歴
- YYYY-MM-DD：初版作成
