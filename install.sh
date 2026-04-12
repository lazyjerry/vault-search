#!/usr/bin/env bash
# Vault Search Obsidian Plugin — 快速安裝腳本
# 用法: bash install.sh [--] [vault_path]
# 範例: bash install.sh -- ~/Documents/MyVault

set -euo pipefail

REPO="notoriouslab/vault-search"
PLUGIN_NAME="vault-search"
FILES=("main.js" "manifest.json" "styles.css")

# --- 顏色輸出 ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

info()  { printf "${GREEN}[INFO]${NC} %s\n" "$1"; }
warn()  { printf "${YELLOW}[WARN]${NC} %s\n" "$1"; }
error() { printf "${RED}[ERROR]${NC} %s\n" "$1"; exit 1; }

# --- 檢查必要工具 ---
for cmd in curl jq; do
  command -v "$cmd" >/dev/null 2>&1 || error "需要 ${cmd}，請先安裝：brew install ${cmd}"
done

# --- 取得 Vault 路徑 ---
if [[ $# -ge 1 ]]; then
  # 支援以 -- 分隔選項與路徑參數
  if [[ "${1:-}" == "--" ]]; then
    shift
  fi

  if [[ $# -lt 1 ]]; then
    error "缺少 Vault 路徑，請提供安裝路徑"
  fi

  # 允許未加引號的含空白路徑（會由多個參數組回原路徑）
  VAULT_PATH="$*"
else
  echo "範例路徑："
  echo "  macOS:   ~/Documents/MyVault"
  echo "  Linux:   ~/obsidian/MyVault"
  echo "  Windows: /c/Users/你的名稱/Documents/MyVault"
  read -rp "請輸入 Obsidian Vault 路徑: " VAULT_PATH
fi

# 容錯：若使用者在雙引號內手動加上 \ 空白或 \~，還原為正常路徑
VAULT_PATH="${VAULT_PATH//\\ / }"
VAULT_PATH="${VAULT_PATH//\\~/~}"

# 展開 ~ 與環境變數
VAULT_PATH="${VAULT_PATH/#\~/$HOME}"

if [[ ! -d "$VAULT_PATH" ]]; then
  error "Vault 路徑不存在: ${VAULT_PATH}"
fi

if [[ ! -d "${VAULT_PATH}/.obsidian" ]]; then
  error "找不到 .obsidian 資料夾，請確認這是有效的 Obsidian Vault: ${VAULT_PATH}"
fi

PLUGIN_DIR="${VAULT_PATH}/.obsidian/plugins/${PLUGIN_NAME}"

info "正在查詢版本資訊..."
FORK_JSON=$(curl -sS "https://api.github.com/repos/${REPO}/releases/latest")
FORK_TAG=$(echo "$FORK_JSON" | jq -r '.tag_name // empty')

if [[ -n "$FORK_TAG" ]]; then
  info "最新版本: ${FORK_TAG} (${REPO})"
else
  warn "repo 尚無 Release"
fi

TAG="$FORK_TAG"

if [[ -z "$TAG" ]]; then
  error "無法取得最新版本資訊，請確認網路連線或稍後再試"
fi

info "將安裝版本: ${TAG} (來源: ${REPO})"

# --- 建立外掛目錄 ---
mkdir -p "$PLUGIN_DIR"
info "外掛目錄: ${PLUGIN_DIR}"

# --- 下載檔案 ---
DOWNLOAD_BASE="https://github.com/${REPO}/releases/download/${TAG}"
FAILED=0

for file in "${FILES[@]}"; do
  info "下載 ${file} ..."
  HTTP_CODE=$(curl -sS -L -w "%{http_code}" -o "${PLUGIN_DIR}/${file}" "${DOWNLOAD_BASE}/${file}")
  if [[ "$HTTP_CODE" -ne 200 ]]; then
    warn "下載 ${file} 失敗 (HTTP ${HTTP_CODE})"
    rm -f "${PLUGIN_DIR}/${file}"
    FAILED=1
  fi
done

if [[ "$FAILED" -eq 1 ]]; then
  error "部分檔案下載失敗，請檢查網路連線後重試"
fi

# --- 完成 ---
echo ""
info "============================================"
info " Vault Search ${TAG} 安裝完成！"
info "============================================"
echo ""
info "後續步驟："
info "  1. 開啟 Obsidian"
info "  2. 前往 Settings → Community plugins"
info "  3. 啟用「Vault Search」"
echo ""
info "使用說明: https://github.com/notoriouslab/vault-search/blob/main/README.md"
