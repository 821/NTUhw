@echo off
xelatex.exe --synctex=-1 report
biber --bblencoding=utf8 -l zh__stroke report
xelatex.exe --synctex=-1 report
:: del /q *.aux *.bbl *.blg *.log *.out *.toc *.bcf *.xml *.synctex *.nlo *.nls *.bak *.ind *.idx *.ilg *.lof *.lot *.ent-x *.tmp *.ltx *.los *.lol *.loc *.listing *.gz *.synctex(busy)