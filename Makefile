.PHONY: .pdf all clean

all: main.pdf

main.pdf : main.tex
	mkdir -p .deps/
	latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" \
		-latexoption=-file-line-error \
		-latexoption=-synctex=1 \
		-M -MF .deps/main.d \
		-use-make main.tex
-include .deps/main.d

draft.pdf : main.tex
	mkdir -p .deps/
	latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" \
		-latexoption=-file-line-error \
		-latexoption=-synctex=1 \
		-M -MF .deps/draft.d \
		-use-make main.tex \
		-jobname=draft
-include .deps/draft.d

anonymize.pdf : main.tex
	mkdir -p .deps/
	latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" \
		-latexoption=-file-line-error \
		-latexoption=-synctex=1 \
		-M -MF .deps/anonymize.d \
		-use-make main.tex \
		-jobname=anonymize
-include .deps/anonymize.d

acm_test.pdf : main.tex
	mkdir -p .deps/
	latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" \
		-latexoption=-file-line-error \
		-latexoption=-synctex=1 \
		-M -MF .deps/acm_test.d \
		-use-make main.tex \
		-jobname=acm_test
-include .deps/acm_test.d

ieee_test.pdf : main.tex
	mkdir -p .deps/
	latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" \
		-latexoption=-file-line-error \
		-latexoption=-synctex=1 \
		-M -MF .deps/ieee_test.d \
		-use-make main.tex \
		-jobname=ieee_test
-include .deps/ieee_test.d

%.tex: %.raw
	./raw2tex $< > $@

%.tex: %.dat
	./dat2tex $< > $@

arxiv.tar: main.pdf
	tar -cvzf arxiv.tar $(shell ./get_arxiv_deps.sh .deps/main.d) main.bbl

clean:
	latexmk -CA
	rm -rf .deps/

