#!/usr/bin/env bash
set -euo pipefail

SKILL_NAME="crdesign"
SKILL_DIR="$(cd "$(dirname "$0")/.." && pwd)"
VERSION_FILE="$SKILL_DIR/data/version.json"
REMOTE_REPO="https://github.com/qishuai6/crdesign-skill.git"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

info()  { echo -e "${CYAN}[INFO]${NC} $*"; }
ok()    { echo -e "${GREEN}[OK]${NC} $*"; }
warn()  { echo -e "${YELLOW}[WARN]${NC} $*"; }
err()   { echo -e "${RED}[ERROR]${NC} $*"; }

get_local_version() {
  if [ -f "$VERSION_FILE" ]; then
    cat "$VERSION_FILE" | grep -o '"version"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | sed 's/.*: *"//;s/"//'
  else
    echo "unknown"
  fi
}

get_remote_version() {
  local v
  # 方法 1: raw.githubusercontent.com
  v=$(curl -fsSL "https://raw.githubusercontent.com/qishuai6/crdesign-skill/main/data/version.json" 2>/dev/null \
    | grep -o '"version"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | sed 's/.*: *"//;s/"//')
  # 方法 2: gh CLI fallback
  if [ -z "$v" ] && command -v gh >/dev/null 2>&1; then
    v=$(gh api repos/qishuai6/crdesign-skill/contents/data/version.json --jq '.content' 2>/dev/null \
      | base64 -d 2>/dev/null \
      | grep -o '"version"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | sed 's/.*: *"//;s/"//')
  fi
  echo "${v:-unknown}"
}

cmd_check() {
  local local_v remote_v
  local_v=$(get_local_version)
  remote_v=$(get_remote_version)

  echo ""
  echo "CRDesign Skill Version"
  echo "  Local:  $local_v"
  echo "  Remote: $remote_v"
  echo ""

  if [ "$remote_v" = "unknown" ]; then
    warn "无法获取远程版本，请检查网络连接"
    return 1
  fi

  if [ "$local_v" = "$remote_v" ]; then
    ok "已是最新版本 ($local_v)"
  else
    warn "有新版本可用: $local_v → $remote_v"
    echo "  运行 'bash scripts/update.sh update' 进行更新"
  fi
}

cmd_update() {
  info "正在更新 CRDesign Skill..."

  if ! git -C "$SKILL_DIR" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    err "当前目录不是 git 仓库"
    err "请重新克隆: git clone $REMOTE_REPO ~/.claude/skills/$SKILL_NAME"
    return 1
  fi

  local old_v new_v
  old_v=$(get_local_version)

  info "拉取最新代码..."
  git -C "$SKILL_DIR" fetch origin main
  git -C "$SKILL_DIR" reset --hard origin/main

  new_v=$(get_remote_version)

  echo ""
  ok "更新完成!"
  echo "  $old_v → $new_v"
  echo ""
  echo "更新内容:"
  git -C "$SKILL_DIR" log --oneline "v${old_v}..HEAD" 2>/dev/null || echo "  (详见 GitHub 提交记录)"
}

cmd_version() {
  local v
  v=$(get_local_version)
  echo "CRDesign Skill v$v"
}

cmd_changelog() {
  local v
  v=$(get_local_version)
  echo "CRDesign Skill v$v — 最近更新:"
  echo ""
  git -C "$SKILL_DIR" log --oneline -10 2>/dev/null || echo "  (无 git 记录)"
}

usage() {
  cat <<EOF
CRDesign Skill 管理工具

用法: bash scripts/update.sh <命令>

命令:
  check      检查是否有新版本
  update     更新到最新版本
  version    显示当前版本
  changelog  查看更新日志
  help       显示帮助信息

示例:
  bash ~/.claude/skills/$SKILL_NAME/scripts/update.sh check
  bash ~/.claude/skills/$SKILL_NAME/scripts/update.sh update
EOF
}

case "${1:-help}" in
  check)     cmd_check ;;
  update)    cmd_update ;;
  version|-v) cmd_version ;;
  changelog) cmd_changelog ;;
  help|--help|-h) usage ;;
  *) err "未知命令: $1"; usage; exit 1 ;;
esac
