# -*- Mode: Makefile; tab-width: 3; indent-tabs-mode: t -*-

enums:
	@sbcl --noinform --disable-debugger --no-userinit --load "tools/generate-enums.lisp" --eval "(main)"

funcs:
	@sbcl --noinform --disable-debugger --load "tools/generate-funcs.lisp" --eval "(spec-parser:main)"

specs:
	cd spec && wget -N http://www.opengl.org/registry/api/enum.spec
	cd spec && wget -N http://www.opengl.org/registry/api/enumext.spec
	cd spec && wget -N http://www.opengl.org/registry/api/gl.spec

clean:
	find . -name ".fasls" | xargs rm -rf
	find . \( -name "*.dfsl" -o -name "*.fasl" -o -name "*.fas" -o -name "*.lib" -o -name "*.x86f" -o -name "*.ppcf" -o -name "*.nfasl" -o -name "*.fsl" \) -exec rm {} \;

.PHONY: enums funcs specs clean
# vim: ft=make ts=3 noet
