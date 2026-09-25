# Repository root: latexmk -pdf
# -pdf selects the $pdflatex rule, so run LuaLaTeX through that rule.
$pdflatex = 'lualatex -synctex=1 -interaction=nonstopmode -file-line-error -halt-on-error %O %S';
$lualatex = $pdflatex;
$pdf_mode = 1;
$dvi_mode = 0;
$postscript_mode = 0;
$do_cd = 1;
@default_files = ('midterm/main.tex');
