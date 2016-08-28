# Makefile for ZzuThesis

METHOD = xelatex
THESISMAIN = main
PACKAGE=zzuthesis

ifeq ($(MAKE),)
    override MAKE = make
endif

THESISCONTENTS=$(THESISMAIN).tex data/*.tex
BIBFILE=ref/*.bib
CLSFILES=$(PACKAGE).cls $(PACKAGE).cfg

all: thesis a3cover

###### for thesis

thesis: $(THESISMAIN).pdf

$(THESISMAIN).pdf: $(CLSFILES) $(THESISCONTENTS) $(THESISMAIN).bbl
	xelatex $(THESISMAIN).tex
	xelatex $(THESISMAIN).tex

$(THESISMAIN).bbl: $(BIBFILE)
	xelatex $(THESISMAIN).tex
	-bibtex $(THESISMAIN)
	rm $(THESISMAIN).pdf

###### for a3cover

a3cover:a3cover.pdf

a3cover.pdf: spine.pdf $(THESISMAIN).pdf a3cover.tex
	xelatex a3cover.tex

spine.pdf: spine.tex
	xelatex spine.tex

##### clean

clean: 
	-@rm -f \
		*~ \
		spine.pdf \
		*.aux \
		*.bak \
		*.bbl \
		*.blg \
		*.dvi \
		*.exa \
		*.glo \
		*.gls \
		*.idx \
		*.ilg \
		*.ind \
		*.ist \
		*.log \
		*.out \
		*.ps \
		*.thm \
		*.toc \
		*.lof \
		*.lot \
		*.loe \
		data/*.aux \
                data/*~
