%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  enslyonstage.cls  —  Internship report class for ENS de Lyon Biosciences
%  Version 2.0  (2026-07-29)
%
%  Copyright (C) 2026  Adama Mbaye
%  SPDX-License-Identifier: LPPL-1.3c
%
%  This work may be distributed and/or modified under the conditions of
%  the LaTeX Project Public License, either version 1.3c of this license
%  or (at your option) any later version.
%  The latest version of this license is in:
%    https://www.latex-project.org/lppl/lppl-1-3c/
%  and version 1.3c or later is part of all distributions of LaTeX
%  version 2008 or later.
%
%  This work has the LPPL maintenance status `maintained'.
%  The Current Maintainer of this work is Adama Mbaye.
%
%  Based on SelfArx / Stylish Article (LaTeXTemplates.com)
%  Adapted for M1/M2 Biosciences internship reports at ENS de Lyon.
%
%  Usage:
%    \documentclass{enslyonstage}           % orange theme (default)
%    \documentclass[blue]{enslyonstage}     % named theme
%
%  Available themes (22):
%    orange (default) · violet  · blue   · red     · green  · teal   · gray
%    navy   · indigo  · purple  · pink   · crimson · amber  · gold
%    lime   · forest  · cyan    · azure  · slate   · brown  · wine   · midnight
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%TC:macro \insererfigure    [0,0,0,0]  % exclude figure captions from word count
%TC:macro \inserersuppfig  [0,0,0,0]  % supplementary figures excluded too
%TC:macro \abstracts        [0]        % abstract is NOT counted (ENS: body only)
%TC:macro \nombredemots     [0]
%TC:envir table             [0,0]      % exclude table bodies and captions
%TC:envir table*            [0,0]
% ↑ These directives are read by TeXcount (local) and Overleaf (Menu > Word Count)

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{enslyonstage}[2026/07/29 v2.0 ENS de Lyon Biosciences Internship Report]

%-----------------------------------------------------------------------------
%  THEME OPTIONS
%  Allows selecting color themes via class options like \documentclass[blue]{enslyonstage}
%  The theme controls the color scheme for headings, rules, links, and backgrounds
%-----------------------------------------------------------------------------

% Default theme color (orange)
\newcommand{\@theme}{orange}

% Declare available theme options
% Each option sets \@theme to the corresponding color name
% Original 7
\DeclareOption{orange}  {\renewcommand{\@theme}{orange}}
\DeclareOption{violet}  {\renewcommand{\@theme}{violet}}
\DeclareOption{blue}    {\renewcommand{\@theme}{blue}}
\DeclareOption{red}     {\renewcommand{\@theme}{red}}
\DeclareOption{green}   {\renewcommand{\@theme}{green}}
\DeclareOption{teal}    {\renewcommand{\@theme}{teal}}
\DeclareOption{gray}    {\renewcommand{\@theme}{gray}}
% 15 additional themes
\DeclareOption{navy}    {\renewcommand{\@theme}{navy}}
\DeclareOption{indigo}  {\renewcommand{\@theme}{indigo}}
\DeclareOption{purple}  {\renewcommand{\@theme}{purple}}
\DeclareOption{pink}    {\renewcommand{\@theme}{pink}}
\DeclareOption{crimson} {\renewcommand{\@theme}{crimson}}
\DeclareOption{amber}   {\renewcommand{\@theme}{amber}}
\DeclareOption{gold}    {\renewcommand{\@theme}{gold}}
\DeclareOption{lime}    {\renewcommand{\@theme}{lime}}
\DeclareOption{forest}  {\renewcommand{\@theme}{forest}}
\DeclareOption{cyan}    {\renewcommand{\@theme}{cyan}}
\DeclareOption{azure}   {\renewcommand{\@theme}{azure}}
\DeclareOption{slate}   {\renewcommand{\@theme}{slate}}
\DeclareOption{brown}   {\renewcommand{\@theme}{brown}}
\DeclareOption{wine}    {\renewcommand{\@theme}{wine}}
\DeclareOption{midnight}{\renewcommand{\@theme}{midnight}}

% Pass all other options to the base article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

%-----------------------------------------------------------------------------
%  BASE CLASS
%  Loads the standard article class with specific settings for internship reports
%  Note: twocolumn is NOT enabled here — the cover page needs to be one column,
%  and \fairepagedegarde will switch to two-column mode after the cover
%-----------------------------------------------------------------------------

\LoadClass[10pt,a4paper]{article}

%-----------------------------------------------------------------------------
%  REQUIRED PACKAGES
%  Packages are loaded in a specific order to avoid conflicts
%-----------------------------------------------------------------------------

% Conditional logic and calculations
\RequirePackage{ifthen}
\RequirePackage{calc}

% Mathematics support
\RequirePackage{amsmath,amsfonts,amssymb}

% Graphics handling
% Default search paths: figures/, logos/, and current directory
\RequirePackage{graphicx}
\graphicspath{{figures/}{logos/}{./}}

% Color support
\RequirePackage{xcolor}

% Table formatting
\RequirePackage{tabularx}
\RequirePackage{booktabs}

% Page number references
\RequirePackage{lastpage}

% Character encoding and fonts
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{palatino}      % Main text font
\RequirePackage{mathpazo}      % Math font matching Palatino
\RequirePackage[english]{babel}
\RequirePackage{csquotes}

% Page geometry settings
% ENS requirements: margins suitable for two-column layout
\RequirePackage[
left=1.8cm, right=1.8cm, top=2.5cm, bottom=2.5cm,
headheight=25pt,
columnsep=0.8cm,
a4paper
]{geometry}

% Caption formatting
% ENS style: small font, bold sans-serif labels, period separator
\RequirePackage[
font=small,
labelfont={bf,sf,small},
labelsep=period,
justification=justified
]{caption}
\setlength{\abovecaptionskip}{3pt}
\setlength{\belowcaptionskip}{0pt}

% Headers and footers
\RequirePackage{fancyhdr}

% Section title formatting
\RequirePackage[explicit]{titlesec}
\RequirePackage{titletoc}

% List formatting
\RequirePackage{enumitem}

% Chemical formulas (e.g., H2O, CO2)
\RequirePackage[version=4]{mhchem}

% Units and scientific notation
\RequirePackage{siunitx}
% Define custom units commonly used in biology
\DeclareSIUnit{\Molar}{M}   % Molarity: \SI{5}{\milli\Molar} → 5 mM
\DeclareSIUnit{\rpm}{rpm}   % Revolutions per minute: \SI{1500}{\rpm} → 1500 rpm

% Subfigures support
\RequirePackage{subcaption}

% Bibliography management with biblatex
% numeric-comp: numbered citations with automatic range compression [1-3]
% sorting=none: references appear in citation order
% backend=biber: modern bibliography processor (Overleaf default)
% maxbibnames=99: show all authors in bibliography
% giveninits=true: use initials for first names (J. Smith)
% doi/isbn/url/eprint=false: suppress these fields to save space (ENS max 35 refs)
\RequirePackage[
	style=numeric-comp,
	sorting=none,
	backend=biber,
	maxbibnames=99,
	maxcitenames=1,        % "Smith et al." from the 2nd author onward (PNAS style)
	mincitenames=1,
	giveninits=true,
	doi=false,
	isbn=false,
	url=false,
	eprint=false
]{biblatex}

% Enhanced float control
\RequirePackage{stfloats}  % Allows figure* placement at bottom [b] in twocolumn
\RequirePackage{placeins}  % \FloatBarrier command to prevent floats from drifting

% Decorative first letter (drop cap)
\RequirePackage{lettrine}

% Key-value option parsing
\RequirePackage{pgfkeys}

% Balance column lengths on last page
\RequirePackage{balance}

% File reading utilities
\RequirePackage{catchfile}

% Dummy text generator for examples
\RequirePackage{lipsum}

% Command patching
\RequirePackage{etoolbox}

% Background images
\RequirePackage{wallpaper}
\RequirePackage[absolute]{textpos}

% Microtypography improvements (loaded last)
\AtEndOfClass{\RequirePackage{microtype}}

% Hyperlinks and cross-references
% Initial load with hidelinks to prevent errors during TOC generation in twocolumn
% Colors will be restored in \AtBeginDocument (see below)
\RequirePackage[hidelinks,unicode,breaklinks]{hyperref}

% Patch \tableofcontents to suppress hyperref link warnings in vertical mode
% This is necessary because titletoc + hyperref + twocolumn can produce spurious warnings
\patchcmd{\tableofcontents}{\@starttoc{toc}}{%
	\begingroup\hypersetup{hidelinks}\@starttoc{toc}\endgroup}{}{}

% Ensure consistent column heights
\flushbottom

%-----------------------------------------------------------------------------
%  CLEVEREF — smart cross-references (must be loaded after hyperref)
%  Use \crefcolor{label} for a coloured cross-reference.
%  Use \crefcolor{fig:a,fig:b,fig:c} for multi-target coloured refs.
%  Do NOT add \usepackage{cleveref} in your .tex — it is already loaded here.
%-----------------------------------------------------------------------------
\RequirePackage[capitalise,noabbrev]{cleveref}
% Override abbreviated names to match the concise biology style of \autoref
\crefname{figure}{Fig.}{Figs.}
\crefname{table}{Table}{Tables}
\crefname{equation}{Eq.}{Eqs.}
\crefname{section}{Section}{Sections}
\crefname{subsection}{Section}{Sections}
% Coloured cleveref: \crefcolor{fig:a,fig:b} → coloured "Figs. 1 and 2"
% (colorMain is defined in \AtBeginDocument — safe to use here in a command
%  that is only ever called inside the document body)
\newcommand{\crefcolor}[1]{\textcolor{colorMain}{\cref{#1}}}

%-----------------------------------------------------------------------------
%  TYPOGRAPHY DEFAULTS
%  Sensible values for a two-column scientific report.
%  Suppress overly aggressive hyphenation and protect inline maths.
%  Individual words that still break badly can be fixed with
%    \hyphenation{hy-phen-a-tion} in the document preamble.
%-----------------------------------------------------------------------------
\hyphenpenalty=9900         % Strongly discourage (but not forbid) hyphenation
\tolerance=500              % Tighter line-breaking tolerance
\emergencystretch=2em       % Last-resort stretch to avoid overfull boxes
\relpenalty=10000           % Forbid breaks after relation symbols (=, <, >)
\binoppenalty=10000         % Forbid breaks after binary operators (+, -, ×)

%-----------------------------------------------------------------------------
%  COLOUR THEMES — 22 palettes
%
%  Each palette is stored as \ENS@pal@<name> (defined here, executed later).
%  Adding a new theme requires only one \def below + one \DeclareOption above.
%
%  Three colors per palette:
%    colorMain   — headings, rules, citation brackets, cross-reference links
%    colorAccent — URLs, secondary decorations (slightly lighter / brighter)
%    colorBg     — section-box and abstract-box background (very pale tint)
%
%  colorMain contrast against white: all themes target ≥ 4.5 : 1 (WCAG AA).
%-----------------------------------------------------------------------------

% ── Original 7 ────────────────────────────────────────────────────────────
\def\ENS@pal@orange  {\definecolor{colorMain}  {HTML}{E14D17}%  ENS Lyon official
                       \definecolor{colorAccent}{HTML}{E07820}%
                       \definecolor{colorBg}    {HTML}{FDF5EC}}
\def\ENS@pal@violet  {\definecolor{colorMain}  {HTML}{652080}%
                       \definecolor{colorAccent}{HTML}{9B4DB8}%
                       \definecolor{colorBg}    {HTML}{F4F0F7}}
\def\ENS@pal@blue    {\definecolor{colorMain}  {HTML}{1A5C9E}%
                       \definecolor{colorAccent}{HTML}{3A82C4}%
                       \definecolor{colorBg}    {HTML}{EDF4FB}}
\def\ENS@pal@red     {\definecolor{colorMain}  {HTML}{A62020}%
                       \definecolor{colorAccent}{HTML}{CC3333}%
                       \definecolor{colorBg}    {HTML}{FBF0F0}}
\def\ENS@pal@green   {\definecolor{colorMain}  {HTML}{1E6B3A}%
                       \definecolor{colorAccent}{HTML}{2E9955}%
                       \definecolor{colorBg}    {HTML}{EEF7F1}}
\def\ENS@pal@teal    {\definecolor{colorMain}  {HTML}{0E6B6B}%
                       \definecolor{colorAccent}{HTML}{1A9999}%
                       \definecolor{colorBg}    {HTML}{E8F6F6}}
\def\ENS@pal@gray    {\definecolor{colorMain}  {HTML}{3A3A3A}%
                       \definecolor{colorAccent}{HTML}{666666}%
                       \definecolor{colorBg}    {HTML}{F2F2F2}}
% ── Blues & darks ──────────────────────────────────────────────────────────
\def\ENS@pal@navy    {\definecolor{colorMain}  {HTML}{0D3B6E}%  marine profond
                       \definecolor{colorAccent}{HTML}{1E5A9C}%
                       \definecolor{colorBg}    {HTML}{E8F0FA}}
\def\ENS@pal@azure   {\definecolor{colorMain}  {HTML}{1D4ED8}%  bleu azure vif
                       \definecolor{colorAccent}{HTML}{2563EB}%
                       \definecolor{colorBg}    {HTML}{EFF6FF}}
\def\ENS@pal@indigo  {\definecolor{colorMain}  {HTML}{3730A3}%  indigo bleu-violet
                       \definecolor{colorAccent}{HTML}{4F46E5}%
                       \definecolor{colorBg}    {HTML}{EEEEFF}}
\def\ENS@pal@midnight{\definecolor{colorMain}  {HTML}{1E2D5C}%  bleu nuit
                       \definecolor{colorAccent}{HTML}{2A3D80}%
                       \definecolor{colorBg}    {HTML}{EBF0FA}}
\def\ENS@pal@slate   {\definecolor{colorMain}  {HTML}{334155}%  ardoise bleue
                       \definecolor{colorAccent}{HTML}{475569}%
                       \definecolor{colorBg}    {HTML}{F1F5F9}}
% ── Purples & pinks ────────────────────────────────────────────────────────
\def\ENS@pal@purple  {\definecolor{colorMain}  {HTML}{5B21B6}%  violet moyen
                       \definecolor{colorAccent}{HTML}{7C3AED}%
                       \definecolor{colorBg}    {HTML}{F3EEFF}}
\def\ENS@pal@pink    {\definecolor{colorMain}  {HTML}{9D174D}%  rose foncé
                       \definecolor{colorAccent}{HTML}{BE185D}%
                       \definecolor{colorBg}    {HTML}{FDF0F7}}
\def\ENS@pal@crimson {\definecolor{colorMain}  {HTML}{881337}%  cramoisi
                       \definecolor{colorAccent}{HTML}{A62153}%
                       \definecolor{colorBg}    {HTML}{FFF0F5}}
\def\ENS@pal@wine    {\definecolor{colorMain}  {HTML}{63152D}%  bordeaux
                       \definecolor{colorAccent}{HTML}{881F3D}%
                       \definecolor{colorBg}    {HTML}{FEF0F4}}
% ── Warm & earthy ──────────────────────────────────────────────────────────
\def\ENS@pal@amber   {\definecolor{colorMain}  {HTML}{92400E}%  ambre chaud
                       \definecolor{colorAccent}{HTML}{B45309}%
                       \definecolor{colorBg}    {HTML}{FFFBEB}}
\def\ENS@pal@gold    {\definecolor{colorMain}  {HTML}{7A5300}%  or foncé
                       \definecolor{colorAccent}{HTML}{9A6C00}%
                       \definecolor{colorBg}    {HTML}{FFFDE7}}
\def\ENS@pal@brown   {\definecolor{colorMain}  {HTML}{5C2D0E}%  brun chocolat
                       \definecolor{colorAccent}{HTML}{7C4015}%
                       \definecolor{colorBg}    {HTML}{FDF5EE}}
% ── Greens & cyans ─────────────────────────────────────────────────────────
\def\ENS@pal@lime    {\definecolor{colorMain}  {HTML}{365314}%  vert lime soutenu
                       \definecolor{colorAccent}{HTML}{4D7A1B}%
                       \definecolor{colorBg}    {HTML}{F7FEE7}}
\def\ENS@pal@forest  {\definecolor{colorMain}  {HTML}{14532D}%  forêt sombre
                       \definecolor{colorAccent}{HTML}{166534}%
                       \definecolor{colorBg}    {HTML}{E5F5ED}}
\def\ENS@pal@cyan    {\definecolor{colorMain}  {HTML}{0E6B8E}%  cyan profond
                       \definecolor{colorAccent}{HTML}{0891B2}%
                       \definecolor{colorBg}    {HTML}{ECFEFF}}

\AtBeginDocument{%
	%--- Select palette: dispatch on \@theme, fall back to orange if unknown ---
	\ifcsname ENS@pal@\@theme\endcsname
		\csname ENS@pal@\@theme\endcsname
	\else
		\ENS@pal@orange
	\fi%
	
	%--- Configure siunitx to use middle dot between units ---
	% Produces µg·mL⁻¹ instead of µg mL⁻¹ (ENS guideline for compound units)
	\sisetup{inter-unit-product=\cdot}%
	
	%--- Restore colored hyperlinks for document body ---
	% This happens after TOC patch to avoid link warnings
	% Links use colorMain, URLs use colorAccent
	\hypersetup{colorlinks=true, linkcolor=colorMain, citecolor=colorMain, urlcolor=colorAccent,
    pdftitle={\@titre}, pdfauthor={\@auteur},
    pdfsubject={\@master\ -- \@domaine}, pdfkeywords={\@keywords}}%
	
	%--- Configure biblatex citation style ---
	% Redefine \mkbibbrackets to create colored superscript citations like ^[1]
	% numeric-comp automatically compresses ranges: [1,2,3] becomes [1-3]
	\renewcommand{\mkbibbrackets}[1]{%
		\textsuperscript{\textcolor{colorMain}{[#1]}}}%
	
	% Bibliography list formatting: bold colored superscript numbers
	\DeclareFieldFormat{labelnumberwidth}%
		{{\bfseries\color{colorMain}\textsuperscript{[#1]}}}%
	
	% Bibliography font size and spacing
	\renewcommand{\bibfont}{\small}%
	\setlength{\bibitemsep}{0pt}%
	\setlength{\bibhang}{0pt}%
	
	%--- Configure \autoref cross-reference style ---
	% Save original \autoref command
	\let\@ENS@autoref\autoref
	% Redefine to wrap both prefix and number in colorMain
	\renewcommand{\autoref}[1]{\textcolor{colorMain}{\@ENS@autoref{#1}}}%
	
	%--- Set prefix labels for \autoref ---
	% These appear before reference numbers: "Fig. 1", "Table 2", "Section 3"
	\renewcommand{\figureautorefname}{Fig.}%
	\renewcommand{\tableautorefname}{Table}%
	\renewcommand{\sectionautorefname}{Section}%
	\renewcommand{\subsectionautorefname}{Section}%
	\renewcommand{\equationautorefname}{Eq.}%
	\providecommand{\suppfigautorefname}{Supplemental Figure}%
	
	%--- Caption label coloring ---
	% Makes "Figure 1." or "Table 1." appear in colorMain
	\DeclareCaptionFormat{coloured}{{\color{colorMain}#1#2}#3\par}%
	\captionsetup{format=coloured}%
	
	%--- Footer center logo setup ---
	% If \logoENS was set and user hasn't overridden \coinbascentre,
	% automatically place the ENS logo in footer center at 8mm height
	\ifx\@logoENS\empty\else
		\ifx\@coinbascentre@user\@undefined
			\coinbascentre{\includegraphics[height=8mm]{\@logoENS}}%
		\fi
	\fi
	
	%--- Apply fancy page style ---
	\pagestyle{fancy}%
}

%-----------------------------------------------------------------------------
%  METADATA COMMANDS
%  These commands store report information used on the cover page
%  Usage: \titre{Your title here}
%         \auteur{Firstname \textsc{Lastname}}
%         etc.
%-----------------------------------------------------------------------------

\newcommand{\titre}[1]      {\def\@titre{#1}}         % Report title (max 125 chars)
\newcommand{\auteur}[1]     {\def\@auteur{#1}}        % Student name
\newcommand{\master}[1]     {\def\@master{#1}}        % "M1" or "M2"
\newcommand{\domaine}[1]    {\def\@domaine{#1}}       % Biological domain
\newcommand{\datedebut}[1]  {\def\@datedebut{#1}}     % Internship start date
\newcommand{\datefin}[1]    {\def\@datefin{#1}}       % Internship end date
\newcommand{\laboratoire}[1]{\def\@laboratoire{#1}}   % Laboratory name and location
\newcommand{\abstracts}[1]  {\def\@abstracts{#1}}     % Abstract text (150-200 words)

% Visual / graphical abstract helper — optional, used INSIDE \abstracts{}
% Usage: \abstractimage{figures/graphical-abstract.pdf}
%   or   \abstractimage[0.8\textwidth]{figures/graphical-abstract.pdf}
% The image is centred inside the abstract box (already full-width).
% It is NOT counted toward words because \abstracts is excluded (%TC: above).
\newcommand{\abstractimage}[2][0.9\textwidth]{%
  \par\medskip%
  \begin{center}%
    \includegraphics[width=#1]{#2}%
  \end{center}%
}
\newcommand{\keywords}[1]   {\def\@keywords{#1}}      % Keywords (5-8 terms)

% Supervisor information (name and email)
\newcommand{\tuteurENS}[2]  {\def\@tuteurENSnom{#1}\def\@tuteurENSemail{#2}}
\newcommand{\tuteurstage}[2]{\def\@tuteurstagenom{#1}\def\@tuteurstagemail{#2}}

% Word count (for compliance with ENS limits: M1≤5000, M2≤4000 ±10%)
% Update before submission using: texcount -sum -1 main.tex
\newcommand{\nombredemots}[1]{\def\@nombredemots{#1}}

% Previous internships table
% Usage: \stagesanterieurs{ \stagerow{L3}{Lab}{Supervisor}{Topic} ... }
\newcommand{\stagesanterieurs}[1]{\def\@stagesanterieurs{#1}}
\newcommand{\stagerow}[4]{#1 & #2 & #3 & #4 \\}

% Initialize all metadata fields to empty
\def\@titre{}\def\@auteur{}\def\@master{}\def\@domaine{}
\def\@datedebut{}\def\@datefin{}\def\@laboratoire{}
\def\@abstracts{}\def\@keywords{}
\def\@tuteurENSnom{}\def\@tuteurENSemail{}
\def\@tuteurstagenom{}\def\@tuteurstagemail{}
\def\@nombredemots{}
\def\@stagesanterieurs{}

%-----------------------------------------------------------------------------
%  LOGO COMMANDS
%  Define logos to appear on cover page and in footer
%  Optional first argument sets display height
%  Usage: \logoENS[1.5cm]{logos/logo_ens.pdf}
%-----------------------------------------------------------------------------

% University logo (not used by default)
\newcommand{\@logoUniv}{}
\newcommand{\@logoUnivH}{1.8cm}
\newcommand{\logoUniv}[2][1.8cm]{%
	\renewcommand{\@logoUniv}{#2}\renewcommand{\@logoUnivH}{#1}}

% Master program logo (not used by default if \logoENS is set)
\newcommand{\@logoformation}{}
\newcommand{\@logoformationH}{1.8cm}
\newcommand{\logoformation}[2][1.8cm]{%
	\renewcommand{\@logoformation}{#2}\renewcommand{\@logoformationH}{#1}}

% Laboratory logo (appears on cover page between domain and info block)
\newcommand{\@logoLabo}{}
\newcommand{\@logoLaboH}{1.8cm}
\newcommand{\logoLabo}[2][1.8cm]{%
	\renewcommand{\@logoLabo}{#2}\renewcommand{\@logoLaboH}{#1}}

% ENS logo (appears in footer center at 8mm by default)
\newcommand{\@logoENS}{}
\newcommand{\@logoENSH}{1.8cm}
\newcommand{\logoENS}[2][1.8cm]{%
	\renewcommand{\@logoENS}{#2}\renewcommand{\@logoENSH}{#1}}

%-----------------------------------------------------------------------------
%  HEADER / FOOTER CUSTOMIZATION
%  Provides five customizable positions in header and footer
%  
%  Default layout:
%    HEADER:  [current section] ───────────────────── [report title wrapped]
%             ──────────────────────────────────────────────────────────────
%    
%    FOOTER:  ──────────────────────────────────────────────────────────────
%             [domain in small caps]  [ENS logo]  [page/total]
%  
%  Customization: Use \coinhautgauche{...}, \coinbasdroit{...}, etc.
%  to override any position
%-----------------------------------------------------------------------------

% Default header content
\newcommand{\@coinhautgauche}{\leftmark}  % Current section name
\newcommand{\@coinhautdroit}{%            % Report title, right-aligned
	\parbox[t]{0.6\linewidth}{\raggedleft\@titre}}

% Default footer content
\newcommand{\@coinbasgauche}{\textsc{\@domaine}}  % Domain in small caps
\newcommand{\@coinbascentre}{}                     % Logo (set in \AtBeginDocument)
\newcommand{\@coinbasdroit}  {\small\sffamily\bfseries\thepage/\pageref{LastPage}}  % Page numbers

% Commands to override default positions
\newcommand{\coinhautgauche}[1]{\renewcommand{\@coinhautgauche}{#1}}
\newcommand{\coinhautdroit}[1] {\renewcommand{\@coinhautdroit}{#1}}
\newcommand{\coinbasgauche}[1] {\renewcommand{\@coinbasgauche}{#1}}
\newcommand{\coinbascentre}[1] {\renewcommand{\@coinbascentre}{#1}%
	\def\@coinbascentre@user{}}  % Flag that user has customized this position
\newcommand{\coinbasdroit}[1]  {\renewcommand{\@coinbasdroit}{#1}}

% Configure header and footer rules
% Colored rules replace default fancyhdr rules
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}
% Draw colored horizontal rules above footer and below header
\renewcommand{\headrule}{\vspace{4pt}{\color{colorMain}\hrule width\headwidth height\headrulewidth}\vskip-\headrulewidth}
\renewcommand{\footrule}{\vskip-\footrulewidth{\color{colorMain}\hrule width\headwidth height\footrulewidth}}

% Clear all default header/footer content
\fancyhf{}

% Set header positions
\fancyhead[L]{\small\sffamily\@coinhautgauche}
\fancyhead[R]{\small\sffamily\@coinhautdroit}

% Set footer positions
\fancyfoot[L]{\small\sffamily\@coinbasgauche}
% Center footer element sits BELOW the footrule
% \smash prevents it from affecting footer box height (which would shift the rule)
\fancyfoot[C]{\smash{\raisebox{-\dimexpr\baselineskip+2pt\relax}{\@coinbascentre}}}
\fancyfoot[R]{\small\sffamily\@coinbasdroit}

%-----------------------------------------------------------------------------
%  SECTION STYLES
%  Formatting for section, subsection, subsubsection, and paragraph headings
%  Style inspired by SelfArx template
%  Uses \columnwidth for proper sizing in two-column layout
%-----------------------------------------------------------------------------

% Main section: colored background box spanning column width
\titleformat{\section}
{\color{colorMain}\large\sffamily\bfseries}{}
{0em}
{\colorbox{colorBg}{\parbox{\dimexpr\columnwidth-2\fboxsep\relax}%
		{\centering\thesection.\space#1}}}[]

% Unnumbered section (same style, no number)
\titleformat{name=\section,numberless}
{\color{colorMain}\large\sffamily\bfseries}{}
{0em}
{\colorbox{colorBg}{\parbox{\dimexpr\columnwidth-2\fboxsep\relax}%
		{\centering#1}}}[]

% Subsection: colored numbered heading
\titleformat{\subsection}
{\color{colorMain}\sffamily\bfseries}
{\thesubsection}{0.5em}{#1}[]

% Subsubsection: small bold heading
\titleformat{\subsubsection}
{\sffamily\small\bfseries}
{\thesubsubsection}{0.5em}{#1}[]

% Paragraph: colored bold run-in heading (inline with text)
\titleformat{\paragraph}[runin]
{\color{colorMain}\sffamily\small\bfseries}
{}{0em}{#1}

% Vertical spacing before and after headings
\titlespacing*{\section}      {0pc}{3ex \@plus4pt \@minus3pt}{5pt}
\titlespacing*{\subsection}   {0pc}{2.5ex \@plus3pt \@minus2pt}{0pt}
\titlespacing*{\subsubsection}{0pc}{2ex \@plus2.5pt \@minus1.5pt}{0pt}
\titlespacing*{\paragraph}    {0pc}{1.5ex \@plus2pt \@minus1pt}{10pt}

%-----------------------------------------------------------------------------
%  TABLE OF CONTENTS FORMATTING
%  Controls appearance of TOC entries
%  Remove \tableofcontents from main.tex if your supervisor doesn't require it
%-----------------------------------------------------------------------------

% Show sections, subsections, and subsubsections in TOC
\setcounter{tocdepth}{3}

% Indentation for TOC entries
\newlength{\tocsep}
\setlength{\tocsep}{1.5pc}

% Remove right margin in TOC
\contentsmargin{0cm}

% Section entries: bold, with page numbers
\titlecontents{section}[\tocsep]
{\addvspace{4pt}\small\bfseries\sffamily}
{\contentslabel[\thecontentslabel]{\tocsep}}{}
{\hfill\thecontentspage}[]

% Subsection entries: small, with dotted line to page number (no mid-line break)
\titlecontents{subsection}[\tocsep]
{\addvspace{2pt}\small\sffamily}
{\contentslabel[\thecontentslabel]{\tocsep}}{}
{\nobreak\titlerule*[.5pc]{.}\nobreak\thecontentspage}[]

% Subsubsection entries: inline with bullets, small font
\titlecontents*{subsubsection}[\tocsep]
{\footnotesize\sffamily}{}{}{}
[\ \textbullet\ ]

%-----------------------------------------------------------------------------
%  COVER PAGE  — \fairepagedegarde
%  
%  Generates the mandatory ENS cover page with:
%    - Full-width banner images (hautdepage.png, basdepage.png)
%    - Student name
%    - Report title with decorative rules
%    - Degree level (M1/M2) and domain
%    - Laboratory logo (optional)
%    - Laboratory info, supervisor, dates
%    - Word count (if provided)
%    - Previous internships table (if provided)
%  
%  After the cover, switches to two-column layout with \twocolumn
%  The class does not load article with twocolumn option to keep cover one-column
%-----------------------------------------------------------------------------

% Helper command to insert full-width banners
% Compensates for page margins to span entire paper width
\newcommand{\@fullwidthbanner}[1]{%
	\noindent
	\hspace{-\dimexpr\oddsidemargin+1in+\hoffset\relax}%
	\includegraphics[width=\paperwidth]{#1}\par
}

\newcommand{\fairepagedegarde}{%
	\begin{titlepage}
		% Temporarily remove side margins for banners
		\newgeometry{top=0pt, bottom=0pt,
			left=\dimexpr\oddsidemargin+1in+\hoffset\relax,
			right=\dimexpr\paperwidth-\textwidth-\oddsidemargin-1in-\hoffset\relax}
		\thispagestyle{empty}
		
		%--- Top banner (logos/hautdepage.png) ---
		\vspace*{0pt}
		\@fullwidthbanner{logos/hautdepage.pdf}
		\vspace{1cm}
		
		%--- Student name ---
		\begin{center}
			{\Large\@auteur\par}
			\vspace{1cm}
			
			%--- Report title with decorative colored rules ---
			{\color{colorMain}\rule{0.7\linewidth}{0.6pt}}\par
			\vspace{0.25cm}
			{\LARGE\bfseries\@titre\par}
			\vspace{0.25cm}
			{\color{colorMain}\rule{0.7\linewidth}{0.6pt}}\par
			\vspace{1cm}
			
% 			%--- Degree level and biological domain ---
% 			{\scshape\large\@master\ Internship report\par}
% 			\ifx\@domaine\empty\else
% 				\vspace{0.25cm}{\itshape\@domaine\par}%
% 			\fi
		\end{center}
		
		%--- Laboratory logo (centered, optional) ---
		\vspace{0.5cm}
		\ifx\@logoLabo\empty\else
			\begin{center}
				\includegraphics[height=\@logoLaboH]{\@logoLabo}
			\end{center}
		\fi
		\vspace{1.5cm}
		
		%--- Information block (lab, supervisor, dates) ---
        \noindent\large
        {\renewcommand{\arraystretch}{1.1}%
        \begin{tabularx}{\linewidth}{@{} l >{\centering\arraybackslash}X @{}}
            \textbf{Laboratory:}       & \@laboratoire \\
            \textbf{Supervisor:}       & \@tuteurstagenom
            \ifx\@tuteurstagemail\empty\else
                \ --- {\ttfamily\@tuteurstagemail}%
            \fi \\
            \textbf{Internship dates:} & \@datedebut\ --\ \@datefin \\
        \end{tabularx}}
        \par\vspace{2cm}
        \normalsize
		
		%--- Word count (optional) ---
		\ifx\@nombredemots\empty\else
			\noindent\textit{Number of words:} \@nombredemots\par
			\vspace{0.5cm}
		\fi
		
		%--- Previous internships table (optional) ---
		\ifx\@stagesanterieurs\empty\else
			\noindent\textit{Previous internships}\par
			\vspace{0.25cm}
			\noindent
			\begin{tabularx}{\linewidth}{@{} l X X X @{}}
				\toprule
				\textbf{Year} & \textbf{Laboratory} & \textbf{Supervisor} &
				\textbf{Title or Subject} \\
				\midrule
				\@stagesanterieurs
				\bottomrule
			\end{tabularx}\par
		\fi
		
		\vfill
		
		%--- Bottom banner (logos/basdepage.png) ---
		\@fullwidthbanner{logos/basdepage.pdf}
		
		% Restore normal page geometry
		\restoregeometry
	\end{titlepage}%
	\setcounter{page}{2}%
    \restoregeometry
	% Switch to two-column layout for the report body
	\twocolumn
}
%-----------------------------------------------------------------------------
%  ABSTRACT BOX  — \faireabstract
%  
%  Creates a full-width colored box containing the abstract and keywords
%  Must be called immediately after \fairepagedegarde
%  Uses \twocolumn[{...}] to span both columns without creating a page break
%  
%  ENS requirements for abstract:
%    - Single paragraph, 150-200 words
%    - English
%    - No literature references
%    - Include: background, results summary, significance
%-----------------------------------------------------------------------------

\newcommand{\faireabstract}{%
	% \twocolumn[{...}] creates a full-width element at top of first page
	\twocolumn[{%
		\vspace{0.5cm}%
		\begin{center}%
			% Outer box: colored border
			\fcolorbox{colorMain}{white}{%
				\parbox{\textwidth-2\fboxsep-2\fboxrule}{%
					% Inner box: light colored background
					\colorbox{colorBg}{%
						\parbox{\textwidth-4\fboxsep-2\fboxrule}{%
							\sffamily\textbf{Abstract}\\[4pt]%
							\@abstracts
							\ifx\@keywords\empty\else
								\par\smallskip\textbf{Keywords:} \textit{\@keywords}
							\fi
						}%
					}%
				}%
			}%
		\end{center}%
		\vspace{0.5cm}%
	}]%
}

%-----------------------------------------------------------------------------
%  FIGURE HELPER  — \insererfigure
%  
%  Simplified figure insertion with automatic sizing and placement
%  
%  Usage:
%    \insererfigure[options]{filename}{caption}{label}
%  
%  Options (comma-separated pgfkeys):
%    col     : single-column figure, width=\linewidth
%    p       : dedicated float page [p] (figure alone on page)
%    b       : double-column, prefer bottom placement [!hb]
%    h=<dim> : image height (default 0.33\textheight, ignored if p or col)
%    w=<dim> : image width (overrides h, ignored if col)
%  
%  Examples:
%    \insererfigure{fig1.pdf}{Caption text}{fig:label}
%      → double-column figure, default height
%    \insererfigure[col]{fig2.pdf}{Caption}{fig:label2}
%      → single-column figure, full column width
%    \insererfigure[p,w=0.8\textwidth]{fig3.pdf}{Caption}{fig:label3}
%      → full-page figure, 80% of text width
%-----------------------------------------------------------------------------

% Float spacing and fraction settings
% These control how much of a page can be occupied by floats
\AtBeginDocument{%
	\setlength{\dbltextfloatsep}{8pt plus 2pt minus 2pt}%   % Space around double-column floats
	\setlength{\textfloatsep}{8pt plus 2pt minus 2pt}%      % Space around single-column floats
	\renewcommand{\dbltopfraction}{0.85}%      % Max fraction of page for top double-column floats
	\renewcommand{\dblfloatpagefraction}{0.85}% % Min fraction for dedicated double-column float page
	\renewcommand{\topfraction}{0.85}%         % Max fraction for top single-column floats
	\renewcommand{\bottomfraction}{0.85}%      % Max fraction for bottom single-column floats
	\renewcommand{\floatpagefraction}{0.85}%   % Min fraction for dedicated single-column float page
	\setcounter{dbltopnumber}{4}%              % Max double-column floats at top
	\setcounter{topnumber}{4}%                 % Max single-column floats at top
	\setcounter{totalnumber}{8}%               % Max floats per page
}

% Define option keys for \insererfigure
\pgfkeys{
	/ENSfig/.is family, /ENSfig,
	col/.is if=@figcol,    % Single-column flag
	p/.is if=@figpage,     % Full-page flag
	b/.is if=@figbot,      % Bottom placement flag
	h/.store in=\@figh,    % Height storage
	w/.store in=\@figw,    % Width storage
	h=0.33\textheight,     % Default height
	w=,                    % Default width (empty = use height)
}

% Boolean flags for figure options
\newif\if@figcol
\newif\if@figpage
\newif\if@figbot

% Main figure insertion command
\newcommand{\insererfigure}[4][]{%
	% Parse options and reset flags
	\pgfkeys{/ENSfig, col=false, p=false, b=false, h=0.33\textheight, w=, #1}%
	% Choose environment based on flags
	\if@figpage
		% Dedicated full page: figure*[p]
		\begin{figure*}[p]
			\centering
			\ifx\@figw\empty
				\includegraphics[height=\@figh]{#2}%
			\else
				\includegraphics[width=\@figw]{#2}%
			\fi
			\caption{\small #3}\label{#4}
		\end{figure*}%
	\else\if@figcol
		% Single column: figure[!htb], always full column width
		\begin{figure}[!htb]
			\centering
			\includegraphics[width=\linewidth]{#2}%
			\caption{\small #3}\label{#4}
		\end{figure}%
	\else\if@figbot
		% Double column, bottom: figure*[!hb]
		\begin{figure*}[!hb]
			\centering
			\ifx\@figw\empty
				\includegraphics[height=\@figh]{#2}%
			\else
				\includegraphics[width=\@figw]{#2}%
			\fi
			\caption{\small #3}\label{#4}
		\end{figure*}%
	\else
		% Default: double column, normal placement: figure*[!htb]
		\begin{figure*}[!htb]
			\centering
			\ifx\@figw\empty
				\includegraphics[height=\@figh]{#2}%
			\else
				\includegraphics[width=\@figw]{#2}%
			\fi
			\caption{\small #3}\label{#4}
		\end{figure*}%
	\fi\fi\fi
}

%-----------------------------------------------------------------------------
%  SUPPLEMENTARY FIGURES  — \inserersuppfig
%
%  For supplementary/appendix figures placed AFTER the bibliography.
%  Uses a separate counter so numbering is S1, S2, S3, …
%  Caption is unnumbered (\caption*) and styled like the main figures.
%
%  Usage:
%    \inserersuppfig{figures/supp1.pdf}{Legend text.}{supp:fig1}
%    \inserersuppfig[width=0.8\textwidth]{fig.pdf}{Legend.}{supp:fig2}
%
%  Cross-reference:
%    \ref{supp:fig1}         → S1
%    \crefcolor{supp:fig1}   → coloured "Supplemental Figure S1"
%
%  The figure quota (M1≤6, M2≤5) applies to main figures only.
%  Supplementary figures are not counted by the ENS guidelines.
%-----------------------------------------------------------------------------

\newcounter{suppfig}
\renewcommand{\thesuppfig}{S\arabic{suppfig}}

% Optional first argument: \includegraphics options (default: width=\textwidth)
\newcommand{\inserersuppfig}[4][width=\textwidth]{%
  \begin{figure*}[!htb]%
    \centering
    \refstepcounter{suppfig}%
    \label{#4}%
    \includegraphics[#1]{#2}%
    \captionsetup{labelsep=none}%
    \caption*{{\color{colorMain}\sffamily\bfseries\small
      Supplemental Figure~\thesuppfig.\enspace}#3}%
  \end{figure*}%
}

%-----------------------------------------------------------------------------
%  BIBLIOGRAPHY  — \biblio
%  
%  Prints the bibliography using biblatex
%  
%  Setup required in main.tex preamble:
%    \addbibresource{references.bib}
%  
%  Compile sequence:
%    pdflatex main.tex  →  biber main  →  pdflatex × 2
%  
%  ENS requirements:
%    - Maximum 35 references
%    - PNAS numbered style (automatic with numeric-comp)
%    - No DOI, ISBN, URL, eprint (disabled in biblatex options above)
%-----------------------------------------------------------------------------

\newcommand{\biblio}{%
	% Add bibliography to table of contents (unnumbered)
	\addcontentsline{toc}{section}{\refname}%
	% Print bibliography
	\printbibliography%
}

%-----------------------------------------------------------------------------
%  DRAFT HELPERS
%  Convenient commands for marking incomplete sections during writing
%  Remove all \TODO and \NOTE before final submission
%-----------------------------------------------------------------------------

\newcommand{\TODO}[1]{{\color{red}\bfseries[TODO: #1]}}
\newcommand{\NOTE}[1]{{\color{colorAccent}\itshape[NOTE: #1]}}