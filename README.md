# Bob的博客

基于Hugo + PaperMod主题的个人博客，专注于疗愈行业的商业思考和实践分享。

## 🚀 快速开始

### 本地开发
```bash
# 克隆项目
git clone https://github.com/bobhere/hugo-blog.git
cd hugo-blog

# 初始化子模块（主题）
git submodule update --init --recursive

# 本地预览
hugo server -D

# 访问 http://localhost:1313
```

### 项目结构
```
hugo-blog/
├── content/
│   ├── posts/          # 文章目录
│   └── about/          # 关于页面
├── themes/
│   └── PaperMod/       # 主题文件（git submodule）
├── public/             # 构建输出目录
├── docs/               # 项目文档
├── hugo.toml           # Hugo配置文件
├── vercel.json         # Vercel部署配置
└── README.md           # 项目说明
```

## 📝 文章发布

详细的文章发布规则请查看：[docs/POSTING_GUIDE.md](docs/POSTING_GUIDE.md)

## 🛠 技术栈

- **静态站点生成器**: Hugo v0.148.2+
- **主题**: PaperMod
- **部署平台**: Vercel
- **域名**: https://hugo-blog-three-xi.vercel.app/

## 📦 部署

项目已配置自动部署：
- 推送到 `main` 分支自动触发 Vercel 部署
- 构建命令: `hugo --gc --minify --buildFuture`
- 输出目录: `public`

## 🔧 配置说明

### Hugo配置 (hugo.toml)
- 基础URL: https://hugo-blog-three-xi.vercel.app/
- 语言: 中文 (zh-cn)
- 时区: Asia/Shanghai
- 主题: PaperMod

### 菜单配置
- 首页 (/)
- 文章 (/posts/)
- 关于 (/about/)
- 搜索 (/search/)

## 📄 许可证

MIT License