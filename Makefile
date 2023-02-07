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

%.tex: %.raw
	./raw2tex $< > $@

%.tex: %.dat
	./dat2tex $< > $@

clean:
	latexmk -CA
	rm -rf .deps/

