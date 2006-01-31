# -*- Mode: Makefile; tab-width: 3; indent-tabs-mode: t -*-

clean:
	find . -name ".fasls" | xargs rm -rf
	find . \( -name "*.dfsl" -o -name "*.fasl" -o -name "*.fas" -o -name "*.lib" -o -name "*.x86f" -o -name "*.ppcf" -o -name "*.nfasl" -o -name "*.fsl" \) -exec rm {} \;

# vim: ft=make ts=3 noet
