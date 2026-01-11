#!/bin/bash
# archive_context.sh - Context管理システムのアーカイブスクリプト
# Usage: ./scripts/archive_context.sh [weekly|monthly|manual]

set -e

# ディレクトリ設定
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
CONTEXT_DIR="$PROJECT_ROOT/context"
ARCHIVE_DIR="$CONTEXT_DIR/archive"

# 日付関連
TODAY=$(date +%Y-%m-%d)
YEAR=$(date +%Y)
MONTH=$(date +%m)
WEEK=$(date +%V)

# カラー出力
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# アーカイブディレクトリの初期化
init_archive_dirs() {
    log_info "アーカイブディレクトリを初期化中..."
    mkdir -p "$ARCHIVE_DIR/progress"
    mkdir -p "$ARCHIVE_DIR/coding/decisions"
    mkdir -p "$ARCHIVE_DIR/coding/implementations"
    mkdir -p "$ARCHIVE_DIR/design/iterations"
    mkdir -p "$ARCHIVE_DIR/milestones"
    log_info "完了"
}

# 週次アーカイブ
archive_weekly() {
    log_info "週次アーカイブを実行中..."

    local week_file="$ARCHIVE_DIR/progress/${YEAR}_W${WEEK}.md"

    if [ -f "$week_file" ]; then
        log_warn "今週のアーカイブは既に存在します: $week_file"
        read -p "上書きしますか? (y/N): " confirm
        if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
            log_info "スキップしました"
            return
        fi
    fi

    # progress_summary.mdから先週分を抽出してアーカイブ
    cat > "$week_file" << EOF
# Week $WEEK - ${YEAR}年${MONTH}月

## 期間
$(date -v-7d +%Y-%m-%d) 〜 $TODAY

## 作業時間
- 合計：（diary.txtから集計）
- 日別：
  - （diary.txtを参照）

## 完了タスク
（progress_summary.mdの先週分から転記）

## 主な変更
（coding_summary.mdの直近変更から転記）

## 技術的決定
（該当があれば記載）

## 課題・振り返り
- よかった点：
- 改善点：

---
*アーカイブ日時: $(date '+%Y-%m-%d %H:%M')*
EOF

    log_info "週次アーカイブを作成しました: $week_file"
    log_warn "手動で内容を補完してください"
}

# 月次アーカイブ
archive_monthly() {
    log_info "月次アーカイブを実行中..."

    local month_file="$ARCHIVE_DIR/progress/${YEAR}-${MONTH}_summary.md"

    if [ -f "$month_file" ]; then
        log_warn "今月のサマリーは既に存在します: $month_file"
        read -p "上書きしますか? (y/N): " confirm
        if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
            log_info "スキップしました"
            return
        fi
    fi

    # 月次サマリーを作成
    cat > "$month_file" << EOF
# ${YEAR}年${MONTH}月 サマリー

## 概要
- 作業日数：（diary.txtから集計）
- 合計時間：（diary.txtから集計）
- 主な成果：

## 週別サマリー
| 週 | 主な作業 | 時間 |
|----|---------|------|
| W$((10#$WEEK - 3)) | | |
| W$((10#$WEEK - 2)) | | |
| W$((10#$WEEK - 1)) | | |
| W$WEEK | | |

## 技術的決定（月次）
1.
2.

## 進捗率の変化
- 月初：%
- 月末：%
- 進捗：+%

---
*アーカイブ日時: $(date '+%Y-%m-%d %H:%M')*
EOF

    log_info "月次サマリーを作成しました: $month_file"
    log_warn "手動で内容を補完してください"
}

# 手動アーカイブ（対話形式）
archive_manual() {
    log_info "手動アーカイブモード"
    echo ""
    echo "アーカイブする対象を選択してください:"
    echo "  1) 技術的決定 (coding/decisions)"
    echo "  2) 実装詳細 (coding/implementations)"
    echo "  3) デザイン変遷 (design/iterations)"
    echo "  4) マイルストーン (milestones)"
    echo "  5) キャンセル"
    echo ""
    read -p "選択 (1-5): " choice

    case $choice in
        1)
            read -p "決定名（英数字、スペースはハイフンに）: " name
            local file="$ARCHIVE_DIR/coding/decisions/${TODAY}_${name}.md"
            create_decision_template "$file" "$name"
            ;;
        2)
            read -p "機能名（英数字、スペースはハイフンに）: " name
            local file="$ARCHIVE_DIR/coding/implementations/${TODAY}_${name}.md"
            create_implementation_template "$file" "$name"
            ;;
        3)
            read -p "デザイン名（英数字、スペースはハイフンに）: " name
            local file="$ARCHIVE_DIR/design/iterations/${TODAY}_${name}.md"
            create_design_template "$file" "$name"
            ;;
        4)
            read -p "マイルストーン名（英数字、スペースはハイフンに）: " name
            local file="$ARCHIVE_DIR/milestones/${TODAY}_${name}.md"
            create_milestone_template "$file" "$name"
            ;;
        5)
            log_info "キャンセルしました"
            return
            ;;
        *)
            log_error "無効な選択です"
            return 1
            ;;
    esac
}

create_decision_template() {
    local file=$1
    local name=$2
    cat > "$file" << EOF
# 技術的決定：$name

- 日付：$TODAY
- 決定者：
- 状態：確定 / 暫定

## 背景
なぜこの決定が必要になったか

## 選択肢
1. **案A**：
   - メリット：
   - デメリット：

2. **案B**：
   - メリット：
   - デメリット：

## 決定
案〇を採用

## 理由
なぜその案を選んだか

## 影響範囲
- ファイル：
- 機能：
EOF
    log_info "作成しました: $file"
}

create_implementation_template() {
    local file=$1
    local name=$2
    cat > "$file" << EOF
# 実装詳細：$name

- 日付：$TODAY
- 担当：

## 概要
何を実装したか

## 実装場所
- メイン：\`path/to/file\`
- 関連：

## 技術的ポイント
- 使用ライブラリ：
- 工夫した点：
- 注意点：

## 経緯
1. 最初のアプローチ：
2. 改善：
3. 最終形：
EOF
    log_info "作成しました: $file"
}

create_design_template() {
    local file=$1
    local name=$2
    cat > "$file" << EOF
# デザイン変遷：$name

- 日付：$TODAY

## バージョン履歴

### v1（$TODAY）
- 内容：
- 問題点：

## 最終決定
- 採用バージョン：
- 確定日：
EOF
    log_info "作成しました: $file"
}

create_milestone_template() {
    local file=$1
    local name=$2
    cat > "$file" << EOF
# マイルストーン：$name

- 達成日：$TODAY
- フェーズ：

## 達成内容
- [x] 条件1
- [x] 条件2

## 振り返り
- 予定工数：
- 実績工数：
- 差分理由：

## 学び
- よかった点：
- 次に活かすこと：
EOF
    log_info "作成しました: $file"
}

# ステータス表示
show_status() {
    log_info "アーカイブ状況:"
    echo ""
    echo "progress/:"
    ls -la "$ARCHIVE_DIR/progress/" 2>/dev/null || echo "  (空)"
    echo ""
    echo "coding/decisions/:"
    ls -la "$ARCHIVE_DIR/coding/decisions/" 2>/dev/null || echo "  (空)"
    echo ""
    echo "coding/implementations/:"
    ls -la "$ARCHIVE_DIR/coding/implementations/" 2>/dev/null || echo "  (空)"
    echo ""
    echo "design/iterations/:"
    ls -la "$ARCHIVE_DIR/design/iterations/" 2>/dev/null || echo "  (空)"
    echo ""
    echo "milestones/:"
    ls -la "$ARCHIVE_DIR/milestones/" 2>/dev/null || echo "  (空)"
}

# メイン処理
main() {
    # アーカイブディレクトリがなければ初期化
    if [ ! -d "$ARCHIVE_DIR" ]; then
        init_archive_dirs
    fi

    case "${1:-help}" in
        weekly)
            archive_weekly
            ;;
        monthly)
            archive_monthly
            ;;
        manual)
            archive_manual
            ;;
        init)
            init_archive_dirs
            ;;
        status)
            show_status
            ;;
        help|--help|-h)
            echo "Usage: $0 [command]"
            echo ""
            echo "Commands:"
            echo "  weekly   週次アーカイブを作成"
            echo "  monthly  月次サマリーを作成"
            echo "  manual   対話形式でアーカイブを作成"
            echo "  init     アーカイブディレクトリを初期化"
            echo "  status   アーカイブ状況を表示"
            echo "  help     このヘルプを表示"
            ;;
        *)
            log_error "不明なコマンド: $1"
            echo "Usage: $0 [weekly|monthly|manual|init|status|help]"
            exit 1
            ;;
    esac
}

main "$@"
