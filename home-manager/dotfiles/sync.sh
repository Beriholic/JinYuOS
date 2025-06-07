#!/usr/bin/env bash

SOURCE_BASE_DIR="$HOME/.config"
GIT_BASE_DIR="./.config"
SKIP_DIRS=("mihomo")
NO_DELETE_DIRS=("hypr") # 添加不删除目标文件的目录列表

export_starship() {
  echo 正在导出starship主题
  cp ./.config/starship.toml "$HOME"/.config
}

# 同步函数
sync_config() {
  local mode="$1"
  local src_base="$2"
  local dest_base="$3"

  echo -e "\n开始${mode}操作..."
  echo "源目录: $src_base"
  echo "目标目录: $dest_base"

  if [ ! -d "$dest_base" ]; then
    echo "错误: 目标目录 '$dest_base' 不存在或不是一个目录。"
    return 1
  fi

  find "$dest_base" -mindepth 1 -maxdepth 1 -type d -print0 | while IFS= read -r -d $'\0' ref_dir; do
    local dir_name=$(basename "$ref_dir")
    local skip=false

    # 检查是否在跳过列表中
    for skip_dir in "${SKIP_DIRS[@]}"; do
      if [[ "$dir_name" == "$skip_dir" ]]; then
        echo "跳过目录: $dir_name"
        skip=true
        break
      fi
    done

    if $skip; then
      continue
    fi

    local src_dir_path="$src_base/$dir_name"
    local dest_dir_path="$dest_base/$dir_name"

    # 特殊处理：导出时需要确保目标目录存在
    if [[ "$mode" == "导出" ]]; then
      mkdir -p "$dest_dir_path"
    fi

    if [[ -d "$src_dir_path" ]]; then
      # 检查是否在不删除列表中
      local no_delete=false
      for no_delete_dir in "${NO_DELETE_DIRS[@]}"; do
        if [[ "$dir_name" == "$no_delete_dir" ]]; then
          no_delete=true
          break
        fi
      done

      echo "正在同步: $src_dir_path/ -> $dest_dir_path/"

      if $no_delete; then
        echo "  [特殊处理] 禁用--delete选项（保留目标目录额外文件）"
        rsync -avh "$src_dir_path/" "$dest_dir_path/"
      else
        rsync -avh --delete "$src_dir_path/" "$dest_dir_path/"
      fi
    fi
  done

  export_starship

  echo "${mode}操作完成。"
}

# 显示菜单
echo "请选择操作模式:"
echo "1) 导入 - 从系统配置目录 (~/.config) 同步到 Git 仓库"
echo "2) 导出 - 从 Git 仓库同步到系统配置目录 (~/.config)"
echo "3) 退出"

# 获取用户输入
read -p "输入选择 (1/2/3): " choice

case $choice in
1)
  sync_config "导入" "$SOURCE_BASE_DIR" "$GIT_BASE_DIR"
  ;;
2)
  sync_config "导出" "$GIT_BASE_DIR" "$SOURCE_BASE_DIR"
  ;;
3)
  echo "操作已取消"
  exit 0
  ;;
*)
  echo "无效选择，请重新运行脚本"
  exit 1
  ;;
esac
