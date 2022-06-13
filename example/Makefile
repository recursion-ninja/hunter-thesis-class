manuscript := thesis
artifacts  := aux bbl bcf blg blx.bib lof lot out pdf run.xml synctex.gz toc

$(manuscript).pdf: $(manuscript).tex
	pdflatex $<
	biber    $(manuscript)
	pdflatex $<
	pdflatex $<

all: clean $(manuscript).pdf

clean:
	-rm -f *~ *.log $(addprefix $(manuscript).,$(artifacts))

.PHONY:	all clean
