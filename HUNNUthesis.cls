\NeedsTeXFormat{LaTeX2e}[2019/12/30]
\ProvidesClass{HUNNUthesis}[2019/12/30 V1.0 Thesis for HUNNUer]
\LoadClass[a4paper,twoside,openright,UTF8]{ctexbook}
%=======空格
\newcommand\HUNNUspace{\phantom{永}}
\@ifclasslater{ctexbook}{2011/03/13}
{
	\ctexset{
		% 图和表目录的间距选项是在\chapter命令内部写入.lof/.lot 文件的
		% 所以属于章节样式的一部分。ctex 宏集提供了现成的选项默认值都是是:10pt
		contentsname={目\HUNNUspace 录},
		chapter/lofskip=0pt,
		chapter/lotskip=0pt
	}
}
{
	\def\CTEX@contentsname{目\HUNNUspace 录}
}
%%=======论文页边距一般要求：上边距2.54cm、下边距2.54cm,左右边距3.00cm,页眉1.50cm,页脚1.75cm
\RequirePackage[top=2.54cm, bottom=2.54cm, outer=3.00cm, inner=3.00cm, headheight=1.5cm, footskip=1.75cm, heightrounded]{geometry}
\RequirePackage[numbers,sort&compress]{natbib}%连续参考文献连接起来
\RequirePackage{amsmath,amsfonts,amssymb}
\RequirePackage{graphicx}
\RequirePackage{subfigure}
\RequirePackage{mathptmx}%Times New Roman字体
\RequirePackage{float}%控制图片浮动位置
\RequirePackage[T1]{fontenc}
\RequirePackage{booktabs}
\RequirePackage{setspace}
\RequirePackage{listings}
\RequirePackage{xcolor}
\RequirePackage{multirow}
\RequirePackage{fancyhdr}%Needed to define custom headers/footers
\RequirePackage{etoolbox}
\RequirePackage[titles,subfigure]{tocloft}%控制生成的表格和图片的目录格式
\RequirePackage{array}
\RequirePackage{makecell}
\RequirePackage{forloop}
\RequirePackage{xstring}
\RequirePackage[unicode,psdextra]{hyperref}%Required for hyperlinks
\RequirePackage[nameinlink]{cleveref}
\RequirePackage{algorithm}
\RequirePackage{algorithmic}
\RequirePackage{caption}
\RequirePackage{ifthen}
\RequirePackage{titlesec}
\RequirePackage{ulem}
\RequirePackage{wasysym}
\RequirePackage{flafter}                        % 使得所有浮动体不能被放置在其浮动环境之前，以免浮动体在引述它的文本之前出现.
\RequirePackage{booktabs}                       % 表格，横的粗线；\specialrule{1pt}{0pt}{0pt}
\RequirePackage{longtable}                      % 支持跨页的表格。
\RequirePackage{tabularx}                       % 自动设置表格的列宽
\RequirePackage{setspace}
\RequirePackage{subfigure}                      % 支持子图 %centerlast 设置最后一行是否居中
\RequirePackage{enumitem}                       % 使用enumitem宏包,改变列表项的格式
\RequirePackage{calc}                           % 长度可以用+ - * / 进行计算
\RequirePackage{txfonts}                        % 字体宏包
\RequirePackage{bm}                             % 处理数学公式中的黑斜体的宏包
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}  % 定理类环境宏包，其中 amsmath 选项用来兼容 AMS LaTeX 的宏包
\RequirePackage{fancyvrb }
\RequirePackage{xcolor}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 封面信息页信息
\newcommand*{\titlecn}[1]{\gdef\@titlecn{#1}}                           % 中文标题
\newcommand*{\titleen}[1]{\gdef\@titleen{#1}}                           % 英文标题
\newcommand*{\titlehead}[1]{\gdef\@titlehead{#1}}                      % 页眉标题
\newcommand*{\priormajor}[1]{\gdef\@priormajor{#1}}                    % 学科专业
\newcommand*{\interestmajor}[1]{\gdef\@interestmajor{#1}}             % 研究方向
\newcommand*{\supervisor}[1]{\gdef\@supervisor{#1}}                    % 导师
\newcommand*{\studentid}[1]{\gdef\@studentid{#1}}                      % 学号
\newcommand*{\csecret}[1]{\gdef\@csecret{#1}}                           % 密级
\newcommand*{\clcnumber}[1]{\gdef\@clcnumber{#1}}                      % 分类号
\newcommand*{\schoolcode}[1]{\gdef\@schoolcode{#1}}                    % 学校代码
\newcommand*{\thesisdate}[1]{\gdef\@thesisdate{#1}}                    % 论文日期
\newcommand*{\thesisid}[1]{\gdef\@thesisid{#1}}                       % 论文编号
\newcommand*{\headtype}[1]{\gdef\@headtype{#1}}                       % 论文类型
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\upcite}[1]{{\setcitestyle{square,super}\cite{#1}}}%参考文献上标
\newcounter{pubctr} % 自定义新计数器
\newenvironment{publist}{%%%%% 定义新环境
  \begin{list}{[\arabic{pubctr}]} %% 标签格式
    {
    \usecounter{pubctr}
    \setlength{\leftmargin}{2em}     % 左边界 \leftmargin =\itemindent + \labelwidth + \labelsep
    \setlength{\itemindent}{0em}     % 标号缩进量
          \setlength{\labelsep}{1em}       % 标号和列表项之间的距离,默认0.5em
          \setlength{\rightmargin}{0em}    % 右边界
          \setlength{\topsep}{0ex}         % 列表到上下文的垂直距离
          \setlength{\parsep}{0ex}         % 段落间距
          \setlength{\itemsep}{0ex}        % 标签间距
          \setlength{\listparindent}{0pt} % 段落缩进量
          }}
{\end{list}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TODO: 1. 页眉页脚样式
% 论文一律用阿拉伯数字连续编页码，封面、封底不要编入页码。
% 目录页后的主体部分开始编第1页，摘要、目录的前置部分用罗马字单独编排页码。
% 所有页码起始页必须为右页（即左页可以是空白页），页码必须标注在每页的相同位置，便于识别。
\pagestyle{fancy}% Enables the custom headers/footers
\fancypagestyle{frontmatterstyle}{
	\renewcommand{\headrulewidth}{0pt}
	\fancyhf{}
	\fancyfoot[C]{\thepage} %
	\renewcommand{\thepage}{\Roman{page}}
}
\appto\frontmatter{\pagestyle{frontmatterstyle}}
\ProcessOptions\relax
\fancypagestyle{mainmatterstyle}{
	\fancyhf{}
	\renewcommand{\headrulewidth}{1.5pt}
	\makeatletter
	\fancyhf[COH]{\songti\zihao{5} {\@titlehead}} % 设置所有（奇数和偶数）右侧页眉
	\fancyhf[CEH]{\songti\zihao{5} {\@headtype}学位论文} % 设置所有（奇数和偶数）左侧页眉
	\makeatother
	\fancyhf[CEF,COF]{\thepage} % 设置所有（奇数和偶数）中间页脚
}
\appto\mainmatter{\pagestyle{mainmatterstyle}}
\appto\mainmatter{\setlength{\baselineskip}{20pt}\songti\zihao{-4}}%行距和字体字号
\fancypagestyle{plain}{
	\thispagestyle{mainmatterstyle}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TODO: 2. 各类标题样式
%%目录章节样式
\AtBeginDocument{\addtocontents{toc}{\protect\thispagestyle{frontmatterstyle}}}
\renewcommand{\contentsname}{\hfill\heiti\zihao{3} 目\quad\quad 录\hfill}
\renewcommand\cftchapfont{\heiti\zihao{4}}
\renewcommand\cftsecfont{\songti\zihao{4}}
\renewcommand\cftsubsecfont{\songti\zihao{4}}
\renewcommand\cftchappagefont{\fontspec{Times New Roman}\zihao{4}}
\renewcommand\cftsecpagefont{\fontspec{Times New Roman}\zihao{4}}
\renewcommand\cftsubsecpagefont{\fontspec{Times New Roman}\zihao{4}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength\cftbeforetoctitleskip{18pt}
\ctexset{chapter={name={,.},number={\arabic{chapter}}}}%改变目录标题样式
\renewcommand{\cftdot}{$\cdot$}%页码前导点的符号;
\renewcommand{\cftdotsep}{0}%前导点的间隔;
\renewcommand{\cftchapleader}{\cftdotfill{\cftchapdotsep}}
\renewcommand{\cftchapdotsep}{\cftdotsep}
\setlength{\cftbeforechapskip}{6pt}%章前间隔4磅
\setlength{\cftbeforesecskip}{6pt}%节前间隔4磅
\setlength{\cftbeforesubsecskip}{6pt}%小节节前间隔4磅
\setlength{\cftsecindent}{0pt}%设置节标号缩进(模版默认不缩进)
\setlength{\cftsubsecindent}{0pt}%设置小节标号缩进(模版默认不缩进)
\cftsetpnumwidth{1.5em}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setcounter{secnumdepth}{3}%设置目录章节的编号深度
\setlength{\parindent}{2em}%段落缩进两个字符
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\prechaptername{ }
\newcommand\postchaptername{.}
\renewcommand{\chaptername}{\prechaptername\arabic{chapter}\postchaptername}
\titleformat{\chapter}{\centering\zihao{3}\heiti}{\chaptername}{0.5em}{}
\titlespacing{\chapter}{0pt}{0pt}{18pt}
\titleformat{\section}{\zihao{-3}\heiti}{\thesection}{0.5em}{}
\titlespacing{\section}{0pt}{12pt}{12pt}
\titleformat{\subsection}{\zihao{4}\heiti}{\thesubsection}{0.5em}{}
\titlespacing{\subsection}{0pt}{6pt}{6pt}
\titleformat{\subsubsection}{\zihao{4}\kaishu}{\thesubsubsection}{0.5em}{}
\titlespacing{\subsubsection}{0pt}{6pt}{6pt}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TODO: 3. 封面页
% 封面：由研究生处统一印制格式。匿名评审的学位论文封面不要填写申请人姓名、导师姓名和职称。
\newcommand\makecoverpage{
	\pagestyle{empty}
	{
		\centering
		\includegraphics[width=14.5cm]{hunnu.png}\\%插入湖南师范大学图标logo
		\linespread{1.25}
		\vspace*{1.5cm}
		{\zihao{0}\bf{ 硕士学位论文} \par } % 一号黑体\bfseries
		\vspace{2cm} % 两个空行
		{\zihao{3}{\heiti\@titlecn} \par} % 二号黑体%\bfseries
		{
			\zihao{3} \fangsong
			\ifBlindReiew
				\vspace{3cm} % 两个空行
				\begin{tabular}{ll}
					\makebox[7em][s]{学科专业} & \uline{\makebox[7cm][c]{\kaishu\@priormajor}}               \\
					\makebox[7em][s]{学位类型} &
					\ifMAEng
					\uline{\makebox[7cm][c]{{$\Square$}\kaishu{科学学位}~~{$\CheckedBox$}\kaishu{专业学位}}} \\
					\else
					\uline{\makebox[7cm][c]{{$\CheckedBox$}\kaishu{科学学位}~~{$\Square$}\kaishu{专业学位}}} \\
					\fi
					\makebox[7em][s]{论文编号} & \uline{\makebox[7cm][c]{\kaishu\@thesisid}}                 \\
				\end{tabular}
				\vspace{1cm}
			\else
				\vspace{2cm} % 两个空行
				\begin{tabular}{ll}
					\makebox[7em][s]{学科专业}       & \uline{\makebox[7cm][c]{\kaishu\@priormajor}}                                            \\
					\makebox[7em][s]{学位类型}       & \uline{\makebox[7cm][c]{{$\Square$}\kaishu{科学学位}~~{$\CheckedBox$}\kaishu{专业学位}}} \\
					\makebox[7em][s]{研究生姓名}     & \uline{\makebox[7cm][c]{\kaishu\@author}}                                                \\
					\makebox[7em][s]{导师姓名、职称} & \uline{\makebox[7cm][c]{\kaishu\@supervisor}}                                            \\
					\makebox[7em][s]{论文编号}       & \uline{\makebox[7cm][c]{\kaishu\@thesisid}}                                              \\
				\end{tabular}
			\fi
		}
		\par
		\vspace{2.5cm}
		{
			\centering
			{\centering \zihao{4} \fangsong 湖南师范大学学位评定委员会办公室 \par}
			{\centering \zihao{4} \fangsong \@thesisdate \par}
		}
	}
	\clearpage
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TODO: 4. 扉页
% 扉页：应包括分类号、密级、学校代码、学号、学位论文题目、申请人姓名、导师姓名和职称、专业名称、研究方向、提交论文年月。
% 匿名评审的学位论文，扉页应隐去学号、申请人姓名、导师姓名和职称。
\newcommand\maketitlepage{
	{
			\vspace*{1cm} % 空行
			\linespread{1.25}
			\zihao{-4} {\heiti
			\begin{tabular}{l@{}c p{3cm} l@{}c}     % @{}去除边框距离，更符合学校模板的下划线紧贴描述文字
				\makebox[4em][s]{分类号}   & \uline{\makebox[3cm][c]{\@clcnumber}}  &  &
				密级                       & \uline{\makebox[3cm][c]{\@csecret}}             \\
				\ifBlindReiew
				\makebox[4em][s]{学校代码} & \uline{\makebox[3cm][c]{\@schoolcode}} &  &   & \\
				\else
				\makebox[4em][s]{学校代码} & \uline{\makebox[3cm][c]{\@schoolcode}} &  &
				学号                       & \uline{\makebox[3cm][c]{\@studentid}}           \\
				\fi
			\end{tabular}}
		}
	\par
	{
		\centering
		{
			\zihao{2}
			% 注意centering的使用，只在局部环境中使用。
			\vspace{3cm} % 空行
			{ \bf{\@titlecn} \par} % 中文标题二号黑体
			{ \bf{\@titleen} \par} % 英文标题二号 Times New Roman
		}
		\vspace{4cm} % 空行
		{
			\zihao{3} {\fangsong
			\begin{tabular}{ll}
				% 利用\makebox[9em][s]{} 实现两端对齐，即字数不同但左右对齐。
				% 9em表示分散对齐的最长的长度为7个字的长度，参数s表示两端分散对齐。
				\ifBlindReiew
				\makebox[9em][s]{论文编号}           & \uline{\makebox[5cm][c]{\kaishu\@thesisid}}      \\
				\else
				\makebox[9em][s]{研究生姓名}         & \uline{\makebox[5cm][c]{\kaishu\@author}}        \\
				\makebox[9em][s]{指导教师姓名、职称} & \uline{\makebox[5cm][c]{\kaishu\@supervisor}}    \\
				\fi
				\makebox[9em][s]{学科专业}           & \uline{\makebox[5cm][c]{\kaishu\@priormajor}}    \\
				\makebox[9em][s]{研究方向}           & \uline{\makebox[5cm][c]{\kaishu\@interestmajor}} \\
			\end{tabular}}
		}
		\par
		\vspace{4.5cm}
		{
			\centering
			{\centering \zihao{4} \fangsong 湖南师范大学学位评定委员会办公室 \par}
			\vspace{0.5cm}
			{\centering \zihao{4} \fangsong \@thesisdate \par}
		}
	}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TODO: 5. 中英文摘要页
%% 中文摘要页
\newcommand{\ZhAbstract}[2]{%
	\phantomsection
	\addcontentsline{toc}{chapter}{中文摘要}
	\vspace*{10pt}
	\setlength{\parskip}{0pt}
	{
		\setlength{\baselineskip}{20pt}
		\begin{center}%
			\begin{minipage}{\textwidth}
				\centering
				\heiti\zihao{3}\noindent{摘\quad\quad 要}%中文摘要
			\end{minipage}
		\end{center}%
		\vspace*{18pt}
		\par \songti\zihao{4}#1
		\vspace{20pt}
		\par \noindent\heiti\zihao{4}{关键词：}\songti\zihao{4}{#2}}
	\clearpage
}
%% 英文摘要页
\newcommand{\EnAbstract}[2]{
	\phantomsection
	\addcontentsline{toc}{chapter}{英文摘要}
	\phantomsection
	\vspace*{18pt}
	\setlength{\parskip}{0pt}
	{
		\setlength{\baselineskip}{20pt}
		\begin{center}%
			\begin{minipage}{\textwidth}
				\centering
				\bfseries\heiti\zihao{3}\noindent{ABSTRACT}%英文标题
			\end{minipage}
		\end{center}%
		\vspace*{18pt}
		\par \songti\zihao{4} #1
		\vspace{20pt}
		\par \noindent{\bfseries\heiti\zihao{4}\text{Key Words: }} \songti\zihao{4}{#2}}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TODO: 6. 图表样式设置
%% 文中的图、表、公式等一律用阿拉伯数字按章顺序编号，如图1-1、图2-2，表1-1、表2-1，公式1-1等。
%% 图序及图名置于图的下方，居中排列；表序及表名置于表的上方，居中排列。
\captionsetup[table]{labelsep=space}%{labelsep=quad}
\captionsetup[figure]{labelsep=space}
\captionsetup[subfigure]{labelsep=space}
\captionsetup[subtable]{labelsep=space}
\renewcommand{\tablename}{表} %表题头
\renewcommand{\figurename}{图} %图题头
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}} %使图编号为7-1的格式 %\protect{~}
\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}%使表编号为7-1的格式
\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}%使公式编号为7.1的格式
\renewcommand{\thesubfigure}{(\alph{subfigure})}%使子图编号为(a)的格式
\renewcommand{\thesubtable}{(\alph{subtable})} %使子表编号为(a)的格式
\renewcommand{\p@subfigure}{\thefigure~} %使子图引用为 7-1 (a) 的格式，母图编号和子图编号之间用~ 加一个空格
\renewcommand{\p@subtable}{\thetable~} %使子表引用为 7-1 (a) 的格式，母图编号和子图编号之间用~加一个空格
\newcommand{\appedixfigtabnum}[1]{
	\setcounter{equation}{0}
	\renewcommand{\theequation}{#1-\arabic{equation}}
	\setcounter{table}{0}   %从零开始编号
	\renewcommand{\thetable}{#1-\arabic{table}}
	\setcounter{figure}{0}   %从零开始编号
	\renewcommand{\thefigure}{#1-\arabic{figure}}
	\renewcommand{\figurename}{图}
	\renewcommand{\tablename}{表}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TODO: 7. 参考文献样式设置
% 参考文献：参考文献中必须有外文参考文献（古汉语等特殊研究领域除外）。
% 参考文献内容集中排列在文章末尾，包括外文参考文献。参考文献的类型以单字母方式标识，具体如下：
% M——专著        C——论文集      N——报纸文章
% J——期刊文章    D——学位论文    R——报告
% S——标准        P——专利        A——文章
% 对于不属于上述的文献类型，采用字母“Z”标识
\newtoks\bibdatabase
\newcommand{\printbib}{
	\songti\zihao{-4}
	\bibliographystyle{hunnubib}
	\addcontentsline{toc}{chapter}{参考文献}
	\bibliography{\the\bibdatabase}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TODO: 8. 各类杂项设置
%========超链接========
\hypersetup{hidelinks,breaklinks=true,bookmarksopen=false}%自动写入pdf信息
\AtBeginDocument{
	\hypersetup{
		pdftitle = {\@titlecn},
		pdfauthor = {\@author},
		pdfsubject = {湖南师范大学硕士毕业论文}
	}
}
%=====列表样式
\setenumerate[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}
\setitemize[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=0pt}
\setdescription{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}
%======英文名称改为汉字
\theorembodyfont{\rmfamily\songti}
\theoremheaderfont{\rmfamily\heiti}
\theoremsymbol{\ensuremath{\square}}
\newtheorem*{proof}{证明}
\theoremstyle{plain}
\theoremsymbol{}
\qedsymbol{\ensuremath{\square}}
\newtheorem{assumption}{假设}[chapter]
\newtheorem{definition}{定义}[chapter]
\newtheorem{proposition}{命题}[chapter]
\newtheorem{lemma}{引理}[chapter]
\newtheorem{theorem}{定理}[chapter]
\newtheorem{axiom}{公理}[chapter]
\newtheorem{corollary}{推论}[chapter]
\newtheorem{example}{例}[chapter]
\newtheorem{conjecture}{猜想}[chapter]
\crefname{theorem}{定理}{定理}
\crefname{assumption}{假设}{假设}
\crefname{definition}{定义}{定义}
\crefname{proposition}{命题}{命题}
\crefname{lemma}{引理}{引理}
\crefname{theorem}{定理}{定理}
\crefname{axiom}{公理}{公理}
\crefname{corollary}{推论}{推论}
\crefname{example}{例}{例}
\crefname{remark}{注释}{注释}
\crefname{conjecture}{猜想}{猜想}
%=======程序伪代码实现
\floatname{algorithm}{算法}
\renewcommand{\algorithmicrequire}{\textbf{输入:}}
\renewcommand{\algorithmicensure}{\textbf{输出:}}
\endinput
%%
%% End of file `HUNNUthesis.cls'.