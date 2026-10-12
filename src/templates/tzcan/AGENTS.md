# 项目背景
1. 项目采用`TexLive`制作简历模板

# 目录结构
1. `./latexmkrc`作为`latexmk`命令的配置文件，自定义编译行为。
2. `./main.tex`作为编写简历内容的主文件，通过`latexmk main.tex`命令进行编译生成。
3. `./assets/badges/`用于存放校徽图片；`./assets/images/`用于存放个人证件照等。
4. `./styles/components/`存放各类简历模板组件。
5. `./styles/resume-tzcan.cls`作为文档类控制简历的总体结构，并作为导出包提供`./styles/components/`中的所有组件

# 组件生成
1. 项目LaTeX发行版采用`TexLive-2026`，注意语法的版本兼容性。
2. 生成的新组件文件名称统一用`tzcan-*.sty`格式来命名，放在`./styles/components/`目录下，在`./styles/resume-tzcan.cls`通过`\RequirePackage`命令导出。
3. 组件对外提供的接口尽量保持为键值对接口，如果你不确定模块内容结构是否适用键值对接口，请询问用户的意见。
4. 对于被多个组件同时依赖的组件，不要创建新的组件文件，直接在`./styles/components/tzcan-common.sty`追加。
5. 新的命令使用`\newcommand`封装。

# 简历编译
1. 你全程不用执行`latexmk main.tex`命令，全程由用户手动执行编译。
