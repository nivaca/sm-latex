\ProvidesClass{smbook}
        [2023/07/13 smbook class]

\LoadClass[12pt,
twoside,
% draft,
final,
]{memoir}


\newif\ifsmcolor % use colors? 
% \smcolorfalse
\smcolortrue


%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%% babel      %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% 
\usepackage[english, german, french,
% greek,
greek.polytonic,
welsh, french, medievallatin,
spanish .minimal .nolists .nolayout .noshorthands .noquoting .uppernames .tabla
]{babel}



%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%% fonts      %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% 
\usepackage{fontspec}
\defaultfontfeatures{Ligatures=TeX, Scale=MatchLowercase}
\setmainfont[Ligatures=Common,
Numbers = OldStyle,
% BoldFont = {* SemiBold},
% BoldItalicFont = {* SemiBold Italic}, 
SmallCapsFeatures = {LetterSpace=5},
ItalicFeatures = {Scale=1},
]%
{TeX Gyre PagellaX}
% {Palatine Parliamentary}
% {Linux Libertine O}
% {EB Garamond}
% {Junicode Two Beta}
% {Baskervillef}
% {Cochineal}
% {Domitian}
% {Coelacanth}
% {TeX Gyre Pagella}
% {GaramondLibre}
% {Palatino Linotype}
% {Minion Pro}

% \babelfont[greek]{rm}{CMU Serif}
\babelfont[greek]{rm}{Libertinus Serif}
% \babelfont[greek]{rm}{Galatia Sil}
% \babelfont[greek]{rm}{GFSDidot}
% \babelfont[greek]{rm}{Palatino Linotype}

\setmonofont[Scale=MatchLowercase]{JetBrains Mono NL}



%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%% microtype    %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% 
\usepackage[babel=true,
verbose=false,
tracking=true,
expansion=true,
protrusion=true,
final]{microtype}
% \SetTracking{encoding = *, shape = sc}{25}
% \SetTracking[context = notracking, ]{encoding = *}{0}
% \SetTracking[context = largetracking, ]{encoding = *}{75}



%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%% load packages  %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% 
\usepackage[autostyle=false,
  style=british, %mexican
  maxlevel=4]{csquotes}
\usepackage{latexcolors}
\usepackage{xparse}
\usepackage{etoolbox}
% \usepackage[margin=3cm]{geometry}
\usepackage{graphicx}
\usepackage{relsize}
\usepackage{booktabs}
\usepackage{lua-widow-control}


%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%% settings     %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% 
\righthyphenmin=62
\lefthyphenmin=62
\clubpenalty=9996
\widowpenalty=9999
\brokenpenalty=4991
\predisplaypenalty=10000
\postdisplaypenalty=1549
\displaywidowpenalty=1602
\flushbottom
\raggedbottom
\midsloppy
% \parindent=0pt
\parindent=14pt
\frenchspacing
\linespread{1.2}

% Widow Control
\usepackage{lua-widow-control}


%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%% chapterstyle   %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% 
\makeatletter
\makechapterstyle{smtrad}{%
  \chapterstyle{default}
  \setlength{\beforechapskip}{4em \@plus 1ex \@minus .2ex}
  \renewcommand*{\chapterheadstart}{\vspace*{\beforechapskip}}
  \renewcommand*{\printchaptername}{\centering}
  \renewcommand*{\chapternamenum}{}
  \renewcommand*{\printchapternum}{\centering}
  \renewcommand*{\afterchapternum}{}
  \renewcommand*{\printchaptertitle}[1]{\LARGE\itshape##1}
  \renewcommand*{\afterchaptertitle}{\vskip3\onelineskip}}
\chapterstyle{smtrad}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%% section style   %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% 
\setsecheadstyle{\Large\itshape\centering}


%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%% pagestyle     %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% 
\makeatletter
\makepagestyle{smtrad}
\newcommand*{\@smtradmarks}{%
  \nouppercaseheads
  \createmark{chapter}{both}{nonumber}{}{}
  % \createmark{section}{right}{nonumber}{}{}
  \createplainmark{toc}{both}{\contentsname}
  \createplainmark{lof}{both}{\listfigurename}
  \createplainmark{lot}{both}{\listtablename}
  \createplainmark{bib}{both}{\bibname}
  \createplainmark{index}{both}{\indexname}
  \createplainmark{glossary}{both}{\glossaryname}}
\makepsmarks{smtrad}{\@smtradmarks}
\makeevenhead{smtrad}{}{\leftmark}{}
\makeoddhead{smtrad}{}{\rightmark}{}
\makeatother

% % FOOTER ----------------------------------

\newcommand*{\SMVerCmd}{{%
    \tiny%
    \ifsmcolor\color{darkred}\fi%
    v.~\SMVersion}}
\newcommand*{\CCURL}{{\tiny\href{https://creativecommons.org/licenses/by-nc-sa/4.0/}{CC BY-NC-SA 4.0}}}

\makeevenfoot{smtrad}{\SMVerCmd}{\thepage}{\CCURL}
\makeoddfoot{smtrad}{\SMVerCmd}{\thepage}{\CCURL}



%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%% custom part def. %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% 

\renewcommand{\partnamefont}{\normalfont\huge}
\renewcommand{\partnumfont}{\normalfont\huge}
\renewcommand{\parttitlefont}{\normalfont\huge}
\renewcommand{\printpartname}{\partnamefont \partname}
\renewcommand{\partnamenum}{}
\renewcommand{\printpartnum}{}
\renewcommand{\printparttitle}[1]{\parttitlefont #1}
\renewcommand{\mempartinfo}[3]{}
\renewcommand{\mempartstarinfo}[1]{}

\makeatletter
\long\def\@part[#1]#2{%
  \M@gettitle{#1}%
  \def\f@rtoc{#1}%
  \@nameuse{part@f@rtoc@before@write@hook}%
  % \phantomsection
  \MakeLinkTarget{}
  \mempreaddparttotochook
  \ifnum \c@secnumdepth >-2\relax
    \refstepcounter{part}%
    \addcontentsline{toc}{part}%
    {\protect\partnumberline{\thepart}\f@rtoc}%
    \mempartinfo{\thepart}{\f@rtoc}{#2}%
  \else
    \addcontentsline{toc}{part}{\f@rtoc}%
    \mempartinfo{}{\f@rtoc}{#2}%
  \fi
  \mempostaddparttotochook
  \partmark{#1}%
  {\centering
    \interlinepenalty \@M
    \parskip\z@
    \normalfont\thispagestyle{empty}
    \printparttitle{\textsc{\MakeTextUppercase{#2}}}\par}%
  \@endpart}
\makeatother


\AtBeginDocument{%
  \chapterstyle{smtrad} %
  \pagestyle{smtrad} %
}




%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%%        TOC       %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% 
\renewcommand*{\cftpartfont}{\large\bfseries\scshape}
\renewcommand*{\cftpartpagefont}{\bfseries\scshape}
\renewcommand*{\cftchapterfont}{\bfseries\scshape}
\renewcommand*{\cftchapterpagefont}{\bfseries\scshape}
\renewcommand*{\cftsectionfont}{\normalfont}
\renewcommand*{\cftsectionpagefont}{\normalfont}
\renewcommand*{\cftpartaftersnumb}{\quad}
\setlength{\cftbeforechapterskip}{6pt}
\setlength{\cftbeforesectionskip}{0pt}
% \setlength{\cftbeforefigureskip}{0pt}
% \setlength{\cftbeforetableskip}{0pt}
\cftsetindents{section}{1.5em}{2.2em}
% \cftsetindents{figure}{0em}{3.0em}
% \cftsetindents{table}{0em}{3.0em}
\setrmarg{3.55em}
\setpnumwidth{2em}
\AtEndDocument{\addtocontents{toc}{\par}}
\AtEndDocument{\addtocontents{lof}{\par}}
% \AtEndDocument{\addtocontents{lot}{\par}}
\setsecnumdepth{chapter}
\maxsecnumdepth{chapter}
\settocdepth{chapter}




%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%% bibliography   %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% 
\usepackage[authordate,
backend=biber,
citetracker=true,
hyperref=true,
parentracker=true,
backref=true,
indexing=cite,
]{biblatex-chicago}

\addbibresource{BibTradSM.bib}


\DeclareCiteCommand{\citeabbr}
{%\usebibmacro{cite:init}%
  \usebibmacro{prenote}}%
{\usebibmacro{citeindex}%
  \printtext[bibhyperref]{{\textscfull{\printfield{shorttitle}}}}}%
{\multicitedelim}%
{\usebibmacro{postnote}}

\DeclareCiteCommand*{\citeabbr}[\mkbibparens]
{%\usebibmacro{cite:init}%
  \usebibmacro{prenote}}%
{\usebibmacro{citeindex}%
  \printtext[bibhyperref]{{\textscfull{\printfield{shorttitle}}}}}%
{\multicitedelim}%
{\usebibmacro{postnote}}

\newcommand*{\sv}{s.v.\ifcsundef{isdot}{\relax}{\isdot}}
\newcommand*{\svv}{s.vv.\ifcsundef{isdot}{\relax}{\isdot}}

\DefineBibliographyStrings{spanish}{%
  editor = {editor},
  editors = {editores},
  translator = {traductor},
  translators = {traductores},
  editortranslator = {editor y traductor},
  backrefpage= {Cit. en p.},
  backrefpages= {Cit. en pp.},
}
\urlstyle{tt}




%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%%       debug      %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% 
\usepackage{ifdraft}
\ifdraft%
  {\newcommand*{\ShL}{%
      \sidepar{{\ifsmcolor\color{ballblue}\fi\tiny\languagename}}}}%
  {\newcommand*{\ShL}{\relax}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%%       macros       %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{smmacros}
  

%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%%       index      %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% 
\makeindex
\makeindex[names]
\makeindex[titles]
\makeindex[lex] % lexemas
\makeindex[ms] % manuscritos
\makeindex[ed] % ediciones incunables latinas

\renewbibmacro*{citeindex}{\indexnames{labelname}{}}

\ifsmcolor
  \definecolor{Link}{HTML}{408080}
\else
  \definecolor{Link}{HTML}{000000}
\fi


%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%%     hyperref     %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{hyperref}
\ifsmcolor
  \hypersetup{
    final=true,
    colorlinks=true,
    allcolors=Link,
  }
\else
  \hypersetup{
    final=true,
    linkbordercolor = {white},
    hidelinks,
  }
\fi


%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%%     footnote     %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand*{\thefootnote}{\fnsymbol{footnote}}
% \usepackage[perpage]{footmisc}
\usepackage[perpage]{zref}
\zmakeperpage{footnote}



%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%%       debug      %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% 
\ifdraft%
  {%
    \usepackage[inline]{showlabels}%
    \renewcommand{\showlabelfont}{\tiny\ifsmcolor\color{darkred}\fi}%
  }%
  {\relax}%


  \endinput
  
  % ===============================================
  %%% Local Variables:
  %%% mode: latex
  %%% TeX-master: t
  %%% End: