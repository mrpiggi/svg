
 svg and svg-extract &ndash; Handling SVG pictures in LaTeX documents 
----------------------------------------------------------------------------

 Copyright (C) Philip Ilten <philten@cern.ch>, 2012-2016  
 Copyright (C) Falk Hanisch <hanisch.latex@outlook.com>, 2017-

 svg 2019/xx/xx v2.03

----------------------------------------------------------------------------

 This material is subject to the LaTeX Project Public License version 1.3c 
 or later. See http://www.latex-project.org/lppl.txt for details.

----------------------------------------------------------------------------


Summary
-------

The **svg** package is intended for the automated integration of 
SVG&nbsp;graphics into LaTeX&nbsp;documents. Therefor the capabilities provided
by ***Inkscape***&mdash;or more precisely its command line tool&mdash;are used 
to export the text within a SVG&nbsp;graphic to a separate file, which is then 
rendered by LaTeX. The two commands `\includesvg` and `\includeinkscape` are 
provided as central user&#8209;interface, which are very similar to the 
`\includegraphics` command of the **graphicx** package.

In addition, the package **svg-extract** allows the extraction and of these 
graphics into independent files in different graphic formats, exactly as it is
rendered within the LaTeX&nbsp;document. For the creation of these graphics in
the well&#8209;known formats PDF, EPS and&nbsp;PS, LaTeX and possibly
conversion tools shipped with the distribution are used. If the graphics are 
required in other file formats, either ***ImageMagick*** or ***Ghostscript*** 
can be invoked.


Versions
--------

**v2.03** (2019/xx/xx)
+ command line format of ***Inkscape&nbsp;1.0*** and later is supported
+ extraction of independent graphic&nbsp;files is only done if necessary; 
  options `extract=forced` and `convert=forced` to invoke process with every 
  single LaTeX&nbsp;run
+ files exported with ***Inkscape*** or extracted as well as converted with
  ***ImageMagick*** or ***Ghostscript*** are not moved from root directory but
  created directly in the path given with `inkscapepath` or `extractpath`
+ option `extractpath=inkscapepath` and `extractpath=inkscapesubpath` to create 
  extracted/converted files in the same directory as the exported files of 
  ***Inkscape***
+ option `clean=nolatex` to preserve auxiliary LaTeX&nbsp;files used during the 
  extraction process

**v2.02b** (2018/11/12)
+ fix bug for package **tikzscale** which changes the definition of
  `\includegraphics`

**v2.02a** (2018/10/17)
+ fix bug for package **polyglossia** which fakes **babel** poorly

**v2.02** (2018/09/08)
+ distortion of included and extracted graphics supported with options `distort` 
  (or `keepaspectratio`) and `extractdistort` as well as rotation for 
  extractions (`extractangle`)
+ fixed errors with active double qoutes from **babel** in path arguments
+ multiple dots within file names possible
+ package **trimspaces** required

**v2.01** (2017/11/29)
+ new option `svgextension` to change the format of files exported by
  ***Inkscape*** from `svg` to a custom one
+ usage of `\input{tex filename}` within ***Inkscape*** graphics
  locates files in all declared searched folders

**v2.00b** (2017/05/23)
+ improved warnings, if package **svg** is loaded by package **svg-extract**

**v2.00a** (2017/03/28)
+ Bug fix for checking stock- and mediasizes

**v2.00** (2017/03/27)
+ New maintainer: Falk Hanisch
+ Re-implementation from scratch
+ functionality split in two packages **svg** and **svg-extract**
+ package **svg** intended for including SVG files
+ package **svg-extract** for extracting graphic files rendered with LaTeX
+ **svg-extract**: enhanced support for ***ImageMagick***
+ **svg-extract**: support for ***Ghostscript*** added
+ package **subfig** not required anymore
+ support of subfigures stopped due to the huge number of packages which deal 
  with this topic and the large variety of implementing this functionality; 
  naming exported graphics after their consecutive numbering can't be ensured
  for all variants of subfigures, so it's neglected

**v1.0** (2016/10/10)
+ initial version by Philip Ilten
