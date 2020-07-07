.PHONY: not-defined.js
not-defined.js:
	grep '    ' README.md | sed -e 's/  //g' > is-not-defined.js
