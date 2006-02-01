# -*- Mode: Makefile; tab-width: 3; indent-tabs-mode: t -*-
#
# Makefile --- Make targets for generating the documentation.
#
# Copyright (c) 2006, Luis Oliveira <loliveira@common-lisp.net> 
#   All rights reserved. 
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
#  o Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer. 
#  o Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
#  o Neither the name of the author nor the names of the contributors may
#    be used to endorse or promote products derived from this software
#    without specific prior written permission. 
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT
# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

docs:
	sh gendocs.sh -o cl-opengl --html "--css-include=style.css" cl-opengl "CL-OpenGL User Manual"

clean:
	find . \( -name "*.info" -o -name "*.aux" -o -name "*.cp" -o -name "*.fn" -o -name "*.fns" -o -name "*.ky" -o -name "*.log" -o -name "*.pg" -o -name "*.toc" -o -name "*.tp" -o -name "*.vr" \) -exec rm {} \;
	rm -rf cl-opengl

upload-docs:
	rsync -av --delete -e ssh cl-opengl common-lisp.net:/project/cl-opengl/public_html/manual/

# vim: ft=make ts=3 noet
