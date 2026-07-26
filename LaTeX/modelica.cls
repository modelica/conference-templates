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
\ProvidesClass{modelica}[2026/07/26 v3.1 Modelica conference template]

% Layout / document-type options
\newif\ifmodelica@abstract
\newif\ifmodelica@userpresentation
\DeclareOption{abstract}{\modelica@abstracttrue}
\DeclareOption{userpresentation}{\modelica@userpresentationtrue}

% Bibliography backend (default: biber/biblatex)
\newif\if@biber
\@bibertrue
\DeclareOption{backend=bibtex}{\@biberfalse}
\DeclareOption{backend=natbib}{\@biberfalse}
\DeclareOption{backend=biber}{\@bibertrue}

\ProcessOptions\relax

% Mutual exclusion: user presentation wins over legacy abstract layout
\ifmodelica@userpresentation
  \ifmodelica@abstract
    \ClassWarningNoLine{modelica}{%
      Options 'userpresentation' and 'abstract' were both set;
      using 'userpresentation'}
  \fi
\fi

% Set up basic geometry according to document type
% Scientific papers and user presentations share the same page margins.
% The legacy 'abstract' option keeps its own (narrower) geometry.
\ifmodelica@userpresentation
  \LoadClass[11pt,a4paper,onecolumn]{article}
  \RequirePackage{geometry}            %% please don't change geometry settings!
  \geometry{left=18mm, right=18mm, top=25mm, bottom=25mm, noheadfoot}
\else
  \ifmodelica@abstract
    \LoadClass[11pt,a4paper,onecolumn]{article}
    \RequirePackage{geometry}            %% please don't change geometry settings!
    \geometry{left=35mm, right=35mm, top=15mm, bottom=20mm, noheadfoot}
  \else
    \LoadClass[11pt,a4paper,twocolumn]{article}
    \RequirePackage{geometry}            %% please don't change geometry settings!
    \geometry{left=18mm, right=18mm, top=25mm, bottom=25mm, noheadfoot}
  \fi
\fi

% Load packages as done in the example
\RequirePackage[main=english]{babel} %% we use English for the conference
\RequirePackage{graphicx}      %% use graphics
\RequirePackage[T1]{fontenc}   %% get hyphenation and accented letters right
\RequirePackage{mathptmx}      %% use fitting times fonts also in formulas
\RequirePackage{amsmath}       %% get support for pretty math formulas
\RequirePackage{courier}       %% For proper courier fonts in texttt
\RequirePackage{csquotes}      %% for language correct quotes since we use Babel
% do not change these lines:
\pagestyle{empty}                %% no page numbers!

% Some sizes
\renewcommand{\normalsize}  {\fontsize{10.5pt}{12.3pt}\selectfont}
\renewcommand{\small}       {\fontsize{09.5pt}{11.1pt}\selectfont}
\renewcommand{\footnotesize}{\fontsize{08.5pt}{09.9pt}\selectfont}

% Labels and captions
\RequirePackage[labelfont=bf, labelsep=period, font=small]{caption}  %% Get bold Figure/Table caption
                                                                 %% Set separator in figures to '.', set fontsize to small

% Prepare author info
\RequirePackage{authblk}                   %% Prepare author and affiliation blocks
\renewcommand\Authfont {\large}        %% Set author font
\renewcommand\Affilfont{\normalsize}   %% Set affiliation font
\renewcommand\Authsep  {\quad}         %% Set text between authors names
\renewcommand\Authand  {\quad}         %% Set text between authors names
\renewcommand\Authands {\quad}         %% Set text between authors names

% Redefine \author's \and
\def\and{\quad}

% Redefine \title to be \textbf and move it up to a height similar to the Word template
\let\modelica@title\title
\renewcommand{\title}[1]{\modelica@title{\vspace{-1.0cm}\textbf{#1}}}

% Redefine \date for it not to be used
\date{} % <--- leave date empty
\renewcommand{\date}[1]{ \ClassWarningNoLine{modelica}{Do not use the date command}}

% Redefine \maketitle to include \thispagestyle{empty}
\let\modelica@maketitle\maketitle
\renewcommand{\maketitle}{\modelica@maketitle\thispagestyle{empty}\@afterindentfalse\@afterheading}

% Make headings nice and compact and make sure to use a new version
\RequirePackage[compact]{titlesec}[2016/03/21]
\RequirePackage{doi}             %% Create correct hyperlinks for DOI numbers

% User presentations: no "Abstract" heading; keep body text flush with paper style
\ifmodelica@userpresentation
  \renewenvironment{abstract}{%
    \par\noindent\ignorespaces
  }{%
    \par
  }
  % Slightly tighter vertical spacing helps stay on a single page
  \titlespacing*{\section}{0pt}{1.0ex plus .2ex}{0.4ex plus .1ex}
  \AtBeginDocument{%
    \setlength{\abovecaptionskip}{4pt}%
    \setlength{\belowcaptionskip}{2pt}%
  }
\fi

\if@biber %% Process backend option "biber"
  \RequirePackage[backend=biber,
                  style=authoryear,
                  dashed=false,
                  dateabbrev=false,
                  maxcitenames=2,
                  maxbibnames=7,
                  urldate=iso,
                  date=iso,
                  seconds=true]
                  {biblatex}[2018/03/04 v3.11 programmable bibliographies (PK/MW)]
  \let\cite\parencite   %% normal \cite produces \parencite
  \let\modelica@printbibliography\printbibliography
  \renewcommand{\printbibliography}{\urlstyle{same}\modelica@printbibliography}%
  \AtBeginBibliography{\small}
  %
\else %% Process backend option "bibtex" / "natbib"
  \RequirePackage[round]{natbib}   %% author-year style referencing
%    \PassOptionsToClass{round}{natbib}
  \let\cite\citep              %% normal \cite produces \citep
  \let\modelica@bibliography\bibliography
  \renewcommand{\bibliography}[1]{\bibliographystyle{plainnat}\small\modelica@bibliography{#1}\normalsize}
\fi

% Professional tables
\RequirePackage{booktabs}

% Modelica code configuration
\RequirePackage{color}
\RequirePackage{listings}
\input{resources/listings-modelica.cfg}
\lstset{language = modelica,
       basicstyle=\fontsize{9pt}{10.5pt}\ttfamily,
       backgroundcolor = \color{white}}
\RequirePackage[autolanguage]{numprint}
\npthousandsep{\,}
