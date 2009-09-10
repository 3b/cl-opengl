# -*- Mode: Makefile; tab-width: 3; indent-tabs-mode: t -*-

# allow overriding location of sbcl, for example
# CL="~/lisp/clbuild/clbuild --implementation sbcl lisp" make funcs
CL ?= sbcl  --noinform --disable-debugger

enums:
	@$(CL) --no-userinit --load "tools/generate-enums.lisp" --eval "(main)"

funcs:
	@$(CL) --load "tools/generate-funcs.lisp" --eval "(spec-parser:main)"

specs:
	cd spec && wget -N http://www.opengl.org/registry/api/enum.spec
	cd spec && wget -N http://www.opengl.org/registry/api/enumext.spec
	cd spec && wget -N http://www.opengl.org/registry/api/gl.spec
	cd spec && wget -N http://www.opengl.org/registry/api/gl.tm

clean:
	find . -name ".fasls" | xargs rm -rf
	find . \( -name "*.dfsl" -o -name "*.fasl" -o -name "*.fas" -o -name "*.lib" -o -name "*.x86f" -o -name "*.ppcf" -o -name "*.nfasl" -o -name "*.fsl" \) -exec rm {} \;

.PHONY: enums funcs specs clean
# vim: ft=make ts=3 noet
