;;; generated file, do not edit
;;; glext version 42 ( 2008/08/16 )

(defpackage #:cl-opengl3-bindings
  (:nicknames #:%gl3)
  (:use #:common-lisp #:cffi)
  (:shadow #:char #:float #:byte #:boolean #:string)
  (:export
   #:*glext-version*
   #:*glext-last-updated*
   #:*gl-get-proc-address*
   #:opengl-error
   #:check-error
   #:enum
   #:AttribMask
   #:ClearBufferMask
   #:ClientAttribMask
   #:BufferAccessMask

  ;; Types.
  #:char #:char-arb #:intptr #:sizeiptr #:intptr-arb #:sizeiptr-arb 
  #:handle-arb #:half #:half-arb #:half-nv #:int64 #:uint64 #:clampd 
  #:double #:clampf #:float #:sizei #:uint #:ushort #:ubyte #:int 
  #:short #:byte #:void #:bitfield #:boolean #:string #:int64-ext 
  #:uint64-ext 

  ;; Functions.
  #:clip-plane #:cull-face #:front-face #:hint #:line-width 
  #:point-size #:polygon-mode #:scissor #:shade-model 
  #:tex-parameter-f #:tex-parameter-fv #:tex-parameter-i 
  #:tex-parameter-iv #:tex-image-1d #:tex-image-2d #:tex-env-f 
  #:tex-env-fv #:tex-env-i #:tex-env-iv #:draw-buffer #:clear 
  #:clear-color #:clear-stencil #:clear-depth #:stencil-mask 
  #:color-mask #:depth-mask #:disable #:enable #:finish #:flush 
  #:blend-func #:logic-op #:stencil-func #:stencil-op #:depth-func 
  #:pixel-store-f #:pixel-store-i #:read-buffer #:copy-pixels 
  #:read-pixels #:get-boolean-v #:get-clip-plane #:get-double-v 
  #:get-error #:get-float-v #:get-integer-v #:get-string 
  #:get-tex-env-fv #:get-tex-env-iv #:get-tex-image 
  #:get-tex-parameter-fv #:get-tex-parameter-iv 
  #:get-tex-level-parameter-fv #:get-tex-level-parameter-iv 
  #:is-enabled #:depth-range #:viewport #:array-element 
  #:draw-arrays #:draw-elements #:get-pointer-v #:polygon-offset 
  #:copy-tex-image-1d #:copy-tex-image-2d #:copy-tex-sub-image-1d 
  #:copy-tex-sub-image-2d #:tex-sub-image-1d #:tex-sub-image-2d 
  #:bind-texture #:delete-textures #:gen-textures #:is-texture 
  #:blend-color #:blend-equation #:draw-range-elements 
  #:tex-image-3d #:tex-sub-image-3d #:copy-tex-sub-image-3d 
  #:active-texture #:sample-coverage #:compressed-tex-image-3d 
  #:compressed-tex-image-2d #:compressed-tex-image-1d 
  #:compressed-tex-sub-image-3d #:compressed-tex-sub-image-2d 
  #:compressed-tex-sub-image-1d #:get-compressed-tex-image 
  #:blend-func-separate #:multi-draw-arrays #:multi-draw-elements 
  #:point-parameter-f #:point-parameter-fv #:point-parameter-i 
  #:point-parameter-iv #:gen-queries #:delete-queries #:is-query 
  #:begin-query #:end-query #:get-query-iv #:get-query-object-iv 
  #:get-query-object-uiv #:bind-buffer #:delete-buffers 
  #:gen-buffers #:is-buffer #:buffer-data #:buffer-sub-data 
  #:get-buffer-sub-data #:map-buffer #:unmap-buffer 
  #:get-buffer-parameter-iv #:get-buffer-pointer-v 
  #:blend-equation-separate #:draw-buffers #:stencil-op-separate 
  #:stencil-func-separate #:stencil-mask-separate #:attach-shader 
  #:bind-attrib-location #:compile-shader #:create-program 
  #:create-shader #:delete-program #:delete-shader #:detach-shader 
  #:disable-vertex-attrib-array #:enable-vertex-attrib-array 
  #:get-active-attrib #:get-active-uniform #:get-attached-shaders 
  #:get-attrib-location #:get-program-iv #:get-program-info-log 
  #:get-shader-iv #:get-shader-info-log #:get-shader-source 
  #:get-uniform-location #:get-uniform-fv #:get-uniform-iv 
  #:get-vertex-attrib-dv #:get-vertex-attrib-fv 
  #:get-vertex-attrib-iv #:get-vertex-attrib-pointer-v #:is-program 
  #:is-shader #:link-program #:shader-source #:use-program 
  #:uniform-1f #:uniform-2f #:uniform-3f #:uniform-4f #:uniform-1i 
  #:uniform-2i #:uniform-3i #:uniform-4i #:uniform-1fv #:uniform-2fv 
  #:uniform-3fv #:uniform-4fv #:uniform-1iv #:uniform-2iv 
  #:uniform-3iv #:uniform-4iv #:uniform-matrix-2fv 
  #:uniform-matrix-3fv #:uniform-matrix-4fv #:validate-program 
  #:vertex-attrib-1d #:vertex-attrib-1dv #:vertex-attrib-1f 
  #:vertex-attrib-1fv #:vertex-attrib-1s #:vertex-attrib-1sv 
  #:vertex-attrib-2d #:vertex-attrib-2dv #:vertex-attrib-2f 
  #:vertex-attrib-2fv #:vertex-attrib-2s #:vertex-attrib-2sv 
  #:vertex-attrib-3d #:vertex-attrib-3dv #:vertex-attrib-3f 
  #:vertex-attrib-3fv #:vertex-attrib-3s #:vertex-attrib-3sv 
  #:vertex-attrib-4nbv #:vertex-attrib-4niv #:vertex-attrib-4nsv 
  #:vertex-attrib-4nub #:vertex-attrib-4nubv #:vertex-attrib-4nuiv 
  #:vertex-attrib-4nusv #:vertex-attrib-4bv #:vertex-attrib-4d 
  #:vertex-attrib-4dv #:vertex-attrib-4f #:vertex-attrib-4fv 
  #:vertex-attrib-4iv #:vertex-attrib-4s #:vertex-attrib-4sv 
  #:vertex-attrib-4ubv #:vertex-attrib-4uiv #:vertex-attrib-4usv 
  #:vertex-attrib-pointer #:uniform-matrix-2x3-fv 
  #:uniform-matrix-3x2-fv #:uniform-matrix-2x4-fv 
  #:uniform-matrix-4x2-fv #:uniform-matrix-3x4-fv 
  #:uniform-matrix-4x3-fv #:color-mask-i #:get-boolean-i-v 
  #:get-integer-i-v #:enable-i #:disable-i #:is-enabled-i 
  #:begin-transform-feedback #:end-transform-feedback 
  #:bind-buffer-range #:bind-buffer-base 
  #:transform-feedback-varyings #:get-transform-feedback-varying 
  #:clamp-color #:begin-conditional-render #:end-conditional-render 
  #:vertex-attrib-i1i #:vertex-attrib-i2i #:vertex-attrib-i3i 
  #:vertex-attrib-i4i #:vertex-attrib-i1ui #:vertex-attrib-i2ui 
  #:vertex-attrib-i3ui #:vertex-attrib-i4ui #:vertex-attrib-i1iv 
  #:vertex-attrib-i2iv #:vertex-attrib-i3iv #:vertex-attrib-i4iv 
  #:vertex-attrib-i1uiv #:vertex-attrib-i2uiv #:vertex-attrib-i3uiv 
  #:vertex-attrib-i4uiv #:vertex-attrib-i4bv #:vertex-attrib-i4sv 
  #:vertex-attrib-i4ubv #:vertex-attrib-i4usv 
  #:vertex-attrib-ipointer #:get-vertex-attrib-iiv 
  #:get-vertex-attrib-iuiv #:get-uniform-uiv 
  #:bind-frag-data-location #:get-frag-data-location #:uniform-1ui 
  #:uniform-2ui #:uniform-3ui #:uniform-4ui #:uniform-1uiv 
  #:uniform-2uiv #:uniform-3uiv #:uniform-4uiv #:tex-parameter-iiv 
  #:tex-parameter-iuiv #:get-tex-parameter-iiv 
  #:get-tex-parameter-iuiv #:clear-buffer-iv #:clear-buffer-uiv 
  #:clear-buffer-fv #:clear-buffer-fi #:get-string-i 
  #:draw-arrays-instanced-arb #:draw-elements-instanced-arb 
  #:is-renderbuffer #:bind-renderbuffer #:delete-renderbuffers 
  #:gen-renderbuffers #:renderbuffer-storage 
  #:get-renderbuffer-parameter-iv #:is-framebuffer 
  #:bind-framebuffer #:delete-framebuffers #:gen-framebuffers 
  #:check-framebuffer-status #:framebuffer-texture-1d 
  #:framebuffer-texture-2d #:framebuffer-texture-3d 
  #:framebuffer-renderbuffer 
  #:get-framebuffer-attachment-parameter-iv #:generate-mipmap 
  #:blit-framebuffer #:renderbuffer-storage-multisample 
  #:framebuffer-texture-layer #:program-parameter-i-arb 
  #:framebuffer-texture-arb #:framebuffer-texture-layer-arb 
  #:framebuffer-texture-face-arb #:map-buffer-range 
  #:flush-mapped-buffer-range #:tex-buffer-arb #:bind-vertex-array 
  #:delete-vertex-arrays #:gen-vertex-arrays #:is-vertex-array 
  #:depth-bounds-ext #:string-marker-gremedy 
  #:get-query-object-i64v-ext #:get-query-object-ui64v-ext 
  #:get-uniform-uiv-ext #:bind-frag-data-location-ext 
  #:get-frag-data-location-ext #:uniform-1ui-ext #:uniform-2ui-ext 
  #:uniform-3ui-ext #:uniform-4ui-ext #:uniform-1uiv-ext 
  #:uniform-2uiv-ext #:uniform-3uiv-ext #:uniform-4uiv-ext 
  #:renderbuffer-storage-multisample-coverage-nv 
  #:program-buffer-parameters-fv-nv 
  #:program-buffer-parameters-iiv-nv 
  #:program-buffer-parameters-iuiv-nv #:uniform-buffer-ext 
  #:get-uniform-buffer-size-ext #:get-uniform-offset-ext 
  #:frame-terminator-gremedy ))

