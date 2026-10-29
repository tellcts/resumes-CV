<div align="center">

<h1 align="center">
  <img src=".github/assets/readme-banner.svg" alt="resumes-CV —— 用 LaTeX 模块化构建属于你的精美简历" />
</h1>

像写代码一样写简历：内容专注表达，排版专注呈现，优雅而不失风范。

[![CI](https://github.com/tellcts/resumes-CV/actions/workflows/build-check.yml/badge.svg?branch=main)](https://github.com/tellcts/resumes-CV/actions/workflows/build-check.yml)
![TeX Live](https://img.shields.io/badge/TeX%20Live-2026-3D6117?logo=latex&logoColor=white)
[![Overleaf](https://img.shields.io/badge/Overleaf-online-47A141?logo=overleaf&logoColor=white)](template-tzcan/USAGE.md#方式一overleaf-在线编译)
[![Docker](https://img.shields.io/badge/Docker-supported-2496ED?logo=docker&logoColor=white)](template-tzcan/USAGE.md#方式三docker-容器编译)
[![Downloads](https://img.shields.io/github/downloads/tellcts/resumes-CV/total?label=Downloads&color=2EA043&logo=github)](https://github.com/tellcts/resumes-CV/releases)
[![GitHub stars](https://img.shields.io/github/stars/tellcts/resumes-CV?style=social)](https://github.com/tellcts/resumes-CV)
[![License](https://img.shields.io/badge/License-PolyForm%20Noncommercial%201.0.0-orange.svg)](LICENSE)
![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20macOS%20%7C%20Linux-lightgrey)

</div>

---

## 🖼️ 效果预览

<div align="center">

<img src="template-tzcan/assets/examples/tzcan-1.jpg" width="49%" alt="tzcan 模板效果预览 · 第 1 页" />
<img src="template-tzcan/assets/examples/tzcan-2.jpg" width="49%" alt="tzcan 模板效果预览 · 第 2 页" />

**tzcan 模板** · 第 1 / 2 页 —— 双矩形边框 · 校徽水印 · 内容与版式彻底分离

[🖼️ **查看全部模板效果图 →**](PREVIEWS.md) · [📖 **tzcan 使用说明**](template-tzcan/USAGE.md)

</div>

## 📖 这是什么

**resumes-CV** 是一个用 LaTeX 编写的**模块化简历模板库**。

仓库中的每个模板都是独立、可直接使用的简历项目，并把**内容**与**版式**分层管理：

- **内容**：姓名、联系方式、教育经历、项目经历、技能等由使用者填写。
- **版式**：纸张、字号、页边距、配色、标题和列表样式由模板自身的组件提供。

使用时先选择模板，再按照该模板的使用说明编辑入口文件。不同模板的入口文件、组件字段和编译命令可能不同，
具体以对应模板的 `USAGE.md` 为准。各模板的效果与使用说明见下方 [可用模板](#-可用模板)。

## ✨ 相比之下有什么优势

### 一张表看懂

|                | 简历制作网站             | Word / 在线模板          | **本模板（LaTeX）**            |
| -------------- | ------------------------ | ------------------------ | ------------------------------ |
| **排版精确度** | ❌ 模板写死，改不动       | ⚠️ 拖拽易跑位，换设备错版 | ✅ 代码控制，结果**可复现**     |
| **内容与版式** | ❌ 混在一起               | ❌ 混在一起               | ✅ **彻底分离**                 |
| **版本管理**   | ❌ 无历史，改错回不去     | ⚠️ 靠另存为堆文件名       | ✅ Git 友好，纯文本可 diff      |
| **隐私**       | ❌ 简历上传到第三方服务器 | ⚠️ 本地，但可能带云同步   | ✅ **全本地，数据不出机器**     |
| **多版本投递** | ⚠️ 手动改一遍             | ⚠️ 手动改一遍             | ✅ 复制目录 / 按需增删模块      |
| **格式规范**   | ⚠️ 看模板作者心情         | ⚠️ 靠手动对齐             | ✅ 统一组件，全篇风格一致       |
| **学习成本**   | ✅ 最低                   | ✅ 低                     | ⚠️ 中（已封装成键值对降低门槛） |
| **费用**       | ❌ 导出 PDF 常要会员      | ⚠️ 部分模板收费           | ✅ **非商业用途免费**           |

### 🧩 内容与版式彻底分离

`main.tex` 里**只有内容和键值对，一行版式代码都没有**。带来的直接好处：

- **改内容不会塌版**：加一段项目经历、删一条技能，其余部分纹丝不动。
- **改版式不用碰内容**：想换配色、调页边距，改 `.sty` 文件里的一个变量即可全局生效。
- **不用懂 LaTeX**：所有组件都是 `键 = {值}` 的形式，会填空就会用。

### 📦 模块化，按需取用

`\cvsection` / `\cvproject` / `\cvskillcategory` / `\cvhonor` …… 十几个组件彼此独立，
**想用哪个用哪个，不用的直接删**。不需要的模块删掉后不会留下空行或多余的分隔符
（分隔符只出现在两个确有内容的条目之间）。

### 🎯 排版精确且可复现

在线模板调间距靠「拖动 + 肉眼瞅」，本模板靠**数值**：

- 分割线右端自动对齐证件照右边界，换照片宽度也**自动重算**；
- 圆点列表缩进、标题间距、边框粗细都是可调变量，改一处全局生效；
- 同一份源码在任何机器上编译，**输出完全一致** —— 今天投的和下周投的是同一个版式。

## 🎨 可用模板

| 模板                          | 风格                                                                  | 使用说明                                  | 效果预览                                |
| ----------------------------- | --------------------------------------------------------------------- | ----------------------------------------- | --------------------------------------- |
| **tzcan** <br/>*(目前已实现)* | 双矩形边框 · 校徽水印 · 两行信息栏 · 内容/版式分离 · 全组件键值对接口 | [📖 **USAGE.md**](template-tzcan/USAGE.md) | [🖼️ **第 1 ~ 2 页**](PREVIEWS.md#-tzcan) |

> [!NOTE]
> **全部模板的效果图都在 [🖼️ PREVIEWS.md](PREVIEWS.md)** —— 本 README 的预览区只展示 tzcan 一个模板，
> 每个模板的图片源文件放在 `template-<模板名>/assets/` 下，具体子目录不限，
> 新增模板时的具体要求见 [🤝 CONTRIBUTING.md](CONTRIBUTING.md#-新增模板规范)。

## 🔧 环境要求

**普通用户不用提前装任何东西** —— 三条路通向同一份 PDF，**任选一条即可**：
**方式一**是 **Overleaf 在线编译**；介意把简历传到网上，可选择**方式二本地安装 TeX Live**或**方式三 Docker 容器编译**。

| 方式       | 方案                  | 适合谁                       | 优点                                                 | 缺点                                                       |
| ---------- | --------------------- | ---------------------------- | ---------------------------------------------------- | ---------------------------------------------------------- |
| **方式一** | **Overleaf 在线编译** | 只想尽快填内容、尽快出 PDF   | 零安装、零配置，浏览器里改完就能出 PDF，换电脑也一样 | ⚠️ 简历会上传到第三方服务器（姓名 / 电话 / 证件照都在云端） |
| **方式二** | **本地安装 TeX Live** | 在意隐私、要长期反复改简历   | 全程本地、离线可用，编译结果可复现                   | 完整版约 10 GB，装完还要配环境                             |
| **方式三** | **Docker 容器编译**   | 不想在本机装几个 GB 的 LaTeX | 免装 TeX Live，源码与产物仍留在自己电脑上            | 要先装好 Docker；首次拉镜像约 2.5 GB                       |

各条路的操作步骤（Overleaf 怎么上传、怎么切 XeLaTeX、Docker 命令行怎么写）见
[📖 tzcan `USAGE.md` → 🚀 选择编译方式](template-tzcan/USAGE.md#-选择编译方式)：
[方式一：Overleaf](template-tzcan/USAGE.md#方式一overleaf-在线编译) ·
[方式二：本地 TeX Live](template-tzcan/USAGE.md#方式二本地安装-tex-live) ·
[方式三：Docker](template-tzcan/USAGE.md#方式三docker-容器编译)。

> [!CAUTION]
> **走 Overleaf 就等于把简历交给第三方。** 姓名、手机号、邮箱、证件照都会存在它的云端 ——
> 介意的话就选另外两条，三条路编出来的 PDF 完全一样。

本地安装请参照**清华镜像站官方指导**：<https://mirrors.tuna.tsinghua.edu.cn/help/CTAN/>；
不想在本机装 10 GB 的发行版就走 Docker（镜像拉一次，之后每次编译几秒）。装完确认两件事：

```bash
xelatex --version    # 应输出 XeTeX 3.141592653-...，TeX Live 2026
latexmk --version    # 应输出 Latexmk, John Collins, ...
```

> [!IMPORTANT]
> **本地安装时记得把 Default paper size 设为 A4**（在安装界面点 `Advanced` 才看得到）——
> 模板用 `a4paper`，不设的话部分宏包会按 Letter 排版，版式会整体跑偏。


## 📁 项目结构

```
resumes-CV/
├── LICENSE
├── README.md                    ← 你正在看的文件
├── CONTRIBUTING.md              # 贡献指南：开发环境 / 规范 / 提 PR 流程
├── PREVIEWS.md                  # 🖼️ 全部模板的效果图（README 只展示 tzcan）
└── template-tzcan/              # tzcan 模板
    ├── main.tex                 # 👈 只改这一个文件：简历内容
    ├── USAGE.md                 # 📖 该模板的完整使用说明
    ├── AGENTS.md                # 模板级开发约定
    ├── CLAUDE.md                # 指向 AGENTS.md
    ├── .latexmkrc               # latexmk 配置（XeLaTeX 引擎、输出到 build/）
    ├── assets/                  # 证件照、校徽、效果图与操作截图
    │   ├── badges/
    │   ├── images/
    │   └── examples/
    ├── build/                   # 编译产物（main.pdf 在这里）
    ├── scripts/                 # Docker 编译脚本
    └── styles/                  # 版式：文档类 + 12 个组件（同级）
        ├── resume-tzcan.cls
        ├── tzcan-common.sty        # 底座：主题色 / 圆点列表
        ├── tzcan-section.sty       # \cvsection 模块标题
        ├── tzcan-personalinfo.sty  # 个人信息区
        ├── tzcan-project.sty       # \cvproject 项目经历
        └── ...                     # 共 12 个组件
```

## 🤝 参与贡献

欢迎提交 Issue 和 Pull Request。具体流程与要求请查看[贡献者文档](CONTRIBUTING.md)。

## 📄 许可

本项目采用 [**PolyForm Noncommercial License 1.0.0**](LICENSE)：

- ✅ **个人求职、学习、非商业项目** —— 免费使用、修改、分发
- ❌ **商业用途** —— 需另行获得授权

简历本身属于你，模板的代码属于这个项目。请保留 `LICENSE` 文件。

## ⭐ 支持这个项目

如果这个模板帮到了你 —— 比如让你在 deadline 前一晚还能安心改简历 ——
**花 3 秒点个 Star** 就是最好的回报：

<div align="center">

### [⭐ Star 一下 → github.com/tellcts/resumes-CV](https://github.com/tellcts/resumes-CV)

你的每一个 Star，都是这个项目继续维护下去的动力 💖

</div>

也欢迎把仓库分享给正在找工作的同学 👥

<div align="center">

**祝你拿到心仪的 Offer！** 🎉

</div>
