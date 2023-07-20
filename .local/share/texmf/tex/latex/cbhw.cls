%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Homework Assignment Class
% LaTeX Class File
% Version 1.0 (05/19/2023)
%
% Author: Christopher Breinholt (cmbreinholt@gmail.com)
%
% This class file is used for generic homework assignments
%
% This package is pulic domain under the Unlicense:
% (https://unlicense.org/)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-------------------------------------------------------------------------------
%  Identification
%-------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cbhw}[2023/05/19] % Christopher Breinholts Homework Class


%-------------------------------------------------------------------------------
%  Preliminary Declarations
%-------------------------------------------------------------------------------

% Define a macro for the name of the institution
\newcommand{\university}[1]{ \newcommand{\universityLocal}{#1} }

% Define a macro for the name of the course
\newcommand{\course}[1]{ \newcommand{\courseLocal}{#1} }

% Define a macro for the name of the instructor
\newcommand{\instructor}[1]{ \newcommand{\instructorLocal}{#1} }

% Define a command for the name of the course, dat and student
\newcommand{\CourseLang}{Course}
\newcommand{\DateLang}{Date}
\newcommand{\StudentLang}{Student}
\newcommand{\InstructorLang}{Instructor}


%-------------------------------------------------------------------------------
%  Document Class Options
%-------------------------------------------------------------------------------

% Disble two column and two sided mode
\DeclareOption{onecolumn}{\@twocolumnfalse}
\DeclareOption{oneside}{\@twosidefalse}

\PassOptionsToClass{a4paper}{article}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions\relax


%-------------------------------------------------------------------------------
%  Document Declarations
%-------------------------------------------------------------------------------

% Load the article class
\LoadClass{article}

% Requires the titlesec package
\RequirePackage{titlesec}

% Requires the fancyhdr package
\RequirePackage{fancyhdr}

% Modification of section
\titleformat{\section}[block]{\normalsize\bfseries\filcenter}{\thesection.}{.3cm}{}

% Modification of subsection and subsubsection
\titleformat{\subsection}[runin]{\bfseries}{ \thesubsection.}{1mm}{}[.\quad]
\titleformat{\subsubsection}[runin]{\bfseries\itshape}{ \thesubsubsection.}{1mm}{}[.\quad]

% Geometry package for page layout
\RequirePackage{geometry}

% Set the page layout
\geometry{left=2.5cm,right=2.5cm,top=2.5cm,bottom=2.5cm}

\fancyhead{}
\fancyfoot{}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}
\fancyhead[RO] {\footnotesize\thepage}
\fancyhead[LO]
    {\footnotesize{\ifx\courseLocal\undefined{}\else\itshape\courseLocal{} --{}
        \fi}\makeatletter\@title\makeatother }
\fancyfoot[RO] {\footnotesize\itshape\makeatletter\@author\makeatother}

% New title style for the document
\renewcommand{\maketitle}{%
    \thispagestyle{plain}
    \begin{center}
        \ifx\universityLocal\undefined{}\else{\scshape \universityLocal}
            \\[10pt] \fi
        \hrule
        \vspace{10pt}
        {\LARGE \bfseries \@title} \\[5pt]
        \StudentLang: {\itshape \@author}
        \vspace{8pt}
        \hrule
        \vspace{10pt}
        \ifx\courseLocal\undefined{}\else\CourseLang: {\itshape \courseLocal{}
            \ifx\instructorLocal\undefined{}\else{-- }\fi  }\fi
        \ifx\instructorLocal\undefined{}\else{\InstructorLang: {\itshape\instructorLocal}}\fi
        \\
        \DateLang: {\itshape\@date}
        \vspace{20pt}
    \end{center}
}

% Define the "problem" environment
\newsavebox{\problembox}
\newenvironment{problem}
    {\begin{center} \begin{lrbox}{\problembox}\begin{minipage}{.98\textwidth}}
    {\end{minipage}\end{lrbox}\fbox{\usebox{\problembox}} \end{center} }

% End of class file
\endinput
