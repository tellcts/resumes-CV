# 项目背景
1. 项目采用`TexLive`制作简历模板

# 目录结构

```text
template-tzcan/                    # tzcan 简历模板根目录
├── .latexmkrc                    # latexmk 配置：自定义编译行为
├── main.tex                      # 简历内容入口：通过 latexmk main.tex 编译
├── USAGE.md                      # 面向使用者的完整中文手册
├── AGENTS.md                     # 该模板的开发约定和接口规范
├── CLAUDE.md                     # 指向 AGENTS.md 的模板约定入口
├── assets/
│   ├── badges/                   # 校徽图片
│   ├── examples/                 # 效果图与 Overleaf 操作截图
│   │   └── overleaf/             # Overleaf 分步操作截图
│   └── images/                   # 个人证件照等图片素材
├── scripts/
│   ├── docker-build.ps1          # Windows PowerShell Docker 编译入口
│   └── docker-build.sh           # macOS / Linux Docker 编译入口
└── styles/
    ├── resume-tzcan.cls          # 文档类：控制简历总体结构并导出全部组件
    └── tzcan-*.sty               # 各类简历组件，与 resume-tzcan.cls 同级
```

# 组件生成
1. 项目LaTeX发行版采用`TexLive-2026`，注意语法的版本兼容性。
2. 生成的新组件文件名称统一用`tzcan-*.sty`格式来命名，放在`./styles/`目录下，在`./styles/resume-tzcan.cls`通过`\RequirePackage`命令导出。
3. 组件对外提供的接口尽量保持为键值对接口，如果你不确定模块内容结构是否适用键值对接口，请询问用户的意见。
4. 对于被多个组件同时依赖的组件，不要创建新的组件文件，直接在`./styles/tzcan-common.sty`追加。
5. 新的命令使用`\newcommand`封装。

# 简历编译
1. 你全程不用执行`latexmk main.tex`命令，全程由用户手动执行编译。

# 文档写作规范
1. 仓库内所有 Markdown 文档（根目录`README.md`、各模板的`USAGE.md`）里的提示框，一律使用 GitHub Alerts 语法，不再使用`> ⚠️`、`> 💡`这类 emoji 前缀的引用块：

   ```markdown
   > [!WARNING]
   > 第一行正文
   > 第二行正文
   ```
