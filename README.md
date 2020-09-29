
 svg and svg-extract &ndash; Handling SVG pictures in LaTeX documents
----------------------------------------------------------------------------

 Copyright (C) Philip Ilten <philten@cern.ch>, 2012-2016<br>
 Copyright (C) Falk Hanisch <hanisch.latex@outlook.com>, 2017-2020

 **svg 2020/09/29 v2.02i**

----------------------------------------------------------------------------

 This material is subject to the LaTeX Project Public License version 1.3c
 or later. See http://www.latex-project.org/lppl.txt for details.

----------------------------------------------------------------------------


Summary
-------

The **svg** package provides an user&#8209;interface for automated integration
of SVG&nbsp;graphics created with ***Inkscape*** into LaTeX&nbsp;documents.
Therefor the capabilities provided by ***Inkscape***&mdash;and its command line
tool&mdash;are used to export the text within a SVG&nbsp;graphic to a separate
file, which is then rendered by LaTeX. The two commands `\includesvg` and
`\includeinkscape` are provided as central user&#8209;interface, which are very
similar to the `\includegraphics` command of the **graphicx** package.

In addition, the package **svg-extract** extends the user&#8209;interface of
package **svg** in order to support the extraction of these graphics into
independent files in different graphic formats, exactly as they are rendered
within the LaTeX&nbsp;document. For the creation of these graphics in the
well&#8209;known formats PDF, EPS and&nbsp;PS, LaTeX and possibly conversion
tools shipped with the most LaTeX distributions are used. If the graphics are
required in other file formats, either ***ImageMagick*** or ***Ghostscript***
can be invoked.


Versions
--------


**v2.02i** (2020/09/29)
+ update for package **scrlfile** v3.32 and kernel (2020/10/01)

**v2.02h** (2020/06/23)
+ hot fix for package **transparent**, 
  see https://github.com/mrpiggi/svg/issues/28
  
**v2.02g** (2020/06/12)
+ hot fix for including files with mutliple dots in it's names, 
  see https://github.com/mrpiggi/svg/issues/27

**v2.02f** (2020/05/07)
+ support for ***Inkscape*** 1.0

**v2.02e** (2020/01/13)
+ fixes for new version of package **scrbase**

**v2.02d** (2019/10/22)
+ fix bugs with current kernel (2019/10/01) regarding file name parsing, see
  https://github.com/mrpiggi/svg/issues/16
+ use `\filemoddate` with XeLaTeX, see https://github.com/mrpiggi/svg/issues/12

**v2.02c** (2019/10/10)
+ fix bugs with current kernel (2019/10/01) regarding file name parsing

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
