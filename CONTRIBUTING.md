<div align="center">

# 🤝 为 resumes-CV 贡献代码

**用 LaTeX 模块化构建属于你的精美简历 💖**

</div>

---

感谢你愿意为本项目出力 💖 本文档面向**所有贡献者**（不只是开发者），
讲清楚三件事：这个仓库长什么样、改代码要守哪些约定、以及怎么把一个改动变成被合并的 PR。

> [!NOTE]
> **只是想做一份自己的简历？** 那你不需要这份文档 —— 请直接看各模板目录下的`USAGE.md`文档即可。

## 📑 目录

- [🤝 为 resumes-CV 贡献代码](#-为-resumes-cv-贡献代码)
  - [📑 目录](#-目录)
  - [📌 先确认三件事](#-先确认三件事)
  - [🧭 从零到第一个 PR](#-从零到第一个-pr)
  - [🛠️ 开发环境](#️-开发环境)
  - [🤖 推荐用 AI 工具辅助开发](#-推荐用-ai-工具辅助开发)
  - [📁 仓库结构与铁律](#-仓库结构与铁律)
  - [🌿 分支与提交规范](#-分支与提交规范)
  - [🧩 组件开发规范](#-组件开发规范)
  - [🆕 新增模板规范](#-新增模板规范)
  - [✍️ 文档写作规范](#️-文档写作规范)
  - [✅ 提交前自测清单](#-提交前自测清单)
  - [📤 提交 Pull Request](#-提交-pull-request)
  - [🚀 CI 与发版](#-ci-与发版)
  - [📄 许可与贡献授权](#-许可与贡献授权)

---

## 📌 先确认三件事

**① 你可以贡献什么**

| 类型           | 说明                                                                   | 对应产物                            |
| -------------- | ---------------------------------------------------------------------- | ----------------------------------- |
| 🐛 **反馈 Bug** | 描述复现步骤、你期望的效果、实际效果；附上最小可复现的 `main.tex` 片段 | Issue                               |
| 🧩 **组件改进** | 新增组件、修正排版、扩展某个命令的键值字段                             | `template-tzcan/styles/tzcan-*.sty` |
| 🎨 **新增模板** | 一套全新风格的模板，自成一体、可单独分发                               | `template-<模板名>/`                |
| ✍️ **文档改进** | 修正错别字、补充说明、把踩坑经验写进 FAQ                               | `README.md` / 各模板的 `USAGE.md`   |

**② 仓库不接受「只改生成物」的 PR**

`build/` 目录、`*.aux`、`*.log`、PDF 等编译产物都在 `.gitignore` 里，
**不要提交进仓库**；请提交**源文件**（`.tex` / `.sty` / `.cls` / `.md` / 素材）。

> [!NOTE]
> **例外：效果图要提交。** `template-<模板名>/assets/` 下的图片和根目录的 [`PREVIEWS.md`](PREVIEWS.md)
> 虽然也是从 PDF 导出的「生成物」，但定位是**给读者看的展示素材**，不属于编译产物 ——
> 见 [🆕 新增模板规范](#-新增模板规范)。

**③ 三条红线**
- **不要提交没有权利的素材。** 校徽、证件照、字体和图标都要确认可再分发。
- **一个 PR 只做一件事。** 修 Bug、重构版式、加组件和改文档请拆开提交，便于评审和回滚。
- **不要把真实简历信息提交进来。** `main.tex` 是示例，姓名、电话、邮箱一律用占位符；真实信息一旦进入 Git 历史，删除文件也无法真正清除。

---

## 🧭 从零到第一个 PR

环境要求见 [🛠️ 开发环境](#️-开发环境)，这里给最短路径：

```bash
# 1. 在 GitHub 上点 Fork，把自己的仓库克隆下来
git clone https://github.com/<你的用户名>/resumes-CV.git
cd resumes-CV

# 2. 把上游仓库加进来，方便随时同步
git remote add upstream https://github.com/tellcts/resumes-CV.git

# 3. 从最新的 main 开一个分支（分支命名见下方规范）
git switch main
git pull upstream main
git switch -c feat/your-topic

# 4. 改代码 / 写文档，然后在模板目录下编译验证
cd template-<template-name>
latexmk main.tex          # 产物：build/main.pdf
cd -

# 5. 提交并推送到自己的 Fork
git add -A
git commit -m "feat：新增 xxx 组件"
git push -u origin feat/your-topic
```

推完之后在 GitHub 上开 Pull Request，**目标分支选 `tellcts/resumes-CV` 的 `main`**。

---

## 🛠️ 开发环境

**开发环境按下表优先级选。** 三条路编出来的 PDF 一致，区别只在「数据留在哪」和「装起来麻不麻烦」：

| 优先级   | 方案                         | 适合谁                                 | 说明                                                                                 |
| -------- | ---------------------------- | -------------------------------------- | ------------------------------------------------------------------------------------ |
| **首选** | **本地安装 TeX Live 完整版** | 长期开发、改组件、出定稿               | 数据全程留在本机，编译结果可复现；代价是完整版约 10 GB，装完要配环境                 |
| **次选** | **Docker 部署 TeX Live**     | 不想在本机装完整发行版                 | 免装 TeX Live，源码与产物仍在本机；使用 TeX Live 内置字体，无需配置系统字库          |
| **辅助** | **Overleaf 在线编译**        | **只想快速生成简历、快速验证样式**的人 | 不用装任何东西，浏览器里就能出 PDF；但会**把简历内容上传到第三方**，且有编译时长限制 |

> [!CAUTION]
> **不要把 Overleaf 当主要开发环境。** 它的定位就是「快速出简历」和「快速验证样式」：
> 上传即意味着把姓名、电话、证件照交给第三方，免费账号有编译时长上限，
> 且不一定同步使用最新版 TeX Live。**提交进仓库的模板，请以本地 TeX Live 或 Docker 编译的结果为准。**

环境要求：

| 项目     | 要求                                                          |
| -------- | ------------------------------------------------------------- |
| 发行版   | **TeX Live 2026**（旧版本可能缺宏包，语法兼容性以 2026 为准） |
| 引擎     | **XeLaTeX**（中文依赖 `ctex`，`pdflatex` 编不出来）           |
| 构建工具 | **latexmk**（随 TeX Live 一起安装）                           |

安装请参照清华镜像站官方指导：<https://mirrors.tuna.tsinghua.edu.cn/help/CTAN/>；
不想在本机装完整发行版，就走
[Docker 部署 TeX Live](template-tzcan/USAGE.md#方式三docker-容器编译) ——
镜像拉一次，之后每次编译只要几秒。

> [!WARNING]
> **必须在模板目录（`template-<模板名>/`）下执行编译。**
> 模板通过 `.latexmkrc` 把 `styles/` 加入 `TEXINPUTS`（tzcan 只需写
> `\documentclass{resume-tzcan}`），在仓库根目录编译仍会直接报找不到文档类。

```bash
cd template-tzcan

latexmk main.tex          # 单次编译，产物 build/main.pdf
latexmk -pvc main.tex     # 常驻模式，保存自动重编
latexmk -c main.tex       # 清理中间文件，保留 PDF
latexmk -C main.tex       # 连 PDF 一起清理
```

> [!IMPORTANT]
> **CI 只保证能够编译，不判断版面质量。** 提交前仍要在本地 TeX Live 或 Docker 中干净编译，
> 并逐页检查 PDF 是否出现塌版、错位或异常断行。

---

## 🤖 推荐用 AI 工具辅助开发

本项目欢迎使用 AI 辅助开发。AI 生成的内容必须经过人工复核、实际编译和逐页验收，
贡献者还应能够解释最终提交的改动。开始工作前让 AI 读取根目录及对应模板的 `AGENTS.md`：

- 一次处理一个组件或一个明确问题，生成后立即编译并检查 PDF；
- 让 AI 解释不熟悉的 LaTeX 或 `expl3` 写法，最终方案由贡献者判断。

---

## 📁 仓库结构与铁律

```
resumes-CV/
├── AGENTS.md                       # 全仓库与模板目录规范
├── README.md                       # 项目总览
├── CONTRIBUTING.md                 # 贡献流程与规范
├── PREVIEWS.md                     # 全部模板效果图
├── .github/workflows/
│   ├── build-check.yml             # 模板编译检查
│   └── release-templates.yml       # Release 打包与上传
└── template-tzcan/                 # tzcan 模板
```

> [!NOTE]
> 完整的新模板目录骨架见 [根目录 AGENTS.md](AGENTS.md) 和
> [🆕 新增模板规范](#-新增模板规范)。`assets/` 与 `styles/` 内部结构不限。

**基本原则**

1. **内容与版式分离**：`main.tex` 里只写内容和键值对，一行版式代码都不写；
   字号、纸张、页边距、配色、边框一律由文档类与组件管理。
2. **模板目录自成一体**：单目录或 Release zip 必须能够独立编译，不能引用模板目录之外的仓库文件。
3. **文档与实现同步**：接口、素材位置、编译方式和目录约定发生变化时，同步更新 `USAGE.md`。

---

## 🌿 分支与提交规范

**分支命名**：`<类型>/<简短主题>`，全小写、用连字符连接。

| 前缀     | 用途                   | 示例                  |
| -------- | ---------------------- | --------------------- |
| `feat/`  | 新组件、新模板、新能力 | `feat/new-template`   |
| `fix/`   | 修 Bug、修排版错位     | `fix/section-spacing` |
| `docs/`  | 只改文档               | `docs/contributing`   |
| `chore/` | 构建、CI、杂项         | `chore/bump-ci`       |

**提交信息**：`<类型>：<简述>`，类型用小写英文，冒号用**全角**，简述用中文一句话说清改了什么。

```text
feat：新增 \cvhonor 荣誉证书组件
fix：修复分割线右端与证件照右边界不齐
docs：补充 Docker 编译拉不动镜像的排查办法
chore：推送 tag 自动上传每个模板的 zip 到 Release
```

| 类型       | 用在什么改动上                 |
| ---------- | ------------------------------ |
| `feat`     | 新增功能、组件、模板           |
| `fix`      | 修复缺陷                       |
| `docs`     | 文档（`README.md`/`USAGE.md`） |
| `style`    | 只调排版表现，不改功能语义     |
| `refactor` | 重构，对外行为不变             |
| `chore`    | 构建、依赖、仓库杂项           |
| `ci`       | CI / 工作流                    |

---

## 🧩 组件开发规范

组件的开发约定以**各模板目录下的 `AGENTS.md`** 为准（例如
[template-tzcan/AGENTS.md](template-tzcan/AGENTS.md)）。新模板的 `styles/` 内部结构不受限制，
应在自己的 `AGENTS.md` 中说明实际布局。

**文件头要写清楚：提供什么、依赖什么、被谁依赖。** 建议模板：

```latex
% ============================================================
% tzcan-<组件名>.sty —— 一句话说明本组件做什么
% ============================================================
%
% 提供：\cvxxx（对外命令）
% 依赖：tzcan-common（\midbullet、\cvbulletlist、两个 expl3 工具）、
%       fontawesome7（\faGear、\faGithub、\faGitee 等）
% 被依赖：resume-tzcan.cls（导出），或其它组件
%
% 键名     含义     写法
% ──────────────────────────────────────────────
% name     名称     name = {示例}
% date     时间     date = {2026.06 --- 2026.08}
%
% 每一项都可以省略：没写的项不出现，也不会留下孤零零的标签。

\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{tzcan-<组件名>}[<年/月/日> <简述>]
```

**键值组件的调用形态**（缩进、尾逗号、值的写法保持一致）：

```latex
\cvproject{
  name = {制造产线品质数据可视化分析},
  date = {2026.06 --- 2026.08},
  tech = {Python~\midbullet~Pandas~\midbullet~SQLite},
  duty = {
  \item 数据建模与统计： 设计 SQLite 表结构，定义判定阈值。
  },
}
```

> [!TIP]
> 改完组件后，除了看 `build/main.pdf`，也顺手在 `main.tex` 里**把新字段用一遍**；
> 需要演示的字段请留在示例里，并同步更新 `USAGE.md` 的字段表。

---

## 🆕 新增模板规范

新增模板放在仓库根目录，目录名使用全小写英文或数字的 `template-<模板名>`。
必须沿用以下根目录骨架；`assets/` 和 `styles/` 的内部结构不限，但模板必须能独立编译。

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

新增模板还需要完成以下发布材料：

- 将 `build/main.pdf` 逐页导出为效果图，放在模板的 `assets/` 下；不要使用整屏截图或 Overleaf 预览；
- 每页一张并按页码排序，文件名以模板名开头，单页控制在 1 MB 以内，内容保持为占位信息；
- 在 [`PREVIEWS.md`](PREVIEWS.md) 中添加 `## 🎨 <模板名>` 小节、完整图片和索引链接；
- 在根 `README.md` 的可用模板表中添加 `USAGE.md` 链接，并让预览列指向 `PREVIEWS.md`；
- 确认模板压缩后能在 Overleaf 选择 **XeLaTeX** 直接编译。

> [!TIP]
> **Overleaf 上最常见的两个坑**：项目根目录必须能直接看到入口文件和样式目录；
> 编译器默认是 pdfLaTeX，必须切换到 **XeLaTeX**。

---

## ✍️ 文档写作规范

仓库里所有 Markdown（`README.md`、`CONTRIBUTING.md`、各模板的 `USAGE.md`）：

- **语言用中文**，技术名词保留原文；
- **标题带语义 emoji**，与现有文档保持一致；

---

## ✅ 提交前自测清单

提 PR 前请逐条对照：

- [ ] 在模板目录下用**本地 TeX Live 完整版或 Docker** `latexmk main.tex` **干净编译**，
      无报错、无未定义命令；
- [ ] 打开编出的 PDF 逐页翻过：**没有塌版、错位、断行异常、孤零零的分隔符**；
- [ ] 新字段 / 新组件已在 `main.tex` 中演示，并同步更新 `USAGE.md`；
- [ ] **新增模板时**：已逐项完成 [🆕 新增模板规范](#-新增模板规范)，并能在 Overleaf 中用 XeLaTeX 编译；
- [ ] 文档改动符合 [✍️ 文档写作规范](#️-文档写作规范)（GitHub Alerts、中文、目录同步）；
- [ ] **没有提交** `build/`、`*.aux`、`*.log`、PDF 等生成物（`git status` 检查一遍）；
- [ ] **没有提交**真实个人信息、来源不明的图片素材；
- [ ] 分支名、提交信息符合 [🌿 分支与提交规范](#-分支与提交规范)。

---

## 📤 提交 Pull Request

1. 把改动推到自己的 Fork，向我们仓库的 `main` 发起 Pull Request；
2. **标题**按 [🌿 分支与提交规范](#-分支与提交规范)填写；描述说明改了什么、为什么改、如何验证；
3. **附上验证证据**：排版改动附改动前后的页面截图；新增模板按
   [🆕 新增模板规范](#-新增模板规范)提交效果图与预览页；
4. **保持 diff 最小**：不要顺手格式化无关文件、不要重排整个 `.sty`；
5. 评审提出修改意见时，**在同一个分支上继续提交**即可，PR 会自动更新；
6. 合并后如果上游有更新，先在本地 `git pull upstream main` 同步，再开下一个分支。

---

## 🚀 CI 与发版

仓库有两条工作流，分工是「**先编译校验，再打包发版**」。

**① [`.github/workflows/build-check.yml`](.github/workflows/build-check.yml) —— 编译校验**

| 触发                                  | 行为                                           |
| ------------------------------------- | ---------------------------------------------- |
| PR（改到 `template-*/**` 或本工作流） | 只编译**本次改动到的模板**；纯文档 PR 不触发它 |
| 发版（被 release 工作流调用）         | 编译**全部模板**，编不过就不发 Release         |
| 手动 `workflow_dispatch`              | 编译全部模板                                   |

**② [`.github/workflows/release-templates.yml`](.github/workflows/release-templates.yml) —— 打包发版**

1. 维护者推送形如 `v*` 的 tag（例如 `v1.2.0`）时触发；
2. **先跑 ①** —— 任一模板编译失败，发版直接中止（`needs: build-check`），不会产出半成品 Release；
3. 全部模板编译通过后，遍历根目录的 `template-*/`，按 [根目录 AGENTS.md](AGENTS.md)
   规定的固定路径用 `git archive` 打包，
   生成 `Resume.Template.<模板名>-<版本>.zip`（zip 内顶层目录就是模板名）；
4. 创建（或追加到）同名 GitHub Release，把 zip 作为附件上传。

---

## 📄 许可与贡献授权

本项目采用 [**PolyForm Noncommercial License 1.0.0**](LICENSE)：

- ✅ **个人求职、学习、非商业项目** —— 免费使用、修改、分发；
- ❌ **商业用途** —— 需另行获得授权。

**你提交的代码会以同一份许可证分发。** 提交 PR 即表示你同意：
你的贡献按 PolyForm Noncommercial 1.0.0 授权给本项目，且你有权提交这些内容
（尤其是图片、字体等第三方素材）。

> [!IMPORTANT]
> 若你的改动引入了第三方素材，请在 PR 描述里**写明来源与许可证**；
> 来源不明或与商业许可冲突的素材会被直接拒绝。

---

<div align="center">

**有疑问？[开一个 Issue](https://github.com/tellcts/resumes-CV/issues) 就好 —— 祝你 PR 顺利 🎉**

</div>
