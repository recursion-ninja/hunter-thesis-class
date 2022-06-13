%% hunterthesis.cls
%% Copyright 2022 Alex Washburn
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
%  -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
%
%     *** *** *** ***      Hunter Thesis      *** *** *** ***
%
%  A LaTeX style for Theses of Hunter College Arts and Sciences
%
%  This is a modified, derivative work of Clean Thesis:
%
%    - http://cleanthesis.der-ric.de
%
%    - https://github.com/derric/cleanthesis#readme
%
%  -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
%
%  Hunter College of Arts and Sciences masters thesis preparation guidelines:
%
%  https://www.hunter.cuny.edu/artsci/graduate-education/guidelines-for-preparing-masters-theses-in-arts-sciences
%
%  Shorthand reference : Prep-Guide
%
%  -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

\LoadClass[%
paper=A4,               % paper size
parskip=half,           % spacing value / method for paragraphs
chapterprefix=true,     % prefix for chapter marks
12pt,                   % font size
headings=normal,        % size of headings
bibliography=totoc,     % include bib in toc
listof=totoc,           % include listof entries in toc
listof=numberline,      % include listof entries in toc
titlepage=on,           % own page for each title page
captions=tablebelow,    % display table captions above the float env
chapterprefix=false,    % do not display a prefix for chapters
appendixprefix=false,   % but display a prefix for appendix chapter
draft=false,            % value for draft version
toc=flat,
toc=numberline
]{scrreprt}%

\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{hunterthesis}[2022/06/10 v1.0.1 A LaTeX style Hunter College theses]
\PassOptionsToPackage{utf8}{inputenc}
\usepackage{inputenc}

%----------------------------- Hunter Thesis variables -------------------------
\global\let\@abstract\@empty
\global\let\@advisor\@empty
\global\let\@acknowledge\@empty
\global\let\@author\@empty
\global\let\@citationfile\@empty
\global\let\@date\@empty
\global\let\@dedication\@empty
\global\let\@department\@empty
\global\let\@director\@empty
\global\let\@keywords\@empty
\global\let\@reader\@empty
\global\let\@thanks\@empty
\global\let\@title\@empty
\global\let\@year\@empty

\global\let\abstract\relax
\global\let\advisor\relax
\global\let\acknowledge\relax
\global\let\author\relax
\global\let\citationfile\relax
\global\let\date\relax
\global\let\dedication\relax
\global\let\department\relax
\global\let\director\relax
\global\let\keywords\relax
\global\let\reader\relax
\global\let\thanks\relax
\global\let\title\relax
\global\let\year\relax

\def \abstract#1{\def\@abstract{#1}}
\def \advisor#1{\def\@advisor{#1}}
\def \acknowledge#1{\def\@acknowledge{#1}}
\def \author#1{\def\@author{#1}}
\def \citationfile#1{\def\@citationfile{#1}}
\def \date#1{\def\@date{#1}}
\def \dedication#1{\def\@dedication{#1}}
\def \department#1{\def\@department{#1}}
\def \director#1{\def\@director{#1}}
\def \keywords#1{\def\@keywords{#1}}
\def \reader#1{\def\@reader{#1}}
\def \thanks#1{\def\@thanks{#1}}
\def \title#1{\def\@title{#1}}
\def \year#1{\def\@year{#1}}
%----------------------------- Hunter Thesis variables -------------------------


\RequirePackage{xkeyval}

% OPTION bibfile
% --> values = file name of your bibtex file
\define@key[ct]{hunterthesis}{bibfile}[referencez]{\def\hunterthesis@bibfile{#1} \def\@citationfile{#1}}
\setkeys[ct]{hunterthesis}{bibfile=referencez}

\ProcessOptionsX[ct]<hunterthesis>

% Use Clean Thesis formatting as the starting template
%\usepackage[bibfile=\hunterthesis@bibfile]{cleanthesis}
%\PassOptionsToPackage{
\PassOptionsToPackage{
sansserif=true,
colorize=full,
colortheme=bluemagenta,
quotesstyle=american,
configurelistings=true,
hangfigurecaption=false,
hangsection=false,
hangsubsection=false,
configurebiblatex=true,
bibsys=biber,
bibstyle=ieee-alphabetic,
bibsorting=nyt,
figuresep=colon,
bibfile=\hunterthesis@bibfile
}{cleanthesis}%
\usepackage{cleanthesis}

% Override some of Clean Thesis formatting
\KOMAoptions{twoside=false}
%\addtokomafont{chapter}{\sffamily}
%\addtokomafont{chapterentry}{\sffamily}
\KOMAoptions{toc=left}
%  toc=listof,
%  toc=listofnumbered,
%  toc=noprotrusion,
%  toc=numberline
%}


\newcommand*\tocentryformatnormal[1]{{\sffamily#1}}
\newcommand*\tocentryformatstrong[1]{{\sffamily\bfseries#1}}
\RedeclareSectionCommands
  [
    tocentryformat=\tocentryformatnormal,
    tocpagenumberformat=\tocentryformatnormal
  ]
  {section,subsection,subsubsection,paragraph,subparagraph}
\RedeclareSectionCommands
  [
    tocentryformat=\tocentryformatstrong,
    tocpagenumberformat=\tocentryformatnormal
  ]
  {chapter}


% Style Table of Content.
\deftocheading{toc}{Table Of Contents}


\hypersetup{% setup the hyperref-package options
    pdftitle    = {\@title},      %   - title (PDF meta)
    pdfsubject  = {\@department}, %   - subject (PDF meta)
    pdfauthor   = {\@author},     %   - author (PDF meta)
    pdfborder   = {0 0 0},        %   -
    breaklinks  = true,           %   - allow line break inside links
    colorlinks  = true,           %   - colorize links?
    colorlinks  = true,
    linkcolor   = blue,
    urlcolor    = blue,
    citecolor   = blue,
    anchorcolor = blue
}

\DefineBibliographyStrings{english}{%
    andothers = {{et\,al\adddot}}, % 'et al.' instead of 'u.a.'
    backrefpage = {{quoted on page}},%
    backrefpages = {{quoted on the pages}},%
}

\usepackage{tocbibind}
\usepackage{etoolbox}
\usepackage[figure,table]{totalcount}
\usepackage[normalem]{ulem}
\usepackage{xifthen}
\usepackage[margin=1.0in]{geometry}


%--------------------------------- Custom Title Page ---------------------------
\renewcommand{\maketitle}{
\thispagestyle{empty}
\parindent=0pt
\begin{center}
~\vfill
{\LARGE \@title}\\[0.25in]
\normalsize by\\[0.25in]
{\large \@author}\\[0.625in]
Submitted in partial fulfillment\\
of the requirements for the degree of\\
Master of Arts in \@department, Hunter College\\
The City University of New York\\[0.625in]
\@year\\[1.6875in]
\uline{\makebox[2.5in][l]{\@date}} \hfill \uline{\makebox[2.5in][l]{\@advisor}}\\[0.0625in]
\makebox[2.5in][l]{Date} \hfill \makebox[2.5in][l]{Thesis Sponsor}\\[1.1875in]
\uline{\makebox[2.5in][l]{\@date}} \hfill \uline{\makebox[2.5in][l]{\@reader}}\\[0.0625in]
\makebox[2.5in][l]{Date} \hfill \makebox[2.5in][l]{Second Reader}
\end{center}
\pagebreak
}

\newcommand{\ThesisTitlePage}{\maketitle}
%--------------------------------- Custom Title Page ---------------------------


%--------------------------------- Front-matter Pages --------------------------
\newcommand{\ThesisNewPage}[2]{\ifdefempty{#2}{}{
    \chapter*{#1}
    \addxcontentsline{toc}{chapter}[]{#1}
    #2\clearpage
}}

\newcommand{\ThesisAbstract}{\ThesisNewPage{Abstract}{\@abstract}}


%\newcommand{\ThesisAbstract}{\ifdefempty{\@abstract}{}{  
%    \chapter*{Abstract}
%    \addxcontentsline{toc}{chapter}[]{Abstract}
%    \@abstract
%    \clearpage
%}}

\newcommand{\ThesisDedication}{\ifdefempty{\@dedication}{}{  
    \chapter*{Dedication}
    \addxcontentsline{toc}{chapter}[]{Dedication}
    \@dedication
    \clearpage
}}

\newcommand{\ThesisAcknowledgments}{\ifdefempty{\@acknowledge}{}{
    \chapter*{Acknowledgments}
    \addxcontentsline{toc}{chapter}[]{Acknowledgments}
    \@acknowledge
    \clearpage
}}

\newcommand{\ThesisTableOfContents}{\tableofcontents\clearpage}

\newcommand{\ThesisListOfFigures}{\iftotalfigures\listoffigures\clearpage\fi}

\newcommand{\ThesisListOfTables}{ \iftotaltables \listoftables \clearpage\fi}

%--------------------------------- Front-matter Pages --------------------------

%---------------------------------  Back-matter Pages --------------------------
\newcommand{\ThesisBibliography}{%
  {%
    \setstretch{1.1}
    \renewcommand{\bibfont}{\normalfont\small}
    \setlength{\biblabelsep}{0pt}
    \setlength{\bibitemsep}{0.5\baselineskip plus 0.5\baselineskip}
    \printbibliography
  }
  \clearpage
}
%---------------------------------  Back-matter Pages --------------------------









% The Prep-Guide specified the following order of contents (when applicable).
%
%   - Title Page
%   - Dedication (optional)
%   - Acknowledgments (optional)
%   - Table of Contents
%   - List of Figures
%   - List of Tables
%   - Title of Chapters
%   - Appendices
%   - References
%
% The Hunter CS master's thesis template patitions the listed contents into 3 segements
%
% The 1st segment is "Front-Matter" and contains the following contents ([X] = added):
%
%   - [ ] Title Page
%   - [ ] Dedication (optional)
%   - [ ] Acknowledgments (optional)
%   - [X] Abstract (optional)
%   - [ ] Table of Contents
%   - [ ] List of Figures
%   - [ ] List of Tables
%
% The 2nd segment is "Body-Matter" and contains the author's creative/scientific work.
%
% The 3rd segment is "Back-Matter" and contains the following:
%
%   - [ ] Appendices (optional)
%   - [X] Glossary (optional)
%   - [ ] References
%

\newcommand{\ThesisFrontmatter}{%
%------------------------------------- Title Page -----------------------------
\ThesisTitlePage
%------------------------------------- Title Page -----------------------------

% Roman numerals for page counter in "Front-matter," after title page
\setcounter{page}{1}
\renewcommand{\thepage}{\roman{page}}

%------------------------------------- Dedication -----------------------------
\ThesisNewPage{Dedication}{\@dedication}
%------------------------------------- Dedication -----------------------------

%------------------------------------- Acknowledgments ------------------------
\ThesisNewPage{Acknowledgments}{\@acknowledge}
%------------------------------------- Acknowledgments ------------------------

%------------------------------------- Abstract -------------------------------
\ThesisNewPage{Abstract}{\@abstract}
%------------------------------------- Abstract -------------------------------

%------------------------------------- ToC ------------------------------------
\ThesisTableOfContents
%------------------------------------- ToC ------------------------------------

%------------------------------------- LoF ------------------------------------
\ThesisListOfFigures
%------------------------------------- LoF ------------------------------------

%------------------------------------- LoT ------------------------------------
\ThesisListOfTables
%------------------------------------- LoT ------------------------------------

% Arabic numerals for page counter after "Front-matter"
\clearpage
\setcounter{page}{1}
\renewcommand{\thepage}{\arabic{page}}
}

\newcommand{\ThesisBackmatter}{%
\clearpage
\ThesisBibliography
}
