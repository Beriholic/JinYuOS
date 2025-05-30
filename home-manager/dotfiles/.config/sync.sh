!/usr/bin/env bash

SOURCE_BASE_DIR="$HOME/.config"
DEST_BASE_DIR="./"

SKIP_DIRS=("mihomo")

echo "开始同步..."

if [ ! -d "$DEST_BASE_DIR" ]; then
  echo "错误: 目标基础目录 '$DEST_BASE_DIR' 不存在或不是一个目录。"
  exit 1
fi

find "$DEST_BASE_DIR" -mindepth 1 -maxdepth 1 -type d -print0 | while IFS= read -r -d $'\0' dest_subdir_path; do
  subdir_name=$(basename "$dest_subdir_path")

  if [ "$subdir_name" = "mihomo" ]; then
    echo "跳过目录: $subdir_name"
    continue
  fi

  skip=false

  for skip_dir in "${SKIP_DIRS[@]}"; do
    if [ "$subdir_name" = "$skip_dir" ]; then
      echo "跳过目录: $subdir_name"
      skip=true
      break
    fi
  done

  if $skip; then
    continue
  fi

  source_subdir_full_path="$SOURCE_BASE_DIR/$subdir_name"

  if [ -d "$source_subdir_full_path" ]; then
    echo "正在同步: $source_subdir_full_path/ -> $dest_subdir_path/"
    rsync -avh --delete "$source_subdir_full_path/" "$dest_subdir_path/"
  else
    echo "警告: 源子目录 '$source_subdir_full_path' 不存在，跳过同步 '$subdir_name'."
  fi
done

echo "同步完成。"
