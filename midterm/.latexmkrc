# midterm directory: latexmk -pdf
# Keep the engine settings identical to ../.latexmkrc.
$pdflatex = 'lualatex -synctex=1 -interaction=nonstopmode -file-line-error -halt-on-error %O %S';
$lualatex = $pdflatex;
$pdf_mode = 1;
$dvi_mode = 0;
$postscript_mode = 0;
$do_cd = 1;
@default_files = ('main.tex');
