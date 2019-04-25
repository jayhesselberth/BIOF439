indir = /Users/abhijit/ARAASTAT/Teaching/BIOF439/slides/lectures/
outdir = /Users/abhijit/ARAASTAT/Teaching/BIOF439/docs/slides/lectures/

rmdfiles = $(wildcard *.Rmd)
htmlfiles = $(addprefix $(outdir),$(rmdfiles:.Rmd=.html))
pdffiles = $(addprefix $(outdir),$(rmdfiles:.Rmd=.pdf))

.PHONY: print_vars

print_vars:
	echo $(htmlfiles)

html: $(htmlfiles)
pdf: $(pdffiles)

$(outdir)%.html: %.Rmd
	Rscript -e "rmarkdown::render('$<', output_dir='$(outdir)')"

$(outdir)%.pdf: %.Rmd
	Rscript -e "pagedown::chrome_print('$<', output='$@')"

cleanpdf:
	rm $(pdffiles)
cleanhtml:
	rm $(htmlfiles)


