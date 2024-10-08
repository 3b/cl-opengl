# -*- Mode: Makefile; tab-width: 3; indent-tabs-mode: t -*-

note:
	@echo "This Makefile is only for rebuilding the low-level bindings from the"
	@echo "official .spec file, it isn't needed for normal use. See tools/README.md"
	@echo "for instructions for updating bindings."

# allow overriding location of sbcl, for example
# CL="~/lisp/clbuild/clbuild --implementation sbcl lisp" make funcs
# CL="sbcl --load ~/quicklisp/setup" make bindings
CL ?= sbcl  --noinform --disable-debugger

bindings:
	@$(CL) --no-userinit --script "tools/generate-bindings.lisp"

REPO="KhronosGroup/OpenGL-Registry"
BRANCH=main
#REPO=3b/OpenGL-Registry
#BRANCH=fix-groups
# fixme: probably should grab xml file with svn instead of wget?
specs:
	cd spec && wget -N https://raw.githubusercontent.com/$(REPO)/$(BRANCH)/xml/gl.xml
	cd spec && curl "https://api.github.com/repos/$(REPO)/commits/heads/$(BRANCH)" -o github-info.json

clean:
	find . -name ".fasls" | xargs rm -rf
	find . \( -name "*.dfsl" -o -name "*.fasl" -o -name "*.fas" -o -name "*.lib" -o -name "*.x86f" -o -name "*.ppcf" -o -name "*.nfasl" -o -name "*.fsl" \) -exec rm {} \;

.PHONY: bindings specs clean note
# vim: ft=make ts=3 noet
