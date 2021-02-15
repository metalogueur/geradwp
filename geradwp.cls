%% ---------------------------- %
%% geradwp LaTeX Document Class %
%% ---------------------------- %

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{geradwp}[v0.1 Class for Les Cahiers du GERAD series]
\RequirePackage{ifthen}

%% -------- %
%% Booleans %
%% -------- %
\newboolean{GD@isWebVersion}
\newboolean{GD@isPaperVersion}
\newboolean{GD@isPlainVersion}
\newboolean{GD@needsBigHeadSep}
\newboolean{GD@isFinalImpression}
\newboolean{GD@isPostPublication}
\newboolean{GD@isRevised}

\setboolean{GD@isWebVersion}{false}
\setboolean{GD@isPaperVersion}{true}
\setboolean{GD@isPlainVersion}{false}
\setboolean{GD@needsBigHeadSep}{false}
\setboolean{GD@isFinalImpression}{false}
\setboolean{GD@isPostPublication}{false}
\setboolean{GD@isRevised}{false}

%% ------------- %
%% Class Options %
%% ------------- %
\DeclareOption{gdweb}{%
	\setboolean{GD@isWebVersion}{true}
	\setboolean{GD@isPaperVersion}{false}
	\setboolean{GD@isPlainVersion}{false}
	\PassOptionsToClass{oneside}{article}
}
\DeclareOption{gdpaper}{%
	\setboolean{GD@isWebVersion}{false}
	\setboolean{GD@isPaperVersion}{true}
	\setboolean{GD@isPlainVersion}{false}
	\PassOptionsToClass{twoside}{article}
}
\DeclareOption{gdplain}{%
	\setboolean{GD@isWebVersion}{false}
	\setboolean{GD@isPaperVersion}{false}
	\setboolean{GD@isPlainVersion}{true}
	\PassOptionsToClass{oneside}{article}
}
\DeclareOption{gdbighead}{%
	\setboolean{GD@needsBigHeadSep}{true}
}
\DeclareOption{gdfinal}{%
	\setboolean{GD@isFinalImpression}{true}
}
\DeclareOption{gdpostpub}{%
	\setboolean{GD@isPostPublication}{true}
}
\DeclareOption{gdrevised}{%
	\setboolean{GD@isRevised}{true}
}

%% ----------------------- %
%% Standard Class Loading %
%% ----------------------- %

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[letterpaper,10pt]{article}

%%----------------- %
%% Required Packages %
%% ----------------- %

\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{latexsym}
\RequirePackage{graphicx}
\RequirePackage{mathrsfs}
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{array}
\RequirePackage[font={footnotesize,bf,sf}]{caption}
\RequirePackage{color}
\RequirePackage{enumitem}

%% ----------------------- % 
%% Required Packages Setup %
%% ----------------------- %

\definecolor{gris}{rgb}{0.44,0.44,0.44} % color pkg setup
\captionsetup[table]{skip=5pt} % caption pkg setup

%% ------- %
%% Lengths %
%% ------- %
\newlength{\GD@authitemsep}
\newlength{\GD@authtopsep}
\newlength{\GD@affilitemsep}
\newlength{\GD@affiltopsep}
\ifthenelse{\boolean{GD@isPlainVersion}}{%
	\setlength{\GD@authitemsep}{0pt}
	\setlength{\GD@authtopsep}{12pt}
	\setlength{\GD@affilitemsep}{0pt}
	\setlength{\GD@affiltopsep}{9pt}
}{%
	\setlength{\GD@authitemsep}{8pt}
	\setlength{\GD@authtopsep}{24pt}
	\setlength{\GD@affilitemsep}{6pt}
	\setlength{\GD@affiltopsep}{9pt}
}

%% ------ %
%% Layout %
%% ------ %

\ifthenelse{\boolean{GD@isWebVersion}}{%
	\geometry{tmargin=1.5cm, bmargin=2cm, lmargin=3cm, rmargin=3cm,nofoot, headsep=15pt, includehead}
}{}
\ifthenelse{\boolean{GD@isPaperVersion}}{%
	\geometry{tmargin=1.5cm, bmargin=2cm, lmargin=3cm, rmargin=2cm,nofoot, headsep=15pt, includehead}
}{}
\ifthenelse{\boolean{GD@needsBigHeadSep}}{%
	\headsep=30pt
}{}
\parindent=15pt
\parskip=7pt plus 1pt minus 1pt
\g@addto@macro\@floatboxreset\centering
\widowpenalty=10000
\clubpenalty=10000
\raggedbottom
\allowdisplaybreaks

\renewcommand{\section}{\@startsection {section}{1}{\z@}%
	{-2ex \@plus -1ex \@minus -.2ex}%
	{1ex \@plus.2ex}%
	{\normalfont\Large\sffamily\bfseries}}
\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
	{-1.25ex\@plus -1ex \@minus -.2ex}%
	{.75ex \@plus .2ex}%
	{\normalfont\large\sffamily\bfseries}}
\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}%
	{\z@}%
	{-1.25ex\@plus -1ex \@minus -.2ex}%
	{.75ex \@plus .2ex}%
	{\normalfont\normalsize\sffamily\bfseries}}
\renewcommand{\paragraph}{\@startsection{paragraph}{4}{\z@}%
	{-1.25ex \@plus 1ex \@minus -.2ex}%
	{-.5em \@plus -.1em}%
	{\normalfont\normalsize\sffamily\bfseries}}
\setlength{\partopsep}{.5ex \@plus .1ex} %% to reduce spaces 
\def\@listI{\leftmargin\leftmargini    %% above, between and under 
	\parsep .25ex \@plus .1ex  %% lists - itemize 
	\topsep .25ex \@plus .1ex  %% description - enumerate
	\itemsep \parsep}
\let\@listi\@listI
\@listi

%% ---------------------- %
%% Class Private Commands %
%% ---------------------- %

\newcommand{\gd@annee}{}
\newcommand{\gd@mois}{}
\newcommand{\gd@month}{}
\newcommand{\gd@numero}{}
\newcommand{\gd@titre}{}
\newcommand{\gd@auteurs@short}{}
\newcommand{\gd@auteurs@copyright}{}
\newcommand{\gd@postpubcitation}{}
\newcommand{\gd@postpubcitation@url}{}
\newcommand{\gd@revised}{}

%% -------------- %
%% Class Public Commands %
%% -------------- %

%%% Proof environment, as defined in amsthm
\DeclareRobustCommand{\qed}{%
	\ifmmode \mathqed
	\else
	\leavevmode\unskip\penalty9999 \hbox{}\nobreak\hfill
	\quad\hbox{\qedsymbol}%
	\fi
}
\let\QED@stack\@empty
\let\qed@elt\relax
\newcommand{\pushQED}[1]{%
	\toks@{\qed@elt{#1}}\@temptokena\expandafter{\QED@stack}%
	\xdef\QED@stack{\the\toks@\the\@temptokena}%
}
\newcommand{\popQED}{%
	\begingroup\let\qed@elt\popQED@elt \QED@stack\relax\relax\endgroup
}
\def\popQED@elt#1#2\relax{#1\gdef\QED@stack{#2}}
\newcommand{\qedhere}{%
	\begingroup \let\mathqed\math@qedhere
	\let\qed@elt\setQED@elt \QED@stack\relax\relax \endgroup
}
\newcommand{\openbox}{\leavevmode
	\hbox to.77778em{%
		\hfil\vrule
		\vbox to.675em{\hrule width.6em\vfil\hrule}%
		\vrule\hfil}}
\DeclareRobustCommand{\textsquare}{%
	\begingroup \usefont{U}{msa}{m}{n}\thr@@\endgroup
}
\providecommand{\qedsymbol}{\openbox}
\newenvironment{proof}[1][\proofname]{\par
	\pushQED{\qed}%
	\normalfont \topsep6\p@\@plus6\p@\relax
	\trivlist
	\item[\hskip\labelsep
	%        \itshape
	\bfseries
	#1\@addpunct{.}]\ignorespaces
}{%
	\popQED\endtrivlist\@endpefalse
}
\providecommand{\proofname}{\sffamily Proof}
%%% end of proof environment

%% Theorems
\newtheorem{assumption}{\sffamily Assumption}
\newtheorem{axiom}{\sffamily Axiom}
\newtheorem{case}{\sffamily Case}
\newtheorem{claim}{\sffamily Claim}
\newtheorem{conclusion}{\sffamily Conclusion}
\newtheorem{condition}{\sffamily Condition}
\newtheorem{conjecture}{\sffamily Conjecture}
\newtheorem{corollary}{\sffamily Corollary}
\newtheorem{criterion}{\sffamily Criterion}
\newtheorem{definition}{\sffamily Definition}
\newtheorem{example}{\sffamily Example}
\newtheorem{exercise}{\sffamily Exercise}
\newtheorem{lemma}{\sffamily Lemma}
\newtheorem{notation}{\sffamily Notation}
\newtheorem{problem}{\sffamily Problem}
\newtheorem{proposition}{\sffamily Proposition}
\newtheorem{remark}{\sffamily Remark}
\newtheorem{solution}{\sffamily Solution}
\newtheorem{summary}{\sffamily Summary}
\newtheorem{theorem}{\sffamily Theorem}

%% geradwp new public commands
\newcommand{\GDannee}[1]{%
	\renewcommand{\gd@annee}{#1}
}
\newcommand{\GDmois}[2]{%
	\renewcommand{\gd@mois}{#1}
	\renewcommand{\gd@month}{#2}
}
\newcommand{\GDnumero}[1]{%
	\renewcommand{\gd@numero}{#1}
}
\newcommand{\GDtitre}[1]{%
	\renewcommand{\gd@titre}{#1}
}
\newcommand{\GDauteursCourts}[1]{%
	\renewcommand{\gd@auteurs@short}{#1}
}
\newcommand{\GDauteursCopyright}[1]{%
	\renewcommand{\gd@auteurs@copyright}{#1}
}
\newcommand{\GDpostpubcitation}[2]{%
	\renewcommand{\gd@postpubcitation}{#1}
	\renewcommand{\gd@postpubcitation@url}{#2}
}
\newcommand{\GDrevised}[1]{%
	\renewcommand{\gd@revised}{#1}
}

\newcommand{\GDpageCouverture}{%
	\ifthenelse{\boolean{GD@isPlainVersion}}{}{\GD@cover}
}

\newcommand{\GD@cover}{%
	\ifthenelse{\boolean{GD@isFinalImpression}}{}{%
		\overfullrule=5pt
	}
	
	\pagestyle{empty}
	\begin{titlepage}
		\sffamily
		\ifthenelse{\boolean{GD@needsBigHeadSep}}{%
			\vspace*{-35pt}
		}{}
		
		{\noindent{\large\bfseries Les Cahiers du GERAD}\hfill ISSN:\quad
			0711--2440}
		
		\vspace*{7.5cm} \hspace*{240pt}
		\begin{minipage}[c][5.4cm][c]{7cm}
			{\begin{tabular}{p{.5cm}|p{5.5cm}}
					\multicolumn{2}{p{6.5cm}}{\bfseries \gd@titre}\\*[10pt]
					& \gd@auteurs@short \\ %Initials. Name
					& \\*[12pt]
					&G--\gd@annee--\gd@numero\\*[8pt]
					&\gd@month\ \gd@annee
					\ifthenelse{\boolean{GD@isRevised}}{%
						\\
						&Revised: \gd@revised
					}{}
			\end{tabular}}
		\end{minipage}
		
		\vfill
		
		\ifthenelse{\boolean{GD@isPostPublication}}{%
			\GDcover@bottom@postpub
		}{%
			\GDcover@bottom@regular
		}		
	\end{titlepage}
}

\newcommand{\GDcover@bottom@regular}{%	
	\hrule
	\smallskip
	
	\noindent\begin{minipage}[t][][l]{7.5cm}
		\scriptsize
		La collection \textit{Les Cahiers du GERAD} est constitu\'{e}e des travaux de recherche men\'{e}s par nos membres. La plupart de ces documents de travail a \'{e}t\'{e} soumis \`{a} des revues avec comit\'{e} de r\'{e}vision. Lorsqu'un document est accept\'{e} et publi\'{e}, le pdf original est retir\'{e} si c'est n\'{e}cessaire et un lien vers l'article publi\'{e} est ajout\'{e}.\\ 
		
		\medskip
		\scriptsize
		\textbf{Citation sugg\'{e}r\'{e}e :} \gd@auteurs@short~(\gd@mois\ \gd@annee). \gd@titre, Rapport technique, Les Cahiers du GERAD G--\gd@annee--\gd@numero, GERAD, HEC Montr\'{e}al, Canada.\\
		
		\textbf{Avant de citer ce rapport technique,} veuillez visiter notre site Web 
		(\url{https://www.gerad.ca/fr/papers/G-\gd@annee-\gd@numero}) afin de mettre \`a jour vos donn\'ees de r\'ef\'erence, s'il a \'et\'e publi\'e dans une revue scientifique.\par
	\end{minipage}
	\hfill
	\begin{minipage}[t][][l]{7.5cm}
		\scriptsize
		The series \textit{Les Cahiers du GERAD} consists of working papers carried out by our members. Most of these pre-prints have been submitted to peer-reviewed journals. When accepted and published, if necessary, the original pdf is removed and a link to the published article is added.\\ \\
		
		\scriptsize
		\textbf{Suggested citation:} \gd@auteurs@short~(\gd@month\ \gd@annee). \gd@titre, Technical report, Les Cahiers du GERAD G--\gd@annee--\gd@numero, GERAD, HEC Montr\'{e}al, Canada.\\
		
		\textbf{Before citing this technical report,} please visit our website (\url{https://www.gerad.ca/en/papers/G-\gd@annee-\gd@numero}) to update your reference data, if it has been published in a scientific journal.\par
	\end{minipage}
	
	\bigskip
	\hrule
	\smallskip
	
	\noindent\begin{minipage}[t][2.1cm][l]{7.5cm}
		\scriptsize
		La publication de ces rapports de recherche est rendue possible gr\^ace au soutien de HEC Montr\'eal, Polytechnique Montr\'eal, Universit\'e McGill, Universit\'e du Qu\'ebec \`a Montr\'eal, ainsi que du Fonds de recherche du Qu\'ebec -- Nature et technologies. 
		
		\medskip
		D\'ep\^ot l\'egal -- Biblioth\`eque et Archives nationales du Qu\'ebec, \gd@annee\\
		\phantom{Depot legal} -- Biblioth\`eque et Archives Canada, \gd@annee\par
	\end{minipage}
	\hfill
	\begin{minipage}[t][2.1cm][l]{7.5cm}
		\scriptsize
		The publication of these research reports is made possible
		thanks to the support of HEC Montr\'eal, Polytechnique Montr\'eal, McGill University, Universit\'e du Qu\'ebec \`a Montr\'eal, as well as the Fonds de recherche du
		Qu\'ebec -- Nature et technologies. 
		
		\medskip
		Legal deposit -- Biblioth\`eque et Archives nationales du Qu\'ebec, \gd@annee\\
		\phantom{Legal deposit} -- Library and Archives Canada, \gd@annee\par
	\end{minipage}
	
	\hrule
	\smallskip
	
	\noindent
	\begin{minipage}[t][1cm][l]{7.5cm}
		\begin{scriptsize}\raggedleft
			\textbf{GERAD} HEC Montr\'eal
			
			3000, chemin de la C\^ote-Sainte-Catherine
			
			Montr\'eal (Qu\'ebec) Canada H3T 2A7\par
		\end{scriptsize}
	\end{minipage}
	\hspace*{.35cm}\vrule\hfill
	\begin{minipage}[t][1cm][l]{7.5cm}
		\begin{scriptsize}
			\textbf{T\'el.\,: 514 340-6053}
			
			T\'el\'ec.\,: 514 340-5665
			
			info@gerad.ca
			
			www.gerad.ca\par
		\end{scriptsize}
	\end{minipage}
	
	\bigskip
	\hrule
}

\newcommand{\GDcover@bottom@postpub}{%
	\hrule
	\smallskip
	
	\noindent
	\begin{minipage}[t][][l]{7.5cm}
		\scriptsize
		La collection \textit{Les Cahiers du GERAD} est constitu\'{e}e des travaux de recherche men\'{e}s par nos membres. La plupart de ces documents de travail a \'{e}t\'{e} soumis \`{a} des revues avec comit\'{e} de r\'{e}vision. Lorsqu'un document est accept\'{e} et publi\'{e}, le pdf original est retir\'{e} si c'est n\'{e}cessaire et un lien vers l'article publi\'{e} est ajout\'{e}.\par
	\end{minipage}
	\hfill
	\begin{minipage}[t][][l]{7.5cm}
		\scriptsize
		The series \textit{Les Cahiers du GERAD} consists of working papers carried out by our members. Most of these pre-prints have been submitted to peer-reviewed journals. When accepted and published, if necessary, the original pdf is removed and a link to the published article is added.\par
	\end{minipage}
	
	\noindent
	\begin{minipage}[t][][l]{\textwidth}
		\footnotesize
		\textbf{CITATION ORIGINALE / ORIGINAL CITATION}
		\smallskip
		
		\gd@postpubcitation@url\ \url{\gd@postpubcitation@url}.
	\end{minipage}
	
	\bigskip
	
	\hrule
	\smallskip
	
	\noindent
	\begin{minipage}[t][2.1cm][l]{7.5cm}
		\scriptsize
		\medskip
		La publication de ces rapports de recherche est rendue possible gr\^ace au soutien de HEC Montr\'eal, Polytechnique Montr\'eal, Universit\'e McGill, Universit\'e du Qu\'ebec \`a Montr\'eal, ainsi que du Fonds de recherche du Qu\'ebec -- Nature et technologies. 
		
		\medskip
		D\'ep\^ot l\'egal -- Biblioth\`eque et Archives nationales du Qu\'ebec, 2020\\
		\phantom{Depot legal} -- Biblioth\`eque et Archives Canada, 2020\par
	\end{minipage}
	\hfill
	\begin{minipage}[t][2.1cm][l]{7.5cm}
		\scriptsize
		\medskip
		The publication of these research reports is made possible
		thanks to the support of HEC Montr\'eal, Polytechnique Montr\'eal, McGill University, Universit\'e du Qu\'ebec \`a Montr\'eal, as well as the Fonds de recherche du
		Qu\'ebec -- Nature et technologies. 
		
		\medskip
		Legal deposit -- Biblioth\`eque et Archives nationales du Qu\'ebec, 2020\\
		\phantom{Legal deposit} -- Library and Archives Canada, 2020\par
	\end{minipage}
	
	\hrule
	\smallskip
	
	\noindent
	\begin{minipage}[t][1cm][l]{7.5cm}
		\begin{scriptsize}\raggedleft
			\textbf{GERAD} HEC Montr\'eal
			
			3000, chemin de la C\^ote-Sainte-Catherine
			
			Montr\'eal (Qu\'ebec) Canada H3T 2A7\par
		\end{scriptsize}
	\end{minipage}
	\hspace*{.35cm}\vrule\hfill
	\begin{minipage}[t][1cm][l]{7.5cm}
		\begin{scriptsize}
			\textbf{T\'el.\,: 514 340-6053}
			
			T\'el\'ec.\,: 514 340-5665
			
			info@gerad.ca
			
			www.gerad.ca\par
		\end{scriptsize}
	\end{minipage}
	
	\bigskip
	\hrule
}

\newenvironment{GDpagetitre}{
	\ifthenelse{\boolean{GD@isPlainVersion}}{\GD@plain@titlepage@begin}{\GD@titlepage@begin}	
}{
	\ifthenelse{\boolean{GD@isPlainVersion}}{\GD@plain@pagetitle@end}{\GD@titlepage@end}	
}

\newcommand{\GD@titlepage@begin}{%	
	\newpage\cleardoublepage
	\parindent=0pt
	\vspace*{1cm}
	\sffamily
	{\LARGE\bfseries \gd@titre\par} %Title
	\begin{minipage}[t][13cm][l]{7.5cm}	
		\vspace*{55pt}
}

\newcommand{\GD@plain@titlepage@begin}{%
	\thispagestyle{empty}
	{\LARGE\bfseries\noindent\gd@titre\par}
}

\newcommand{\GD@titlepage@end}{%
	\vfill
	\end{minipage}
	\vfill
	{\bfseries \gd@month\ \gd@annee}\\*%\\ 
	%\revised\\
	{\bfseries Les Cahiers du GERAD}\\
	{\bfseries G--\gd@annee--\gd@numero}\\
	{\footnotesize Copyright \copyright\ \gd@annee\ GERAD, \gd@auteurs@copyright}
	\vspace*{0.05cm}
	
	\hrule
	\smallskip
	
	\noindent
	\begin{minipage}[t][][l]{7.5cm}
	\begin{scriptsize}
		Les textes publi\'es dans la s\'erie des rapports de recherche \textit{Les Cahiers du GERAD} n'engagent que la responsabilit\'e de leurs auteurs. Les auteurs conservent leur droit d'auteur et leurs droits moraux sur leurs publications et les utilisateurs s'engagent \`{a} reconna\^{\i}tre et respecter les exigences l\'{e}gales associ\'{e}es \`{a} ces droits. Ainsi, les utilisateurs:
		\begin {itemize}
		\item Peuvent t\'{e}l\'{e}charger et imprimer une copie de toute publication du portail public aux fins d'\'{e}tude ou de recherche priv\'{e}e;
		\item Ne peuvent pas distribuer le mat\'{e}riel ou l'utiliser pour une activit\'{e} \`{a} but lucratif ou pour un gain commercial;
		\item Peuvent distribuer gratuitement l'URL identifiant la publication.
	\end{itemize}
	Si vous pensez que ce document enfreint le droit d'auteur, contactez-nous en fournissant des d\'{e}tails. Nous supprimerons imm\'{e}diatement l'acc\`{e}s au travail et enqu\^{e}terons sur votre demande.\par
	\end{scriptsize}
	\end{minipage}
	\hfill
	\begin{minipage}[t][][l]{7.5cm}
	\begin{scriptsize}
	The authors are exclusively responsible for the content of their research papers published in the series \textit{Les Cahiers du GERAD}. Copyright and moral rights for the publications are retained by the authors and the users must commit themselves to recognize and abide the legal requirements associated with these rights. Thus, users:
	\begin{itemize}
		\item May download and print one copy of any publication from the public portal for the purpose of private study or research;
		\item May not further distribute the material or use it for any profit-making activity or commercial gain;
		\item May freely distribute the URL identifying the publication.
	\end{itemize}
	If you believe that this document breaches copyright please contact us providing details, and we will remove access to the work immediately and investigate your claim.\par
	\end{scriptsize}
	\end{minipage}
	
	\thispagestyle{empty}
	\parindent=15pt
	\newpage
}

\newcommand{\GD@plain@pagetitle@end}{%
	\vspace*{12pt}
	{\noindent\Large\gd@mois\ \gd@annee}
	\vspace*{30pt}
}

\newcommand{\GDabstract}{%
\setcounter{page}{2}
\renewcommand{\thepage}{\roman{page}}
\pagestyle{fancy}
\lhead[
\textcolor{gris}{\sffamily{\,}\thepage}\hfill
\textcolor{gris}{\sffamily G--\gd@annee--\gd@numero}\hfill % { -- \itshape Revised}
\textcolor{gris}{\sffamily Les Cahiers du GERAD}
{\large\strut}\color{gris}{\hrule}
]
{
	\textcolor{gris}{\sffamily{\,} Les Cahiers du GERAD}\hfill
	\textcolor{gris}{\sffamily G--\gd@annee--\gd@numero}\hfill % { -- \itshape Revised}
	\textcolor{gris}{\sffamily\thepage}
	{\large\strut}\color{gris}{\hrule}
}
\chead[]{}
\rhead[]{}
\lfoot[]{}
\cfoot[]{}
\rfoot[]{}	
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\rmfamily
\vspace*{5pt}	
}

\newcommand{\GDacknowledgements}{%
\vfill
\hrule
\smallskip
\paragraph{Acknowledgements: }
}

\newcommand{\GDwpstart}{%
\newpage
\setcounter{page}{1}
\renewcommand{\thepage}{\arabic{page}}
\baselineskip=12.5pt 
\rmfamily
}

\newlist{GDauthlist}{itemize}{1}
\setlist[GDauthlist]{label={}, left=0pt .. 0pt, itemsep=\GD@authitemsep, topsep=\GD@authtopsep}
\newlist{GDaffillist}{enumerate}{1}
\setlist[GDaffillist]{label=\textsuperscript{\emph{\alph*}}, ref=\textsuperscript{\emph{\alph*}}, wide,
	left=0pt .. 1em, itemsep=\GD@affilitemsep, topsep=\GD@affiltopsep}
\newlist{GDemaillist}{itemize}{1}
\setlist[GDemaillist]{label={}, left=0pt .. 0pt, itemsep=0pt, parsep=0pt}
\newcommand{\GDrefsep}{\textsuperscript{,~}}
\newcommand{\GDauthitem}[1]{%
	\ifthenelse{\boolean{GD@isPlainVersion}}{%
		\item {\large\bfseries #1}
	}{%
		\item {\Large\bfseries #1}
	}
}
\newcommand{\GDaffilitem}[2]{\item \label{#1}{\itshape #2}}
\newcommand{\GDemailitem}[1]{\item {\small\ttfamily #1}}

\endinput
