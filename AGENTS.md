# 项目背景

1. 本项目使用 TeX Live 制作模块化 LaTeX 简历模板。
2. 每个模板必须位于仓库根目录，并以 `template-<模板名>/` 命名。
3. 新增模板以 `template-tzcan/` 的模板根目录结构为基准；`assets/` 和 `styles/` 内部可以自行组织，但必须保证模板能够独立编译。

# 新模板目录结构

所有新模板必须采用以下结构：

```text
template-<模板名>/                   # 单个模板的根目录
├── .latexmkrc                      # latexmk 配置：XeLaTeX、输出目录和 TEXINPUTS
├── main.tex                        # 模板入口：简历内容与组件调用
├── USAGE.md                        # 面向使用者的完整中文手册
├── AGENTS.md                       # 该模板的开发约定和接口规范
├── CLAUDE.md                       # 仅一行 @AGENTS.md，指向模板约定
├── assets/                         # 图片、字体、效果图等素材，内部结构不限
├── scripts/                        # Docker 编译辅助脚本目录
│   ├── docker-build.ps1            # Windows PowerShell Docker 编译入口
│   └── docker-build.sh             # macOS / Linux Docker 编译入口
└── styles/                         # 文档类与样式组件，内部结构不限但需可独立编译
```

# 目录与文件约束

1. `assets/`、`scripts/`、`styles/`、`.latexmkrc`、`main.tex`、`USAGE.md` 必须存在，且必须位于模板根目录。
2. `build/` 是编译产物目录，可以自动生成，但不得提交到 Git。
3. 模板不得引用其自身目录之外的文件，以保证单独下载目录或 Release zip 后仍能编译。

# CI 打包约束

1. 编译检查工作流使用根目录下的 `template-*/` 查找模板。
2. Release 工作流固定打包 `.latexmkrc`、`main.tex`、`assets/`、`scripts/`、`styles/`、`USAGE.md`。
3. 上述六个路径任一缺失时，Release 打包必须失败；新增模板前需确认这些路径全部存在。
