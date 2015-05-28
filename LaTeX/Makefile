NAME=example-paper

.PHONY: all

all: clean $(NAME).pdf

$(NAME).pdf: $(NAME).tex $(NAME).bib
	pdflatex $(NAME)
	bibtex $(NAME)
	pdflatex $(NAME)
	pdflatex $(NAME)


clean:
	rm -f *.aux *.bbl *.blg *-blx.bib *.log *.out *.run.xml *.toc *.bcf *~
	rm -f *.nlo *.ist *.nls *.ilg

distclean: clean
	rm -f $(NAME).pdf
	rm -rf auto/ _region_*
