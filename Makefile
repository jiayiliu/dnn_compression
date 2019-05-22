.PHONY:
	all

all: download html


download:
	wget "${SPREADSHEET}"/export?format=csv -O output.csv



html: header.md
	python convert.py
	pandoc index.md -o tmp.html
	sed 's/<table>/<table class="sortable-theme-bootstrap" data-sortable>/' tmp.html > index.html
	rm tmp.html

