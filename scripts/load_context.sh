#!/bin/bash
# load_context.sh - 必要なcontextだけを効率的に読み込むスクリプト
# Usage: ./scripts/load_context.sh [mode]

set -e

# ディレクトリ設定
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
CONTEXT_DIR="$PROJECT_ROOT/context"
ARCHIVE_DIR="$CONTEXT_DIR/archive"

# カラー出力
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_section() {
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${CYAN}$1${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

# ファイルサイズ（トークン概算）を表示
show_size() {
    local file=$1
    if [ -f "$file" ]; then
        local chars=$(wc -c < "$file")
        local tokens=$((chars / 4))  # 概算：4文字≒1トークン
        echo "  $(basename "$file"): ~${tokens} tokens"
    fi
}

# クイックモード：current_state.mdのみ
load_quick() {
    log_section "Quick Mode - 現在の作業状況のみ"
    echo ""

    if [ -f "$CONTEXT_DIR/current_state.md" ]; then
        cat "$CONTEXT_DIR/current_state.md"
    else
        echo "current_state.md が見つかりません。"
        echo "テンプレートから作成してください: .claude/rules/current_state_template.md"
    fi
}

# 標準モード：主要contextファイル
load_standard() {
    log_section "Standard Mode - 主要コンテキスト"
    echo ""

    log_info "読み込むファイル:"
    show_size "$CONTEXT_DIR/current_state.md"
    show_size "$CONTEXT_DIR/project_context.md"
    show_size "$CONTEXT_DIR/coding_summary.md"
    show_size "$CONTEXT_DIR/design_summary.md"
    show_size "$CONTEXT_DIR/progress_summary.md"
    echo ""

    for file in current_state.md project_context.md coding_summary.md design_summary.md progress_summary.md; do
        if [ -f "$CONTEXT_DIR/$file" ]; then
            log_section "$file"
            cat "$CONTEXT_DIR/$file"
            echo ""
        fi
    done
}

# 詳細モード：アーカイブも含む
load_detailed() {
    log_section "Detailed Mode - アーカイブ含む"
    echo ""

    # 標準コンテキスト
    load_standard

    # 最新のアーカイブ
    echo ""
    log_section "最新のアーカイブ"

    # 直近の週次アーカイブ
    local latest_weekly=$(ls -t "$ARCHIVE_DIR/progress/"*_W*.md 2>/dev/null | head -1)
    if [ -n "$latest_weekly" ]; then
        echo ""
        echo "=== 最新の週次アーカイブ ==="
        cat "$latest_weekly"
    fi

    # 直近の技術的決定（3件）
    echo ""
    echo "=== 直近の技術的決定（最新3件） ==="
    for file in $(ls -t "$ARCHIVE_DIR/coding/decisions/"*.md 2>/dev/null | head -3); do
        echo "--- $(basename "$file") ---"
        cat "$file"
        echo ""
    done
}

# 特定カテゴリのみ
load_category() {
    local category=$1

    case $category in
        coding)
            log_section "Coding関連コンテキスト"
            [ -f "$CONTEXT_DIR/coding_summary.md" ] && cat "$CONTEXT_DIR/coding_summary.md"
            echo ""
            echo "=== 技術的決定（アーカイブ） ==="
            ls -la "$ARCHIVE_DIR/coding/decisions/" 2>/dev/null || echo "(なし)"
            ;;
        design)
            log_section "Design関連コンテキスト"
            [ -f "$CONTEXT_DIR/design_summary.md" ] && cat "$CONTEXT_DIR/design_summary.md"
            echo ""
            echo "=== デザイン変遷（アーカイブ） ==="
            ls -la "$ARCHIVE_DIR/design/iterations/" 2>/dev/null || echo "(なし)"
            ;;
        progress)
            log_section "Progress関連コンテキスト"
            [ -f "$CONTEXT_DIR/progress_summary.md" ] && cat "$CONTEXT_DIR/progress_summary.md"
            echo ""
            echo "=== 週次アーカイブ一覧 ==="
            ls -la "$ARCHIVE_DIR/progress/" 2>/dev/null || echo "(なし)"
            ;;
        *)
            echo "不明なカテゴリ: $category"
            echo "利用可能: coding, design, progress"
            exit 1
            ;;
    esac
}

# トークン概算を表示
show_token_estimate() {
    log_section "トークン概算"
    echo ""

    local total=0

    for file in current_state.md project_context.md coding_summary.md design_summary.md progress_summary.md; do
        if [ -f "$CONTEXT_DIR/$file" ]; then
            local chars=$(wc -c < "$CONTEXT_DIR/$file")
            local tokens=$((chars / 4))
            total=$((total + tokens))
            printf "  %-30s ~%5d tokens\n" "$file" "$tokens"
        fi
    done

    echo ""
    echo "  ─────────────────────────────────────────"
    printf "  %-30s ~%5d tokens\n" "合計" "$total"
    echo ""

    if [ $total -lt 2000 ]; then
        echo -e "${GREEN}✓ 推奨範囲内（<2000 tokens）${NC}"
    elif [ $total -lt 4000 ]; then
        echo -e "${YELLOW}△ やや多め（2000-4000 tokens）${NC}"
    else
        echo -e "${YELLOW}! 削減を検討してください（>4000 tokens）${NC}"
    fi
}

# メイン処理
main() {
    case "${1:-help}" in
        quick|q)
            load_quick
            ;;
        standard|s)
            load_standard
            ;;
        detailed|d)
            load_detailed
            ;;
        coding|design|progress)
            load_category "$1"
            ;;
        tokens|t)
            show_token_estimate
            ;;
        help|--help|-h)
            echo "Usage: $0 [mode]"
            echo ""
            echo "Modes:"
            echo "  quick, q      current_state.mdのみ（最小）"
            echo "  standard, s   主要contextファイルを表示"
            echo "  detailed, d   アーカイブ含む詳細表示"
            echo "  coding        コーディング関連のみ"
            echo "  design        デザイン関連のみ"
            echo "  progress      進捗関連のみ"
            echo "  tokens, t     トークン概算を表示"
            echo "  help          このヘルプを表示"
            echo ""
            echo "推奨:"
            echo "  - 通常作業開始時: quick"
            echo "  - 新機能実装時: standard"
            echo "  - 詳細調査時: detailed または category指定"
            ;;
        *)
            echo "不明なモード: $1"
            echo "Usage: $0 [quick|standard|detailed|coding|design|progress|tokens|help]"
            exit 1
            ;;
    esac
}

main "$@"
