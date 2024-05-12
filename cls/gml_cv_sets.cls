% Class declaration
\ProvidesClass{cls/gml_cv_sets}
\LoadClass[]{article}

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
\usetikzlibrary{positioning}

% Colours definition
\definecolor{bluecol}{HTML}{212F3D}
\definecolor{purplecol}{HTML}{B66978}
\definecolor{redcol}{HTML}{D4213D}
\definecolor{whitecol}{HTML}{FFFFFF}
\definecolor{blackcol}{HTML}{000000}
\definecolor{lmargcol}{rgb}{0.25,0.25,0.25}

% Size of icons
\newcommand{\iconsize}{\Large}
\newcommand{\paracolbackgroundoptions}{
    \backgroundcolor{c[0](4pt,4pt)(0.5\columnsep,4pt)}[rgb]{0.25, 0.25, 0.25}
    \backgroundcolor{c[1](0.5\columnsep,4pt)(4pt,4pt)}[rgb]{1, 1, 1}
    \backgroundcolor{C[0](10000pt,10000pt)(0.5\columnsep,10000pt)}[rgb]{0.25,
    0.25, 0.25}
    \backgroundcolor{C[1](0.5\columnsep,10000pt)(10000pt,10000pt)}[rgb]{1, 1,
    1}}
\newcommand{\setasidefontcolour}{\color{white}}

% Basic settings
\pagestyle{empty}
\setlength{\parindent}{0cm}
\newlength{\rightcolwidth}
\newlength{\leftcolwidth}
\setlength{\leftcolwidth}{0.3\textwidth}
\setlength{\rightcolwidth}{0.65\textwidth}

% First column settings
\setlength{\columnsep}{2cm}
\columnratio{0.3}[0.7]

% Passing options to article
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% Hiperlinks setting that hides ugly blue borders
\hypersetup{hidelinks}

% Avoid line overflow
\setlength{\emergencystretch}{2pt}

% Format of the section titles
\titleformat{\section}{
\scshape\Large\raggedright\bfseries}{}{0em}{}[\titlerule]
\titlespacing{\section}{0pt}{12pt}{5pt}
 
% Inspiration from:
% https://www.overleaf.com/latex/templates/altacv-template/trgqjpwnmtgv
\newcommand{\strentag}[1]{
  \tikz[baseline]\node[draw=bluecol, rounded corners, inner sep=0.4em, thick]{
    \color{bluecol}\textbf{#1}};}
\newcommand{\aostag}[1]{
  \tikz[baseline]\node[draw=whitecol, rounded corners, inner sep=0.4em]{
    \color{whitecol}\textbf{#1}};}

% Icon Cross
\newcommand{\interestcross}[7]{
\begin{tikzpicture}
\node[above=0.9em,text=#3] at (0,1) {#1 #4};
\node[below=0.9em,text=#3] at (0,-1) {#1 #5};
\node[right=0.1em,text=#3] at (1,0) {#1 #6};
\node[left=0.1em,text=#3] at (-1,0) {#1 #7};
\draw[line width=0.5mm,draw=#2] (-2,-2) -- (2,2);
\draw[line width=0.5mm, draw=#2] (-2,2) -- (2,-2);
\draw[white, line width=1.0mm] circle (0.9) (0,0);
\end{tikzpicture}}

% Inspiration from:
% https://github.com/Johayon/Data-Scientist-Resume-LaTeX/blob/master/twentysecondcv.cls
\smartdiagramset{bubble center node font = \scriptsize, bubble node font = 
\scriptsize, bubble center node size = 0.4cm, bubble node size = 0.4cm,
distance center/other bubbles = 0.4cm, distance text center bubble = 0.4cm,
bubble center node color = bluecol, bubble center node font = \small, set 
color list = {purplecol, purplecol, purplecol, purplecol, purplecol,
purplecol, purplecol, purplecol, purplecol}, bubble fill opacity = 0.6,
bubble text opacity = 1, description title text width=0.5cm, description 
title width=0.5cm, description width=5cm, description text width=5cm, 
descriptive items y sep =1.25, back arrow distance = 0, back arrow 
disabled = true, border color = white}
\newcommand{\bubblediagram}[1]{\smartdiagram[bubble diagram]{#1}}

% Hobby icon
\newcommand{\hobbyicon}[5]{
\begin{tikzpicture}
\draw[draw=none, fill=#3] (0,0) circle (0.5);
\node[](icon) at (0,0) {#4#1};
\node[below=#5, align=center] at (icon) {#2};
\end{tikzpicture}}

% Icon settings
\newcommand{\icon}[3]{\phantom{x}{#3\color{#2}#1}\phantom{x}}

% PictoFraction
\newcommand{\pictofraction}[6]{
\pgfmathparse{#3 - 1}\foreach \n in {0,...,\pgfmathresult}{\icon{#1}{#2}{#6}}
\pgfmathparse{#5 - 1}\foreach \n in {0,...,\pgfmathresult}{\icon{#1}{#4}{#6}}}

% Font highlighting / boxes with background color 
\newcommand{\bg}[3]{\colorbox{#1}{\bfseries\color{#2}#3}}
\newcommand{\bgupper}[3]{\colorbox{#1}{\color{#2}\huge\bfseries
\MakeUppercase{#3}}}

% Inspiration from: https://www.sharelatex.com/templates/cv-or-resume/fancy-cv
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

% Bar
\newcommand{\barrule}[3]{\hspace{0.5em}
{\color{#3}\rule[\baselineskip]{#1\textwidth}{#2}}\vspace{0.5em}}

% CV events
\newcommand{\cvevent}[4]{{#1} & \textbf{#2} \newline #3 \vspace{1.0em} & 
\raisebox{-0.7\height}{\includegraphics[height=0.9cm]{#4}}}
\newcommand{\cveventlong}[4]{{#1} & \textbf{#2} ~ -- ~ {\bg{bluecol}{white}{
  #3}} \newline \newline {\color{black!70} #4} \newline}

% CV degree
\newcommand{\cvdegree}[5]{{\footnotesize #1} & \textbf{\footnotesize #2} 
\newline {\footnotesize #3} \newline {\footnotesize #4} \vspace{0.3em} & 
\raisebox{-0.7\height}{\includegraphics[height=1.0cm]{#5}}}