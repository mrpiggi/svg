
 svg -- Include SVG pictures in pdfLaTeX documents using Inkscape
----------------------------------------------------------------------------

 Copyright (C) Philip Ilten <philten@cern.ch>,  2012-2016
 Copyright (C) Falk Hanisch <hanisch.latex@outlook.com>, 2016-2017

 svg 2017/xx/xx v2.00

============================================================================

 This material is subject to the LaTeX Project Public License version 1.3c 
 or later. See http://www.latex-project.org/lppl.txt for details.

----------------------------------------------------------------------------

Summary
-------

This package provides a command similar to the \includegraphics command of the 
graphicx package, but for the inclusion of SVGs using Inkscape.

    \includesvg[<options>]{<svg filename>}

A variety of options are available, including width, height, and path of the 
SVG. Additionally, it is possible to extract the SVG image to a PDF, EPS, or 
PNG, exactly as it is rendered within the LaTeX document. Within the
documentation an example is given using an SVG created from the high energy
particle physics analysis package ROOT.

Versions
--------

**v2.00** (2017/xx/xx)


**v1.0** (2016/10/10)
+ first version of `svg` by Philip Ilten
