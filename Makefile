# -*- Mode: Makefile; tab-width: 3; indent-tabs-mode: t -*-

# allow overriding location of sbcl, for example
# CL="~/lisp/clbuild/clbuild --implementation sbcl lisp" make funcs
CL ?= sbcl  --noinform --disable-debugger

bindings:
	@$(CL) --no-userinit --script "tools/generate-bindings.lisp"

# fixme: probably should grab xml file with svn instead of wget?
specs:
	cd spec && wget -N https://cvs.khronos.org/svn/repos/ogl/trunk/doc/registry/public/api/gl.xml
	cd spec && svn info --xml https://cvs.khronos.org/svn/repos/ogl/trunk/doc/registry/public/api/ > svn-info.xml

clean:
	find . -name ".fasls" | xargs rm -rf
	find . \( -name "*.dfsl" -o -name "*.fasl" -o -name "*.fas" -o -name "*.lib" -o -name "*.x86f" -o -name "*.ppcf" -o -name "*.nfasl" -o -name "*.fsl" \) -exec rm {} \;

.PHONY: bindings specs clean
# vim: ft=make ts=3 noet
