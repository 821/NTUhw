\NeedsTeXFormat{LaTeX2e}
\LoadClassWithOptions{article}
\ProvidesClass{NTUhw}[2020/11/11]

% 中文
\RequirePackage[BoldFont,SlantFont,CheckSingle,AutoFallBack=true]{xeCJK}
\RequirePackage[T1]{fontenc}
\defaultfontfeatures{Mapping=tex-text}
\setCJKmainfont[AutoFakeBold]{NotoSerifCJKtc-Regular.otf}
\setCJKmonofont[AutoFakeBold]{TW-Kai-98_1.ttf}
\setmainfont{Times New Roman}
\setmonofont{Times New Roman}
\RequirePackage{CJKpunct}
\RequirePackage{zhnumber}

% 段落縮進兩個字
\makeatletter
\def\elegant@CJKChar@size{\hskip \f@size \p@}
\newdimen\elegant@CJKChar@size@dimen
\settowidth\elegant@CJKChar@size@dimen{\elegant@CJKChar@size\CJKglue}
\newcommand{\CJKsetfontspace}{
\settowidth\elegant@CJKChar@size@dimen{\elegant@CJKChar@size\CJKglue}%
\ifdim\parindent=0pt%
\relax%
\else%
\parindent2\elegant@CJKChar@size@dimen%
\fi%
}
\newcommand{\Eindent}{\CJKsetfontspace\parindent2\elegant@CJKChar@size@dimen}
\newcommand{\Enoindent}{\parident\z@}
\RequirePackage{indentfirst}
\AtBeginDocument{\Eindent}
\makeatother

% 標題
\makeatletter
\DeclareRobustCommand{\maketitle}{\begin{center}\noindent \Large \@title \\ \normalsize \@author \vskip 0em\end{center}}
\makeatother

% Packages

% 萬一要用APA格式寫一兩條文獻呢
\RequirePackage{hanging}

% 章節標題格式
\RequirePackage[compact]{titlesec}
\titlelabel{}
\titleformat{\section}{\large\center}{\zhnumber{\arabic{section}} 、}{0em}{}

% 圖片、列表等
\RequirePackage{enumerate}
\RequirePackage{enumitem}
\RequirePackage{graphicx}
\RequirePackage{fancyvrb}
\RequirePackage{listings}

% 顏色
\RequirePackage{color}
\newcommand{\blue}[1]{\textcolor{blue}{#1}}

% 鏈接
\RequirePackage{url}
\RequirePackage[unicode,CJKbookmarks=true,colorlinks=true,linkcolor=blue,urlcolor=blue,citecolor=blue]{hyperref}

% 腳註
\RequirePackage{etoolbox}
\makeatletter
\patchcmd{\@footnotetext}{\footnotesize}{\ttfamily}{}{}
\makeatother
\RequirePackage[bottom]{footmisc}


% 摘要與引用
\renewenvironment{quote}
               {\list{}{\leftmargin 3em
               \ttfamily\selectfont}%
                \item\relax}
               {\endlist}
\newenvironment{sabstract}
               {\list{}{\leftmargin 0em
               \ttfamily\selectfont}%
                \item\relax}
               {\endlist}

\RequirePackage{fancyhdr}


% 文獻
\RequirePackage[american]{babel}
\RequirePackage{csquotes}
\RequirePackage[%maxcitenames=2,
  sorting=centy,hyperref=true,backend=biber,usetranslator=true]{biblatex-chicago}
\DeclareStyleSourcemap{
	\maps{
		\map[overwrite]{
			\step[
				fieldsource = language, match = \regexp{chinese|繁體中文|簡體中文|中文},
				fieldset = userf, fieldvalue = {cc}
			]
		}
		\map[overwrite]{
			\step[
				fieldsource = language, match = \regexp{japanese|日文},
				fieldset = userf, fieldvalue = {cj}
			]
		}
		\map[overwrite]{
			\step[
				fieldsource = language, match = \regexp{korean},
				fieldset = userf, fieldvalue = {ck}
			]
		}
		\map[overwrite]{
			\step[
				fieldsource = entrysubtype, match = \regexp{周},
				fieldset = userf, fieldvalue = {01046}
			]
		}
		\map[overwrite]{
			\step[
				fieldsource = entrysubtype, match = \regexp{春秋},
				fieldset = userf, fieldvalue = {06770}
			]
		}
		\map[overwrite]{
			\step[
				fieldsource = entrysubtype, match = \regexp{戰國},
				fieldset = userf, fieldvalue = {07476}
			]
		}
		\map[overwrite]{
			\step[
				fieldsource = entrysubtype, match = \regexp{秦},
				fieldset = userf, fieldvalue = {08221}
			]
		}
		\map[overwrite]{
			\step[
				fieldsource = entrysubtype, match = \regexp{漢},
				fieldset = userf, fieldvalue = {09202}
			]
		}
		\map[overwrite]{
			\step[
				fieldsource = entrysubtype, match = \regexp{三國},
				fieldset = userf, fieldvalue = {10220}
			]
		}
		\map[overwrite]{
			\step[
				fieldsource = entrysubtype, match = \regexp{晉},
				fieldset = userf, fieldvalue = {10266}
			]
		}
		\map[overwrite]{
			\step[
				fieldsource = entrysubtype, match = \regexp{北魏},
				fieldset = userf, fieldvalue = {10386}
			]
		}
		\map[overwrite]{
			\step[
				fieldsource = entrysubtype, match = \regexp{東魏},
				fieldset = userf, fieldvalue = {10534}
			]
		}
		\map[overwrite]{
			\step[
				fieldsource = entrysubtype, match = \regexp{西魏},
				fieldset = userf, fieldvalue = {10535}
			]
		}
		\map[overwrite]{
			\step[
				fieldsource = entrysubtype, match = \regexp{北齊},
				fieldset = userf, fieldvalue = {10550}
			]
		}
		\map[overwrite]{
			\step[
				fieldsource = entrysubtype, match = \regexp{北周},
				fieldset = userf, fieldvalue = {10557}
			]
		}
		\map[overwrite]{
			\step[
				fieldsource = entrysubtype, match = \regexp{南朝宋},
				fieldset = userf, fieldvalue = {10420}
			]
		}
		\map[overwrite]{
			\step[
				fieldsource = entrysubtype, match = \regexp{南朝齊},
				fieldset = userf, fieldvalue = {10479}
			]
		}
		\map[overwrite]{
			\step[
				fieldsource = entrysubtype, match = \regexp{南朝梁|梁},
				fieldset = userf, fieldvalue = {10502}
			]
		}
		\map[overwrite]{
			\step[
				fieldsource = entrysubtype, match = \regexp{南朝陳|陳},
				fieldset = userf, fieldvalue = {10577}
			]
		}
		\map[overwrite]{
			\step[
				fieldsource = entrysubtype, match = \regexp{隋},
				fieldset = userf, fieldvalue = {10581}
			]
		}
		\map[overwrite]{
			\step[
				fieldsource = entrysubtype, match = \regexp{唐},
				fieldset = userf, fieldvalue = {10618}
			]
		}
		\map[overwrite]{
			\step[
				fieldsource = entrysubtype, match = \regexp{五代},
				fieldset = userf, fieldvalue = {10907}
			]
		}
		\map[overwrite]{
			\step[
				fieldsource = entrysubtype, match = \regexp{宋},
				fieldset = userf, fieldvalue = {10960}
			]
		}
		\map[overwrite]{
			\step[
				fieldsource = entrysubtype, match = \regexp{元},
				fieldset = userf, fieldvalue = {11271}
			]
		}
		\map[overwrite]{
			\step[
				fieldsource = entrysubtype, match = \regexp{明},
				fieldset = userf, fieldvalue = {11368}
			]
		}
		\map[overwrite]{
			\step[
				fieldsource = entrysubtype, match = \regexp{淸|清},
				fieldset = userf, fieldvalue = {11616}
			]
		}
		\map[overwrite]{
			\step[
				fieldsource = entrysubtype, match = \regexp{民},
				fieldset = userf, fieldvalue = {11912}
			]
		}
		\map[overwrite]{
			\step[
				fieldsource = entrysubtype, match = \regexp{今},
				fieldset = userf, fieldvalue = {11949}
			]
		}
		\map[overwrite]{
			\step[
				fieldsource = entrysubtype, match = \regexp{日},
				fieldset = userf, fieldvalue = {cj}
			]
		}
		\map[overwrite]{
			\step[
				fieldsource = entrysubtype, match = \regexp{德},
				fieldset = userf, fieldvalue = {g}
			]
		}
		\map{
			\step[fieldset = userf, fieldvalue = {en}]
		}
	}
}

\newcommand{\cegen}[2]{\iffieldequalstr{userf}{en}{#2}{#1}}

\DeclareSortingScheme{centy}{
	\sort{\field{presort}}
	\sort[final]{\field{sortkey}}
	\sort{
		\field{userf}
	}
	\sort{
		\field{sortname}
		\field{author}
		\field{editor}
		\field{translator}
		\field{sorttitle}
		\field{title}
	}
	\sort{
		\field{sorttitle}
		\field{title}
	}
	\sort{
		\field{sortyear}
		\field{year}
	}
}

\DeclareSortingScheme{ecnty}{
	\sort{\field{presort}}
	\sort[final]{\field{sortkey}}
	\sort[direction = descending]{
		\field{userf}
	}
	\sort{
		\field{sortname}
		\field{author}
		\field{editor}
		\field{translator}
		\field{sorttitle}
		\field{title}
	}
	\sort{
		\field{sorttitle}
		\field{title}
	}
	\sort{
		\field{sortyear}
		\field{year}
	}
}


\DefineBibliographyStrings{english}{
	andmore = {\cegen{等}{\mkbibemph{et\addabbrvspace al\adddot}}},
	andothers = {\cegen{等}{\mkbibemph{et\addabbrvspace al\adddot}}},
	and = {\cegen{、}{and}},
	bibliography = {引用書目},
	references = {引用書目},
	bytranslator = {\cegen{譯}{trans\adddot}},
	number = {\cegen{}{no\adddot}}
}

\newcommand*\clguillemet{《}
\newcommand*\crguillemet{》}
\newcommand*\clchevron{〈}
\newcommand*\crchevron{〉}
\newcommand*\cbscomma{、}
\newcommand*\cldquot{“}
\newcommand*\crdquot{”}
\newcommand*\ccomma{，}
\newcommand*\cscolon{；}
\newcommand*\ccolon{：}
\newcommand*\cperiod{。}

\newcommand*{\cecomma}{\cegen{\ccomma}{\addcomma\addspace}}
\newcommand*{\cecolon}{\cegen{\ccolon}{\addcolon\addspace}}
\newcommand*{\cescolon}{\cegen{\cscolon}{\addscolon\addspace}}
\newcommand*{\ceperiod}{\cegen{\cperiod}{\addperiod\addspace}}
\newcommand*{\cespace}{\cegen{}{\addspace}}
\newcommand*\celbracket{\cegen{（}{(}}
\newcommand*\cerbracket{\cegen{）}{)}}
\newcommand*{\cebracket}[1]{\celbracket{#1}\cerbracket}

\renewcommand*{\finalnamedelim}{\cegen{、}{\addspace\bibstring{and}\space}}
\renewcommand*{\multinamedelim}{\cegen{\cbscomma}{\addcomma\addspace}} % modified: Chinese back-sloping comma between authors
\renewcommand*{\andothersdelim}{\cespace}
\renewcommand*{\postnotedelim}{\cecomma}
\renewcommand*{\finentrypunct}{\cegen{\cperiod}{.}} % 文獻結尾
\renewcommand{\bibendnotewrapper}[1]{\bibsentence #1\cperiod}
\renewcommand{\bibfootnotewrapper}[1]{\bibsentence #1\cperiod}
\renewcommand*{\newunitpunct}{\ceperiod}
\renewcommand*{\newcunitpunct}{\cecomma}
\renewcommand*{\entrysetpunct}{\cescolon}
\renewcommand*{\labelnamepunct}{\newunitpunct} % 年號之類
\renewcommand*{\subtitlepunct}{\newunitpunct}
\renewcommand*{\intitlepunct}{\cecolon}
\renewcommand*{\bibpagespunct}{\cecomma}
\renewcommand*{\bibpagerefpunct}{}
\renewcommand*{\revsdnamepunct}{\cecomma}
\renewcommand*{\postvolpunct}{\addcolon\addspace}
\newcommand*{\cearticle}[1]{\cegen{\clchevron{#1}\crchevron}{\mkbibquote{#1}}}
\newcommand*{\cebook}[1]{\cegen{\clguillemet{#1}\crguillemet}{\emph{#1}}}
\newcommand*{\ceinbook}[1]{\cegen{\clguillemet{#1}\crguillemet}{\emph{#1}\addperiod}}
\renewcommand*{\bibnamedash}{
  \cegen{― ―}{
  \ifdimless{\leftmargin}{0.75em}
    {\mbox{\textemdash\space}}
    {\makebox[\leftmargin][l]{%
       \ifdimless{\leftmargin}{1.25em}
         {\textendash}
         {\textemdash}}}}}


\DeclareCiteCommand{\cite}
  {\usebibmacro{prenote}}
  {\usedriver
     {\DeclareNameAlias{sortname}{default}}
     {cite:\thefield{entrytype}}} % 這句是關鍵
  {\multicitedelim}
  {\usebibmacro{postnote}}
\newcommand{\ftnote}[1]{\footnote{\renewcommand{\baselinestretch}{1.1}\ttfamily {#1}}}
\newcommand{\ccite}[1]{\ftnote{\cite{#1}。}}
\newcommand{\pccite}[2]{\ftnote{\cite{#1}，頁{#2}。}}
\newcommand{\ecite}[1]{\ftnote{\cite{#1}.}}
\newcommand{\pecite}[2]{\ftnote{\cite{#1}, page {#2}.}}
\newcommand{\fcite}[3]{\ftnote{{#1}\cite{#2}{#3}}}

%定義古籍
\defbibfilter{hsource}{%
\( \subtype{商} \or \subtype{周} \or \subtype{春秋} \or \subtype{戰國} \or \subtype{秦} \or \subtype{漢} \or \subtype{三國} \or \subtype{晉} \or \subtype{北魏} \or \subtype{東魏} \or \subtype{西魏} \or \subtype{北齊} \or \subtype{北周} \or \subtype{南朝宋} \or \subtype{南朝齊} \or \subtype{南朝梁} \or \subtype{南朝陳} \or \subtype{隋} \or \subtype{唐} \or \subtype{五代} \or \subtype{宋} \or \subtype{元} \or \subtype{明} \or \subtype{淸} \or \subtype{民} \or \subtype{今} \or \subtype{德} \or \keyword{史料} \)
}
\defbibfilter{nothsource}{%
\( not \subtype{商} \and \not \subtype{周} \and \not \subtype{春秋} \and \not \subtype{戰國} \and \not \subtype{秦} \and \not \subtype{漢} \and \not \subtype{三國} \and \not \subtype{晉} \and \not \subtype{北魏} \and \not \subtype{東魏} \and \not \subtype{西魏} \and \not \subtype{北齊} \and \not \subtype{北周} \and \not \subtype{南朝宋} \and \not \subtype{南朝齊} \and \not \subtype{南朝梁} \and \not \subtype{南朝陳} \and \not \subtype{隋} \and \not \subtype{唐} \and \not \subtype{五代} \and \not \subtype{宋} \and \not \subtype{元} \and \not \subtype{明} \and \not \subtype{淸} \and \not \subtype{民} \and \not \subtype{今} \and \not \subtype{德} \and \not \keyword{史料} \)
}

\DeclareFieldFormat[article,thesis,inbook,inancient,inproceedings,online,unpublished,news,newspaper,simple]{title}{\cearticle{#1}}
\DeclareFieldFormat[incollection,book,misc,ancient]{title}{\cebook{#1}}
\DeclareFieldFormat{journaltitle}{\cebook{#1}}

\newbibmacro*{bibprefix}{\printfield{addendum}}
\newbibmacro*{dynasty}{%
  \iffieldundef{entrysubtype}{}{%
    ［\printfield{entrysubtype}］}}
\newbibmacro*{cevol}{%
  \iffieldundef{volume}{}{%
    \cegen{第}{Vol. }%
    \printfield{volume}%
    \cegen{卷}{\addcomma\addspace}%
  }}
\newbibmacro*{ceseries}{%
  \iffieldundef{series}{}{%
    \cegen{第}{ser.}%
    \printfield[noformat]{series}%
    \cegen{輯}{\addcomma\addspace}%
  }}
\newbibmacro*{cenum}{%
  \iffieldundef{number}{}{%
    \cegen{第}{No. }%
    \printfield{number}%
    \cegen{期}{}%
  }}
\newbibmacro*{volumes}{%
  \iffieldundef{volumes}{}{%
    \printfield{volumes}%
  }}
\newbibmacro*{pages}{%
  \iffieldundef{pages}{}{%
    \cecomma\setunit{}\cegen{頁}{}\printfield{pages}}}%
\renewbibmacro*{urldate}{\thefield{urlyear}\bibrangedash\thefield{urlmonth}\bibrangedash\thefield{urlday}}
\newbibmacro*{book-title}{%
  \printtext[title]{%
    \printfield[noformat]{title}%
    \setunit{\cecolon}%
    \printfield[noformat]{subtitle}}%
}
\newbibmacro*{article-title}{%
  \printtext[title]{%
    \printfield[noformat]{title}%
    \setunit{\cecolon}%
    \printfield[noformat]{subtitle}}%
  \setunit{\cecomma}%
}
\newbibmacro*{translator}{%
  \iflistundef{translator}%
    {}%
    {\cegen{著}{}%
      \setunit{\cecomma}%
      \cegen{}{Trans. by }%
      \printtext{translator}%
      \cegen{譯}{}%
    }%
}
\newbibmacro*{loc+inst+type+year}{%
  \printlist{location}%
  \setunit*{\cecolon}%
  \printlist{institution}%
  \printfield{type}%
  \setunit*{\cecomma}%
  \printfield{year}%
}

\renewbibmacro*{publ+loc+year}{%
  \printlist{location}%
  \iflistundef{publisher}%
  {\setunit*{\cecomma}}%
  {\setunit*{\cecolon}}%
  \printlist{publisher}%
  \setunit*{\cecomma}%
  \usebibmacro{date}%
}

\renewbibmacro*{byauthor}{%
  \ifthenelse{\ifuseauthor\OR
              \ifnameundef{author}}
    {}
    {\bibstring{by}\addspace
     \printnames[byauthor]{author}}}

\newbibmacro*{editor+booktitle}{%
  \cegen{收入}{In }%
  \setunit*{}%
  \ifnameundef{editor}{氏著}{%
    \printnames{editor}%
    \cegen{編}{ Ed. }%
  }%
  \setunit*{}%
  \cebook{\printfield{booktitle}}%
}

\newbibmacro*{newstitle}{%
  \cegen{}{ }%
  \setunit*{}%
  \cebook{\printfield{booktitle}}%
}

\newbibmacro*{publ+loc+year+day}{%
  \printlist{location}%
  \iflistundef{publisher}%
  {\setunit*{\addcomma\addspace}}%
  {\setunit*{\addcolon\addspace}}%
  \printlist{publisher}%
  \setunit*{\addcomma\addspace}%
  \usebibmacro{newsdate}% For the author-date style.  Tricky.
}%

\newbibmacro*{newsdate}{% Adding the test solved some issues in 0.9 with
  \cegen{\thefield{year}年\thefield{month}月\thefield{date}日}%
  {\iftoggle{cms@switchdates}%
  {\ifthenelse{\iffieldundef{origyear}\AND\iffieldundef{origmonth}
    \AND\iffieldundef{origday}}%
    {}%
    {\printorigdate}}%
  {\ifthenelse{\iffieldundef{year}\AND\iffieldundef{month}
    \AND\iffieldundef{day}}%  punctuation in some entry types (Misc).  The 
    {}%                   whole \printdate thing may need further work. 
    {\printdate}}}}

% 王汎森，〈明末清初儒學的宗教化：以許三禮的告天之學為例〉，《新史學》第 9 卷第 2 期，1998，臺北，頁 89-123。
\DeclareBibliographyDriver{article}{%
  \usebibmacro{bibindex}%
  \usebibmacro{mag+news+author}%
  \newcunit\newblock%
  \usebibmacro{article-title}%
  \usebibmacro{journal+sub}%
  \cegen{}{\addcomma\addspace}%
  \setunit*{}%
  \usebibmacro{cevol}%
  \usebibmacro{cenum}%
  \usebibmacro{ceseries}%
  \newcunit\newblock%
  \usebibmacro{date}%
  \newcunit\newblock%
  \usebibmacro{pages}%
  \usebibmacro{finentry}%
}
% 王汎森，〈明末清初儒學的宗教化：以許三禮的告天之學為例〉，《新史學》第9卷第2期（1998，臺北），頁89-123。
\DeclareBibliographyDriver{cite:article}{%
  \usebibmacro{mag+news+author}%
  \newcunit\newblock%
  \usebibmacro{article-title}%
  \usebibmacro{journal+sub}%
  \cegen{}{\addcomma\addspace}%
  \setunit*{}%
  \usebibmacro{cevol}%
  \usebibmacro{cenum}%
  \usebibmacro{ceseries}%
  \cegen{}{\addspace}%
  \setunit*{}%
  \cebracket{\usebibmacro{date}\cecomma\printlist{location}}%
  \usebibmacro{pages}%
  \usebibmacro{finentry}%
}

%朱漢民，《中國的書院》。臺北：臺灣商務印書館，1993。
\DeclareBibliographyDriver{book}{%
  \usebibmacro{bibindex}%
  \printfield{bibprefix}%
  \usebibmacro{dynasty}%
  \usebibmacro{author/editor}%
  \usebibmacro{translator}%
  \newcunit\newblock%
  \usebibmacro{book-title}%
  \setunit{\ceperiod}%
  \usebibmacro{publ+loc+year}%
  \usebibmacro{finentry}%
}
%朱漢民，《中國的書院》（臺北：臺灣商務印書館，1993），頁110-111。
\DeclareBibliographyDriver{cite:book}{%
  \usebibmacro{bibindex}%
  \printfield{bibprefix}%
  \usebibmacro{dynasty}%
  \usebibmacro{author/editor}%
  \usebibmacro{translator}%
  \newcunit\newblock%
  \usebibmacro{book-title}%
  \cegen{}{\addspace}%
  \setunit*{}%
  \cebracket{\usebibmacro{publ+loc+year}}%
  \usebibmacro{pages}%
  \usebibmacro{finentry}%
}

%于振波，〈漢代的循吏與酷吏〉，收入氏著，《簡牘與秦漢社會》，頁282-295。長沙：湖南大學出版社，2012。
\DeclareBibliographyDriver{inbook}{%
  \usebibmacro{bibindex}%
  \usebibmacro{dynasty}%
  \usebibmacro{author/editor}%
  \newcunit\newblock%
  \usebibmacro{article-title}\cecomma%
  \usebibmacro{editor+booktitle}%
  \usebibmacro{pages}%
  \setunit{\ceperiod}%
  \usebibmacro{publ+loc+year}%
  \usebibmacro{finentry}%
}
%于振波，〈漢代的循吏與酷吏〉，收入氏著，《簡牘與秦漢社會》（長沙：湖南大學出版社，2012），頁282。
\DeclareBibliographyDriver{cite:inbook}{%
  \usebibmacro{bibindex}%
  \usebibmacro{dynasty}%
  \usebibmacro{author/editor}%
  \newcunit\newblock%
  \usebibmacro{article-title}\cecomma%
  \usebibmacro{editor+booktitle}%
  \cebracket{\usebibmacro{publ+loc+year}}%
  \usebibmacro{pages}%
  \usebibmacro{finentry}%
}

%朱鴻，〈明成祖與永樂政治〉。臺北：國立臺灣師範大學歷史研究所博士論文，1982。
\DeclareBibliographyDriver{thesis}{%
  \usebibmacro{bibindex}%
  \usebibmacro{author/editor}%
  \setunit*{}%
  \printfield{nameaddon}%
  \newcunit\newblock%
  \ifundef\lasthash{\usebibmacro{book-title}\setunit{\ceperiod}}{}%
  \ifundef\lasthash{}{\usebibmacro{book-title}\setunit{\ceperiod}}%
  \newunit%
  \usebibmacro{loc+inst+type+year}%
  \usebibmacro{finentry}
}
%朱鴻，〈明成祖與永樂政治〉（臺北：國立臺灣師範大學歷史研究所博士論文，1982）。
\DeclareBibliographyDriver{cite:thesis}{%
  \usebibmacro{bibindex}%
  \usebibmacro{author/editor}%
  \setunit*{}%
  \printfield{nameaddon}%
  \newcunit\newblock%
  \ifundef\lasthash{\usebibmacro{book-title}}{}%
  \ifundef\lasthash{}{\usebibmacro{book-title}}%
  \setunit*{\cegen{}{\addspace}}%
  \cebracket{%
    \usebibmacro{loc+inst+type+year}%
  }%
  \usebibmacro{finentry}
}

\DeclareBibliographyDriver{online}{%
  \usebibmacro{bibindex}%
  \usebibmacro{author/editor}%
  \setunit{\addspace}%
  \printfield{nameaddon}%
  \newcunit\newblock%
  \usebibmacro{article-title}\ceperiod\setunit{\addspace}%
  \newunit\newblock%
  \cegen{擷取日期}{Accessed }%
  \usebibmacro{urldate}%
  \ceperiod\setunit{\addspace}%
  \usebibmacro{url}%
  \usebibmacro{finentry}%
}

\DeclareBibliographyDriver{cite:online}{%
  \usebibmacro{bibindex}%
  \usebibmacro{author/editor}%
  \setunit{\addspace}%
  \printfield{nameaddon}%
  \newcunit\newblock%
  \usebibmacro{article-title}\ceperiod\setunit{\addspace}%
  \newunit\newblock%
  \cegen{擷取日期}{Accessed }%
  \usebibmacro{urldate}%
  \ceperiod\setunit{\addspace}%
  \usebibmacro{url}%
  \usebibmacro{finentry}%
}

\DeclareBibliographyDriver{ancient}{%
  \usebibmacro{bibindex}%
  \usebibmacro{dynasty}%
  \usebibmacro{author/editor}%
  \newcunit\newblock%
  \usebibmacro{book-title}%
  \setunit{\ceperiod}%
  \usebibmacro{publ+loc+year}%
  \cegen{年}{\addspace}%
  \printfield[noformat]{version}%
  \usebibmacro{pages}%
  \usebibmacro{finentry}%
}
%王鳴盛，《十七史商榷》（臺北：樂天，1972年影廣雅書局本），卷12，頁1。
\DeclareBibliographyDriver{cite:ancient}{%
  \usebibmacro{bibindex}%
  \usebibmacro{dynasty}%
  \usebibmacro{author/editor}%
  \newcunit\newblock%
  \usebibmacro{book-title}%
  \cegen{}{\addspace}%
  \setunit*{}%
  \cebracket{%
    \usebibmacro{publ+loc+year}%
    \cegen{年}{\addspace}%
    \printfield[noformat]{version}%
  }%
  \usebibmacro{pages}%
  \usebibmacro{finentry}%
}

%［明］尤時熙，《尤西川先生擬學小記》，收入《四庫全書存目叢書》子部第9冊。臺南：莊嚴文化公司，1995。
\DeclareBibliographyDriver{incollection}{%
  \usebibmacro{bibindex}%
  \usebibmacro{dynasty}%
  \usebibmacro{author/editor}%
  \newcunit\newblock%
  \usebibmacro{book-title}%
  \newcunit\newblock%
  \setunit*{\cegen{，收入}{, In\addspace}}%
  \printfield[title]{booktitle}%
  \iffieldundef{booksubtitle}{}{\printfield{booksubtitle}}%
  \iffieldundef{publisher}{\ceperiod\usebibmacro{publ+loc+year}}{}%
  \usebibmacro{pages}%
  \usebibmacro{finentry}%
}
%［明］尤時熙，《尤西川先生擬學小記》，收入《四庫全書存目叢書》子部第9冊（臺南：莊嚴文化公司，1995）
\DeclareBibliographyDriver{cite:incollection}{%
  \usebibmacro{bibindex}%
  \usebibmacro{dynasty}%
  \usebibmacro{author/editor}%
  \newcunit\newblock%
  \usebibmacro{book-title}%
  \newcunit\newblock%
  \setunit*{\cegen{，收入}{, In\addspace}}%
  \printfield[title]{booktitle}%
  \iffieldundef{booksubtitle}{}{\printfield{booksubtitle}}%
  \iffieldundef{publisher}{\cebracket{\usebibmacro{publ+loc+year}}}{}%
  \usebibmacro{pages}%
  \usebibmacro{finentry}%
}

\DeclareBibliographyDriver{unpublished}{%
  \usebibmacro{bibindex}%
  \usebibmacro{mag+news+author}%
  \newcunit\newblock%
  \usebibmacro{article-title}%
  \printfield{note}%
  \cegen{}{\addcomma\addspace}%
  \setunit*{}%
  \usebibmacro{cevol}%
  \usebibmacro{cenum}%
  \usebibmacro{ceseries}%
  \newcunit\newblock%
  \usebibmacro{date}%
  \newcunit\newblock%
  \printlist{location}%
  \usebibmacro{pages}%
  \usebibmacro{finentry}%
}

\DeclareBibliographyDriver{cite:unpublished}{%
  \usebibmacro{mag+news+author}%
  \newcunit\newblock%
  \usebibmacro{article-title}%
  \printfield{note}%
  \cegen{}{\addcomma\addspace}%
  \setunit*{}%
  \usebibmacro{cevol}%
  \usebibmacro{cenum}%
  \usebibmacro{ceseries}%
  \cegen{}{\addspace}%
  \setunit*{}%
  \cebracket{\usebibmacro{date}\cecomma\printlist{location}}%
  \usebibmacro{pages}%
  \usebibmacro{finentry}%
}

%佚名，〈但願人長久：家庭黨支部，家風來育人〉，《新聞聯播》。北京：CCTV1 綜合，2016 年 9 月 17 日。
\DeclareBibliographyDriver{news}{%
  \usebibmacro{bibindex}%
  \usebibmacro{author/editor}%
  \newcunit\newblock%
  \usebibmacro{article-title}\cecomma%
  \usebibmacro{newstitle}%
  \usebibmacro{pages}%
  \setunit{\ceperiod}%
  \usebibmacro{publ+loc+year}%
  \usebibmacro{finentry}%
}
%佚名，〈但願人長久：家庭黨支部，家風來育人〉，《新聞聯播》（北京：CCTV1 綜合，2016 年 9 月 17 日）。
\DeclareBibliographyDriver{cite:news}{%
  \usebibmacro{bibindex}%
  \usebibmacro{author/editor}%
  \newcunit\newblock%
  \usebibmacro{article-title}\cecomma%
  \usebibmacro{newstitle}%
  \cebracket{\usebibmacro{publ+loc+year}}%
  \usebibmacro{pages}%
  \usebibmacro{finentry}%
}

%齊心，〈憶仲勳——紀念習仲勳同志100週年誕辰〉，《人民日報》，2013年10月18日，第6版。
\DeclareBibliographyDriver{newspaper}{%
  \usebibmacro{bibindex}%
%  \usebibmacro{dynasty}%
  \usebibmacro{author/editor}%
  \newcunit\newblock%
  \usebibmacro{article-title}%
  \printfield[journaltitle]{journaltitle}%
  \setunit{\cecomma}%
  \printfield{year}\cecomma%
  \cegen{第}{}\printfield{number}\cegen{版}{}%
  \usebibmacro{finentry}%
}
%齊心，〈憶仲勳——紀念習仲勳同志100週年誕辰〉，《人民日報》（2013年10月18日，第6版）。
\DeclareBibliographyDriver{cite:newspaper}{%
  \usebibmacro{bibindex}%
%  \usebibmacro{dynasty}%
  \usebibmacro{author/editor}%
  \newcunit\newblock%
  \usebibmacro{article-title}%
  \printfield[journaltitle]{journaltitle}%
  \cegen{第}{}\printfield{number}\cegen{版}{}%
  \cebracket{\printfield{year}}%
  \usebibmacro{finentry}%
}

%中共中央全面深化改革領導小組，〈上海市開展進一步規範領導幹部配偶、子女及其配偶經商辦企業管理工作的意見〉，2015年2月27日。
\DeclareBibliographyDriver{simple}{%
  \usebibmacro{bibindex}%
%  \usebibmacro{dynasty}%
  \usebibmacro{author/editor}%
  \newcunit\newblock%
  \usebibmacro{article-title}%
  \setunit{\cecomma}%
  \printfield{year}%
  \usebibmacro{finentry}%
}
%中共中央全面深化改革領導小組，〈上海市開展進一步規範領導幹部配偶、子女及其配偶經商辦企業管理工作的意見〉（2015年2月27日）。
\DeclareBibliographyDriver{cite:simple}{%
  \usebibmacro{bibindex}%
%  \usebibmacro{dynasty}%
  \usebibmacro{author/editor}%
  \newcunit\newblock%
  \printtext[title]{\printfield[noformat]{title}}%
  \cebracket{\printfield{year}}%
  \usebibmacro{finentry}%
}

\DeclareBibliographyDriver{inancient}{%
  \usebibmacro{bibindex}%
  \usebibmacro{dynasty}%
  \usebibmacro{author/editor}%
  \newcunit\newblock\cecomma%
  \setunit*{}%
  \cebook{\printfield{booktitle}}%
  \setunit{\ceperiod}%
  \usebibmacro{publ+loc+year}%
  \usebibmacro{finentry}%
}

\DeclareBibliographyDriver{cite:inancient}{%
  \usebibmacro{bibindex}%
  \usebibmacro{dynasty}%
  \usebibmacro{author/editor}%
  \newcunit\newblock%
  \usebibmacro{article-title}\cecomma%
  \setunit*{}%
  \cebook{\printfield{booktitle}}%
  \cebracket{\usebibmacro{publ+loc+year}}%
  \usebibmacro{pages}%
  \usebibmacro{finentry}%
}

