MAIN_TEX = main.tex

.PHONY: all
all: compile lint clean

.PHONY: compile
compile:
	latexmk -c $(MAIN_TEX)

.PHONY: clean
clean:
	find . -type d -name Library -prune -o -type f -name '*.aux' -exec rm -r {} \;
	find . -type d -name Library -prune -o -type f -name '*.dvi' -exec rm -r {} \;
	find . -type d -name Library -prune -o -type f -name '*.fdb_latexmk' -exec rm -r {} \;
	find . -type d -name Library -prune -o -type f -name '*.fls' -exec rm -r {} \;
	find . -type d -name Library -prune -o -type f -name '*.synctex.gz' -exec rm -r {} \;
	find . -type d -name Library -prune -o -type f -name '*.log' -exec rm -r {} \;
	find . -type d -name Library -prune -o -type f -name '*.synctex' -exec rm -r {} \;
	find . -type d -name Library -prune -o -type f -name '*.toc' -exec rm -r {} \;
	rm -f **/__latexindent_temp.tex
	rm -f __latexindent_temp.te

.PHONY: install
install:
	npm install
	npm audit fix

.PHONY: lint
lint:
	npx textlint "**/**.tex"

.PHONY: fix-lint
fix-lint:
	npx textlint "**/**.tex" --fix