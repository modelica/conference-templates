%% modelica.cls
%% Copyright 2015 DLR and the Modelica Association
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work is 'maintained' on GitHub:
%   https://github.com/modelica-association/conference-templates
%
% The Current Maintainers are: @akloeckner, @dietmarw.
%
% This work consists of all files in the GitHub repository except
% a) The files indicated by .gitignore files
% b) The GitHub management files .gitignore, *.md
%
% This class is created from the template for the Modelica 2015 conference
%
% Layout: Bernhard Thiele,  Linköping University, Sweden,  2015
% Author: Andreas Klöckner, DLR Oberpfaffenhofen, Germany, 2015
%
\ProvidesClass{modelica}[2015/05/20 v2.0 Modelica 2015 conference template]

% Declare an abstract option
\newif\ifmodelica@abstract
\DeclareOption{abstract}{\modelica@abstracttrue}
\ProcessOptions

% Set up basic geometry according to abstract option
\ifmodelica@abstract
	\LoadClass[11pt,a4paper,onecolumn]{article}
	\usepackage{geometry}            %% please don't change geometry settings!
	\geometry{left=35mm, right=35mm, top=15mm, bottom=20mm, noheadfoot}
\else
	\LoadClass[11pt,a4paper,twocolumn]{article}
	\usepackage{geometry}            %% please don't change geometry settings!
	\geometry{left=20mm, right=20mm, top=25mm, bottom=25mm, noheadfoot}
\fi

% Load packages as done in the example
\usepackage{graphicx}      %% use graphics
\usepackage[T1]{fontenc}   %% get hyphenation and accented letters right
\usepackage{mathptmx}      %% use fitting times fonts also in formulas
\usepackage{courier}       %% For proper courier fonts in texttt
% do not change these lines:
\pagestyle{empty}                %% no page numbers!

% Some sizes
\renewcommand{\normalsize}  {\fontsize{10.95pt}{12.3pt}\selectfont}
\renewcommand{\small}       {\fontsize{09.00pt}{11.1pt}\selectfont}
\renewcommand{\footnotesize}{\fontsize{08.00pt}{09.9pt}\selectfont}

% Labels and captions
\usepackage[labelfont=bf, labelsep=period, font=small]{caption}  %% Get bold Figure/Table caption
                                                                 %% Set separator in figures to '.', set fontsize to small

% Prepare author info
\usepackage{authblk}                   %% Prepare author and affiliation blocks
\renewcommand\Authfont {\large}        %% Set author font
\renewcommand\Affilfont{\normalsize}   %% Set affiliation font
\renewcommand\Authsep  {\quad}         %% Set text between authors names
\renewcommand\Authand  {\quad}         %% Set text between authors names
\renewcommand\Authands {\quad}         %% Set text between authors names

% Redefine \author's \and
\def\and{\quad}

% Redefine \title to be \textbf
\let\modelica@title\title
\renewcommand{\title}[1]{\modelica@title{\textbf{#1}}}

% Redefine \date for it not to be used
\date{} % <--- leave date empty
\renewcommand{\date}[1]{ \ClassWarningNoLine{modelica}{Do not use the date command}}

% Redefine \maketitle to include \thispagestyle{empty}
\let\modelica@maketitle\maketitle
\renewcommand{\maketitle}{\modelica@maketitle\thispagestyle{empty}\@afterindentfalse\@afterheading}

% Make headings nice and compact
\usepackage[compact]{titlesec}

% Make sure, the bibstyle is used
\usepackage[round]{natbib}   %% author-year style referencing
\usepackage{doi}             %% Create cor­rect hy­per­links for DOI num­bers
\let\cite\citep              %% normal \cite produces \citep
\let\modelica@bibliography\bibliography
\renewcommand{\bibliography}[1]{\bibliographystyle{plainnat}\small\modelica@bibliography{#1}\normalsize}

