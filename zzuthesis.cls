%%================================================
%% Filename: zzuthesis.cls
%% Encoding: UTF-8
%% Author: Yuan Xiaoshuai - yxshuai@gmail.com
%% Created: 2012-01-08 13:11
%% Last modified: 2016-08-28 20:53
%%================================================
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 标识节(Identification)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{zzuthesis}
[2016/08/28 4.1 Zhengzhou University Thesis Template]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 声明选项(Declaration options)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\ifzzu@bachelor\zzu@bachelorfalse
\newif\ifzzu@master\zzu@masterfalse
\newif\ifzzu@doctor\zzu@doctorfalse
\DeclareOption{bachelor}{\zzu@bachelortrue}
\DeclareOption{master}{\zzu@mastertrue}
\DeclareOption{doctor}{\zzu@doctortrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 选项处理 (Option processing)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ProcessOptions\relax
\ifzzu@bachelor\relax\else
  \ifzzu@master\relax\else
    \ifzzu@doctor\relax\else
        \ClassError{zzuthesis}%Reporting errors
                   {You have to specify one of thesis options:%
                    bachelor, master or doctor.}{}
    \fi
  \fi
\fi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 装载类与宏包 (Loading classes & packages)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ifzzu@doctor%博士论文双面打印
  \LoadClass[12pt,a4paper]{book}
\else%其它单面打印
  \LoadClass[12pt,a4paper,openany]{book}
\fi
\RequirePackage{indentfirst}%首行缩进
\RequirePackage{calc}%算术运算
\RequirePackage{titletoc}%目录格式
\RequirePackage{amsmath,amssymb,amsthm,bm}
\RequirePackage{geometry}%页边距设置
\RequirePackage{tabularx}%表格宽度控制
\RequirePackage{multirow}%跨行表格
\RequirePackage{longtable}%长表格，可替换supertabular
\RequirePackage{booktabs}%三线表格
\RequirePackage[config]{subfig}%引入caption，并用config选项兼容subfigure
\RequirePackage{graphicx}%图形支持
\RequirePackage[neverdecrease]{paralist}%列表环境
\RequirePackage[BoldFont,CJKnumber]{xeCJK}
  \punctstyle{hangmobanjiao}
  \defaultfontfeatures{Mapping=tex-text}%连字符
  \setCJKmainfont[BoldFont={STZhongsong}, 
    ItalicFont={Adobe Kaiti Std}]{Adobe Song Std}
  \setCJKsansfont{Adobe Heiti Std}
  \setCJKmonofont{Adobe Kaiti Std}
  \setCJKfamilyfont{song}{Adobe Song Std}
  \setCJKfamilyfont{hei}{Adobe Heiti Std}
  \setCJKfamilyfont{fs}{Adobe Fangsong Std}
  \setCJKfamilyfont{kai}{Adobe Kaiti Std}
  \setCJKfamilyfont{xingkai}{STXingkai}%封面标题
  % \setCJKfamilyfont{vertfont}[RawFeature={vertical}]{Adobe Song Std}%竖直字体
  \setmainfont{Times New Roman}
  \setsansfont{Arial}
  \setmonofont{Courier New}
\RequirePackage[numbers,super,sort&compress]{natbib}%参考文献引用
\RequirePackage{hyperref}%超链接、书签
  \hypersetup{%
    % CJKbookmarks=true,
    bookmarksnumbered=true,%节的标号放入标签
    bookmarksopen=true,
    bookmarksopenlevel=1,
    breaklinks=true,
    % colorlinks=false,%彩色链接
    % plainpages=false,%格式化页码
    % pdfpagelabels,
    pdfborder=0 0 0}
  \urlstyle{same}%相同字体
\RequirePackage{hypernat}%让hyperref和natbib协调工作
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 文前，正文，文后格式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand\frontmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmatterfalse
  \pagenumbering{Roman}
  \pagestyle{zzu@headings}}
\renewcommand\mainmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmattertrue
  \pagenumbering{arabic}}
\renewcommand\backmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmattertrue}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 字体配置
%% 字体调用命令：
%%   \song    % 宋体 Adobe Song Std
%%   \hei     % 黑体 Adobe Heiti Std
%%   \kai     % 楷书 Adobe Kaiti Std
%%   \fs      % 仿宋 Adobe Fangsong Std
%%   \xingkai % 行楷 STXingkai
%%   \vertfont% 竖宋 Adobe Song Std
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\song}{\CJKfamily{song}}
\def\songti{\song}
\newcommand{\fs}{\CJKfamily{fs}}
\def\fangsong{\fs}
\newcommand{\kai}{\CJKfamily{kai}}
\def\kaishu{\kai}
\newcommand{\hei}{\CJKfamily{hei}}
\def\heiti{\hei}
% \newcommand{\vertfont}{\CJKfamily{vertfont}}
\newcommand{\xingkai}{\CJKfamily{xingkai}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  字号设置
%%  模板使用thuthesis论文模板的字号定义：
%%    \thu@define@fontsize{<字号名称>}{<磅数>}
%%  相当于定义：\newcommand{\chuhao}[1][\baselinestretch]{%
%%                \fontsize{42bp}{42bp*\real{#1}}\selectfont}
%%
%% 1. 设置初号、小初…… 八号等字体的命令分别为：\chuhao、\xiaochu … \bahao；
%% 2. 在使用时，可加入行距参数，如\chuhao[1.25]表示初号字体，1.25倍行距。
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newlength\zzu@linespace
\newcommand{\zzu@choosefont}[2]{%
   \setlength{\zzu@linespace}{#2*\real{#1}}%
   \fontsize{#2}{\zzu@linespace}\selectfont}
\def\zzu@define@fontsize#1#2{%
  \expandafter\newcommand\csname #1\endcsname[1][\baselinestretch]{%
    \zzu@choosefont{##1}{#2}}}
\zzu@define@fontsize{chuhao}{42bp}
\zzu@define@fontsize{xiaochu}{36bp}
\zzu@define@fontsize{yihao}{26bp}
\zzu@define@fontsize{xiaoyi}{24bp}
\zzu@define@fontsize{erhao}{22bp}
\zzu@define@fontsize{xiaoer}{18bp}
\zzu@define@fontsize{sanhao}{16bp}
\zzu@define@fontsize{xiaosan}{15bp}
\zzu@define@fontsize{sihao}{14bp}
\zzu@define@fontsize{banxiaosi}{13bp}
\zzu@define@fontsize{xiaosi}{12bp}
\zzu@define@fontsize{wuhao}{10.5bp}
\zzu@define@fontsize{xiaowu}{9bp}
\zzu@define@fontsize{liuhao}{7.5bp}
\zzu@define@fontsize{xiaoliu}{6.5bp}
\zzu@define@fontsize{qihao}{5.5bp}
\zzu@define@fontsize{bahao}{5bp}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 正文字体及行距
%% 研究生论文《规范》规定正文字体行距为固定20磅行距
%% 本科论文规定正文字体行距为1.25倍行距
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\let\zzu@normalsize\normalsize
\renewcommand\normalsize{\zzu@normalsize\xiaosi[1.667]}
% \renewcommand\normalsize{\zzu@normalsize%TODO
%   \ifzzu@bachelor\xiaosi[1.25]\else\xiaosi[1.667]\fi}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 页面设置
%% 
%% 1.页边距
%% 2.段落间距及缩进
%% 3.\cleardoublepage命令：双面打印时，清空空白页
%% 规范中要求的页边距：
%% 上下3.8cm，左右3.2cm，页眉页脚3.0cm，装订线0cm
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% \ifzzu@bachelor%TODO 
  % \geometry{left=2.6cm,right=2.0cm,top=2.0cm,bottom=2.2cm,includeheadfoot}
% \else%研究生
  % \geometry{left=3.2cm,right=3.2cm,top=3.8cm,bottom=3.8cm,includeheadfoot}
% \fi
\geometry{left=3.17cm,right=3.17cm,top=2.54cm,bottom=2.54cm,includeheadfoot}
\newlength\CJK@twochars
% \def\CJK@spaceChar{\Unicode{48}{7}}  % TODO: \Unicode not available
\def\CJK@spaceChar{\hskip \f@size \p@} % 28 Aug, 2016
\def\CJKindent{%段落缩进
  \settowidth\CJK@twochars{\CJK@spaceChar\CJK@spaceChar}%
  \parindent\CJK@twochars}
\setlength{\parskip}{\z@ \@plus\tw@\p@ \@minus\z@}
\let\zzu@cleardoublepage\cleardoublepage
\newcommand{\zzu@clearemptydoublepage}{%开始奇数新页面
  \clearpage{\pagestyle{empty}\zzu@cleardoublepage}}
\let\cleardoublepage\zzu@clearemptydoublepage
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 页眉页脚
%% 页眉：居中显示章节名称；宋体10.5磅居中，Abstract用Roman字体
%% 页脚：居中显示页码；宋体10.5磅居中
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\ps@zzu@empty{%%No head or foot line.
  \let\@oddhead\@empty\let\@evenhead\@empty%
  \let\@oddfoot\@empty\let\@evenfoot\@empty}
\def\ps@zzu@plain{%%No head, centred or right page number in foot.
  \let\@oddhead\@empty\let\@evenhead\@empty%
  \def\@oddfoot{\hfil\wuhao\thepage\ifzzu@bachelor\relax\else\hfil\fi}%
  \let\@evenfoot=\@oddfoot}
\def\ps@zzu@headings{%%Centred head, centred page number in foot.
  \def\@oddhead{\vbox to\headheight{%
    \hb@xt@\textwidth{\wuhao\rmfamily\hfill\leftmark\hfill}%
      \vskip\tw@\p@\hbox{\vrule width\textwidth height.4\p@ depth\z@}}}
  \let\@evenhead=\@oddhead
  \def\@oddfoot{\wuhao\hfil\thepage\ifzzu@bachelor\relax\else\hfil\fi}
  \let\@evenfoot=\@oddfoot}
\renewcommand{\chaptermark}[1]{\@mkboth{\@chapapp\  ~~#1}{}}
\def\zzu@item@space{%列表环境间距
  \let\itemize\compactitem
  \let\enditemize\endcompactitem
  \let\enumerate\compactenum
  \let\endenumerate\endcompactenum
  \let\description\compactdesc
  \let\enddescription\endcompactdesc}
\setdefaultenum{(1)}{1)}{}{}%TODO : 带圈数字
\let\zzu@footnotesize\footnotesize%脚注字体及行距
\renewcommand\footnotesize{\zzu@footnotesize\xiaowu[1.5]}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    浮动对象、图片、表格、公式设置
%% 1. 若插入的图片未指定扩展名，则在指定文件路径搜索pdf，eps，png，jpg，jpeg文件
%%    搜索路径在主文件中定义；
%% 2. 定义tabularx环境中的Z选项，用于居中自动调整，定义命令\Xhline
%% 3. 公式、图片、表格编号分隔符为句号，即“3.1”的形式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength{\floatsep}{12bp \@plus4\p@\@minus\p@}%浮动对象和文字间的距离
\setlength{\intextsep}{12bp \@plus4\p@\@minus\tw@\p@}
\setlength{\textfloatsep}{12bp \@plus4\p@\@minus2\p@}
\setlength{\@fptop}{0bp \@plus1.0fil}
\setlength{\@fpsep}{12bp \@plus2.0fil}
\setlength{\@fpbot}{0bp \@plus1.0fil}
\renewcommand{\textfraction}{0.15}%页面文本的最小比例(0.2)
\renewcommand{\topfraction}{0.85}%页顶浮动对象高/页高的最大值(0.7)
\renewcommand{\bottomfraction}{0.50}%页底浮动对象高/页高的最大值(0.3)
\renewcommand{\floatpagefraction}{0.80}%浮动页由浮动对象占用的最小比例(0.5)
\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg,.jpeg}%搜索指定扩展名
\let\zzu@tabular\@tabular
\ifzzu@bachelor%本科：小四楷体
  \def\@tabular{\xiaosi[1.25]\kaishu\zzu@tabular}%
  \DeclareCaptionLabelFormat{zzu}{{\xiaosi[1.25]\kaishu #1~\rmfamily #2}}
  \DeclareCaptionLabelSeparator{zzu}{\hspace{1em}}%表序与表名之间空一个汉字度
  \DeclareCaptionFont{zzu}{\xiaosi[1.25]\kaishu}
\else%研究生：五号宋体
  \def\zzu@tabular{\wuhao[1]\zzu@tabular}
  \DeclareCaptionLabelFormat{zzu}{{\wuhao[1]\rmfamily #1~#2}}
  \DeclareCaptionLabelSeparator{zzu}{\hspace{1em}}
  \DeclareCaptionFont{zzu}{\wuhao[1]}
\fi%
\let\zzu@LT@array\LT@array%长表格
\ifzzu@bachelor
  \def\LT@array{\xiaosi[1.25]\kaishu\zzu@LT@array}
\else
  \def\LT@array{\wuhao[1]\zzu@LT@array}
\fi%
\newcolumntype{Z}{>{\centering\arraybackslash}X}%居中自动调整
\newcommand\Xhline[1]{\noalign{\ifnum0=`}\fi\arrayrulewidth#1%
        \ifx\hline\LT@hline\let\@xhline\LT@@hline\fi
        \hrule\@height\arrayrulewidth\futurelet\reserved@a\@xhline}
\captionsetup{labelformat=zzu,labelsep=zzu,font=zzu}
\ifzzu@bachelor%caption 在上，段前空6磅，段后空12磅
  \captionsetup[table]{position=top,belowskip={12bp-\intextsep},aboveskip=6bp}
\else%cation 在上，段前空6磅，段后空6磅
  \captionsetup[table]{position=top,belowskip={6bp},aboveskip=6bp}
\fi
\captionsetup[figure]{%cation 在下，段前空6磅，段后空12磅
  position=bottom,belowskip={12bp-\intextsep},aboveskip=6bp}
\captionsetup[subfloat]{labelformat=simple,font=zzu,%
  captionskip=6bp,nearskip=6bp,farskip=0bp,topadjust=0bp}
\renewcommand{\thesubfigure}{(\alph{subfigure})}%子图形编号：字母
\renewcommand{\thesubtable}{(\alph{subtable})}%子表格编号：字母
\renewcommand\theequation{%公式编号分隔符
  \ifnum \c@chapter>\z@ \thechapter.\fi\@arabic\c@equation}
\allowdisplaybreaks[4]%允许公式断行分页
\newtheoremstyle{theorem}%定理类型
  {0.5ex}%Space above
  {0.5ex}%Space below
  {\rmfamily}%Body font
  {}%Indent amount 
  {\sffamily}%Theorem head font
  {\zzu@theorem@separator}%Punctuation after theorem head
  {1em}%Space after theorem head
  {}%Theorem head spec
\renewenvironment{proof}[1][\proofname]{\par%证明
  \pushQED{\qed}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\labelsep
  \sffamily
  #1\@addpunct{\quad}]\ignorespaces}
  {\popQED\endtrivlist\@endpefalse}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 章节标题
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand\chapter{%一级标题
  \if@openright\cleardoublepage\else\clearpage\fi\phantomsection%
  % \thispagestyle{zzu@plain}
  \global\@topnum\z@%prevent floats from appearing at the top of this page
  \@afterindenttrue%
  \secdef\@chapter\@schapter}%\secdef<unstarcommand><starcommand>
\def\@chapter[#1]#2{%
  \ifnum \c@secnumdepth >\m@ne
   \if@mainmatter
     \refstepcounter{chapter}
     \addcontentsline{toc}{chapter}{\protect\numberline{\@chapapp}#1}%TODO shit
     %\@chapapp: '\chaptername'.
     %\numberline{⟨number⟩} puts <number> flushleft in a box of width \@tempdima
   \else
     \addcontentsline{toc}{chapter}{#1}%
   \fi
  \else
    \addcontentsline{toc}{chapter}{#1}%
  \fi
  \chaptermark{#1}%\chaptermark{⟨text⟩}: to set a mark.
  \@makechapterhead{#2}
  \@afterheading}
\def\@makechapterhead#1{%
  \vspace*{24bp}%段前空24磅
  {\parindent \z@
   \ifzzu@bachelor\centering\else\raggedright\fi%本科居中，研究生居左
    \sffamily\sanhao[1]%黑体三号字，单倍行距
    \ifnum \c@secnumdepth >\m@ne
      \@chapapp\hskip1em%章序号与章名空一个汉字符
    \fi
    \interlinepenalty\@M
    #1\par\nobreak
    \vskip 18bp}}%段后空18磅
\def\@schapter#1{%
  \@makeschapterhead{#1}
  \@afterheading}
\def\@makeschapterhead#1{%
  \vspace*{24bp}%
  {\parindent \z@ \centering
   \sffamily\sanhao[1]
   \def\@tempa{#1}
   \def\@tempb{\cabstractname}
   \def\@tempc{\eabstractname}
   \ifx\@tempa\@tempb\pagenumbering{Roman}\xiaoer[1]\fi
   \ifx\@tempa\@tempc\xiaoer[1]\fi
   \interlinepenalty\@M
   #1\par\nobreak
   \vskip 18bp}}
\newcounter{zzu@bookmark}
\def\zzu@chapter*{%\zzu@chapter*[tocline]{title}[header]
  %% \@ifnextchar peeks at the following character and compares it with its first argument. 
  %% If both are the same it executes its second argument, otherwise its third.
  \@ifnextchar [ % ]
    {\zzu@@chapter}
    {\zzu@@chapter@}}
\def\zzu@@chapter@#1{\zzu@@chapter[#1]{#1}}
\def\zzu@@chapter[#1]#2{%
  \@ifnextchar [ % ]
    {\zzu@@@chapter[#1]{#2}}
    {\zzu@@@chapter[#1]{#2}[]}}
\def\zzu@@@chapter[#1]#2[#3]{%
  \if@openright\cleardoublepage\else\clearpage\fi\phantomsection%
  \def\@tmpa{#1}
  \def\@tmpb{#3}
  \ifx\@tmpa\@empty
    \addtocounter{zzu@bookmark}\@ne
    \pdfbookmark[0]{#2}{zzuchapter.\thezzu@bookmark}
  \else
    \addcontentsline{toc}{chapter}{#1}
  \fi
  \chapter*{#2}
  \ifx\@tmpb\@empty
    \@mkboth{#2}{#2}
  \else
    \@mkboth{#3}{#3}
  \fi}
\renewcommand\section{%二级标题
  %\@startsection {NAME}{LEVEL}{INDENT}{BEFORESKIP}{AFTERSKIP}{STYLE}
  \@startsection{section}{1}{\z@}%缩进0，段前空24磅
                {-24bp \@plus -6bp \@minus -2bp}%
                {6bp \@plus 2bp}%段后空6磅。
                {\sffamily\ifzzu@bachelor\sihao\else\sihao[1.429]\fi}}%行距20
\renewcommand\subsection{%三级标题
  \@startsection{subsection}{2}{\ifzzu@bachelor\CJK@twochars \else\z@ \fi}
                {-12bp \@plus -3bp \@minus -1bp}%
                {6bp \@plus 2bp}%
                {\ifzzu@bachelor\bfseries\xiaosi%本科宋体加粗
                 \else\sffamily\banxiaosi[1.538]\fi}}%
\renewcommand\subsubsection{%四级标题
  \@startsection{subsubsection}{3}{\ifzzu@bachelor\CJK@twochars \else\z@ \fi}%
                {-12bp \@plus -3bp \@minus -1bp}%
                {6bp \@plus 2bp}%
                {\ifzzu@bachelor\bfseries\xiaosi
                 \else\sffamily\xiaosi[1.667]\fi}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 目录及图表清单
%% 目录利用titletoc宏包对目录进行定制
%% 
%% 各章目录：宋体14磅，单倍行距，段前6磅，段后0磅
%%           两端对齐，页码右对齐
%% 一级标题：宋体12磅，单倍行距，段前6磅，段后0磅
%%           左缩进2字符，两端对齐，页码右对齐
%% 二级标题：宋体10.5磅，单倍行距，段前6磅，段后0磅
%%           左缩进4字符，两端对齐，页码右对齐
%% 图和附表清单：宋体10.5磅，行距16磅
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setcounter{secnumdepth}{3}%章节编号深度：4
\setcounter{tocdepth}{2}%目录深度：2
\renewcommand\tableofcontents{%
  \zzu@chapter*[]{\contentsname}
  \@starttoc{toc}\normalsize}
\renewcommand\listoffigures{%本科无图和附表清单
  \ifzzu@bachelor\relax\else
  \zzu@chapter*{\listfigurename}
  \@starttoc{lof}\fi}
\renewcommand\listoftables{%
  \ifzzu@bachelor\relax\else
  \zzu@chapter*{\listtablename}
  \@starttoc{lot}\fi}
\titlecontents{chapter}[\z@]{\vspace{6bp}\sffamily\sihao[1]}
  {{\thecontentslabel}\quad}{}
  {\hspace{.5em}\titlerule*{.}\xiaosi\contentspage}
\titlecontents{section}[2em]{\vspace{6bp} \xiaosi[1]}
  {\thecontentslabel\quad}{}
  {\hspace{.5em}\titlerule*{.}\xiaosi\contentspage}
\titlecontents{subsection}[4em]{\vspace{6bp} \wuhao[1]}
  {\thecontentslabel\quad}{}
  {\hspace{.5em}\titlerule*{.}\xiaosi\contentspage}
\titlecontents{figure}[\z@]{\wuhao[1.524]}%10.5bp，16bp
  {\makebox[3.5em][l]{\figurename~\thecontentslabel\quad}}{}
  {\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{table}[\z@]{\wuhao[1.524]}%10.5bp，16bp
  {\makebox[3.5em][l]{\tablename~\thecontentslabel\quad}}{}
  {\hspace{.5em}\titlerule*{.}\contentspage}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 封面
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\zzu@define@term#1{%定义封面的一些替换命令
  \expandafter\gdef\csname #1\endcsname##1{%
    \expandafter\gdef\csname zzu@#1\endcsname{##1}}
  \csname #1\endcsname{}}
\zzu@define@term{schoolcode}
\zzu@define@term{id}
\zzu@define@term{secretlevel}
\zzu@define@term{protitle}
\zzu@define@term{ctitle}
\zzu@define@term{cauthor}
\zzu@define@term{stuno}
\zzu@define@term{csupervisor}
\zzu@define@term{csubject}
\zzu@define@term{cmajor}
\zzu@define@term{cdepartment}
% \newcommand\cdepartment[2][]{%
  % \def\zzu@cdepartment@short{#1}\def\zzu@cdepartment{#2}}
\zzu@define@term{cdate}
% \zzu@define@term{submitdate}
\zzu@define@term{etitle}
\zzu@define@term{eauthor}
\zzu@define@term{esupervisor}
\zzu@define@term{emajor}
\zzu@define@term{edepartment}
\zzu@define@term{edate}
\newcommand\zzu@underline[2][6em]{%
  \hskip\p@\underline{\hb@xt@ #1{\hss#2\hss}}\hskip3\p@}
\newlength{\zzu@title@width}
\def\zzu@put@title#1{\makebox{\hb@xt@\zzu@title@width{#1}}}
\newcommand{\zzu@first@titlepage}{%论文中文封面
  \thispagestyle{zzu@empty}
  \begin{center}
    \ifzzu@bachelor%%本科毕业论文
      \vspace*{2.4cm}
      \hspace*{-1.3cm}{\yihao\bfseries\fs\zzu@schoolname\zzu@subtitle}
      \par\vskip2.4cm
      \hspace*{1cm}\sffamily\sanhao\zzu@bachelor@title@pre\zzu@title@sep
      \parbox[t]{10cm}{%
        \setbox0=\hbox{{\sanhao[1.55]\zzu@ctitle}}
        \begin{picture}(0,0)(0,0)
          \setlength\unitlength{1cm}
          \linethickness{.5\p@}
          \put(0,-0.25){\line(1,0){10}}
          \ifdim\wd0>10cm
            \put(0,-1.12){\line(1,0){10}}
          \fi
        \end{picture}%
        \ignorespaces\sanhao[1.55]\zzu@ctitle\par
        \setbox0=\hbox{{\sanhao[1.55]\zzu@etitle}}
        \begin{picture}(0,0)(0,0)
          \setlength\unitlength{1cm}
          \linethickness{.5\p@}
          \put(0,-0.25){\line(1,0){10}}
          \ifdim\wd0>10cm
            \put(0,-1.12){\line(1,0){10}}
          \fi
        \end{picture}%
        \ignorespaces\sanhao[1.55]\zzu@etitle\par
        \vskip.5cm
        \setlength{\zzu@title@width}{2.8cm}
        \zzu@put@title{\zzu@supervisor@title\zzu@title@sep}%
          \zzu@underline[3cm]{\hfill\zzu@csupervisor\hfill}\hfill
        \setlength{\zzu@title@width}{1.8cm}
        \zzu@put@title{\zzu@protitle@title\zzu@title@sep}%
          \zzu@underline[2cm]{\hfill\zzu@protitle\hfill}}\par
        \vspace*{\stretch{1}}
        \hspace*{0.8cm}\parbox[t][4.0cm][t]{22em}{{\xiaosan[1.8]\rmfamily
          \setlength{\zzu@title@width}{4em}
          \zzu@put@title{\zzu@author@title}\zzu@title@sep%
            \zzu@underline[6em]{\zzu@cauthor}\hspace*{8bp}
          \zzu@stuno@title\zzu@title@sep\zzu@underline[8em]{\zzu@stuno}\par
          \zzu@put@title{\zzu@major@title}\zzu@title@sep%
            \zzu@underline[18em]{\zzu@cmajor}\par
          \zzu@put@title{\zzu@department@title}\zzu@title@sep%
            \zzu@underline[18em]{\zzu@cdepartment}\par
          \zzu@put@title{\zzu@cdate@title}\zzu@title@sep%
            \zzu@underline[18em]{\zzu@cdate}\par}}
        \vspace*{\stretch{1}}
        % \begin{center}
          % {\xiaosan\rmfamily\zzu@submitdate}
        % \end{center}
    \else%研究生学位论文
      \noindent\begin{minipage}{.49\textwidth}
        \begin{flushleft}
          \includegraphics[width=3.35cm]{zzulogo}
        \end{flushleft}
      \end{minipage}
      \hfill
      \noindent\begin{minipage}{.49\textwidth}
        \begin{flushright}
          \kaishu\sihao
        \setlength{\zzu@title@width}{6em}
        \begin{tabular}{p{\zzu@title@width}@{~}l}
          \zzu@put@title{\zzu@schoolcode@title} & 
            \zzu@underline[9em]{\zzu@schoolcode}\\[1ex]
          \zzu@put@title{\zzu@id@title} & 
            \zzu@underline[9em]{\zzu@id}\\[1ex]
          \zzu@put@title{\zzu@secretlevel@title} & 
            \zzu@underline[9em]{\zzu@secretlevel}\\
          \end{tabular}
        \end{flushright}
      \end{minipage}
      \vskip \stretch{1}
      \begin{center}
        {\ziju{18bp}\chuhao\xingkai\zzu@schoolname}
        \par\vskip.6cm
        {\ziju{18bp}\xiaochu\sffamily\zzu@subtitle}
        \vskip \stretch{1}
        \kaishu\erhao[1.5] \zzu@ctitle
        \vskip \stretch{1}
        \setlength{\zzu@title@width}{4em}
        \kaishu\sanhao[1.25]
        \def\tabcolsep{\p@}%\tabcolsep：tabular环境中两列标准间隔的一半
        \def\arraystretch{1.5}%\arraystretch表格行距的缩放比例因子（缺省为1）
        \begin{tabular}{p{\zzu@title@width}l@{}l}
          \zzu@put@title{\zzu@author@title} &  \zzu@title@sep & 
            \zzu@underline[150pt]{\zzu@cauthor}
        \\
          \zzu@put@title{\zzu@supervisor@title} &  \zzu@title@sep & 
            \zzu@underline[150pt]{\zzu@csupervisor\hspace{1em}\zzu@protitle}
        \\ 
          \zzu@put@title{\zzu@subject@title} &  \zzu@title@sep & 
            \zzu@underline[150pt]{\zzu@csubject}
        \\
          \zzu@put@title{\zzu@major@title} &  \zzu@title@sep & 
            \zzu@underline[150pt]{\zzu@cmajor}
        \\
        \ifzzu@doctor\else
          \zzu@put@title{\zzu@department@title} &  \zzu@title@sep & 
            \zzu@underline[150pt]{\zzu@cdepartment}
        \\
        \fi
          \zzu@put@title{\zzu@cdate@title} &  \zzu@title@sep & 
            \zzu@underline[150pt]{\zzu@cdate}
        \end{tabular}\\
        \vskip \stretch{1}
      \end{center}
    \fi
  \end{center}} % end of titlepage
\newcommand{\zzu@engcover}{%硕士和博士论文英文封面
  \thispagestyle{zzu@empty}
  \vspace*{1cm}
  \begin{center}
    \parbox[t][5.8cm][t]{\paperwidth-7.2cm}{
      \renewcommand{\baselinestretch}{1.5}
      \ifzzu@master
        \begin{center}
          \sanhao A thesis submitted to\\
          {\bfseries Zhengzhou University}\\
          for the degree of Master\\
        \end{center}
      \else
        \begin{center}
          \sanhao A dissertation submitted to\\
          {\bfseries Zhengzhou University}\\
          for the degree of Doctor\\
        \end{center}
      \fi}
    \vskip \stretch{1}
    \parbox[t][5.2cm][t]{\paperwidth-7.2cm}{
      \renewcommand{\baselinestretch}{1.5}
      \begin{center}
        \sanhao\bfseries\zzu@etitle
      \end{center}}
    \vskip \stretch{2}
    \parbox[t][3.6cm][b]{\paperwidth-7.2cm}{
      \renewcommand{\baselinestretch}{1.5}
      \begin{center}
        \sanhao
        By\quad{}\zzu@eauthor\par
        Supervisor :\quad\zzu@esupervisor\par
        \zzu@emajor\par
        \zzu@edepartment\par
        \zzu@edate
      \end{center}}
  \vfill
  \end{center}}
\newcommand{\zzu@authorization@mk}{%原创性声明及授权声明
  \thispagestyle{zzu@empty}
  \vspace*{\stretch{1}}
  \begin{center}
    \sffamily\sanhao \zzu@declarename
  \end{center}
  \vskip 20pt
  \xiaosi[2]\zzu@declaretext
  \vskip 20pt
  \zzu@authorsig\hfill\zzu@declaredate\hspace*{2em}
  \vspace*{\stretch{2}}
  \begin{center}
    \sffamily\sanhao \zzu@authtitle
  \end{center}
  \vskip 20pt
  \xiaosi[2]\zzu@authorization
  \vskip 20pt
  \zzu@authorsig\hfill\zzu@authdate\hspace*{2em}
  \vspace*{\stretch{2}}}
\newcommand{\makecover}{%制作封面
  \phantomsection
  \pdfbookmark[-1]{\zzu@ctitle}{ctitle}
  \normalsize%
  \begin{titlepage}
    \zzu@first@titlepage
    \ifzzu@bachelor\clearpage
    \else
      \if@openright\cleardoublepage\else\clearpage\fi
      \zzu@engcover
      \if@openright\cleardoublepage\else\clearpage\fi
      \zzu@authorization@mk
    \fi%
  \end{titlepage}
  \normalsize
  % \let\@tabular\zzu@tabular
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 中英文摘要及关键词
%% 中文摘要部分的标题为"摘要"(本科为"中文摘要"，黑体三号字)
%%   关键词之间空两个汉字符宽度，悬挂缩进
%% 英文摘要部分的标题为 Abstract，用 Arial 体三号字
%%   关键词之间空四个英文字符宽度，悬挂缩进
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\zzu@parse@keywords#1{%关键词分割
  \expandafter\gdef\csname zzu@#1\endcsname{}%
  \expandafter\gdef\csname #1\endcsname##1{\vskip12bp
    \@for\reserved@a:=##1\do{
      \expandafter\ifx\csname zzu@#1\endcsname\@empty\else
        \expandafter\g@addto@macro\csname zzu@#1\endcsname{%
          \ignorespaces\csname zzu@#1@separator\endcsname}
      \fi
      \expandafter\expandafter\expandafter\g@addto@macro%TODO IT'S BEYOND ME !
        \expandafter\csname zzu@#1\expandafter\endcsname\expandafter{%
          \reserved@a}}
  \setbox0=\hbox{{\bfseries \csname zzu@#1@title\endcsname}}%“关键词”三字加粗
  \ifzzu@bachelor\indent\else\noindent\hangindent\wd0\hangafter1\fi
  \box0\csname zzu@#1\endcsname}}
\zzu@parse@keywords{ckeywords}
\zzu@parse@keywords{ekeywords}
\newenvironment{cabstract}
  {\zzu@chapter*[]{\cabstractname}}{}
\newenvironment{eabstract}
 {\zzu@chapter*[]{\eabstractname}}{}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 主要符号对照表
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{denotation}[1][2.5cm]{
  \if@openright\cleardoublepage\else\clearpage\fi
  \zzu@chapter*[]{\zzu@denotation@name}
  \noindent\begin{list}{}%
    {\vskip-30bp\wuhao[1.524]%宋体五号(10.5磅)，行距16磅
     \renewcommand\makelabel[1]{##1\hfil}
     \setlength{\labelwidth}{#1}%标签盒子宽度
     \setlength{\labelsep}{0.5cm}%标签与列表文本距离
     \setlength{\itemindent}{0cm}%标签缩进量
     \setlength{\leftmargin}{\labelwidth+\labelsep}%左边界
     \setlength{\rightmargin}{0cm}
     \setlength{\parsep}{0cm}%段落间距
     \setlength{\itemsep}{0cm}%标签间距
    \setlength{\listparindent}{0cm}%段落缩进量
    \setlength{\topsep}{\z@}%标签与上文的间距
   }}{\end{list}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 致谢
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{ack}{%
    \if@openright\cleardoublepage\else\clearpage\fi
    \zzu@chapter*{\zzu@ackname}
    \fs\xiaosi[1.524]%仿宋五号，固定行距16磅
  }{}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    参考文献环境
%% 1. 文献作者不超过3位时，全部列出；超过时只列前3位，后面加“等”或相应外文；
%% 2. 作者姓名之间用“,”分开，建议根据《中国高校自然科学学报编排规范》的要求
%%    书写参考文献，并按引用顺序将其附于文末，该规范建议根据国标书写参考文献。
%% 3. 引用参考文献的位置，上标标注[参考文献序号]
%% 参考文献风格：GBT7714-2005NLang-UTF8(基本符合国标要求)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\bibpunct{[}{]}{,}{s}{}{,}
\renewcommand\NAT@citesuper[3]{\ifNAT@swa%
  \unskip\kern\p@\textsuperscript{\NAT@@open #1\NAT@@close}%
  \if*#3*\else\ (#3)\fi\else #1\fi\endgroup}
\DeclareRobustCommand\onlinecite{\@onlinecite}
\def\@onlinecite#1{\begingroup\let\@cite\NAT@citenum\citep{#1}\endgroup}
\renewenvironment{thebibliography}[1]{%
   \zzu@chapter*{\bibname}%
   \wuhao[1.524]%宋体五号，行距16磅
   \list{\@biblabel{\@arabic\c@enumiv}}%
        {\renewcommand{\makelabel}[1]{##1\hfill}
         \settowidth\labelwidth{1.1cm}
         \setlength{\labelsep}{0.4em}
         \setlength{\itemindent}{\z@}
         \setlength{\leftmargin}{\labelwidth+\labelsep}
         \addtolength{\itemsep}{-0.7em}
         \usecounter{enumiv}%
         \let\p@enumiv\@empty
         \renewcommand\theenumiv{\@arabic\c@enumiv}}%
    \sloppy\frenchspacing
    \clubpenalty4000
    \@clubpenalty \clubpenalty
    \widowpenalty4000%
    \interlinepenalty4000%
    \sfcode`\.\@m}
   {\def\@noitemerr
     {\@latex@warning{Empty `thebibliography' environment}}%
    \endlist\frenchspacing}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 附录
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\let\zzu@appendix\appendix
\renewenvironment{appendix}{%
  \zzu@appendix
  \gdef\@chapapp{\appendixname~\thechapter}
  \renewcommand\theequation{%
    \ifnum \c@chapter>\z@ \thechapter\fi\@arabic\c@equation}
  }{}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 个人简历、在学期间发表的学术论文及研究成果
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{resume}[1][\zzu@resume@title]{%
  \zzu@chapter*{#1}\wuhao[1.524]}{}
\newcommand{\resumeitem}[1]{\vspace{2em}{\sihao\sffamily{#1}}\vspace{.5em}\par}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 自定义命令
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand*{\ziju}[1]{\renewcommand{\CJKglue}{\hskip #1}}%字距
\newcommand{\pozhehao}{\kern0.3ex\rule[0.8ex]{2em}{0.1ex}\kern0.3ex}%破折号
\def\zzu@setup@pdfinfo{%pdf文档信息
  \hypersetup{%TODO no use.
    pdftitle={\zzu@ctitle},
    pdfauthor={\zzu@cauthor},
    pdfsubject={\zzu@subtitle},
    pdfkeywords={\zzu@ckeywords},
    pdfcreator={\zzu@cauthor},
    pdfproducer={\zzuthesis}}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 延迟的代码 (Delaying code)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtEndOfClass{\input{zzuthesis.cfg}}
\AtBeginDocument{\CJKindent}
\AtEndOfClass{\sloppy\zzu@item@space}
\endinput
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% End of file `zzuthesis.cls'.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
