#!/bin/bash

# 源文件夹路径
source_dir="/home/mingjie/source_dir"
# 目标文件夹路径
destination_dir="organized_files"

# 创建目标文件夹
mkdir -p "$destination_dir"

# 计数器初始化
folder_count=0
subfolder_count=0
file_count=0

# 遍历源文件夹
while IFS= read -r -d '' file; do
    # 每100个文件夹创建一个新的子文件夹
    if [ $file_count -eq 0 ]; then
        subfolder_count=$((subfolder_count + 1))
        subfolder_dir="${destination_dir}/subfolder_${subfolder_count}"
        mkdir -p "$subfolder_dir"
    fi

    # 每100个文件夹创建一个新的文件夹
    if [ $subfolder_count -eq 1 ] || [ $((file_count % 100)) -eq 0 ]; then
        folder_count=$((folder_count + 1))
        folder_dir="${subfolder_dir}/folder_${folder_count}"
        mkdir -p "$folder_dir"
    fi

    # 移动文件到目标文件夹
    mv "$file" "$folder_dir"
    file_count=$((file_count + 1))
done < <(find "$source_dir" -type f -print0)

echo "Total files moved: $file_count"
