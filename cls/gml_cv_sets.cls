% Class declaration
\ProvidesClass{cls/gml_cv_sets}
\LoadClass[]{article}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% Libraries import
\usepackage{fontawesome}
\usepackage[utf8]{inputenc}
\usepackage[default]{raleway}
\usepackage[margin=1cm, a4paper]{geometry}
\usepackage[T1]{fontenc}
\usepackage{xcolor}
\usepackage{hyperref}
\usepackage{paracol}
\usepackage{tikz}
\usepackage{smartdiagram}
\usepackage{float}
\usepackage{array}
\usepackage{titlesec}
\usepackage{pgfplots}
\usepackage{pgfplotstable}
\usepgfplotslibrary{polar}
\usepgfplotslibrary{statistics}
\usetikzlibrary{positioning}

% Colours definition
\definecolor{bluecol}{HTML}{212F3D}
\definecolor{purplecol}{HTML}{B66978}
\definecolor{redcol}{HTML}{D4213D}
\definecolor{whitecol}{HTML}{FFFFFF}
\definecolor{blackcol}{HTML}{000000}
\definecolor{lmargcol}{rgb}{0.25,0.25,0.25}

% Page style and indent settings
\pagestyle{empty}
\setlength{\parindent}{0cm}

% Hiperlinks setting that hides ugly blue borders
\hypersetup{hidelinks}

% Avoid line overflow
\setlength{\emergencystretch}{2pt}

% Format of the section titles
\titleformat{\section}{
\scshape\Large\raggedright\bfseries}{}{0em}{}[\titlerule]
\titlespacing{\section}{0pt}{12pt}{5pt}

% Backuground colors
\newcommand{\paracolbackgroundoptions}{
    \backgroundcolor{c[0](4pt,4pt)(0.5\columnsep,4pt)}[rgb]{0.25, 0.25, 0.25}
    \backgroundcolor{c[1](0.5\columnsep,4pt)(4pt,4pt)}[rgb]{1, 1, 1}
    \backgroundcolor{C[0](10000pt,10000pt)(0.5\columnsep,10000pt)}[rgb]{0.25,
    0.25, 0.25}
    \backgroundcolor{C[1](0.5\columnsep,10000pt)(10000pt,10000pt)}[rgb]{1, 1,
    1}}

% Side font color
\newcommand{\setasidefontcolour}{\color{white}}

% Font highlighting / boxes with background color 
\newcommand{\bg}[3]{\colorbox{#1}{\bfseries\color{#2}#3}}
\newcommand{\bgupper}[3]{\colorbox{#1}{\color{#2}\Large\bfseries
\MakeUppercase{#3}}}

% Header settings
\newcommand{\header}[7]{
\tikz[remember picture, overlay] {
\node[rectangle, fill=#5, anchor=north, minimum width=\paperwidth, 
minimum height=5cm](header) at (current page.north){};
\node[left=#7 of header.north, anchor=east](name) at (header.east) {
  \fontfamily{\sfdefault}\selectfont #2};
\node[anchor=south east](degree) at (name.north east) {\fontfamily{
  \sfdefault}\selectfont #1};
\node[anchor=north east](descr) at (name.south east) {\fontfamily{
  \sfdefault}\selectfont #3};
\node[right=#6 of header.west, anchor=west](picture) at (header.west) {};
\draw[path picture={\node[anchor=center] at (path picture bounding 
box.center){\includegraphics[height=4.3cm]{#4}} ;}] (picture) circle (2) ;}}

% First column settings
\setlength{\columnsep}{2cm}
\columnratio{0.3}[0.7]

% CV events
\newcommand{\cvevent}[4]{{#1} & \textbf{#2} \newline #3 \vspace{1.0em} & 
\raisebox{-0.7\height}{\includegraphics[height=0.9cm]{#4}}}
\newcommand{\cveventlong}[4]{{#1} & \textbf{#2} ~ -- ~ {\bg{bluecol}{white}{
  #3}} \newline \newline {\color{black!70} #4} \newline}

% CV degree
\newcommand{\cvdegree}[5]{{\footnotesize #1} & \textbf{\footnotesize #2} 
\newline {\footnotesize #3} \newline {\footnotesize #4} \vspace{0.3em} & 
\raisebox{-0.7\height}{\includegraphics[height=1.0cm]{#5}}}

% Bubble diagram
\smartdiagramset{bubble center node font = \footnotesize, bubble node font = 
\scriptsize, bubble center node size = 0.4cm, bubble node size = 0.4cm,
distance center/other bubbles = 0.4cm, distance text center bubble = 0.4cm,
bubble center node color = bluecol, set color list = {purplecol, purplecol, 
purplecol, purplecol, purplecol, purplecol, purplecol, purplecol, purplecol}, 
bubble fill opacity = 0.6, bubble text opacity = 1, description title text 
width=0.5cm, description title width=0.5cm, description width=5cm, 
description text width=5cm, descriptive items y sep =1.25, back arrow 
distance = 0, back arrow disabled = true, border color = bluecol}
\newcommand{\bubblediagram}[1]{\smartdiagram[bubble diagram]{#1}}

% Scatter plot
\pgfplotsset{compat=1.17}
\newcommand{\scatterplot}[2]{
  \begin{tikzpicture}
  \begin{axis}[
    width=6.3cm, height=6.3cm, enlargelimits=0.2, axis lines=left,
    xlabel={\color{whitecol} \textbf{#1}}, ylabel={\color{whitecol} 
    \textbf{#2}}, axis line style={draw=whitecol, line width=2pt}, tick 
    style={draw=whitecol}, tick label style={whitecol, font=\bfseries},
    xmin=20, xmax=100, ymin=1.5, ymax=7]
      \addplot[
          scatter/classes={a={purplecol,  fill opacity=0.6, draw=white},
          b={purplecol,  fill opacity=0.6, draw=white}}, scatter, mark=*,
          only marks, scatter src=explicit symbolic, nodes near 
          coords*={\Label}, nodes near coords align={horizontal}, every node 
          near coord/.append style={anchor=south, inner sep=5pt}, mark 
          options={mark size=4, line width=0.5pt}, visualization depends 
          on={value \thisrow{label} \as \Label}
      ] table [meta=class, row sep=\\, header=true]{
          x	y	class	label \\
          82	6	b	\bg{bluecol}{whitecol}{Python} \\
          38	3.2	a	\bg{bluecol}{whitecol}{JavaScript} \\
          65	5.3	a	\bg{bluecol}{whitecol}{MATLAB} \\
          72	4.3	a	\bg{bluecol}{whitecol}{VBA} \\
          60	4	a	\bg{bluecol}{whitecol}{R} \\
          58	2.5	a	\bg{bluecol}{whitecol}{SQL} \\
          75	3	a	\bg{bluecol}{whitecol}{\LaTeX} \\
          50	4.5	a	\bg{bluecol}{whitecol}{Git} \\
          30	2	a	\bg{bluecol}{whitecol}{Java} \\
      };
  \end{axis}
  \end{tikzpicture}
}

% Radar plot
\newcommand{\radarplot}{
  \begin{tikzpicture}
    \begin{polaraxis}[
        width=5cm, height=5cm, xtick={0, 40, ..., 320},
        xticklabels={\bg{bluecol}{whitecol}{pandas}, 
        \bg{bluecol}{whitecol}{matplotlib}, \bg{bluecol}{whitecol}{NumPy},
        \bg{bluecol}{whitecol}{PyTorch}, \bg{bluecol}{whitecol}{Scikit-learn},
        \bg{bluecol}{whitecol}{QuantLib}, \bg{bluecol}{whitecol}{Plotly},
        \bg{bluecol}{whitecol}{SQLAlchemy},
        \bg{bluecol}{whitecol}{SciPy}}, ytick={2,4,6,8,10}, yticklabels={},
        ymin=0, ymax=10, grid=both, major grid style={whitecol}, minor grid 
        style={whitecol}, every axis plot/.append style={thick}
    ]
    \addplot[color={purplecol}, fill={purplecol}, fill opacity=0.8,
    line width=1mm] coordinates {
      (0,8)(40,7)(80,9)(120,6)(160,5)(200,8)(240,7)(280,6)(320,9)(0,8)};
    \end{polaraxis}
\end{tikzpicture}
}

% Hashtag
\newcommand{\hashtag}[1]{
  \tikz[baseline]\node[draw=whitecol, rounded corners, inner sep=0.4em]{
    \color{whitecol} \scriptsize \faHashtag ~ \textbf{#1}};}

% Strengths hashtags
\newcommand{\shashtag}[1]{
  \tikz[baseline]\node[draw=bluecol, rounded corners, inner sep=0.4em, thick]{
    \color{bluecol}\textbf{#1}};}

% Icon
\newcommand{\icon}[3]{\phantom{x}{#3\color{#2}#1}\phantom{x}}

% Hobby icons
\newcommand{\hobbyicon}[5]{
\begin{tikzpicture}
\draw[draw=none, fill=#3] (0,0) circle (0.5);
\node[](icon) at (0,0) {#4#1};
\node[below=#5, align=center] at (icon) {\scriptsize \textbf{#2}};
\end{tikzpicture}}

% Dot plot
\newcommand{\dotplot}[6]{
\pgfmathparse{#3 - 1}\foreach \n in {0,...,\pgfmathresult}{\icon{#1}{#2}{#6}}
\pgfmathparse{#5 - 1}\foreach \n in {0,...,\pgfmathresult}{\icon{#1}{#4}{#6}}}

% Bar plot
\newcommand{\barrule}[3]{\hspace{0.5em}
{\color{#3}\rule[\baselineskip]{#1\textwidth}{#2}}\vspace{0.5em}}