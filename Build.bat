@echo off
xelatex.exe --synctex=-1 NTUHist
biber --bblencoding=utf8 -l zh__stroke NTUHist
xelatex.exe --synctex=-1 NTUHist
:: del /q *.aux *.bbl *.blg *.log *.out *.toc *.bcf *.xml *.synctex *.nlo *.nls *.bak *.ind *.idx *.ilg *.lof *.lot *.ent-x *.tmp *.ltx *.los *.lol *.loc *.listing *.gz *.synctex(busy)