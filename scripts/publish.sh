#!/bin/bash

# 快速发布脚本
# 使用方法: ./scripts/publish.sh "commit message"

set -e

# 检查是否提供了提交信息
if [ -z "$1" ]; then
    echo "请提供提交信息"
    echo "使用方法: ./scripts/publish.sh \"feat: add new article\""
    exit 1
fi

echo "🔍 检查文件状态..."
git status

echo "📝 添加所有更改..."
git add .

echo "💾 提交更改..."
git commit -m "$1"

echo "🚀 推送到远程仓库..."
git push

echo "✅ 发布完成！"
echo "🌐 网站将在2-3分钟后更新: https://hugo-blog-three-xi.vercel.app/"