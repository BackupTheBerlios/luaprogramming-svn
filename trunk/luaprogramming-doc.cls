\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{luaprogramming-doc}[2010/03/01 Class for typesetting the open source `Lua Programming' textbook]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions
\LoadClass[a4paper,12pt,twoside]{book}
\RequirePackage[landscape,margin=1in,top=1in,bottom=1in]{geometry}
\RequirePackage{xcolor}
\RequirePackage[colorlinks,
            plainpages=false,
            linkcolor=black,
            bookmarksopen]{hyperref}
\RequirePackage{makeidx}
\RequirePackage{fourier}
\RequirePackage[scaled]{helvet}
\RequirePackage[scaled]{beramono}
\RequirePackage{pifont}
\RequirePackage{bbding}
\RequirePackage{ragged2e}
\RequirePackage{caption}
\RequirePackage{graphicx}
\RequirePackage{multicol}
\RequirePackage{enumerate}
\RequirePackage{fancybox}
\RequirePackage{tikz}
\RequirePackage{pgf}
\RequirePackage[norotate,ttbnotitle,ttbnum]{flowfram}
\RequirePackage{shapepar}
\usetikzlibrary{shapes}
\definecolor{luablue}{rgb}{0.02,0.04,0.48}
\definecolor{luaorange}{rgb}{1,0.7,0.2}
\newlength{\leftwidth}
\newlength{\rightwidth}
\computeleftedgeodd{\leftwidth}
\setlength{\leftwidth}{-\leftwidth}
\addtolength{\leftwidth}{0.4\textwidth}
\setlength{\rightwidth}{\paperwidth}
\addtolength{\rightwidth}{-\leftwidth}
\vtwotone[1]{\leftwidth}{luaorange}{backleft}{\rightwidth}{luablue}{backright}
\vtwotone[none]{\rightwidth}{luablue}{lastbackright}{\leftwidth}{luaorange}{lastbackleft}
\vtwotonetop[odd]{1cm}{\leftwidth}{luaorange}{oddtopleft}{\rightwidth}{luablue}{oddtopright}
\vtwotonetop[even]{1cm}{\rightwidth}{luablue}{eventopleft}{\leftwidth}{luaorange}{eventopright}
\setlength{\marginparwidth}{2cm}
\newflowframe{0.6\textwidth}{\textheight}{0pt}{0pt}[main]
\newdynamicframe{0.38\textwidth}{\textheight}{0.62\textwidth}{0pt}[chaphead]
\setflowframe*{main}{evenx=0.4\textwidth}
\setdynamicframe*{chaphead}{evenx=0pt,clear}
\newstaticframe[none]{0.38\textwidth}{0.55\textheight}{0.62\textwidth}{0.45\textheight}[shapedt]
\setstaticframe*{shapedt}{evenx=0pt}
\newstaticframe[none]{0.38\textwidth}{0.45\textheight}{0.62\textwidth}{0pt}[shapedb]
\setstaticframe*{shapedb}{evenx=0pt}
\setflowframe*{main}{margin=inner}
\dfchaphead*{chaphead}
\appenddfminitoc*{chaphead}
\renewcommand{\DFchapterstyle}[1]{%
{\raggedright\sffamily\bfseries\Huge\color{blue}\thechapter. #1\par
}}
\renewcommand{\DFschapterstyle}[1]{{\raggedright\sffamily\bfseries\Huge\color{blue} #1\par
}}
\makethumbtabs{0.75in}
\enableminitoc
\setthumbtab{1}{backcolor=[rgb]{0.15,0.15,1}}
\setthumbtab{2}{backcolor=[rgb]{0.2,0.2,1}}
\setthumbtab{3}{backcolor=[rgb]{0.25,0.25,1}}
\setthumbtab{4}{backcolor=[rgb]{0.3,0.3,1}}
\setthumbtab{5}{backcolor=[rgb]{0.35,0.35,1}}
\setthumbtab{6}{backcolor=[rgb]{0.4,0.4,1}}
\setthumbtab{7}{backcolor=[rgb]{0.45,0.45,1}}
\setthumbtab{8}{backcolor=[rgb]{0.5,0.5,1}}
\newcommand{\thumbtabstyle}[1]{{\hypersetup{linkcolor=white}%
\textbf{\large\sffamily #1}}}
\setthumbtab{all}{style=thumbtabstyle,textcolor=white}
\pagestyle{plain}
\makedfheaderfooter
\newlength{\xoffset}
\computerightedgeodd{\xoffset}
\addtolength{\xoffset}{-2cm}
\newlength{\yoffset}
\computebottomedge{\yoffset}
\newcommand{\footstyle}[1]{\bfseries\LARGE #1}
\setdynamicframe*{footer}{oddx=\xoffset,y=\yoffset,width=2cm,height=2cm,
backcolor=blue,textcolor=white,style=footstyle,pages=none}
\computeleftedgeeven{\xoffset}
\setdynamicframe*{footer}{evenx=\xoffset}
\twocolumninarea[none]{0.6\textwidth}{\textheight}{0pt}{0pt}
\newcounter{N}
\newcounter{I}
\setcounter{N}{\value{maxflow}}
\addtocounter{N}{-2}
\whiledo{\value{N}<\value{maxflow}}{%
\stepcounter{N}\stepcounter{I}
\setflowframe{\value{N}}{label=oddcol\theI}}
\twocolumninarea[none]{0.6\textwidth}{\textheight}{0.4\textwidth}{0pt}
\setcounter{I}{0}
\setcounter{N}{\value{maxflow}}
\addtocounter{N}{-2}
\whiledo{\value{N}<\value{maxflow}}{%
\stepcounter{N}\stepcounter{I}
\setflowframe{\value{N}}{label=evencol\theI}}
\renewenvironment{theindex}{%
\setflowframe*{oddcol1,oddcol2}{pages=odd}%
\setflowframe*{evencol1,evencol2}{pages=even}%
\setdynamicframe*{chaphead}{clear=false}%
\clearpage
\mbox{}\framebreak\phantomsection
\setflowframe*{main}{pages=none}%
\setdynamiccontents*{chaphead}{\DFschapterstyle{\indexname}%
\idxnav}%
\addcontentsline{toc}{chapter}{\indexname}%
\setlength{\parindent}{0pt}%
\setlength{\parskip}{0pt plus .3pt}%
\let\item\@idxitem
}{%
\setdynamicframe*{chaphead}{clear}%
}
\newcommand{\chapdesc}[1]{%
\appenddynamiccontents*{chaphead}{\par
\emph{#1}}}
\renewenvironment{theindex}{%
\setflowframe*{oddcol1,oddcol2}{pages=odd}%
\setflowframe*{evencol1,evencol2}{pages=even}%
\setdynamicframe*{chaphead}{clear=false}%
\clearpage
\mbox{}\framebreak\phantomsection
\setflowframe*{main}{pages=none}%
\setdynamiccontents*{chaphead}{\DFschapterstyle{\indexname}%
\idxnav}%
\addcontentsline{toc}{chapter}{\indexname}%
\setlength{\parindent}{0pt}%
\setlength{\parskip}{0pt plus .3pt}%
\let\item\@idxitem
}{%
\setdynamicframe*{chaphead}{clear}%
}
\newcommand*{\idxgroupheading}[1]{%
\textbf{\hypertarget{idx:#1}{#1}}%
\protected@write\@auxout{}{\string\addtoidxnav{#1}}\indexspace}
\newcommand*{\idxgrouplink}[1]{%
\par\vskip5pt\textbf{\hyperlink{idx:#1}{#1}}}
\newcommand{\idxnav}{}
\newcommand*{\addtoidxnav}[1]{%
\toks@\expandafter{\idxnav}%
\xdef\idxnav{\the\toks@ \noexpand\idxgrouplink{#1}}%
}
\newcommand{\styni}[1]{\textsf{#1}}
\newcommand{\envni}[1]{\textsf{#1}}
\newcommand{\ctrni}[1]{\textsf{#1}}
\newcommand{\pkgoptni}[1]{\textsf{#1}}
\newcommand{\sty}[1]{\styni{#1}\index{#1@\styni{#1} package}}
\newcommand{\env}[1]{\envni{#1}\index{#1@\envni{#1} environment}}
\newcommand{\ctr}[1]{\ctrni{#1}\index{#1@\ctrni{#1} counter}}
\newcommand{\cmdname}[1]{\texttt{\symbol{92}#1}\index{#1@\texttt{\symbol{92}#1}}}
\newcommand{\meta}[1]{%
\textnormal{\ensuremath{\langle}\emph{#1}\ensuremath{\rangle}}}
\newcommand{\marg}[1]{\texttt{\char`\{#1\char`\}}}
\newcommand{\oarg}[1]{\texttt{[#1]}}
\newcommand{\appname}[1]{\texttt{#1}\index{#1@\texttt{#1}}}
\newcommand{\pkgopt}[1]{\pkgoptni{#1}\index{#1@\pkgoptni{#1} option}}
\newcommand{\key}[1]{#1\index{frame settings!#1}}
\newcommand{\dq}[1]{``#1''}
\newcommand*{\Index}[1]{#1\index{#1}}
\newsavebox\dfnsbox
\definecolor{defcol}{cmyk}{0,0,0.2,0}
\newlength\dfnlen
\newenvironment{definition}{%
\par\vskip10pt\noindent
\setlength{\dfnlen}{\linewidth}%
\addtolength{\dfnlen}{-2\fboxsep}%
\begin{lrbox}{\dfnsbox}%
\begin{minipage}{\dfnlen}\ignorespaces\ttfamily
}{%
\end{minipage}%
\end{lrbox}%
\colorbox{defcol}{\usebox{\dfnsbox}}%
\par
\vskip10pt\noindent\ignorespacesafterend}
\renewcommand\labelitemi{\HandRight}
\renewcommand\labelitemii{\HandRightUp}
\renewcommand\labelitemiii{\HandCuffRight}
\renewcommand\labelitemiv{\HandPencilLeft}
\captionsetup{
   margin = 10pt,
   font = {small,rm},
   labelfont = {small,bf},
   format = plain, % 
   indention = 0em,  % 
   labelsep = colon, %
   justification = RaggedRight, % 
   singlelinecheck = true, % 
   position = bottom %
}
\endinput
