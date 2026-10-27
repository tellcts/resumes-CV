<div align="center">

# 📄 resumes-CV · tzcan 模板

</div>

这个模板只需要编辑 `main.tex` 填写内容，排版由 `styles/` 提供。修改姓名、经历或技能不会打乱整体版式。

## 快速上手

1. 用 `assets/images/person.png` 覆盖模板证件照；需要水印时替换 `assets/badges/` 中的校徽。
2. 编辑 `main.tex`，用真实内容替换示例。
3. 选择 Overleaf、本地 TeX Live 或 Docker 编译。

本地和 Docker 的编译产物都是 `build/main.pdf`；Overleaf 直接点击 `Download PDF`。

## 获取模板

```bash
git clone https://github.com/tellcts/resumes-CV.git
cd resumes-CV/src/templates/tzcan
```

也可以从 [Releases](https://github.com/tellcts/resumes-CV/releases) 下载 `Resume.Template.tzcan-*.zip`。

## 🚀 选择编译方式

| 方式 | 优点 | 注意 |
| --- | --- | --- |
| **Overleaf** | 零安装，浏览器内编辑和编译 | 个人资料会上传到云端 |
| **本地 TeX Live** | 数据和产物都在本机，适合长期修改 | 需要安装完整环境 |
| **Docker** | 不需要安装 TeX Live | 首次拉取镜像约 2.5 GB |

三种方式生成的内容相同。模板固定使用 TeX Live 自带的 Fandol（中文）和 Latin Modern（西文）字体，不再依赖操作系统字体，因此不同平台的字体来源一致。

### 首选 Overleaf 在线编译

1. 将 `src/templates/tzcan/` 压成 ZIP，或使用 Release 中的模板压缩包。
2. 登录 <https://www.overleaf.com>，选择 `New Project → Upload Project`。
3. 确认项目根目录直接包含 `main.tex`、`assets/` 和 `styles/`。
4. 打开 `Menu → Compiler`，选择 **XeLaTeX**。
5. 修改 `main.tex`，重新编译并下载 PDF。

> [!WARNING]
> 项目根目录不能多套一层 `tzcan/` 文件夹，否则 `styles/resume-tzcan.cls` 的相对路径会失效。
>
> Overleaf 默认使用 pdfLaTeX，必须手动切换为 XeLaTeX，否则中文无法正常编译。

> [!CAUTION]
> 使用 Overleaf 时，姓名、电话、邮箱和证件照都会保存在第三方服务器。介意隐私请选择本地 TeX Live 或 Docker。

Overleaf 会自行管理输出目录，不需要寻找 `build/main.pdf`，直接下载预览面板中的 PDF 即可。

### 方式一：本地安装 TeX Live

需要 **TeX Live 2026**、**XeLaTeX** 和 `latexmk`。进入模板目录后执行：

```bash
cd src/templates/tzcan
latexmk main.tex          # 单次编译
latexmk -pvc main.tex     # 保存后自动编译
```

> [!WARNING]
> 必须在 `src/templates/tzcan/` 目录下编译；图片路径也相对这个目录解析。

> [!IMPORTANT]
> 安装 TeX Live 时，请在 `Advanced` 中把默认纸张设为 A4。

缺少宏包时不必重装整个 TeX Live，例如：

```bash
tlmgr install fontawesome7
```

### 方式二：Docker 容器编译

先启动 Docker，然后在模板目录执行对应脚本：

```powershell
# Windows PowerShell
.\scripts\docker-build.ps1
```

```bash
# macOS / Linux
./scripts/docker-build.sh
```

默认镜像为 `ghcr.io/tellcts/texlive:latest`。如果下载速度较慢，可将 `scripts/docker-build.ps1` 和 `scripts/docker-build.sh` 中的镜像地址替换为速度更快的兼容镜像。

首次运行会下载镜像，之后会复用镜像。编译缓存异常时，删除模板目录下的 `build/` 后重新执行脚本。

## 修改简历内容

`main.tex` 的推荐结构如下：

```latex
\documentclass{styles/resume-tzcan}

\addwatermark[opacity=0.09]{assets/badges/ecjtu.png}{center}

\begin{document}
\cvname{张~三}
\cvpersonalinfo{
  phone = {+86 188--8888--8888},
  email = {you@example.com},
  link  = {https://github.com/your-name | GitHub},
}
\cvphototopright[2.5cm]{assets/images/person.png}

\cvsection{\faLaptopCode}{项目经历}
\cvproject{
  name = {项目名称},
  date = {2026.06 --- 2026.08},
  duty = {
  \item 负责内容：用一句话说明工作与结果。
  },
}

\end{document}
```

### 通用写法

- 键值统一写成 `键 = {值}`，例如 `name = {项目名称}`。
- 未填写的可选键不会显示，也不会留下标签或多余分隔符。
- 列表直接写 `\item`，不要再套一层 `\begin{itemize}`。
- 图片路径相对模板目录，例如 `assets/images/person.png`。
- 特殊字符需要转义：`#` 写成 `\#`，`%` 写成 `\%`，`&` 写成 `\&`，`_` 写成 `\_`。
- 要让列表项单行显示，连同行首标签尽量控制在 46 个汉字以内。

## 素材替换

| 素材 | 位置 | 建议 |
| --- | --- | --- |
| 证件照 | `assets/images/person.png` | 竖版一寸照，比例约 5:7 |
| 校徽水印 | `assets/badges/*.png` | 透明背景 PNG，正方形 |

保持文件名不变并直接覆盖原文件，`main.tex` 无需修改。

### 证件照

```latex
\cvphototopright[2.5cm]{assets/images/person.png}
\cvhorizontalline
```

`\cvphototopright` 将照片固定在右上角，宽度默认 `2.5cm`，修改宽度后分隔线会自动适配。`\cvhorizontalline` 必须放在照片命令之后；不使用照片时可以删掉照片命令，分隔线仍能正常显示。

需要把照片插入正文流时，可改用 `\cvphoto[2.5cm]{图片路径}`。

### 校徽水印

```latex
\addwatermark[opacity=0.09]{assets/badges/ecjtu.png}{center}
```

第一个参数可控制透明度和旋转，第二个参数可改为 `north`、`south`、`north west` 等 TikZ 锚点。透明度建议在 `0.03` 到 `0.15` 之间。不需要水印时删除整行。

### 行内分隔符

```latex
tech = {Python~\midbullet~Pandas~\midbullet~SQLite}
```

`\midbullet` 比直接输入 `·` 更整齐，适合技术栈、证书名称等行内分隔。

## 组件参考

| 命令 | 用途 | 必填情况 |
| --- | --- | --- |
| `\cvsection` | 章节标题 | 图标和标题都必填；加 `*` 可省略下划线 |
| `\cvname` | 姓名 | 必填 |
| `\cvpersonalinfo` | 个人信息栏 | 全部可选 |
| `\cvphototopright` / `\cvphoto` | 证件照 | 图片路径必填 |
| `\cvhorizontalline` | 信息区分隔线 | 无参数 |
| `\cvproject` | 项目经历 | 全部可选 |
| `\cvinternship` | 实习经历 | 全部可选 |
| `\cvwork` | 工作经历 | 全部可选 |
| `\cveducation` | 教育背景 | 全部可选 |
| `\cvskillcategory` | 技能分类 | `content` 实际必填 |
| `\cvhonor` | 荣誉证书 | 全部可选 |
| `\cvselfassessment` | 自我评价 | 至少写一个 `\item` |
| `\addwatermark` | 校徽水印 | 图片路径和锚点必填 |

### `\cvsection` 章节标题

```latex
\cvsection{\faLaptopCode}{项目经历}
```

默认在标题下方绘制分隔线。若不需要分隔线，在命令后加 `*`：

```latex
\cvsection*{\faLaptopCode}{项目经历}
```

常用图标：

| 用途 | 命令 | 用途 | 命令 |
| --- | --- | --- | --- |
| 项目 | `\faLaptopCode` | 实习 | `\faBriefcase` |
| 教育 | `\faGraduationCap` | 技能 | `\faGear` |
| 荣誉 | `\faAward` | 自我评价 | `\faCircleUser` |
| 工作 | `\faBuilding` | 其他 | `\faRocket` |

更多图标见 [Font Awesome Free](https://fontawesome.com/search?m=free)。

### `\cvname` 姓名

```latex
\cvname{张~三}
```

`~` 是不换行空格，可让两个字的姓名在视觉上更舒展。

### `\cvpersonalinfo` 个人信息栏

```latex
\cvpersonalinfo{
  phone    = {+86 188--8888--8888},
  email    = {you@example.com},
  link     = {https://github.com/your-name | GitHub},
  age      = {21岁},
  gender   = {男},
  identity = {应届生 | 硕士在读},
  target   = {数字化工程师},
}
```

| 键 | 含义 | 说明 |
| --- | --- | --- |
| `phone` | 电话 | 自动生成可点击的 `tel:` 链接 |
| `email` | 邮箱 | 自动生成可点击的 `mailto:` 链接 |
| `link` | 主页 | 写法为 `{URL \| 显示文字}`，显示文字可省略 |
| `age` | 年龄 | 原样显示 |
| `gender` | 性别 | 原样显示 |
| `identity` | 身份 | 可用 `\|` 分隔多个身份 |
| `target` | 求职目标 | 原样显示 |

第一行显示 `phone`、`email`，第二行显示其余字段。`link` 会自动识别 GitHub、Gitee 和 GitLab 图标，其他网址使用通用主页图标。

### `\cvproject` 项目经历

```latex
\cvproject{
  name = {制造产线品质数据可视化分析},
  date = {2026.06 --- 2026.08},
  link = {https://github.com/your-name/your-project},
  intro = {项目解决的问题、主要方法和最终成果。},
  tech = {Python~\midbullet~Pandas~\midbullet~SQLite},
  duty = {
  \item 数据建模：设计数据库结构，定义质量判定阈值。
  \item 分析展示：完成良率统计并输出可视化报告。
  },
  highlight = {
  \item 交付结果：一条命令完成数据分析和报告生成。
  },
}
```

| 键 | 含义 | 显示方式 |
| --- | --- | --- |
| `name` | 项目名称 | 标题行左侧，加粗 |
| `link` | 项目链接 | 标题行中间，可点击 |
| `date` | 项目时间 | 标题行右侧 |
| `intro` | 项目介绍 | 「项目介绍：」+ 正文 |
| `tech` | 技术栈 | 「技术栈：」+ 正文 |
| `duty` | 个人职责 | 块式标签 + 圆点列表 |
| `highlight` | 项目亮点 | 块式标签 + 圆点列表 |

显示顺序固定为：标题行 → 项目介绍 → 技术栈 → 个人职责 → 项目亮点。连续填写多个 `\cvproject` 时，相邻项目之间会自动绘制与章节标题下划线同粗的分隔线，并在上下两段内容之间居中。

### `\cvinternship` 实习经历

```latex
\cvinternship{
  position = {运维开发实习生},
  company  = {某某信息技术有限公司},
  date     = {2026.07 --- 2026.09},
  duty = {
  \item 设备巡检：按计划巡检终端与服务器，记录并上报隐患。
  },
  achievement = {
  \item 效率提升：日常巡检由 20 分钟缩短到 2 分钟。
  },
}
```

| 键 | 含义 | 显示方式 |
| --- | --- | --- |
| `position` | 职位 | 标题行左侧，加粗 |
| `company` | 公司 | 标题行中间，加粗 |
| `date` | 时间 | 标题行右侧 |
| `duty` | 岗位职责 | 块式标签 + 圆点列表 |
| `achievement` | 产出成果 | 块式标签 + 圆点列表 |

连续填写多个 `\cvinternship` 时，相邻实习经历之间会自动绘制分隔线。

### `\cvwork` 工作经历

字段和写法与 `\cvinternship` 一致，只改变命令名和章节标题：

```latex
\cvsection{\faBuilding}{工作经历}
\cvwork{
  position = {系统运维工程师},
  company  = {某某科技有限公司},
  date     = {2026.10 --- 2027.06},
  duty = {
  \item 日常运维：负责服务器与办公终端的巡检和维护。
  },
  achievement = {
  \item 监控覆盖：监控覆盖率由 60\% 提升到 95\%。
  },
}
```

连续填写多个 `\cvwork` 时，相邻工作经历之间会自动绘制分隔线；样式与项目、实习经历保持一致。没有正式工作经历时，可以把章节标题和 `\cvwork` 整段删除。

### `\cveducation` 教育背景

```latex
\cveducation{
  date    = {2023.09 --- 2027.06},
  school  = {某某大学},
  major   = {某某专业},
  degree  = {本科},
  rank    = {前20\%（GPA:~4.0~/~5.0）},
  courses = {软件工程，数据库系统原理，数据结构，计算机网络},
}
```

| 键 | 含义 | 说明 |
| --- | --- | --- |
| `date` | 就读时间 | 标题行右侧，右对齐 |
| `school` | 学校 | 标题行左侧，加粗 |
| `major` | 专业 | 可省略 |
| `degree` | 学历 | 如「本科」「硕士」 |
| `rank` | 排名或绩点 | 自动补常规字重的「专业排名：」 |
| `courses` | 主修课程 | 自动补常规字重的「主修课程：」 |

学校位于标题行左侧，专业与学历自动连接后居中，日期位于同一行右端。缺少哪项就跳过哪项；专业排名与主修课程等内容从左侧开始对齐。

### `\cvskillcategory` 专业技能

```latex
\cvskillcategory{
  name    = {编程与脚本},
  content = {掌握 Python 及常用库，有 C\# 基础。},
}
```

`name` 可以省略，`content` 为空时整条不会显示。`name` 后会自动补冒号，不要在值里重复填写。

### `\cvhonor` 荣誉证书

```latex
\cvhonor{
  date   = {2025.12},
  award  = {全国计算机技术与软件专业技术资格证书~\midbullet~信息安全工程师},
}
```

每条 `\cvhonor` 会在 `award` 前自动添加“1.”“2.”等序号。`award` 在标题行左侧，`date` 在标题行右侧并右对齐。

### `\cvselfassessment` 自我评价

```latex
\cvselfassessment
{
\item 解决问题：先复现定位，再查日志与文档寻找根因。
\item 沟通协作：把操作步骤整理成文档并及时共享。
\item 抗压能力：按优先级拆分任务，交付前完成自测。
}
```

这个命令不接受键值对，直接传入 `\item` 列表。

## 版式与配色

只修改内容时不需要打开 `styles/`。需要调整版式时，可参考下面的位置：

| 目标 | 文件 | 主要配置 |
| --- | --- | --- |
| 字号、纸张、页边距 | `styles/resume-tzcan.cls` | `\LoadClass`、`geometry` |
| 字体 | `styles/resume-tzcan.cls` | `ctex` 的 `fontset=fandol` |
| 主题颜色 | `styles/components/tzcan-common.sty` | `cvsection`、`cvicon`、`cvrule`、`cvtext` |
| 边框粗细与间距 | `styles/components/tzcan-border.sty` | `\cvborderouterwidth`、`\cvborderinnerwidth`、`\cvbordergap` |
| 章节标题间距 | `styles/components/tzcan-section.sty` | `\cvsectiontitlesep`、`\cvsectionrulesep` |
| 照片与分隔线位置 | `styles/components/tzcan-personalinfo.sty` | `\cvphototop`、`\cvphotoright`、`\cvlinegap` |
| 列表缩进 | `styles/components/tzcan-common.sty` | `\cvbulletlist` 的 `leftmargin` |

中文固定使用 TeX Live 自带的 Fandol 字体，西文和数学字体沿用 TeX Live 的 Latin Modern。模板不读取系统字体，因此无需额外安装宋体、黑体或中易字库。

主题颜色使用 HTML 十六进制值，例如：

```latex
\definecolor{cvsection}{HTML}{2C3E50}
\definecolor{cvicon}{HTML}{2980B9}
\definecolor{cvrule}{HTML}{BDC3C7}
\definecolor{cvtext}{HTML}{333333}
```

修改页边距或照片位置时，需要同时检查 `geometry` 和 `tzcan-personalinfo.sty` 中的相关数值，避免分隔线与照片错位。

## 目录结构

```text
src/templates/tzcan/
├── main.tex                # 简历内容
├── assets/                 # 证件照与校徽
├── scripts/                # Docker 编译脚本
├── build/                  # 编译产物
└── styles/                 # 文档类与组件
```

日常使用时只需要修改 `main.tex` 和 `assets/`。

## 常见问题

| 问题 | 检查方法 |
| --- | --- |
| Overleaf 找不到 `styles/resume-tzcan.cls` | 确认 `main.tex`、`styles/`、`assets/` 位于项目根目录 |
| 中文无法显示或 `ctex` 报错 | 编译器必须选择 XeLaTeX，并使用 `latexmk main.tex` |
| 提示找不到 Fandol 字体 | 使用完整安装的 TeX Live 2026，或执行 `tlmgr install fandol` |
| 图片找不到 | 在模板目录编译，路径写成 `assets/images/person.png` 或 `assets/badges/xxx.png` |
| 图标显示为方块 | 执行 `tlmgr install fontawesome7` |
| 修改后 PDF 没变化 | 本地执行 `latexmk -C main.tex`；其他方式删除 `build/` 后重编 |
| 不知道具体报错位置 | 打开 `build/main.log`，从后往前找到第一个以 `!` 开头的错误 |
| 列表意外折行 | 精简文字，让每条列表连同行首标签不超过 46 个汉字 |
| 页面内容压到边框 | 精简内容或调整 `resume-tzcan.cls` 中的 `geometry` 下边距 |

更多问题可提交 [Issue](https://github.com/tellcts/resumes-CV/issues)。
