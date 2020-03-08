
# https://stackoverflow.com/questions/4728810/makefile-variable-as-prerequisite
check-env:
ifndef SPREADSHEET
	$(error SPREADSHEET is undefined)
endif

.PHONY:
	all

all: download html

download: check-env
	wget ${SPREADSHEET}/export?format=csv -O output.csv

html: header.md
	python3 convert.py
	pandoc index.md -o tmp.html
	sed 's/<table>/<table class="sortable-theme-bootstrap" data-sortable>/' tmp.html > index.html
	rm tmp.html

