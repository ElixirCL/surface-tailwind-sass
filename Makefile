.PHONY: docs deps clean server

docs d:
	mkdir -p docs
	asciidoctor README.adoc
	mv README.html docs/index.html

deps dg:
	mix deps.get

clean c:
	rm -rf _build/

server s:
	mix server