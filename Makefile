FILENAME = dapse13-analysis
BIBFILENAME = $(FILENAME)

.SUFFIXES: .tex .Rnw
PATTERNS = $(wildcard *.Rnw)
TEX = $(patsubst %.Rnw, %.tex, $(PATTERNS))

all: patterns $(FILENAME).tex $(BIBFILENAME).bib $(TEX) contents.tex abstract.tex custom.tex title.tex
	pdflatex $(FILENAME)
	bibtex $(FILENAME)
	pdflatex $(FILENAME)
	pdflatex $(FILENAME)

%.tex: %.Rnw
	R CMD Sweave $<

patterns:
	$(MAKE) -C patterns

view:
	open $(FILENAME).pdf

clean:
	$(MAKE) -C patterns clean
	-rm -f *.aux *.bbl *.blg *.log *.out *.idx *.ilg *.ind *.toc *.d
