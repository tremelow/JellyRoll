\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{templatePFE}

\LoadClass[a4paper,12pt,twoside,openright]{report}

%Packages
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc} 
%\RequirePackage[round]{natbib}
\RequirePackage[nosort,nospace]{cite}
\RequirePackage[francais]{babel}
\RequirePackage{amsmath}
\RequirePackage{algorithm}
\RequirePackage{algorithmic}
\RequirePackage{array}
\RequirePackage[
    bookmarks         = true,%     % Signets
    bookmarksnumbered = true,%     % Signets numérotés%
    bookmarksopen     = true,%     % Signets ouverts
    colorlinks        = true,%     % Liens en couleur : true ou false
    urlcolor          = blue,%     % Couleur des liens externes
    linkcolor         = black,%    % Couleur des liens internes
    citecolor         = black,%    % Couleur des citations
    ]{hyperref}%
\RequirePackage{subfig}
\RequirePackage{dsfont}
\RequirePackage{amssymb}
\RequirePackage{pifont}
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{comment}
\RequirePackage{multirow}
\RequirePackage[top=2cm, bottom=2cm, left=2.5cm, right=2.5cm]{geometry}
\RequirePackage[textsize=scriptsize,textwidth=\marginparwidth]{todonotes}
\RequirePackage{xargs}
\RequirePackage{kpfonts}
\RequirePackage{titletoc}
\RequirePackage{titlesec}
\RequirePackage[nottoc]{tocbibind}
\RequirePackage{enumerate}

\usetikzlibrary{decorations.markings}


%Commandes et configurations diverses
\newcommand{\cmark}{\ding{51}}%
\newcommand{\xmark}{\ding{55}}%

\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

\renewcommand{\algorithmicrequire}{\textbf{Entrée:}}
\renewcommand{\algorithmicensure}{\textbf{Ensure:}}
\renewcommand{\algorithmiccomment}[1]{\{#1\}}
\renewcommand{\algorithmicend}{\textbf{fin}}
\renewcommand{\algorithmicif}{\textbf{si}}
\renewcommand{\algorithmicthen}{\textbf{alors}}
\renewcommand{\algorithmicelse}{\textbf{sinon}}
\renewcommand{\algorithmicelsif}{\algorithmicelse\ \algorithmicif}
\renewcommand{\algorithmicendif}{\algorithmicend\ \algorithmicif}
\renewcommand{\algorithmicfor}{\textbf{pour}}
\renewcommand{\algorithmicforall}{\textbf{pour tout}}
\renewcommand{\algorithmicdo}{\textbf{faire}}
\renewcommand{\algorithmicendfor}{\algorithmicend\ \algorithmicfor}
\renewcommand{\algorithmicwhile}{\textbf{tant que}}


%%%%%%%%%%%%%%%%%%%%%%
%  Todonotes colors  %
%%%%%%%%%%%%%%%%%%%%%%

\colorlet{Plum}{red!75!blue!85!cyan}
\colorlet{OliveGreen}{green!40!gray!95}
\newcommandx{\unsure}[2][1=]{\todo[linecolor=orange,backgroundcolor=orange!40,bordercolor=red,#1]{#2}}
\newcommandx{\fixme}[2][1=]{\todo[linecolor=red,backgroundcolor=red!30,bordercolor=red,#1]{#2}}
\newcommandx{\change}[2][1=]{\todo[linecolor=blue,backgroundcolor=blue!25,bordercolor=blue,#1]{#2}}
\newcommandx{\info}[2][1=]{\todo[linecolor=OliveGreen,backgroundcolor=OliveGreen!25,bordercolor=OliveGreen,#1]{#2}}
\newcommandx{\improvement}[2][1=]{\todo[linecolor=Plum,backgroundcolor=Plum!25,bordercolor=Plum,#1]{#2}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Définition de variables %
%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\TypeProjet{Projet de Fin d'Etudes}
\def\MentionSpecialite{Filière :}
\def\AnneeScolaire{Année Scolaire :}
\def\MentionConfidentialite{Mention de confidentialité}
\def\MentionAuteur{Auteur :}
\def\MentionTuteurENSTA{Enseignant référent :}
\def\MentionPromo{Promotion :}
\def\MentionTuteurOrganisme{Tuteurs}
\def\MentionStageEffectueDu{Stage effectué du}
\def\MentionStageEffectueAu{au}
\def\MentionNomOrganisme{Nom de l'organisme d'accueil :}
\def\MentionAdresse{Adresse :}


\newcommand{\nom}[1]{\def\Nom{#1}}
\newcommand{\logo}[1]{\def\LogoCorp{#1}}
\newcommand{\specialite}[1]{\def\Specialite{#1}}
\newcommand{\annees}[1]{\def\AnneeScolaire{#1}}
\newcommand{\titre}[1]{\def\Titre{#1}}
\newcommand{\soustitre}[1]{\def\SousTitre{#1}}
\newcommand{\confidentialite}[1]{\def\Confidentialite{#1}}
\newcommand{\noteConfidentialite}[1]{\def\NoteConfidentialite{#1}}
\newcommand{\auteur}[1]{\def\Auteur{#1}}
\newcommand{\promotion}[1]{\def\Promotion{#1}}
\newcommand{\tuteurENSTA}[1]{\def\TuteurENSTA{#1}}
\newcommand{\tuteurOrganisme}[1]{\def\TuteurOrganisme{#1}}
\newcommand{\dateDebut}[1]{\def\DateDebut{#1}}
\newcommand{\dateFin}[1]{\def\DateFin{#1}}
\newcommand{\organisme}[1]{\def\Organisme{#1}}
\newcommand{\adresseOrganisme}[1]{\def\AdresseOrganisme{#1}}

\definecolor{gray}{gray}{0.5}
\definecolor{darkgray}{gray}{0.3}

\input{formatCouverture.tex}


%Organisation de page
\pagestyle{fancy}

\fancyhead{}
\fancyfoot{}
\fancyhead[C]{\footnotesize\color{gray}\Titre}
\fancyfoot[C]{\vspace*{.7cm}\color{darkgray}\Auteur ~/ \Organisme \\ \color{gray}\textit{\Confidentialite}}
\fancyfoot[RO, LE] {\thepage}

\fancypagestyle{plain}{
\fancyhead{}
\fancyfoot{}
\fancyhead[C]{\footnotesize\color{gray}\Titre}
\fancyfoot[C]{\vspace*{.7cm}\color{darkgray}\Auteur ~/ \Organisme \\ \color{gray}\textit{\Confidentialite}}
\fancyfoot[RO, LE] {\thepage}}

\fancypagestyle{empty}{
\fancyhead{} \fancyfoot{} }

\newcommand{\chapterb}[1]{\chapter*{#1\addcontentsline{toc}{chapter}{#1}\markboth{#1}{#1}}}


\renewcommand{\headrulewidth}{0pt}

\titleformat
	{\chapter}
	[display]
	{\vspace*{-0.8cm}\centering\normalfont\bfseries\large\scshape}
	{\vspace*{-1cm}\rule[3pt]{0.15\linewidth}{3pt}\quad\quad\chaptername\ \thechapter\quad\quad \rule[3pt]{0.15\linewidth}{3pt}}
	{0.2\baselineskip}
	{\rule{\linewidth}{0.5pt}\break\Huge} 
	[\vspace{-0.5\baselineskip}\rule{\linewidth}{0.5pt}\vspace{-.5cm}]%\vspace{0.6\baselineskip}]
