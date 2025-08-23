#!/bin/bash

# 创建新文章脚本
# 使用方法: ./scripts/new-post.sh "article-name"

set -e

# 检查是否提供了文章名称
if [ -z "$1" ]; then
    echo "请提供文章名称（英文，用连字符分隔）"
    echo "使用方法: ./scripts/new-post.sh \"your-article-name\""
    exit 1
fi

ARTICLE_NAME="$1"
FILE_PATH="content/posts/${ARTICLE_NAME}.md"

# 检查文件是否已存在
if [ -f "$FILE_PATH" ]; then
    echo "❌ 文件已存在: $FILE_PATH"
    exit 1
fi

echo "📝 创建新文章: $ARTICLE_NAME"

# 使用Hugo命令创建新文章
hugo new "posts/${ARTICLE_NAME}.md"

echo "✅ 文章创建成功: $FILE_PATH"
echo "📝 请编辑文章内容，然后使用以下命令发布:"
echo "   ./scripts/publish.sh \"feat: add article about ${ARTICLE_NAME}\""