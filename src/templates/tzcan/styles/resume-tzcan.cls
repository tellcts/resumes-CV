% ============================================================
% resume-tzcan.cls —— 个人简历文档类
% ============================================================
% 本类不接受任何类选项，字号 11pt、纸张 A4、页边距等一律写死在下面。
% 理由：这些值与「照片 xshift」「边框几何」「分割线与照片右边界对齐」互相咬合，
% 拆成可调选项等于把耦合关系暴露给使用者，容易一改就错位。
% 要改版式请直接改本文件里的值，并同步检查 components/tzcan-personalinfo.sty
% 里 \cvphototopright 的 xshift。
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume-tzcan}[2026/10/12 Created by Tzcan]

% 本类零选项：收到任何选项只报警告，不改行为。
\DeclareOption*{\ClassWarning{resume-tzcan}{本类不接受选项，已忽略 \CurrentOption}}
\ProcessOptions\relax

% 基础类。字号与纸张在这里定死，不接受使用者覆盖。
\LoadClass[11pt,a4paper]{article}

% ============================================================
% 一、第三方宏包
% ============================================================
\RequirePackage{graphicx}   % 必备，支持 PNG/PDF/JPG
\RequirePackage{eso-pic}    % 用于添加背景
\RequirePackage{tikz}       % 方便控制位置和透明度（也可直接用 eso-pic 的 \put）

% --- 字体图标 ---
\RequirePackage{fontawesome5}

% --- 颜色 ---
\RequirePackage{xcolor}

% --- 布局工具 ---
\RequirePackage{calc}
\RequirePackage{tabularx}
\RequirePackage{setspace}
\RequirePackage{enumitem}
\RequirePackage{ifthen}

% expl3：各组件键值接口依赖它（\keys_define:nn、\__cv_* 工具）
\RequirePackage{expl3}

% hyperref 保持在整个第三方包加载的最后
\RequirePackage[colorlinks=false, pdfborder={0 0 0}]{hyperref}

% ============================================================
% 二、自有组件
% ============================================================
% tzcan-common 必须最先：它提供四个主题色、\midbullet、两个 expl3 工具
% 与 \cvbulletlist，其余 11 个组件全部依赖它。
% 其余组件彼此无依赖，顺序可调。

\RequirePackage{styles/components/tzcan-common}          % 底座：颜色 / 工具 / 圆点列表
\RequirePackage{styles/components/tzcan-watermark}       % \addwatermark
\RequirePackage{styles/components/tzcan-border}          % \cvborderframe
\RequirePackage{styles/components/tzcan-section}         % \cvsection
\RequirePackage{styles/components/tzcan-personalinfo}    % 个人信息区：\cvname \cvpersonalinfo \cvphototopright \cvhorizontalline
\RequirePackage{styles/components/tzcan-education}       % \cveducation
\RequirePackage{styles/components/tzcan-honor}           % \cvhonor
\RequirePackage{styles/components/tzcan-skill}           % \cvskillcategory
\RequirePackage{styles/components/tzcan-project}         % \cvproject
\RequirePackage{styles/components/tzcan-internship}      % \cvinternship
\RequirePackage{styles/components/tzcan-workship}        % \cvwork
\RequirePackage{styles/components/tzcan-selfassessment}  % \cvselfassessment

% ============================================================
% 三、文档级设置
% ============================================================
% 禁止页眉页脚以及页码
\pagestyle{empty}

% 左右页边距 1.5cm，与右上角照片的 xshift=-1.5cm 对齐：
%   · 所有分割线（\rule{\textwidth}）的右端正好落在证件照右边界上；
%   · 左右边距相等 ⇒ 正文与分割线都保持居中；
%   · 正文行宽 = 分割线长度（18cm），各模块内容与分割线左右两端都对齐。
% 注意：改动这里的数值时，要同步改 components/tzcan-personalinfo.sty 里
% \cvphototopright 的 xshift。
% bottom 说明：内框线带在距页底 0.475–0.625cm，所以正文区下边界低于约 0.8cm
% 时，最后一行就有压到内框的风险。当前 1.0cm ⇒ 下边界 28.70cm，距内框内沿
% 约 0.37cm。注意：调小 bottom 只是「允许正文往下排」，正文本身不会自动下移；
% 只有当内容长到用满新空间时，底部留白才会真的变小。
\RequirePackage[
  left=1.5cm, right=1.5cm, top=2.0cm, bottom=1.0cm
]{geometry}

% 中文支持。
\RequirePackage{ctex}

% 添加双矩形边框包裹（几何旋钮见 components/tzcan-border.sty）
\cvborderframe

% 压掉 article 默认上边距的一部分，让首行上移到与照片顶部对齐的位置。
% 这是版式调整而非内容，故随文档类一起管理。
% 用 \AtBeginDocument 承载，执行时机等同于「正文第一行」；
% 若编译后发现整页纵向位置不对，第一嫌疑就是这一行。
\AtBeginDocument{\vspace*{-1.5cm}}

% ============================================================
% 文件结束
% ============================================================
