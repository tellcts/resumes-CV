<div align="center">

# 📄 resumes-CV · tzcan 模板

**用 LaTeX 模块化构建属于你的精美简历 💖**

</div>

---

本文档面向**模板使用者**，讲解这个模板本身怎么用 —— 从拿到模板、编译出 PDF，
到每个组件的每个字段说明。

排版全部由文档类 `styles/resume-tzcan.cls` 与 `styles/components/` 下的 12 个组件提供，
`main.tex` 里**只写内容、不写版式** —— 你不需要懂 LaTeX 宏包开发，只要会填键值对。

> [!TIP]
> **只想用这个模板做一份自己的简历？** 先看 [🚀 选择编译方式](#-选择编译方式) ——
> 首选 **Overleaf 在线编译**（不用装 LaTeX，浏览器里就能出 PDF），其次 **本地安装 TeX Live**（数据不出本机）。

> [!NOTE]
> **只想赶紧看到效果？** 跳到 [首选 Overleaf 在线编译](#首选-overleaf-在线编译)
> 和 [🖼️ 替换素材](#-替换素材) 两节就够了。

## 📑 目录

- [📄 resumes-CV · tzcan 模板](#-resumes-cv--tzcan-模板)
  - [📑 目录](#-目录)
  - [📥 获取模板](#-获取模板)
  - [🚀 选择编译方式](#-选择编译方式)
    - [首选 Overleaf 在线编译](#首选-overleaf-在线编译)
    - [次选 本地安装 TeX Live](#次选-本地安装-tex-live)
    - [三选 Docker 容器编译（免装 LaTeX）](#三选-docker-容器编译免装-latex)
  - [🔨 本地编译](#-本地编译)
    - [方式一：本地安装 TeX Live](#方式一本地安装-tex-live)
    - [方式二：Docker 容器编译](#方式二docker-容器编译)
      - [拉不下镜像？](#拉不下镜像)
    - [常用清理命令](#常用清理命令)
    - [`.latexmkrc` 已经替你配好了](#latexmkrc-已经替你配好了)
  - [🖼️ 替换素材](#️-替换素材)
    - [证件照](#证件照)
    - [校徽](#校徽)
  - [🧩 组件参考手册](#-组件参考手册)
    - [组件可选项总览](#组件可选项总览)
    - [顶层骨架](#顶层骨架)
    - [各组件详解](#各组件详解)
      - [`\cvsection` 模块标题](#cvsection-模块标题)
      - [`\cvname` 姓名](#cvname-姓名)
      - [`\cvpersonalinfo` 个人信息栏](#cvpersonalinfo-个人信息栏)
      - [`\cvphototopright` / `\cvphoto` 证件照](#cvphototopright--cvphoto-证件照)
      - [`\cvhorizontalline` 信息区分隔线](#cvhorizontalline-信息区分隔线)
      - [`\cvproject` 项目经历](#cvproject-项目经历)
      - [`\cvinternship` 实习经历](#cvinternship-实习经历)
      - [`\cvwork` 工作经历](#cvwork-工作经历)
      - [`\cveducation` 教育背景](#cveducation-教育背景)
      - [`\cvskillcategory` 专业技能](#cvskillcategory-专业技能)
      - [`\cvhonor` 荣誉证书](#cvhonor-荣誉证书)
      - [`\cvselfassessment` 自我评价](#cvselfassessment-自我评价)
      - [`\addwatermark` 校徽水印](#addwatermark-校徽水印)
      - [`\midbullet` 行内圆点](#midbullet-行内圆点)
    - [🔧 内部命令（仅供版式定制）](#-内部命令仅供版式定制)
  - [🎨 版式与配色定制](#-版式与配色定制)
  - [📁 目录结构](#-目录结构)
  - [❓ 常见问题](#-常见问题)

---

## 📥 获取模板

```bash
# HTTPS（推荐，无需配置 SSH Key）
git clone https://github.com/tellcts/resumes-CV.git

# 或 SSH
git clone git@github.com:tellcts/resumes-CV.git
```

---

## 🚀 选择编译方式

**如果你只想用这个模板做一份简历**，第一件事是选编译方式 —— 三条路通向同一份 PDF，
区别只在「快不快」和「数据留在哪」：

| 方式                            | 适合谁                           | 优点                                             | 缺点                                                                   |
| ------------------------------- | -------------------------------- | ------------------------------------------------ | ---------------------------------------------------------------------- |
| **① Overleaf 在线编译（首选）** | 只想填内容、尽快看到简历效果的人 | 不用装任何软件，浏览器里改完就出 PDF，上手最快   | ⚠️ **简历会上传到服务器**：姓名、电话、邮箱、证件照都存在 Overleaf 云端 |
| **② 本地安装 TeX Live（次选）** | 在意隐私，或要长期反复改简历的人 | 数据全程留在自己电脑上，离线可用，编译结果可复现 | 完整版 TeX Live 10 GB，安装 + 配环境慢，第一次上手门槛高           |
| **③ Docker 容器编译（备选）**   | 装了 Docker、不想装 LaTeX 的人   | 免装 TeX Live，源码仍在本机，产物也在本机        | 首次拉镜像约 2.5 GB；容器内中文字体与系统字体不同，外观略有差异        |

> [!TIP]
> **一句话选型**：图快、图省事 → Overleaf；简历里有不想上传的信息 → 本机装 TeX Live，
> 或者走 [三选 Docker 容器编译](#三选-docker-容器编译免装-latex)（不想在本机装10 GB 的 TeX Live 就选它）。
> 三者可以混用：在 Overleaf 上把内容改到满意，再回本地用同一份 `main.tex` 编出最终版。

### 首选 Overleaf 在线编译

- ✅ **优点**：不用装 LaTeX、不用配环境，注册后几分钟就能看到简历效果；换电脑、换系统都一样。
- ⚠️ **缺点**：**个人数据上传到服务器** —— `main.tex` 里的姓名、手机号、邮箱、教育经历，
  以及 `assets/` 下的证件照，都会保存在 Overleaf 的云端。介意的话请走下面的本地方案。

操作步骤：

1. **拿到模板**：克隆仓库后把 `src/templates/tzcan/` 压成 ZIP；
   或从 [Releases](https://github.com/tellcts/resumes-CV/releases) 直接下载打包好的 `Resume.Template.tzcan-*.zip`；
2. **上传**：打开 <https://www.overleaf.com> 注册 / 登录（免费账号够用）→ `New Project` → `Upload Project` → 选择压缩包；
3. **确认文件层级**：项目**根目录**下要直接能看到 `main.tex`、`styles/`、`assets/`，**不能**被套在 `tzcan/` 文件夹里 ——
   `main.tex` 用的是相对路径 `\documentclass{styles/resume-tzcan}`，多一层就报找不到文档类。
   真被套了一层，就在 Overleaf 文件树里全选拖到根目录（或删掉那层文件夹）；
4. **切换编译器**：左上角 `Menu` → `Compiler` 选 **XeLaTeX**。Overleaf 默认是 pdfLaTeX，**不改这一步中文编不出来**；
5. **点 `Recompile`**：首次编译要预热中文字体，稍慢属正常；免费账号有编译时长上限，万一超时，再点一次通常就过了；
6. **导出成品**：右上角 `Download PDF`。

几点说明：

- Overleaf 自己接管输出目录，`.latexmkrc` 里的 `$out_dir = 'build'` 在那边**不生效**，这是正常现象，
  不用去找 `build/main.pdf`，直接点 `Download PDF` 即可。
- `ctex`、`fontawesome5`、`tikz` 等宏包 Overleaf 都已内置，不需要额外安装。
- 换证件照：在文件树里进 `assets/images/` 上传你自己的 `person.png` 覆盖同名文件，`main.tex` 一个字都不用改；
  校徽同理，放进 `assets/badges/`。

### 次选 本地安装 TeX Live

- ✅ **优点**：简历**全程留在自己电脑上**，不联网、不上传、不注册；改完本地立刻重编，
  长期反复改简历反而更顺手。
- ⚠️ **缺点**：安装包大、耗时长 —— 完整版 TeX Live 10 GB，下载 + 安装常常要半小时以上，
  初次还可能踩到中文字体或宏包缺失的坑。

安装步骤与中文字体配置见根目录 [README 的环境要求](../../../README.md#-环境要求)，
装完直接看下一节 [方式一：本地安装 TeX Live](#方式一本地安装-tex-live)：

```bash
# 确认装好了（各应输出一行 TeX / latexmk 版本号）
xelatex --version
latexmk --version

cd resumes-CV/src/templates/tzcan
latexmk main.tex          # → build/main.pdf
latexmk -pvc main.tex     # 常驻模式，保存 .tex 自动重编
```

### 三选 Docker 容器编译（免装 LaTeX）

- ✅ **优点**：本机**不用装几个 GB 的 TeX Live**，只要装了 Docker 就能编；源码、图片、产物
  全在你自己的目录里，容器只借用「编译」这一步；镜像只拉一次，之后每次编译都是几秒钟的事。
- ⚠️ **缺点**：需要先装 Docker（Desktop / Engine 都行）并保持运行；首次要拉约 2.5 GB 的镜像，
  直连 Docker Hub 可能失败（见 [拉不下镜像？](#拉不下镜像)）；容器里没有你系统的中文字体，
  中文外观与「本地安装 TeX Live」版略有差异。

操作只有一行命令，详见 [方式二：Docker 容器编译](#方式二docker-容器编译)。

---

## 🔨 本地编译

本地编译有两条路，编出来的是**同一份 `build/main.pdf`**，按你本机装了什么挑一条：

| 方式                          | 前提                             | 适合谁                               |
| ----------------------------- | -------------------------------- | ------------------------------------ |
| **方式一：本地安装 TeX Live** | 装好 TeX Live 2026（含 XeLaTeX） | 长期反复改简历，想要最顺手的编辑体验 |
| **方式二：Docker 容器编译**   | 装好并启动 Docker，能拉一次镜像  | 不想在本机装几个 GB 的 TeX Live      |

> [!WARNING]
> **两条路都必须在模板目录下执行编译。** `main.tex` 里写的是 `\documentclass{styles/resume-tzcan}`
> ——相对路径，在别的目录下编译会直接报找不到文档类。

> [!NOTE]
> **用 Overleaf 的话，本节整节跳过** —— 见上面的 [首选 Overleaf 在线编译](#首选-overleaf-在线编译)。

### 方式一：本地安装 TeX Live

```bash
cd resumes-CV/src/templates/tzcan

latexmk main.tex          # 单次编译 → 产物 build/main.pdf
latexmk -pvc main.tex     # 常驻模式，保存 .tex 自动重编，适合边改边看
```

产物是 **`build/main.pdf`**，不在项目根目录，别找错地方 👀

### 方式二：Docker 容器编译

本机没装 TeX Live、也不想装？只要装了 Docker，用官方 `texlive/texlive` 镜像就能编 ——
**源码始终留在你自己的目录里**，容器只是把「编译」这一步借走，简历数据不出本机。

**第一步：进模板目录**（和方式一一样，绕不开）：

```bash
cd resumes-CV/src/templates/tzcan
```

**第二步：一条命令编出 PDF**：

```bash
# macOS / Linux（bash / zsh）
docker run --rm \
  -v "$PWD":/workdir \
  -w /workdir \
  texlive/texlive \
  latexmk main.tex
```

```powershell
# Windows（PowerShell）
docker run --rm `
  -v "${PWD}:/workdir" `
  -w /workdir `
  texlive/texlive `
  latexmk main.tex
```

命令逐段拆开看：

| 片段                 | 作用                                                                |
| -------------------- | ------------------------------------------------------------------- |
| `docker run --rm`    | 开一个一次性容器，编译完自动删除，不在本机留垃圾                    |
| `-v "$PWD":/workdir` | 把**当前所在目录**（也就是模板目录）挂进容器的 `/workdir`           |
| `-w /workdir`        | 让容器的当前目录就是 `/workdir` —— 相对路径和 `.latexmkrc` 才找得到 |
| `texlive/texlive`    | 官方 TeX Live 镜像（等同于 `texlive/texlive:latest`）               |
| `latexmk main.tex`   | 容器里执行的命令，和方式一完全一致                                  |

> [!NOTE]
> 容器的工作目录就是 `/workdir`，`.latexmkrc` 会被自动读到 —— 引擎（XeLaTeX）和输出目录（`build/`）
> 都不用额外传参数，产物照样落在**本机**的 `build/main.pdf`。

> [!TIP]
> **首次运行要拉镜像**（约 2.5 GB），这一次慢是正常的；之后每次编译只是启动一个容器，几秒就出结果。

想边改边看，在 `docker run` 后面加 `-it` 跑常驻模式（会占住一个终端，`Ctrl+C` 退出）：

```bash
docker run --rm -it -v "$PWD":/workdir -w /workdir texlive/texlive latexmk -pvc main.tex
```

#### 拉不下镜像？

Docker Hub 在国内直连经常超时，第一次 `docker run` 就卡在拉取：

```text
Error response from daemon: Get "https://registry-1.docker.io/v2/": dial tcp ...: i/o timeout
```

按顺序试这两个办法：

1. **你已经配了镜像加速器**（Docker Desktop 的 `Settings → Docker Engine` 里加了 `registry-mirrors`，
   或走了代理）—— 那就不用改命令，继续用官方的 `texlive/texlive`；
2. **没配加速、也不想折腾** —— 换成作者从官方同步的 `ghcr.io/tellcts/texlive:latest`，
   只改镜像名，其余参数一个字不用动：

```bash
docker run --rm \
  -v "$PWD":/workdir \
  -w /workdir \
  ghcr.io/tellcts/texlive:latest \
  latexmk main.tex
```

```powershell
docker run --rm `
  -v "${PWD}:/workdir" `
  -w /workdir `
  ghcr.io/tellcts/texlive:latest `
  latexmk main.tex
```

这份镜像的内容与官方 `texlive/texlive` 一致（作者定期同步），只是换了个仓库 —— 所以本文档里凡是
出现 `texlive/texlive` 的地方，都可以直接替换成 `ghcr.io/tellcts/texlive:latest`。

> [!IMPORTANT]
> **容器里没有你系统的中文字体**，`ctex` 会自动退回 TeX Live 自带的 **Fandol（方正）** 字体族。
> 内容和版式都一样，但中文观感（尤其**加粗标题**）会和方式一编出来的有细微差异，个别行还可能折行位置不同。

> [!TIP]
> **换编译方式前先清一次 `build/`**：上一次在本机编译时，`latexmk` 把 `c:/texlive/...` 这类
> **本机路径**记进了 `build/main.fdb_latexmk` / `build/main.fls`，容器里并没有这些文件，
> 它可能因此多跑几轮、日志里冒出无关的「找不到文件」。清理命令见下一节。

### 常用清理命令

```bash
# 方式一：本机
latexmk -c main.tex       # 清理中间文件（.aux / .log / .xdv 等），保留 PDF
latexmk -C main.tex       # 连 PDF 一起清理
```

```bash
# 方式二：Docker（<镜像> 换成 texlive/texlive 或 ghcr.io/tellcts/texlive:latest）
docker run --rm -v "$PWD":/workdir -w /workdir <镜像> latexmk -C main.tex
```

### `.latexmkrc` 已经替你配好了

模板目录下的 `.latexmkrc` 会让 `latexmk` 自动做这几件事，不需要你传额外参数
（Overleaf 会自己接管这些参数，见 [首选 Overleaf 在线编译](#首选-overleaf-在线编译)；
Docker 方式同理，容器的工作目录就是 `/workdir`）：

| 配置                           | 作用                                                 |
| ------------------------------ | ---------------------------------------------------- |
| `$pdf_mode = 5`                | 指定用 **XeLaTeX** 编译（中文必需，别改成 pdflatex） |
| `$out_dir = 'build'`           | 所有产物输出到 `build/`，不污染源码目录              |
| `$synctex = 1`                 | 开启 SyncTeX，支持 PDF ↔ 源码双向跳转                |
| `$interaction = 'nonstopmode'` | 遇错不中断，一次编译尽量把错误全报出来               |
| `$file_line_error = 1`         | 报错信息带文件名和行号                               |

---

## 🖼️ 替换素材

模板现有两张演示图片，**先把它们换成你自己的**，再改 `main.tex` 里的文字。

| 用途     | 位置                       | 格式建议                                 |
| -------- | -------------------------- | ---------------------------------------- |
| 证件照   | `assets/images/person.png` | PNG / JPG，竖版一寸照，比例约 5:7        |
| 校徽水印 | `assets/badges/*.png`      | **PNG 透明背景**，正方形，分辨率越高越好 |

> [!TIP]
> 最简单的做法：**保持文件名不变，直接覆盖原文件**。这样 `main.tex` 一个字都不用改。

### 证件照

在 `main.tex` 里由 `\cvphototopright` 调用：

```latex
% 右上角一寸照片（路径相对 cwd，即 src/templates/tzcan/）
\cvphototopright[2.5cm]{assets/images/person.png}
```

- `[2.5cm]` 是**可选参数**，表示照片宽度，不写就默认 `2.5cm`（标准一寸照）。
- 改宽度后分隔线位置会自动跟着算，不用手工调数值。
- 照片是**页面坐标定位**的，不受正文行距影响，改内容不会把它挤跑。

### 校徽

校徽推荐到这个网站找：**<https://www.urongda.com/>** —— 收录了国内各高校的校徽矢量图 / 高清图，
下载时优先选**透明背景的 PNG**（不透明的白底图当水印会在简历上糊出一块白斑）。

下载后放进 `assets/badges/`，然后在 `main.tex` 的**导言区**（`\begin{document}` 之前）调用：

```latex
% 透明度 0.09，居中铺满页面
\addwatermark[opacity=0.09]{assets/badges/ecjtu.png}{center}
```

想换水印位置就把 `center` 换成 `north`、`south`、`north west` 等 TikZ 锚点名；
想换透明度就改 `opacity` 的值（`0.03` ~ `0.15` 之间比较耐看）。

模板已自带两张示例校徽：`ecjtu.png`（华东交大）、`tsinghua.png`（清华），可直接删掉。

> [!WARNING]
> **路径是相对「编译进程的当前目录」解析的，不是相对 `main.tex` 的位置。**
> 所以务必在 `src/templates/tzcan/` 目录下执行 `latexmk`，并且把路径写完整
> （`assets/badges/xxx.png`，而不是 `xxx.png`）。这是新手最常见的 `File not found` 原因。

---

## 🧩 组件参考手册

12 个组件全部**导出**自文档类 `styles/resume-tzcan.cls`，`main.tex` 里直接调用即可，
**不需要**写 `\usepackage`。

### 组件可选项总览

| 组件                | 用途                             | 键是否全部可选       |
| ------------------- | -------------------------------- | -------------------- |
| `\cvsection`        | 模块标题（图标 + 文字 + 下划线） | ❌ 两个参数都必填     |
| `\cvname`           | 姓名                             | ❌ 必填               |
| `\cvpersonalinfo`   | 信息栏（两行）                   | ✅ **全部可选**       |
| `\cvphototopright`  | 右上角证件照                     | ✅ 宽度可选           |
| `\cvhorizontalline` | 个人信息区下的分隔线             | — 无参数             |
| `\cvproject`        | 项目经历条目                     | ✅ **全部可选**       |
| `\cvinternship`     | 实习经历条目                     | ✅ **全部可选**       |
| `\cvwork`           | 工作经历条目                     | ✅ **全部可选**       |
| `\cveducation`      | 教育背景条目                     | ✅ **全部可选**       |
| `\cvskillcategory`  | 技能分类条目                     | ⚠️ `content` 实为必填 |
| `\cvhonor`          | 荣誉证书条目                     | ✅ **全部可选**       |
| `\cvselfassessment` | 自我评价                         | — 无键值接口         |
| `\addwatermark`     | 校徽水印                         | ✅ 第 1 个参数可选    |
| `\midbullet`        | 行内居中圆点（分隔符）           | — 无参数             |

**通用约定（适用于所有键值组件）：**

1. **值一律用花括号包住** —— `name = {张三}`，不要写成 `name = 张三`。
2. **键名拼错会直接报错**，不会静默丢内容，所以看到 `Undefined control sequence` 或
   `key ... unknown` 先检查拼写。
3. **没写的键 = 不显示**，且不会留下孤零零的标签或多余的分隔符 —— 分隔符只出现在
   两个**确有内容**的条目之间。可以放心地按需删减任何一行。
4. 需要缩小字号、加粗等局部排版时，直接在值里写 LaTeX 命令即可，例如
   `gpa = {\small GPA: 3.8}`。

### 顶层骨架

`main.tex` 的推荐调用顺序（**已按此顺序写好，照抄即可**）：

```latex
\documentclass{styles/resume-tzcan}          % ① 文档类：零选项，版式全在 .cls 里

\addwatermark[opacity=0.09]{assets/badges/ecjtu.png}{center}   % ② 可选：校徽水印

\begin{document}

\cvname{张~三}                                % ③ 姓名
\cvpersonalinfo{ ... }                        % ④ 信息栏
\cvphototopright[2.5cm]{assets/images/person.png}  % ⑤ 证件照
\cvhorizontalline                             % ⑥ 分隔线

\cvsection{\faLaptopCode}{项目经历}            % ⑦ 正文各模块，顺序随你
\cvproject{ ... }
% ...

\end{document}
```

> [!WARNING]
> **⑤ 和 ⑥ 的顺序不能颠倒。** `\cvhorizontalline` 要读 `\cvphototopright` 记录下来的
> 照片尺寸才能算出自己该画在哪；先画线再放照片，线就会退化成「不考虑照片」的行内画法。

> [!NOTE]
> ③④⑤⑥ 四块**各自独立**，按需取用；不用照片的话，直接删掉 ⑤，⑥ 会自动退回普通行内直线。

### 各组件详解

#### `\cvsection` 模块标题

`\cvsection{图标}{标题文字}` —— 两个参数都**必填**。

```latex
\cvsection{\faLaptopCode}{项目经历}
\cvsection{\faBriefcase}{实习经历}
\cvsection{\faGraduationCap}{教育背景}
\cvsection{\faCog}{专业技能}
\cvsection{\faAward}{荣誉证书}
\cvsection{\faUserCircle}{自我评价}
```

图标来自 `fontawesome5` 宏包，写 `\fa` 开头的命令名即可。常用图标速查：

| 图标 | 命令            | 图标 | 命令               |
| ---- | --------------- | ---- | ------------------ |
| 💻    | `\faLaptopCode` | 🎓    | `\faGraduationCap` |
| 💼    | `\faBriefcase`  | ⚙️    | `\faCog`           |
| 🏆    | `\faAward`      | 👤    | `\faUserCircle`    |
| 🏢    | `\faBuilding`   | 🚀    | `\faRocket`        |
| 📊    | `\faChartBar`   | 🔧    | `\faWrench`        |

更多图标见 [Font Awesome 5 官方图标列表](https://fontawesome.com/v5/search?o=r&m=free)。

---

#### `\cvname` 姓名

`\cvname{姓名}` —— 必填，居中、特大号、加粗。

```latex
\cvname{张~三}     % ~ 是不换行空格，两字姓名看起来更舒服
```

---

#### `\cvpersonalinfo` 个人信息栏

`\cvpersonalinfo{ ... }` —— 键值接口，**全部键可选**。渲染成居中的两行。

| 键         | 含义            | 必填 | 所在行 | 说明                                         |
| ---------- | --------------- | ---- | ------ | -------------------------------------------- |
| `phone`    | 电话            | 否   | 第一行 | 自动变成可点击的 `tel:` 链接                 |
| `email`    | 邮箱            | 否   | 第一行 | 自动变成可点击的 `mailto:` 链接              |
| `github`   | GitHub 用户名   | 否   | 第二行 | **只填用户名**，自动补 `https://github.com/` |
| `age`      | 年龄            | 否   | 第二行 | 原样输出，如 `21岁`                          |
| `gender`   | 性别            | 否   | 第二行 | 原样输出                                     |
| `identity` | 身份 / 学历状态 | 否   | 第二行 | 原样输出，可用 `                             | ` 写多个 |
| `target`   | 求职目标岗位    | 否   | 第二行 | 原样输出                                     |

```latex
\cvpersonalinfo{
  phone    = {+86 188--8888--8888},
  email    = {you@example.com},
  github   = {tellcts},
  age      = {21岁},
  gender   = {男},
  identity = {26应届生 | 中共党员 | 共青团员 | 硕士在读},
  target   = {数字化工程师},
}
```

**说明：**

- **第一行**只放 `phone` / `email`，用 ` | ` 分隔；**第二行**放其余五项，用 ` · ` 分隔。
- 哪一项不写、哪一行就少一项，**不会出现连续两个分隔符**。
- `github` 虽然叫「用户名」，但位置在第二行末尾，不是第一行。
- `identity` 想写多个身份时用 `|` 隔开即可，它只是一段原样输出的文字。

---

#### `\cvphototopright` / `\cvphoto` 证件照

```latex
\cvphototopright[2.5cm]{assets/images/person.png}   % 钉在右上角（推荐）
\cvphoto[2.5cm]{assets/images/person.png}           % 就地放置，带细边框
```

| 参数         | 必填   | 默认    | 说明                   |
| ------------ | ------ | ------- | ---------------------- |
| `[宽度]`     | 否     | `2.5cm` | 标准一寸照宽度         |
| `{图片路径}` | **是** | —       | 相对**编译目录**的路径 |

- `\cvphototopright` 用**页面坐标**定位，图片钉在距页右边缘 1.5cm、距页顶 0.65cm 处，
  右下角与正文分割线严丝合缝地对齐。
- 改宽度后 `\cvhorizontalline` 会自动重算位置，**不需要**手工试数值。
- `\cvphoto` 是「就地插入」版本，会跟着正文排版流走 —— 一般用不上，除非你想把照片放进某个区块里。

---

#### `\cvhorizontalline` 信息区分隔线

`\cvhorizontalline` —— **无参数**，画一条横贯正文宽度的浅灰细线。

```latex
\cvname{张~三}
\cvpersonalinfo{ ... }
\cvphototopright[2.5cm]{assets/images/person.png}
\cvhorizontalline        % ← 必须放在 \cvphototopright 之后
```

不写 `\cvphototopright` 也能用，此时线会按普通行内直线绘制。想让线离照片近一点 / 远一点，
改 `styles/components/tzcan-personalinfo.sty` 里的 `\cvlinegap`（默认 `0.18cm`）。

---

#### `\cvproject` 项目经历

`\cvproject{ ... }` —— 键值接口，**全部键可选**。

> [!NOTE]
> 显示顺序固定：**标题行 → 项目介绍 → 技术栈 → 个人职责 → 项目亮点**，传入顺序不影响排版。

| 键          | 含义     | 必填 | 说明                                                   |
| ----------- | -------- | ---- | ------------------------------------------------------ |
| `name`      | 项目名称 | 否   | 标题行左端，加粗                                       |
| `link`      | 项目链接 | 否   | 标题行居中，渲染为 ` GitHub` 图标链接                  |
| `date`      | 项目时间 | 否   | 标题行右端                                             |
| `intro`     | 项目介绍 | 否   | 行内式标签「项目介绍：」+ 正文，小号字                 |
| `tech`      | 技术栈   | 否   | 行内式标签「技术栈：」+ 正文，建议用 `\midbullet` 分隔 |
| `duty`      | 个人职责 | 否   | 块式标签「个人职责」+ 圆点列表                         |
| `highlight` | 项目亮点 | 否   | 块式标签「项目亮点」+ 圆点列表                         |

```latex
\cvproject{
  name = {制造产线品质数据可视化分析},
  date = {2026.06 --- 2026.08},
  link = {https://github.com/your-github/your-project},
  intro = {面向制造产线品质分析，构造产线口径的测试数据并以 SQLite 存储，
           基于 Pandas 完成良率统计、SPC 过程控制与缺陷趋势分析。},
  tech = {Python~\midbullet~Pandas~\midbullet~SQLite~\midbullet~Streamlit},
  duty = {
  \item 数据建模与统计： 设计 SQLite 表结构，定义插损/回损判定阈值。
  \item SPC 过程控制： 实现 X-bar-R 控制图与 Cpk 计算。
  },
  highlight = {
  \item 一键报告： CLI 一条命令完成「分析 → 图表 → PDF 报告」全链路。
  },
}
```

**排版提示：**

- `duty` / `highlight` 是 `\item` 列表，每项以 `\item` 开头，**不要**自己写 `\begin{itemize}`。
- 标题行三段（`name` / `link` / `date`）**全空时整行不输出**，不会留下空行。
- `\midbullet` 是行内居中圆点，比直接写 `·` 的字距更均匀。
- ⏱ **单行长度约束**：`\small`(10pt) 下每条可用行宽约 **50 个汉字**；要让每条 `\item`
  单行显示不折行，整体（含行首「标签：」）控制在 **46 字以内**。

---

#### `\cvinternship` 实习经历

`\cvinternship{ ... }` —— 键值接口，**全部键可选**。

> [!NOTE]
> 显示顺序固定：**标题行 → 岗位职责 → 产出成果**。

| 键            | 含义     | 必填 | 说明                                                        |
| ------------- | -------- | ---- | ----------------------------------------------------------- |
| `position`    | 职位名称 | 否   | 标题行左端，加粗                                            |
| `company`     | 公司名称 | 否   | 标题行居中，加粗                                            |
| `date`        | 实习时间 | 否   | 标题行右端                                                  |
| `duty`        | 岗位职责 | 否   | 块式标签 + 圆点列表                                         |
| `achievement` | 产出成果 | 否   | 块式标签 + 圆点列表；不写则**整块（含标签与间距）都不输出** |

```latex
\cvinternship{
  position = {运维开发实习生},
  company  = {某某信息技术有限公司},
  date     = {2026.07 --- 2026.09},
  duty = {
  \item 设备巡检： 按计划巡检在用终端与服务器，记录状态并上报隐患。
  \item 脚本开发： 用 Shell 与 Python 编写巡检、备份脚本，替代手工操作。
  },
  achievement = {
  \item 巡检提效： 日常巡检由 20 分钟缩短到 2 分钟，异常自动留痕。
  },
}
```

排版约束同 `\cvproject`：每条建议控制在 46 字以内。

---

#### `\cvwork` 工作经历

`\cvwork{ ... }` —— 键值接口，**全部键可选**。结构与 `\cvinternship` **完全对齐**，
只有两个块式标签换成了「工作职责 / 工作成果」。

> [!NOTE]
> 显示顺序固定：**标题行 → 工作职责 → 工作成果**。

| 键            | 含义     | 必填 | 说明                                  |
| ------------- | -------- | ---- | ------------------------------------- |
| `position`    | 职位名称 | 否   | 标题行左端                            |
| `company`     | 公司名称 | 否   | 标题行居中                            |
| `date`        | 任职时间 | 否   | 标题行右端                            |
| `duty`        | 工作职责 | 否   | 块式标签 + 圆点列表                   |
| `achievement` | 工作成果 | 否   | 块式标签 + 圆点列表；不写则整块不输出 |

```latex
\cvwork{
  position = {系统运维工程师},
  company  = {某某网络科技有限公司},
  date     = {2026.10 --- 2027.06},
  duty = {
  \item 日常运维： 负责公司内网服务器与办公终端的日常巡检与维护。
  },
  achievement = {
  \item 监控覆盖： 监控覆盖率由 60\% 提升到 95\%。
  },
}
```

> [!TIP]
> **求职阶段不必硬填此项。** 没有正式工作经历就整段删掉（连 `\cvsection{\faBuilding}{工作经历}`
> 一起删），排版不会留下空洞。

---

#### `\cveducation` 教育背景

`\cveducation{ ... }` —— 键值接口，**全部键可选**。

| 键        | 含义     | 必填 | 说明                                           |
| --------- | -------- | ---- | ---------------------------------------------- |
| `date`    | 就读时间 | 否   | 左侧固定 3.5cm 宽的栏位                        |
| `school`  | 学校     | 否   | 加粗，与专业、学历用 ` · ` 自动连接            |
| `major`   | 专业     | 否   | 同上                                           |
| `degree`  | 学历     | 否   | 如 `本科` / `硕士`                             |
| `gpa`     | 补充信息 | 否   | **原样输出、命令不加前缀**，用来写 GPA、排名等 |
| `courses` | 主修课程 | 否   | 命令会**自动补「主修课程：」前缀**             |

```latex
\cveducation{
  date    = {2023.09 --- 2027.06},
  school  = {某某大学},
  major   = {某某专业},
  degree  = {本科},
  gpa     = {GPA:~x.xx~/~5.0 --- 专业排名前 xx\%},
  courses = {软件工程，数据库系统原理，数据结构，计算机网络，操作系统},
}
```

**说明：**

- `school` / `major` / `degree` 三者**缺谁跳过谁**，例如只写 `school` 就只显示学校名。
- 想恢复成整串手写、完全掌控连接符，只写 `school` 即可：
  `school = {某某大学~\midbullet~某某专业~\midbullet~本科}`
- `gpa` 和 `courses` 是**第二、三行**，两条都不写就只输出标题行，不会留下空行。
- 百分号在 LaTeX 里是注释符，必须转义写成 `\%`。

---

#### `\cvskillcategory` 专业技能

`\cvskillcategory{ ... }` —— 键值接口。

| 键        | 含义     | 必填           | 说明                                                   |
| --------- | -------- | -------------- | ------------------------------------------------------ |
| `name`    | 分类名称 | 否             | 加粗，命令**自动补「：」**；省略则只输出内容           |
| `content` | 分类内容 | ⚠️ **实质必填** | **为空时整条不输出** —— 只有名称没有内容的分类没有意义 |

```latex
\cvskillcategory{
  name    = {编程与脚本},
  content = {掌握 Python 及常用库，有 C\# 基础，能读懂代码，借助 AI 完成中高难度开发。},
}
\cvskillcategory{
  name    = {数据库与 SQL},
  content = {熟悉 Oracle 数据库，掌握 SQL 常用查询与多表关联，理解索引、事务等原理。},
}
```

**说明：**

- 分类条数不限，`\cvskillcategory` 想写几条写几条，按调用顺序依次排列。
- 不要自己写 `name = {编程与脚本：}`，末尾的冒号命令会补，写两个会变成「：：」。
- `#` 在 LaTeX 里是特殊字符（`C#` 要写 `C\#`），`%` 要写 `\%`，`&` 要写 `\&`，`_` 要写 `\_`。

---

#### `\cvhonor` 荣誉证书

`\cvhonor{ ... }` —— 键值接口，**全部键可选**。

| 键       | 含义            | 必填 | 说明                                   |
| -------- | --------------- | ---- | -------------------------------------- |
| `date`   | 获得时间        | 否   | 左侧固定 3.5cm 宽的栏位，小号字        |
| `award`  | 奖项 / 证书名称 | 否   | 加粗，右侧栏                           |
| `detail` | 详情            | 否   | 第二行，小号字；为空则**第二行不输出** |

```latex
\cvhonor{
  date  = {2025.06},
  award = {全国大学生英语六级(CET-6)},
}

\cvhonor{
  date   = {2025.12},
  award  = {全国计算机技术与软件专业技术资格证书~\midbullet~信息安全工程师},
  detail = {（可选）补充说明，例如证书编号或成绩},
}
```

**说明：** 每条 `\cvhonor` 就是一个独立条目，几条就调用几次。`detail` 大多数情况下用不上，
直接省略即可。

---

#### `\cvselfassessment` 自我评价

`\cvselfassessment{ ... }` —— **没有键值接口**，唯一的参数就是圆点列表本体。

```latex
\cvselfassessment
{
\item 解决问题： 遇到故障先复现定位，再查日志与文档找根因。
\item 沟通协作： 习惯把操作步骤整理成文档与人共享。
\item 抗压与责任心： 任务集中时按优先级列清单推进，交付前确认自测通过。
}
```

**说明：**

- 每项以 `\item` 开头，**不要**自己写 `\begin{itemize}`。
- 结构与 `\cvproject` 的 `duty` / `highlight` 完全一致（都走同一个圆点列表样式）。
- 它**不是**键值接口，所以不能写 `\cvselfassessment{ content = {...} }`。

---

#### `\addwatermark` 校徽水印

`\addwatermark[选项]{图片路径}{锚点}` —— 在**导言区**调用（`\begin{document}` 之前）。

| 参数         | 必填   | 说明                                                                      |
| ------------ | ------ | ------------------------------------------------------------------------- |
| `[选项]`     | 否     | TikZ node 选项，最常用的是 `opacity=0.09`；也可加 `rotate=45` 等          |
| `{图片路径}` | **是** | 相对**编译目录**的路径，如 `assets/badges/ecjtu.png`                      |
| `{锚点}`     | **是** | TikZ 锚点名：`center` / `north` / `south` / `north west` / `south east` … |

```latex
\addwatermark[opacity=0.09]{assets/badges/ecjtu.png}{center}
\addwatermark[opacity=0.06, rotate=30]{assets/badges/tsinghua.png}{north east}
```

**说明：**

- 图片宽度固定为 **0.7 倍页宽**，位置锚点是「页面」而非正文 —— 每页都会出现。
- 透明度建议 `0.03` ~ `0.15`：太低看不见，太高会把正文糊掉。
- 不想要水印就整行删掉，不影响其他任何排版。

---

#### `\midbullet` 行内圆点

`\midbullet` —— **无参数**，一个在多行文字里垂直居中的 `·`，用作文本内分隔符。

```latex
tech = {Python~\midbullet~Pandas~\midbullet~SQLite}
```

比直接敲 `·` 的字距更均匀，也不会因中英文字体差异而偏上或偏下。

---

### 🔧 内部命令（仅供版式定制）

以下命令由组件内部调用，一般**不需要**在 `main.tex` 里手写：

| 命令                                       | 由谁调用           | 作用                                  |
| ------------------------------------------ | ------------------ | ------------------------------------- |
| `\cvborderframe`                           | `resume-tzcan.cls` | 页面双矩形边框，已在文档类里调用一次  |
| `\cvbulletlist`                            | 各列表类组件       | 统一的圆点列表样式（左缩进 1.2em）    |
| `\infoitem`                                | `\cvpersonalinfo`  | 「图标 + 文字」原子组件，不可断行     |
| `\hrefmail` / `\hrefphone` / `\hrefgithub` | `\cvpersonalinfo`  | 生成可点击的邮箱 / 电话 / GitHub 链接 |
| `\cvprojectlabel` 等                       | 各经历类组件       | 条目标签（行内式 / 块式）             |

---

## 🎨 版式与配色定制

**`main.tex` 里不写任何版式。** 想调字号、页边距、配色、边框，去改对应的 `.sty` / `.cls`：

| 想改什么       | 改哪个文件                                 | 改哪个值                                                   |
| -------------- | ------------------------------------------ | ---------------------------------------------------------- |
| 字号 / 纸张    | `styles/resume-tzcan.cls`                  | `\LoadClass[11pt,a4paper]{article}`                        |
| 页边距         | `styles/resume-tzcan.cls`                  | `geometry` 的 `left` / `right` / `top` / `bottom`          |
| 整页纵向偏移   | `styles/resume-tzcan.cls`                  | `\AtBeginDocument{\vspace*{-1.5cm}}`                       |
| 主题配色       | `styles/components/tzcan-common.sty`       | `cvsection` `cvicon` `cvrule` `cvtext`                     |
| 边框粗细与空隙 | `styles/components/tzcan-border.sty`       | `\cvborderouterwidth` `\cvborderinnerwidth` `\cvbordergap` |
| 模块标题间距   | `styles/components/tzcan-section.sty`      | `\cvsectiontitlesep` `\cvsectionrulesep`                   |
| 照片位置       | `styles/components/tzcan-personalinfo.sty` | `\cvphotoright` `\cvphototop` `\cvlinegap`                 |
| 分隔线上下位置 | `styles/components/tzcan-personalinfo.sty` | `\cvhorizontallinesep`                                     |
| 圆点列表缩进   | `styles/components/tzcan-common.sty`       | `\cvbulletlist` 里的 `leftmargin`                          |

**主题配色**（`tzcan-common.sty`，全部是 HTML 十六进制色值）：

| 颜色变量    | 默认值           | 用途                 |
| ----------- | ---------------- | -------------------- |
| `cvsection` | `#2C3E50` 深蓝灰 | 模块标题文字         |
| `cvicon`    | `#2980B9` 亮蓝   | 标题图标、信息栏图标 |
| `cvrule`    | `#BDC3C7` 浅灰   | 分割线、下划线       |
| `cvtext`    | `#333333` 深灰   | 全局正文颜色         |

```latex
% 想换成一套更暖的配色，改这四行即可
\definecolor{cvsection}{HTML}{8B4513}
\definecolor{cvicon}{HTML}{D2691E}
\definecolor{cvrule}{HTML}{DEB887}
\definecolor{cvtext}{HTML}{333333}
```

> [!WARNING]
> **改动前先读源码注释。** 页边距、照片位置、分隔线位置三者互相咬合 ——
> `\cvphotoright`（照片距页右缘）必须与 `geometry` 的左右页边距保持一致，
> 否则分割线右端就对不上照片右边界。相关约束在 `.cls` 和 `tzcan-personalinfo.sty`
> 的注释里都写清楚了。

---

## 📁 目录结构

```
src/templates/tzcan/
├── .latexmkrc                      # latexmk 配置：XeLaTeX 引擎、输出到 build/
├── main.tex                        # 👈 你唯一需要改的文件：简历内容
├── USAGE.md                        # 本文件
├── assets/
│   ├── badges/                     # 校徽（水印）
│   │   ├── ecjtu.png
│   │   └── tsinghua.png
│   └── images/
│       └── person.png              # 证件照
├── build/                          # 编译产物，main.pdf 在这里（已被 .gitignore 忽略）
└── styles/
    ├── resume-tzcan.cls            # 文档类：字号 / 纸张 / 页边距 / 全局设置
    └── components/                 # 12 个组件，全部由 .cls 导出
        ├── tzcan-common.sty            # 底座：主题色 / \midbullet / \cvbulletlist
        ├── tzcan-watermark.sty         # \addwatermark
        ├── tzcan-border.sty            # \cvborderframe
        ├── tzcan-section.sty           # \cvsection
        ├── tzcan-personalinfo.sty      # \cvname \cvpersonalinfo \cvphototopright \cvhorizontalline
        ├── tzcan-education.sty         # \cveducation
        ├── tzcan-honor.sty             # \cvhonor
        ├── tzcan-skill.sty             # \cvskillcategory
        ├── tzcan-project.sty           # \cvproject
        ├── tzcan-internship.sty        # \cvinternship
        ├── tzcan-workship.sty          # \cvwork
        └── tzcan-selfassessment.sty    # \cvselfassessment
```

**设计原则：** `main.tex` 只管内容，`styles/` 只管版式。
新增模块时按 `tzcan-*.sty` 命名放进 `components/`，再在 `resume-tzcan.cls` 里用
`\RequirePackage{styles/components/tzcan-xxx}` 导出一次，`main.tex` 即可直接调用。

---

## ❓ 常见问题

<details>
<summary><b>Q：在 Overleaf 上编译失败，或报找不到 <code>styles/resume-tzcan.cls</code>？</b></summary>

按顺序检查三件事：

1. **编译器是不是 XeLaTeX** —— `Menu` → `Compiler` 里改，Overleaf 默认的 pdfLaTeX 编不出中文。
2. **文件层级对不对** —— 项目根目录必须直接看到 `main.tex`、`styles/`、`assets/`，
   不能套在 `tzcan/` 文件夹里（相对路径会因为多一层而失效）。
3. **首次编译慢 / 超时** —— 预热中文字体要时间，免费账号有编译时长上限，再点一次 `Recompile` 通常就过了。

另外，Overleaf 用自己的输出目录，`.latexmkrc` 里的 `$out_dir = 'build'` 在那边不生效，
这是正常现象 —— PDF 直接点右上角 `Download PDF` 拿。

</details>

<details>
<summary><b>Q：用 Docker 编译时拉不动镜像，报 <code>i/o timeout</code>？</b></summary>

Docker Hub 在国内直连大概率超时，处理办法见 [拉不下镜像？](#拉不下镜像)：已经配了镜像加速器就
继续用官方的 `texlive/texlive`，没配就换成作者同步的 `ghcr.io/tellcts/texlive:latest`。

顺带一提，Docker 编出来的中文会比本机版「略有不同」：容器里没有你系统的中文字体，`ctex` 会自动
退回 TeX Live 自带的 Fandol（方正）字体族，加粗标题的观感和个别行的折行位置都可能有出入。
要完全一致的定稿，请用 [方式一](#方式一本地安装-tex-live) 在装好 TeX Live 的本机编一次。

</details>

<details>
<summary><b>Q：编译报 <code>File not found</code> / 图片显示不出来？</b></summary>

图片路径解析的是**编译进程的当前目录（cwd）**，不是 `main.tex` 所在目录。两个检查点：

1. 是否在 `src/templates/tzcan/` 目录下执行的 `latexmk`？
2. 路径是否写全 —— `assets/badges/ecjtu.png` 而不是 `ecjtu.png`？

</details>

<details>
<summary><b>Q：图标显示成空白方块 / 缺字？</b></summary>

缺少 `fontawesome5` 或字体文件。补装：

```bash
tlmgr install fontawesome5
```

若仍不行，说明 TeX Live 装的是精简版，字体文件不齐 —— 补装 `texlive-fonts-extra`，
或直接用完整（`full`）方案重装。Linux 下还需确认 `xetex` 能访问系统字体：

```bash
fc-cache -fv
```

</details>

<details>
<summary><b>Q：中文显示不出来，或者报 <code>ctex</code> 相关错误？</b></summary>

本项目**必须用 XeLaTeX 编译**，`pdflatex` 出不来中文。检查两点：

1. `.latexmkrc` 里的 `$pdf_mode = 5` 是否被改过（`5` 就是 XeLaTeX，别动它）。
2. 你是否手动跑了 `pdflatex` 或 `xelatex` 而不是 `latexmk` —— 请统一用 `latexmk main.tex`。

</details>

<details>
<summary><b>Q：整页内容纵向位置不对 / 整体偏下？</b></summary>

第一嫌疑是 `styles/resume-tzcan.cls` 里的这一行，它用来把首行上移到与照片顶部对齐：

```latex
\AtBeginDocument{\vspace*{-1.5cm}}
```

调整它的数值（越负越靠上）。改完记得检查底部内容有没有压到内边框。

</details>

<details>
<summary><b>Q：某条 <code>\item</code> 莫名其妙折行了？</b></summary>

`\small`(10pt) 下每条可用行宽约 **50 个汉字**，加上行首「标签：」后，
单条控制在 **46 字以内**才能稳定单行显示。超了就精简措辞，或者接受折行
（折行本身不影响美观，只是行数变多）。

</details>

<details>
<summary><b>Q：照片压住了页面边框？</b></summary>

改 `styles/components/tzcan-personalinfo.sty` 里的 `\cvphototop`（照片距页顶距离，默认 `0.65cm`），
把它调大一点让照片往下走。注意它不能小于内框线带的厚度，否则一定重叠。

</details>

<details>
<summary><b>Q：改了 <code>main.tex</code> 但 PDF 没变化？</b></summary>

多半是 `build/` 里的缓存。清理后重编：

```bash
latexmk -C main.tex && latexmk main.tex
```

</details>

<details>
<summary><b>Q：编译报错，但不知道错在哪？</b></summary>

打开 **`build/main.log`**，从后往前找第一个 `!` 开头的行 —— 那才是真正的错误，
它后面的行号指向 `main.tex` 或某个 `.sty`。报错带文件名行号是因为 `.latexmkrc` 里开了
`$file_line_error = 1`。

</details>

<details>
<summary><b>Q：页面底部的文字压到内边框上了？</b></summary>

`resume-tzcan.cls` 里 `geometry` 的 `bottom=1.0cm` 决定了正文区下边界。
内容太长时，要么精简内容，要么调大 `bottom`（但正文本身不会自动下移，
只有当内容真的用满新空间时底部留白才会变小）。

</details>

<details>
<summary><b>Q：<code>\cvsection</code> 的标题间距想更紧一点？</b></summary>

改 `styles/components/tzcan-section.sty` 里的两个长度：
`\cvsectiontitlesep`（标题 ↔ 分割线，默认 `1.2ex`）和 `\cvsectionrulesep`（分割线 ↔ 正文，默认 `1ex`）。
可以填负值。参考：`0.6ex` 偏挤。

</details>

---

<div align="center">

**🎉 祝你拿到心仪的 Offer！**

没有解决你的问题？欢迎提 [Issue](https://github.com/tellcts/resumes-CV/issues)，
或回到[根目录 README](../../../README.md) 查看项目整体介绍。

</div>
