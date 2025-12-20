#!/bin/bash

# Context更新スクリプト
# 使い方: ./scripts/update_context.sh [target]
# target: coding, design, progress, project, shared, all

TARGET=${1:-all}

echo "=== Context Update Script ==="
echo "Target: $TARGET"
echo ""

case $TARGET in
  coding)
    echo "📝 coding_summary.md の更新を開始します"
    echo "Claudeに以下を伝えてください："
    echo "「coding_summary.md を現在の実装状態に基づいて更新してください」"
    ;;
  
  design)
    echo "🎨 design_summary.md の更新を開始します"
    echo "Claudeに以下を伝えてください："
    echo "「design_summary.md を現在のデザイン状態に基づいて更新してください」"
    ;;
  
  progress)
    echo "📊 progress_summary.md の更新を開始します"
    echo "Claudeに以下を伝えてください："
    echo "「diary.txt を分析して progress_summary.md を更新してください」"
    ;;
  
  project)
    echo "📋 project_context.md の更新を開始します"
    echo "Claudeに以下を伝えてください："
    echo "「project_context.md を現在のプロジェクト状態に基づいて更新してください」"
    ;;
  
  shared)
    echo "🔗 shared_progress_summary.md の更新を開始します"
    echo "Claudeに以下を伝えてください："
    echo "「shared_progress_summary.md を他のcontextファイルとdiary.txtから生成してください」"
    ;;
  
  all)
    echo "🔄 すべてのcontextファイルを更新します"
    echo "Claudeに以下を伝えてください："
    echo "「すべてのcontextファイル（coding, design, progress, project, shared）を更新してください」"
    ;;
  
  *)
    echo "❌ 不明なターゲット: $TARGET"
    echo ""
    echo "使用可能なターゲット:"
    echo "  coding   - coding_summary.md を更新"
    echo "  design   - design_summary.md を更新"
    echo "  progress - progress_summary.md を更新"
    echo "  project  - project_context.md を更新"
    echo "  shared   - shared_progress_summary.md を更新"
    echo "  all      - すべてを更新"
    exit 1
    ;;
esac

echo ""
echo "✅ スクリプト完了"