all: regular irregular
	echo "done"

.DEFAULT:
	dither -xvt c tape.dh dump cfg.$@.json
	dither -xvt c vectorize.dh
	node --max-old-space-size=8192 makefont.js $@

zip:
	for f in *.ttf; do\
		zip -9 $$f.zip $$f ARPHICPL.TXT;\
	done;
