@echo off
attrib +h "Makefile*" /s
attrib +h "*.bat" /s
attrib +h "*.dtx" /s
attrib +h "*.mak" /s
attrib +h "examples\*.*" /s
del "*.*" /s /q> nul
if exist svg-inkscape rmdir svg-inkscape /s /q > nul
if exist svg-extract rmdir svg-extract /s /q > nul
attrib -h "*.*" /s
