# Latex Makefile using latexmk

PROJNAME=main

FLAGS="-interaction=nonstopmode -file-line-error"

.PHONY: $(PROJNAME).pdf all clean

all: $(PROJNAME).pdf

frn: $(PROJNAME)-frn.pdf

$(PROJNAME)-frn.pdf: $(PROJNAME)-frn.tex
	pdflatex $(PROJNAME)-frn.tex

$(PROJNAME)-frn.tex: $(PROJNAME).tex
	pdflatex $(PROJNAME).tex
	$(RM) $(PROJNAME).pdf

$(PROJNAME).pdf: $(PROJNAME).tex $(PROJNAME)-frn.pdf
	latexmk -pdf -pdflatex="pdflatex -interactive=nonstopmode" -use-make $<

cleanall:
	latexmk -C
	$(RM) $(PROJNAME)-frn.tex

clean:
	latexmk -c