# 开发指南

## 🛠 本地开发环境

### 环境要求
- Hugo v0.148.2+ (Extended版本)
- Git
- Node.js (可选，用于主题定制)

### 安装 Hugo
```bash
# macOS (推荐使用 Homebrew)
brew install hugo

# 验证安装
hugo version
```

### 项目设置
```bash
# 克隆项目
git clone https://github.com/bobhere/hugo-blog.git
cd hugo-blog

# 初始化子模块（PaperMod主题）
git submodule update --init --recursive

# 启动开发服务器
hugo server -D

# 访问 http://localhost:1313
```

## 📁 项目结构详解

```
hugo-blog/
├── archetypes/           # 文章模板
│   └── default.md
├── content/              # 内容目录
│   ├── posts/           # 博客文章
│   ├── about/           # 关于页面
│   └── search/          # 搜索页面
├── themes/              # 主题目录
│   └── PaperMod/       # PaperMod主题（git submodule）
├── public/              # 构建输出（自动生成）
├── resources/           # Hugo资源缓存
├── docs/                # 项目文档
├── hugo.toml           # Hugo配置文件
├── vercel.json         # Vercel部署配置
└── .gitmodules         # Git子模块配置
```

## ⚙️ 配置文件说明

### hugo.toml
```toml
baseURL = 'https://hugo-blog-three-xi.vercel.app/'
languageCode = 'zh-cn'
title = 'Bob的博客'
theme = 'PaperMod'
timeZone = 'Asia/Shanghai'
buildFuture = true

[params]
  defaultTheme = "auto"
  disableThemeToggle = false
  
  # 搜索配置
  fuseOpts.isCaseSensitive = false
  fuseOpts.shouldSort = true
  fuseOpts.location = 0
  fuseOpts.distance = 1000
  fuseOpts.threshold = 0.4
  fuseOpts.minMatchCharLength = 0
  fuseOpts.keys = ["title", "permalink", "summary", "content"]

# 菜单配置
[[menu.main]]
  identifier = "home"
  name = "首页"
  url = "/"
  weight = 10
```

### vercel.json
```json
{
  "buildCommand": "hugo --gc --minify --buildFuture",
  "outputDirectory": "public"
}
```

## 🎨 主题定制

### PaperMod 主题特性
- 响应式设计
- 深色/浅色模式切换
- 搜索功能
- 标签和分类支持
- SEO优化

### 自定义样式
如需自定义样式，可以在 `assets/css/` 目录下添加CSS文件。

### 自定义布局
如需自定义布局，可以在 `layouts/` 目录下覆盖主题模板。

## 🚀 构建和部署

### 本地构建
```bash
# 开发构建
hugo server -D

# 生产构建
hugo --gc --minify --buildFuture
```

### 构建参数说明
- `--gc`: 启用垃圾回收，清理未使用的缓存
- `--minify`: 压缩HTML、CSS、JS
- `--buildFuture`: 构建未来日期的文章

### Vercel 自动部署
- 推送到 `main` 分支自动触发部署
- 构建时间: 通常 30-60 秒
- 部署完成后自动更新CDN

## 🔧 常用命令

```bash
# 创建新文章
hugo new posts/article-name.md

# 启动开发服务器
hugo server -D

# 构建生产版本
hugo --gc --minify --buildFuture

# 更新主题
git submodule update --remote themes/PaperMod

# 查看Hugo版本
hugo version

# 检查配置
hugo config
```

## 🐛 故障排除

### 主题问题
如果遇到主题相关问题：
```bash
# 重新初始化子模块
git submodule deinit -f themes/PaperMod
git rm -f themes/PaperMod
rm -rf .git/modules/themes/PaperMod
git submodule add --depth=1 https://github.com/adityatelange/hugo-PaperMod.git themes/PaperMod
```

### 构建问题
如果构建失败：
1. 检查 Hugo 版本是否为 Extended 版本
2. 检查配置文件语法
3. 检查文章 Front Matter 格式
4. 清理缓存：`hugo --gc`

### 部署问题
如果 Vercel 部署失败：
1. 检查构建日志
2. 确认 `vercel.json` 配置正确
3. 检查 Git 推送是否成功

## 📊 性能优化

### 图片优化
- 使用 WebP 格式
- 压缩图片大小
- 使用适当的图片尺寸

### 构建优化
- 启用 `--minify` 压缩
- 使用 `--gc` 清理缓存
- 定期清理 `public/` 目录

### SEO 优化
- 配置正确的 `baseURL`
- 使用语义化的URL结构
- 添加适当的meta标签