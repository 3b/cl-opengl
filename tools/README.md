To rebuild/update bindings:

0. Download updated .spec file (optional):  
    In top-level cl-opengl dir  
    `make specs`

1. Build bindings:  
    In top-level cl-opengl dir  
    `make bindings > /tmp/changed`

2. Look at `/tmp/changed` file / `git diff` and see if any names need edited.  
    Mostly looking at function names or suspicious value changes in enums,
    or if any argument types changed in a way that needs manual adjustment.
    
    For example add `-` before `i64v` in
    ```
    (defglextfun ("glGetQueryBufferObjecti64v" get-query-buffer-objecti64v) :void
      (id uint)
      (buffer uint)
      (pname enum)
      (offset intptr))

    ```
    
    Just edit the generated file (`gl/funcs-gl-glcore.lisp` etc.,) it
    will re-use previous contents on next run.
    
    Generally try to keep actual words delimited by `-` in function
    names, as well as separating type/argument count suffixes like
    `i64v` and extension suffixes `ARB`,`EXT`,etc. Look at existing
    functions and try to match them if possible.
    
    Also check for any new `duplicate enum` messages, and see
    `special-cases.lisp` for example of handling differences between
    GL and GLES.

3. If any names were hand-edited, run `make bindings` again to
regenerate package definition to match.

4. Proofread new function names in `git diff` or `gitk` or whatever.

