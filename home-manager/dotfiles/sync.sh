#!/usr/bin/env bash

SYSTEM_CONFIG_DIR="$HOME/.config"
GIT_REPO_CONFIG_DIR="./.config"

SKIP_DIRS=("mihomo")
NO_DELETE_DIRS=("hypr")

declare -A SYNC_FILES_MAP

SYNC_FILES_MAP["hypr"]="colors.conf hyprlock.conf"

export_starship() {
  local starship_toml_in_repo="$GIT_REPO_CONFIG_DIR/starship.toml"
  if [[ -f "$starship_toml_in_repo" ]]; then
    echo "正在同步 starship 主题..."
    cp "$starship_toml_in_repo" "$SYSTEM_CONFIG_DIR/"
  fi
}

sync_config() {
  local mode="$1"

  echo -e "\n开始${mode}操作..."
  echo "以 Git 仓库目录为基准: $GIT_REPO_CONFIG_DIR"

  if [ ! -d "$GIT_REPO_CONFIG_DIR" ]; then
    echo "错误: Git 仓库配置目录 '$GIT_REPO_CONFIG_DIR' 不存在。"
    return 1
  fi

  find "$GIT_REPO_CONFIG_DIR" -mindepth 1 -maxdepth 1 -type d -print0 | while IFS= read -r -d $'\0' repo_dir; do
    local dir_name=$(basename "$repo_dir")
    local skip=false

    for skip_dir in "${SKIP_DIRS[@]}"; do
      if [[ "$dir_name" == "$skip_dir" ]]; then
        echo "跳过目录: $dir_name"
        skip=true
        break
      fi
    done
    if $skip; then continue; fi

    local src_dir_path dest_dir_path
    if [[ "$mode" == "导入" ]]; then
      src_dir_path="$SYSTEM_CONFIG_DIR/$dir_name"
      dest_dir_path="$GIT_REPO_CONFIG_DIR/$dir_name"
      echo "正在处理: $dir_name (导入)"
    else
      src_dir_path="$GIT_REPO_CONFIG_DIR/$dir_name"
      dest_dir_path="$SYSTEM_CONFIG_DIR/$dir_name"
      echo "正在处理: $dir_name (导出)"
      mkdir -p "$dest_dir_path"
    fi

    if [[ ! -d "$src_dir_path" ]]; then
      echo "  警告: 源目录 '$src_dir_path' 不存在，跳过。"
      continue
    fi

    if [[ -v SYNC_FILES_MAP["$dir_name"] ]]; then
      echo "  [特殊处理] 只同步 '$dir_name' 目录下的指定文件列表。"

      local file_list_str=${SYNC_FILES_MAP["$dir_name"]}
      read -r -a files_to_sync <<<"$file_list_str"

      local rsync_opts=()
      for file in "${files_to_sync[@]}"; do
        if [[ -f "$src_dir_path/$file" ]]; then
          rsync_opts+=(--include="$file")
        else
          echo "    警告: 源文件 '$src_dir_path/$file' 不存在，将从同步列表中忽略。"
        fi
      done

      if [ ${#rsync_opts[@]} -eq 0 ]; then
        echo "    没有找到任何有效的源文件进行同步，跳过 '$dir_name'。"
        continue
      fi

      rsync -avh --delete "${rsync_opts[@]}" --exclude='*' "$src_dir_path/" "$dest_dir_path/"

    else
      local no_delete=false
      for no_delete_dir in "${NO_DELETE_DIRS[@]}"; do
        if [[ "$dir_name" == "$no_delete_dir" ]]; then
          no_delete=true
          break
        fi
      done

      if $no_delete; then
        echo "  [全目录同步] 禁用 --delete 选项。"
        rsync -avh --exclude '.git' "$src_dir_path/" "$dest_dir_path/"
      else
        echo "  [全目录同步] 启用 --delete 选项。"
        rsync -avh --delete --exclude '.git' "$src_dir_path/" "$dest_dir_path/"
      fi
    fi
  done

  export_starship
  echo -e "\n${mode}操作完成。"
}

echo "请选择操作模式:"
echo "1) 导入 - 从系统 (~/.config) 同步到 Git 仓库 (./.config)"
echo "2) 导出 - 从 Git 仓库 (./.config) 同步到系统 (~/.config)"
echo "3) 退出"

read -p "输入选择 (1/2/3): " choice

case $choice in
1) sync_config "导入" ;;
2) sync_config "导出" ;;
3)
  echo "操作已取消"
  exit 0
  ;;
*)
  echo "无效选择"
  exit 1
  ;;
esac
