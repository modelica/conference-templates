PAPERS = example-paper example-user-presentation

.PHONY: all clean distclean

all: $(addsuffix .pdf,$(PAPERS))

%.pdf: %.tex
	latexmk -pdf $*

clean:
	@for name in $(PAPERS); do \
		latexmk -C $$name; \
	done
	rm -f *.aux *.bbl *.blg *-blx.bib *.log *.out *.run.xml *.toc *.bcf *~
	rm -f *.nlo *.ist *.nls *.ilg *.fls *.fdb*

distclean: clean
	rm -f $(addsuffix .pdf,$(PAPERS))
	rm -rf auto/ _region_*
