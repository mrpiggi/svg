@echo off
attrib +h "*.bat" /s
attrib +h "*.dtx" /s
attrib +h "*.ins" /s
attrib +h "examples\*.*" /s
del "*.*" /s /q> nul
rmdir svg-extract
rmdir svg-inkscape
attrib -h "*.*" /s
