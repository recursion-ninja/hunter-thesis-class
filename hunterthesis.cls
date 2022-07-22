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
%
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
%   - [ ] Abstract & Keywords
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
%  -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

\LoadClass[%
paper=A4,               % paper size
parskip=half,           % spacing value / method for paragraphs
chapterprefix=true,     % prefix for chapter marks
11pt,                   % font size
headings=normal,        % size of headings
bibliography=totoc,     % include bib in toc
listof=totoc,           % include listof entries in toc
listof=numberline,      % include listof entries in toc
listof=nochaptergap,
titlepage=on,           % own page for each title page
captions=tablebelow,    % display table captions above the float env
chapterprefix=false,    % do not display a prefix for chapters
appendixprefix=false,   % but display a prefix for appendix chapter
draft=false,            % value for draft version
toc=flat,
toc=numberline,
toc=totoc
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
\global\let\@annum\@empty

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
\global\let\annum\relax

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
\def \annum#1{\def\@annum{#1}}
%----------------------------- Hunter Thesis variables -------------------------


%----------------------------- Hunter Thesis document class parameters ---------
\RequirePackage{xkeyval}
% OPTION bibfile
% --> values = file name of your bibtex file
\define@key[ct]{hunterthesis}{bibfile}[referencez]{\def\hunterthesis@bibfile{#1} \def\@citationfile{#1}}
\setkeys[ct]{hunterthesis}{bibfile=referencez}

\ProcessOptionsX[ct]<hunterthesis>
%----------------------------- Hunter Thesis document class parameters ---------


%----------------------------- Clean Thesis as starting template ---------------
\RequirePackage[dvipsnames,svgnames,hyperref]{xcolor}
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
bibsorting=anyt,
figuresep=colon,
bibfile=\hunterthesis@bibfile
}{cleanthesis}%
\usepackage{cleanthesis}
\KOMAoptions{twoside=false}
%----------------------------- Clean Thesis as starting template ---------------


%----------------------------- Setup table of contents -------------------------
\usepackage{tocbibind}
\usepackage[english]{babel}
\addto\captionsenglish{%
  \renewcommand{\contentsname}{Table of Contents}%
  \renewcommand{\bibname}{References}%
}
\newcommand*\tocentryformatnormal[1]{{\sffamily#1}}
\newcommand*\tocentryformatstrong[1]{{\sffamily\bfseries#1}}
\BeforeTOCHead[toc]{%
  \KOMAoptions{parskip=false}% no parskip in ToC
  \RedeclareSectionCommand[afterskip=1sp minus 1sp]{chapter}% no skip after ToC title
}
\RedeclareSectionCommands
  [
    tocentryformat=\tocentryformatnormal,
    tocindent=0in,
    tocnumwidth=0.45in,
    tocpagenumberformat=\tocentryformatnormal
  ]
  {section,subsection,subsubsection,paragraph,subparagraph}
\RedeclareSectionCommands
  [
    tocentryformat=\tocentryformatstrong,
    tocindent=0in,
    tocnumwidth=0.375in,
    tocpagenumberformat=\tocentryformatnormal
  ]
  {chapter}

\DeclareTOCStyleEntry[beforeskip=-0.1in]{chapter}{chapter}
\DeclareTOCStyleEntry[beforeskip=-0.1in]{section}{section}
\DeclareTOCStyleEntry[beforeskip=-0.1in]{default}{subsection}
\DeclareTOCStyleEntry[beforeskip=-0.1in]{default}{subsubsection}
%----------------------------- Setup table of contents -------------------------


%----------------------------- Setup bibliography backreferencing --------------
\DefineBibliographyStrings{english}{%
    andothers = {{et\,al\adddot}}, % 'et al.' instead of 'u.a.'
    backrefpage = {{cited on page}},%
    backrefpages = {{cited on the pages}},%
}
%----------------------------- Setup bibliography backreferencing --------------


%----------------------------- Setup hyperref-package options ------------------
\definecolor{LinkBlue}{RGB}{24,112,176}
\hypersetup{
    pdftitle    = {\@title},      %   - title (PDF meta)
    pdfsubject  = {\@department}, %   - subject (PDF meta)
    pdfauthor   = {\@author},     %   - author (PDF meta)
    pdfborder   = {0 0 0},        %   -
    breaklinks  = true,           %   - allow line break inside links
    colorlinks  = true,           %   - colorize links?
    linkcolor   = black,
    anchorcolor = LinkBlue,
    citecolor   = LinkBlue,
    urlcolor    = LinkBlue
}
%----------------------------- Setup hyperref-package options ------------------


%----------------------------- Setup glossary options --------------------------
\usepackage[acronyms,shortcuts,toc,section=chapter,numberedsection=autolabel]{glossaries}
\setacronymstyle{long-short}
\makenoidxglossaries
%----------------------------- Setup glossary options --------------------------


%----------------------------- Modify paragraph format -------------------------
\newlength\savedparfillskip
\newcommand*{\saveparfillskip}[1]{\setlength{\savedparfillskip}{\dimexpr\parfillskip\relax}}
\AddtoDoHook{heading/postinit/chapter}{\saveparfillskip}
\renewcommand{\chapterlinesformat}[3]{%
    \ctchaptertitle{#3}%
    #2%
    \hspace{-\savedparfillskip}%
}
%----------------------------- Modify paragraph format -------------------------


%----------------------------- Other packages ----------------------------------
\usepackage{scrhack} % Must come first
\usepackage{amsmath}
\usepackage{changepage}
\usepackage{etoolbox}
\usepackage[margin=1.0in,bottom=1.25in]{geometry}
\usepackage{latexsym}
\usepackage{lmodern}
\usepackage{setspace}
\usepackage[figure,table]{totalcount}
\usepackage[normalem]{ulem}
\usepackage{xifthen}

%----------------------------- Other packages ----------------------------------


%--------------------------------- Custom Title Page ---------------------------
\renewcommand{\maketitle}{
\thispagestyle{empty}
\parindent=0pt
\KOMAoptions{fontsize=12pt}
\begin{center}
\singlespacing
~\vfill
\Huge\@title\normalsize
\\[0.25in]
by
\\[0.25in]
\Large\@author\normalsize
\\[0.625in]
Submitted in partial fulfillment\\
of the requirements for the degree of\\
Master of Arts in \@department, Hunter College\\
The City University of New York
\\[0.625in]
\@annum
\\[1.6875in]
\uline{\makebox[2.5in][l]{~~~\@date}} \hfill \uline{\makebox[2.5in][l]{~~~\@advisor}}    \\[0.0625in]
       \makebox[2.5in][l]{~~~Date}    \hfill        \makebox[2.5in][l]{~~~Thesis Sponsor}\\[1.1875in]
\uline{\makebox[2.5in][l]{~~~\@date}} \hfill \uline{\makebox[2.5in][l]{~~~\@reader}}     \\[0.0625in]
       \makebox[2.5in][l]{~~~Date}    \hfill        \makebox[2.5in][l]{~~~Second Reader}
\end{center}
\KOMAoptions{fontsize=11pt}
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

\newcommand{\ThesisAbstract}{
  \ifdefempty{\@abstract}
  {
    \PackageError{hunterthesis}{Abstract is empty!}
      {Please provide your abstract with the \\abstract\{\} command. No more than 50 words permitted!}
  }
  {
    \ifdefempty{\@keywords}
    {
      \PackageError{hunterthesis}{Keywords is empty!}
        {Please provide your keywords with the \\keywords\{\} command. Exactly 10 keywords required!}
    }
    {
      \newcommand{\AbstractPagePadding}{0.625in}
      \chapter*{Abstract}
      \addxcontentsline{toc}{chapter}[]{Abstract}
      \begin{adjustwidth}{\AbstractPagePadding}{\AbstractPagePadding}
      \@abstract
      \end{adjustwidth}
      \chapterheadendvskip
      {\large \textbf{Keywords}}
      \begin{adjustwidth}{\AbstractPagePadding}{\AbstractPagePadding}
      \@keywords
      \end{adjustwidth}
      \clearpage
    }
  }
}

\newcommand{\ThesisTableOfContents}{\tableofcontents\clearpage}

\newcommand{\ThesisListOfFigures}{\iftotalfigures\listoffigures\clearpage\fi}

\newcommand{\ThesisListOfTables}{ \iftotaltables \listoftables \clearpage\fi}
%--------------------------------- Front-matter Pages --------------------------


%---------------------------------  Back-matter Pages --------------------------
\newcommand{\ThesisAbreviations}{%
  \printnoidxglossary[type=acronym,title={Appendix: Abreviations}]
  \clearpage
}

\newcommand{\ThesisReferences}{%
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


%--------------------------------- Exported Commands ---------------------------
\newcommand{\DefineAbbreviation}[2]{\newacronym{#1}{#1}{#2}}

\newcommand{\Abrev}[1]{\gls{#1}}


\newcommand{\ThesisFrontmatter}{%
% Always use Arabic numbering, even in Front-matter
\setcounter{page}{1}
\pagenumbering{arabic}

\ThesisTitlePage

% Always use *double* spacing outside of Back-matter
\doublespacing

% Other Front-matter pages
\ThesisNewPage{Dedication}{\@dedication}
\ThesisNewPage{Acknowledgments}{\@acknowledge}
\ThesisAbstract
\ThesisTableOfContents
\ThesisListOfFigures
\ThesisListOfTables
}


\newenvironment{ThesisBackmatter}%
{%
\clearpage
% Always use *single* spacing within Back-matter
\singlespacing
\appendix
\ThesisAbreviations
}%
{%
\ThesisReferences
}%
