.SUFFIXES: .tex .Rnw
PATTERNS = $(wildcard *.Rnw)
TEX = $(patsubst %.Rnw, %.tex, $(PATTERNS))

all: $(TEX)

%.tex: %.Rnw
	R CMD Sweave $<
	sed -e "s/includegraphics{/includegraphics{patterns\//g" $@ > tmp.tex
	mv tmp.tex $@


clean:
	rm $(TEX) *.pdf
