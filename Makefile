# Makefile for ZzuThesis

LATEXMKOPTS = -xelatex -file-line-error -halt-on-error -interaction=nonstopmode
THESISMAIN = main
PACKAGE = zzuthesis

THESISCONTENTS=$(THESISMAIN).tex data/*.tex
CLSFILES=$(PACKAGE).cls

# make deletion work on Windows
ifdef SystemRoot
	RM = del /Q
else
	RM = rm -f
endif

all: thesis a3cover

###### for thesis

thesis: $(THESISMAIN).pdf

$(THESISMAIN).pdf: $(CLSFILES) $(THESISCONTENTS)
	latexmk $(LATEXMKOPTS) $(THESISMAIN)

###### for a3cover

a3cover:a3cover.pdf

a3cover.pdf: spine.pdf $(THESISMAIN).pdf a3cover.tex
	xelatex a3cover.tex

spine.pdf: spine.tex
	xelatex spine.tex

##### clean

clean: 
	latexmk -c $(THESISMAIN) spine a3cover
	-@$(RM) *~ *.bbl *.exa *.xdv data/*.aux
