;;; generated file, do not edit
;;; glext version 64 ( 2010-08-03 01:30:25 -0700 (Tue, 03 Aug 2010) )

(defpackage #:cl-opengl-bindings
  (:nicknames #:%gl)
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
  #:cull-face #:front-face #:hint #:line-width #:point-size 
  #:polygon-mode #:scissor #:tex-parameter-f #:tex-parameter-fv 
  #:tex-parameter-i #:tex-parameter-iv #:tex-image-1d #:tex-image-2d 
  #:draw-buffer #:clear #:clear-color #:clear-stencil #:clear-depth 
  #:stencil-mask #:color-mask #:depth-mask #:disable #:enable 
  #:finish #:flush #:blend-func #:logic-op #:stencil-func 
  #:stencil-op #:depth-func #:pixel-store-f #:pixel-store-i 
  #:read-buffer #:read-pixels #:get-boolean-v #:get-double-v 
  #:get-error #:get-float-v #:get-integer-v #:get-string 
  #:get-tex-image #:get-tex-parameter-fv #:get-tex-parameter-iv 
  #:get-tex-level-parameter-fv #:get-tex-level-parameter-iv 
  #:is-enabled #:depth-range #:viewport #:new-list #:end-list 
  #:call-list #:call-lists #:delete-lists #:gen-lists #:list-base 
  #:begin #:bitmap #:color-3b #:color-3bv #:color-3d #:color-3dv 
  #:color-3f #:color-3fv #:color-3i #:color-3iv #:color-3s 
  #:color-3sv #:color-3ub #:color-3ubv #:color-3ui #:color-3uiv 
  #:color-3us #:color-3usv #:color-4b #:color-4bv #:color-4d 
  #:color-4dv #:color-4f #:color-4fv #:color-4i #:color-4iv 
  #:color-4s #:color-4sv #:color-4ub #:color-4ubv #:color-4ui 
  #:color-4uiv #:color-4us #:color-4usv #:edge-flag #:edge-flag-v 
  #:end #:index-d #:index-dv #:index-f #:index-fv #:index-i 
  #:index-iv #:index-s #:index-sv #:normal-3b #:normal-3bv 
  #:normal-3d #:normal-3dv #:normal-3f #:normal-3fv #:normal-3i 
  #:normal-3iv #:normal-3s #:normal-3sv #:raster-pos-2d 
  #:raster-pos-2dv #:raster-pos-2f #:raster-pos-2fv #:raster-pos-2i 
  #:raster-pos-2iv #:raster-pos-2s #:raster-pos-2sv #:raster-pos-3d 
  #:raster-pos-3dv #:raster-pos-3f #:raster-pos-3fv #:raster-pos-3i 
  #:raster-pos-3iv #:raster-pos-3s #:raster-pos-3sv #:raster-pos-4d 
  #:raster-pos-4dv #:raster-pos-4f #:raster-pos-4fv #:raster-pos-4i 
  #:raster-pos-4iv #:raster-pos-4s #:raster-pos-4sv #:rect-d 
  #:rect-dv #:rect-f #:rect-fv #:rect-i #:rect-iv #:rect-s #:rect-sv 
  #:tex-coord-1d #:tex-coord-1dv #:tex-coord-1f #:tex-coord-1fv 
  #:tex-coord-1i #:tex-coord-1iv #:tex-coord-1s #:tex-coord-1sv 
  #:tex-coord-2d #:tex-coord-2dv #:tex-coord-2f #:tex-coord-2fv 
  #:tex-coord-2i #:tex-coord-2iv #:tex-coord-2s #:tex-coord-2sv 
  #:tex-coord-3d #:tex-coord-3dv #:tex-coord-3f #:tex-coord-3fv 
  #:tex-coord-3i #:tex-coord-3iv #:tex-coord-3s #:tex-coord-3sv 
  #:tex-coord-4d #:tex-coord-4dv #:tex-coord-4f #:tex-coord-4fv 
  #:tex-coord-4i #:tex-coord-4iv #:tex-coord-4s #:tex-coord-4sv 
  #:vertex-2d #:vertex-2dv #:vertex-2f #:vertex-2fv #:vertex-2i 
  #:vertex-2iv #:vertex-2s #:vertex-2sv #:vertex-3d #:vertex-3dv 
  #:vertex-3f #:vertex-3fv #:vertex-3i #:vertex-3iv #:vertex-3s 
  #:vertex-3sv #:vertex-4d #:vertex-4dv #:vertex-4f #:vertex-4fv 
  #:vertex-4i #:vertex-4iv #:vertex-4s #:vertex-4sv #:clip-plane 
  #:color-material #:fog-f #:fog-fv #:fog-i #:fog-iv #:light-f 
  #:light-fv #:light-i #:light-iv #:light-model-f #:light-model-fv 
  #:light-model-i #:light-model-iv #:line-stipple #:material-f 
  #:material-fv #:material-i #:material-iv #:polygon-stipple 
  #:shade-model #:tex-env-f #:tex-env-fv #:tex-env-i #:tex-env-iv 
  #:tex-gen-d #:tex-gen-dv #:tex-gen-f #:tex-gen-fv #:tex-gen-i 
  #:tex-gen-iv #:feedback-buffer #:select-buffer #:render-mode 
  #:init-names #:load-name #:pass-through #:pop-name #:push-name 
  #:clear-accum #:clear-index #:index-mask #:accum #:pop-attrib 
  #:push-attrib #:map-1d #:map-1f #:map-2d #:map-2f #:map-grid-1d 
  #:map-grid-1f #:map-grid-2d #:map-grid-2f #:eval-coord-1d 
  #:eval-coord-1dv #:eval-coord-1f #:eval-coord-1fv #:eval-coord-2d 
  #:eval-coord-2dv #:eval-coord-2f #:eval-coord-2fv #:eval-mesh-1 
  #:eval-point-1 #:eval-mesh-2 #:eval-point-2 #:alpha-func 
  #:pixel-zoom #:pixel-transfer-f #:pixel-transfer-i #:pixel-map-fv 
  #:pixel-map-uiv #:pixel-map-usv #:copy-pixels #:draw-pixels 
  #:get-clip-plane #:get-light-fv #:get-light-iv #:get-map-dv 
  #:get-map-fv #:get-map-iv #:get-material-fv #:get-material-iv 
  #:get-pixel-map-fv #:get-pixel-map-uiv #:get-pixel-map-usv 
  #:get-polygon-stipple #:get-tex-env-fv #:get-tex-env-iv 
  #:get-tex-gen-dv #:get-tex-gen-fv #:get-tex-gen-iv #:is-list 
  #:frustum #:load-identity #:load-matrix-f #:load-matrix-d 
  #:matrix-mode #:mult-matrix-f #:mult-matrix-d #:ortho #:pop-matrix 
  #:push-matrix #:rotate-d #:rotate-f #:scale-d #:scale-f 
  #:translate-d #:translate-f #:draw-arrays #:draw-elements 
  #:get-pointer-v #:polygon-offset #:copy-tex-image-1d 
  #:copy-tex-image-2d #:copy-tex-sub-image-1d 
  #:copy-tex-sub-image-2d #:tex-sub-image-1d #:tex-sub-image-2d 
  #:bind-texture #:delete-textures #:gen-textures #:is-texture 
  #:array-element #:color-pointer #:disable-client-state 
  #:edge-flag-pointer #:enable-client-state #:index-pointer 
  #:interleaved-arrays #:normal-pointer #:tex-coord-pointer 
  #:vertex-pointer #:are-textures-resident #:prioritize-textures 
  #:index-ub #:index-ubv #:pop-client-attrib #:push-client-attrib 
  #:blend-color #:blend-equation #:draw-range-elements 
  #:tex-image-3d #:tex-sub-image-3d #:copy-tex-sub-image-3d 
  #:color-table #:color-table-parameter-fv 
  #:color-table-parameter-iv #:copy-color-table #:get-color-table 
  #:get-color-table-parameter-fv #:get-color-table-parameter-iv 
  #:color-sub-table #:copy-color-sub-table #:convolution-filter-1d 
  #:convolution-filter-2d #:convolution-parameter-f 
  #:convolution-parameter-fv #:convolution-parameter-i 
  #:convolution-parameter-iv #:copy-convolution-filter-1d 
  #:copy-convolution-filter-2d #:get-convolution-filter 
  #:get-convolution-parameter-fv #:get-convolution-parameter-iv 
  #:get-separable-filter #:separable-filter-2d #:get-histogram 
  #:get-histogram-parameter-fv #:get-histogram-parameter-iv 
  #:get-minmax #:get-minmax-parameter-fv #:get-minmax-parameter-iv 
  #:histogram #:minmax #:reset-histogram #:reset-minmax 
  #:active-texture #:sample-coverage #:compressed-tex-image-3d 
  #:compressed-tex-image-2d #:compressed-tex-image-1d 
  #:compressed-tex-sub-image-3d #:compressed-tex-sub-image-2d 
  #:compressed-tex-sub-image-1d #:get-compressed-tex-image 
  #:client-active-texture #:multi-tex-coord-1d #:multi-tex-coord-1dv 
  #:multi-tex-coord-1f #:multi-tex-coord-1fv #:multi-tex-coord-1i 
  #:multi-tex-coord-1iv #:multi-tex-coord-1s #:multi-tex-coord-1sv 
  #:multi-tex-coord-2d #:multi-tex-coord-2dv #:multi-tex-coord-2f 
  #:multi-tex-coord-2fv #:multi-tex-coord-2i #:multi-tex-coord-2iv 
  #:multi-tex-coord-2s #:multi-tex-coord-2sv #:multi-tex-coord-3d 
  #:multi-tex-coord-3dv #:multi-tex-coord-3f #:multi-tex-coord-3fv 
  #:multi-tex-coord-3i #:multi-tex-coord-3iv #:multi-tex-coord-3s 
  #:multi-tex-coord-3sv #:multi-tex-coord-4d #:multi-tex-coord-4dv 
  #:multi-tex-coord-4f #:multi-tex-coord-4fv #:multi-tex-coord-4i 
  #:multi-tex-coord-4iv #:multi-tex-coord-4s #:multi-tex-coord-4sv 
  #:load-transpose-matrix-f #:load-transpose-matrix-d 
  #:mult-transpose-matrix-f #:mult-transpose-matrix-d 
  #:blend-func-separate #:multi-draw-arrays #:multi-draw-elements 
  #:point-parameter-f #:point-parameter-fv #:point-parameter-i 
  #:point-parameter-iv #:fog-coord-f #:fog-coord-fv #:fog-coord-d 
  #:fog-coord-dv #:fog-coord-pointer #:secondary-color-3b 
  #:secondary-color-3bv #:secondary-color-3d #:secondary-color-3dv 
  #:secondary-color-3f #:secondary-color-3fv #:secondary-color-3i 
  #:secondary-color-3iv #:secondary-color-3s #:secondary-color-3sv 
  #:secondary-color-3ub #:secondary-color-3ubv #:secondary-color-3ui 
  #:secondary-color-3uiv #:secondary-color-3us 
  #:secondary-color-3usv #:secondary-color-pointer #:window-pos-2d 
  #:window-pos-2dv #:window-pos-2f #:window-pos-2fv #:window-pos-2i 
  #:window-pos-2iv #:window-pos-2s #:window-pos-2sv #:window-pos-3d 
  #:window-pos-3dv #:window-pos-3f #:window-pos-3fv #:window-pos-3i 
  #:window-pos-3iv #:window-pos-3s #:window-pos-3sv #:gen-queries 
  #:delete-queries #:is-query #:begin-query #:end-query 
  #:get-query-iv #:get-query-object-iv #:get-query-object-uiv 
  #:bind-buffer #:delete-buffers #:gen-buffers #:is-buffer 
  #:buffer-data #:buffer-sub-data #:get-buffer-sub-data #:map-buffer 
  #:unmap-buffer #:get-buffer-parameter-iv #:get-buffer-pointer-v 
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
  #:vertex-attrib-ipointer #:get-vertex-attrib-iiv 
  #:get-vertex-attrib-iuiv #:vertex-attrib-i1i #:vertex-attrib-i2i 
  #:vertex-attrib-i3i #:vertex-attrib-i4i #:vertex-attrib-i1ui 
  #:vertex-attrib-i2ui #:vertex-attrib-i3ui #:vertex-attrib-i4ui 
  #:vertex-attrib-i1iv #:vertex-attrib-i2iv #:vertex-attrib-i3iv 
  #:vertex-attrib-i4iv #:vertex-attrib-i1uiv #:vertex-attrib-i2uiv 
  #:vertex-attrib-i3uiv #:vertex-attrib-i4uiv #:vertex-attrib-i4bv 
  #:vertex-attrib-i4sv #:vertex-attrib-i4ubv #:vertex-attrib-i4usv 
  #:get-uniform-uiv #:bind-frag-data-location 
  #:get-frag-data-location #:uniform-1ui #:uniform-2ui #:uniform-3ui 
  #:uniform-4ui #:uniform-1uiv #:uniform-2uiv #:uniform-3uiv 
  #:uniform-4uiv #:tex-parameter-iiv #:tex-parameter-iuiv 
  #:get-tex-parameter-iiv #:get-tex-parameter-iuiv #:clear-buffer-iv 
  #:clear-buffer-uiv #:clear-buffer-fv #:clear-buffer-fi 
  #:get-string-i #:draw-arrays-instanced #:draw-elements-instanced 
  #:tex-buffer #:primitive-restart-index #:get-integer-64-i-v 
  #:get-buffer-parameter-i64v #:framebuffer-texture 
  #:vertex-attrib-divisor #:min-sample-shading #:blend-equation-i 
  #:blend-equation-separate-i #:blend-func-i #:blend-func-separate-i 
  #:active-texture-arb #:client-active-texture-arb 
  #:multi-tex-coord-1d-arb #:multi-tex-coord-1dv-arb 
  #:multi-tex-coord-1f-arb #:multi-tex-coord-1fv-arb 
  #:multi-tex-coord-1i-arb #:multi-tex-coord-1iv-arb 
  #:multi-tex-coord-1s-arb #:multi-tex-coord-1sv-arb 
  #:multi-tex-coord-2d-arb #:multi-tex-coord-2dv-arb 
  #:multi-tex-coord-2f-arb #:multi-tex-coord-2fv-arb 
  #:multi-tex-coord-2i-arb #:multi-tex-coord-2iv-arb 
  #:multi-tex-coord-2s-arb #:multi-tex-coord-2sv-arb 
  #:multi-tex-coord-3d-arb #:multi-tex-coord-3dv-arb 
  #:multi-tex-coord-3f-arb #:multi-tex-coord-3fv-arb 
  #:multi-tex-coord-3i-arb #:multi-tex-coord-3iv-arb 
  #:multi-tex-coord-3s-arb #:multi-tex-coord-3sv-arb 
  #:multi-tex-coord-4d-arb #:multi-tex-coord-4dv-arb 
  #:multi-tex-coord-4f-arb #:multi-tex-coord-4fv-arb 
  #:multi-tex-coord-4i-arb #:multi-tex-coord-4iv-arb 
  #:multi-tex-coord-4s-arb #:multi-tex-coord-4sv-arb 
  #:load-transpose-matrix-f-arb #:load-transpose-matrix-d-arb 
  #:mult-transpose-matrix-f-arb #:mult-transpose-matrix-d-arb 
  #:sample-coverage-arb #:compressed-tex-image-3d-arb 
  #:compressed-tex-image-2d-arb #:compressed-tex-image-1d-arb 
  #:compressed-tex-sub-image-3d-arb 
  #:compressed-tex-sub-image-2d-arb 
  #:compressed-tex-sub-image-1d-arb #:get-compressed-tex-image-arb 
  #:point-parameter-f-arb #:point-parameter-fv-arb #:weight-bv-arb 
  #:weight-sv-arb #:weight-iv-arb #:weight-fv-arb #:weight-dv-arb 
  #:weight-ubv-arb #:weight-usv-arb #:weight-uiv-arb 
  #:weight-pointer-arb #:vertex-blend-arb 
  #:current-palette-matrix-arb #:matrix-index-ubv-arb 
  #:matrix-index-usv-arb #:matrix-index-uiv-arb 
  #:matrix-index-pointer-arb #:window-pos-2d-arb 
  #:window-pos-2dv-arb #:window-pos-2f-arb #:window-pos-2fv-arb 
  #:window-pos-2i-arb #:window-pos-2iv-arb #:window-pos-2s-arb 
  #:window-pos-2sv-arb #:window-pos-3d-arb #:window-pos-3dv-arb 
  #:window-pos-3f-arb #:window-pos-3fv-arb #:window-pos-3i-arb 
  #:window-pos-3iv-arb #:window-pos-3s-arb #:window-pos-3sv-arb 
  #:vertex-attrib-1d-arb #:vertex-attrib-1dv-arb 
  #:vertex-attrib-1f-arb #:vertex-attrib-1fv-arb 
  #:vertex-attrib-1s-arb #:vertex-attrib-1sv-arb 
  #:vertex-attrib-2d-arb #:vertex-attrib-2dv-arb 
  #:vertex-attrib-2f-arb #:vertex-attrib-2fv-arb 
  #:vertex-attrib-2s-arb #:vertex-attrib-2sv-arb 
  #:vertex-attrib-3d-arb #:vertex-attrib-3dv-arb 
  #:vertex-attrib-3f-arb #:vertex-attrib-3fv-arb 
  #:vertex-attrib-3s-arb #:vertex-attrib-3sv-arb 
  #:vertex-attrib-4nbv-arb #:vertex-attrib-4niv-arb 
  #:vertex-attrib-4nsv-arb #:vertex-attrib-4nub-arb 
  #:vertex-attrib-4nubv-arb #:vertex-attrib-4nuiv-arb 
  #:vertex-attrib-4nusv-arb #:vertex-attrib-4bv-arb 
  #:vertex-attrib-4d-arb #:vertex-attrib-4dv-arb 
  #:vertex-attrib-4f-arb #:vertex-attrib-4fv-arb 
  #:vertex-attrib-4iv-arb #:vertex-attrib-4s-arb 
  #:vertex-attrib-4sv-arb #:vertex-attrib-4ubv-arb 
  #:vertex-attrib-4uiv-arb #:vertex-attrib-4usv-arb 
  #:vertex-attrib-pointer-arb #:enable-vertex-attrib-array-arb 
  #:disable-vertex-attrib-array-arb #:program-string-arb 
  #:bind-program-arb #:delete-programs-arb #:gen-programs-arb 
  #:program-env-parameter-4d-arb #:program-env-parameter-4dv-arb 
  #:program-env-parameter-4f-arb #:program-env-parameter-4fv-arb 
  #:program-local-parameter-4d-arb #:program-local-parameter-4dv-arb 
  #:program-local-parameter-4f-arb #:program-local-parameter-4fv-arb 
  #:get-program-env-parameter-dv-arb 
  #:get-program-env-parameter-fv-arb 
  #:get-program-local-parameter-dv-arb 
  #:get-program-local-parameter-fv-arb #:get-program-iv-arb 
  #:get-program-string-arb #:get-vertex-attrib-dv-arb 
  #:get-vertex-attrib-fv-arb #:get-vertex-attrib-iv-arb 
  #:get-vertex-attrib-pointer-v-arb #:is-program-arb 
  #:bind-buffer-arb #:delete-buffers-arb #:gen-buffers-arb 
  #:is-buffer-arb #:buffer-data-arb #:buffer-sub-data-arb 
  #:get-buffer-sub-data-arb #:map-buffer-arb #:unmap-buffer-arb 
  #:get-buffer-parameter-iv-arb #:get-buffer-pointer-v-arb 
  #:gen-queries-arb #:delete-queries-arb #:is-query-arb 
  #:begin-query-arb #:end-query-arb #:get-query-iv-arb 
  #:get-query-object-iv-arb #:get-query-object-uiv-arb 
  #:delete-object-arb #:get-handle-arb #:detach-object-arb 
  #:create-shader-object-arb #:shader-source-arb 
  #:compile-shader-arb #:create-program-object-arb 
  #:attach-object-arb #:link-program-arb #:use-program-object-arb 
  #:validate-program-arb #:uniform-1f-arb #:uniform-2f-arb 
  #:uniform-3f-arb #:uniform-4f-arb #:uniform-1i-arb 
  #:uniform-2i-arb #:uniform-3i-arb #:uniform-4i-arb 
  #:uniform-1fv-arb #:uniform-2fv-arb #:uniform-3fv-arb 
  #:uniform-4fv-arb #:uniform-1iv-arb #:uniform-2iv-arb 
  #:uniform-3iv-arb #:uniform-4iv-arb #:uniform-matrix-2fv-arb 
  #:uniform-matrix-3fv-arb #:uniform-matrix-4fv-arb 
  #:get-object-parameter-fv-arb #:get-object-parameter-iv-arb 
  #:get-info-log-arb #:get-attached-objects-arb 
  #:get-uniform-location-arb #:get-active-uniform-arb 
  #:get-uniform-fv-arb #:get-uniform-iv-arb #:get-shader-source-arb 
  #:bind-attrib-location-arb #:get-active-attrib-arb 
  #:get-attrib-location-arb #:draw-buffers-arb #:clamp-color-arb 
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
  #:framebuffer-texture-face-arb #:vertex-attrib-divisor-arb 
  #:map-buffer-range #:flush-mapped-buffer-range #:tex-buffer-arb 
  #:bind-vertex-array #:delete-vertex-arrays #:gen-vertex-arrays 
  #:is-vertex-array #:get-uniform-indices #:get-active-uniforms-iv 
  #:get-active-uniform-name #:get-uniform-block-index 
  #:get-active-uniform-block-iv #:get-active-uniform-block-name 
  #:uniform-block-binding #:copy-buffer-sub-data 
  #:draw-elements-base-vertex #:draw-range-elements-base-vertex 
  #:draw-elements-instanced-base-vertex 
  #:multi-draw-elements-base-vertex #:provoking-vertex #:fence-sync 
  #:is-sync #:delete-sync #:client-wait-sync #:wait-sync 
  #:get-integer-64-v #:get-sync-iv #:tex-image-2d-multisample 
  #:tex-image-3d-multisample #:get-multisample-fv #:sample-mask-i 
  #:blend-equation-i-arb #:blend-equation-separate-i-arb 
  #:blend-func-i-arb #:blend-func-separate-i-arb 
  #:min-sample-shading-arb #:named-string-arb 
  #:delete-named-string-arb #:compile-shader-include-arb 
  #:is-named-string-arb #:get-named-string-arb 
  #:get-named-string-iv-arb #:bind-frag-data-location-indexed 
  #:get-frag-data-index #:gen-samplers #:delete-samplers 
  #:is-sampler #:bind-sampler #:sampler-parameter-i 
  #:sampler-parameter-iv #:sampler-parameter-f 
  #:sampler-parameter-fv #:sampler-parameter-iiv 
  #:sampler-parameter-iuiv #:get-sampler-parameter-iv 
  #:get-sampler-parameter-iiv #:get-sampler-parameter-fv 
  #:get-sampler-parameter-iuiv #:query-counter 
  #:get-query-object-i64v #:get-query-object-ui64v #:vertex-p2ui 
  #:vertex-p2uiv #:vertex-p3ui #:vertex-p3uiv #:vertex-p4ui 
  #:vertex-p4uiv #:tex-coord-p1ui #:tex-coord-p1uiv #:tex-coord-p2ui 
  #:tex-coord-p2uiv #:tex-coord-p3ui #:tex-coord-p3uiv 
  #:tex-coord-p4ui #:tex-coord-p4uiv #:multi-tex-coord-p1ui 
  #:multi-tex-coord-p1uiv #:multi-tex-coord-p2ui 
  #:multi-tex-coord-p2uiv #:multi-tex-coord-p3ui 
  #:multi-tex-coord-p3uiv #:multi-tex-coord-p4ui 
  #:multi-tex-coord-p4uiv #:normal-p3ui #:normal-p3uiv #:color-p3ui 
  #:color-p3uiv #:color-p4ui #:color-p4uiv #:secondary-color-p3ui 
  #:secondary-color-p3uiv #:vertex-attrib-p1ui #:vertex-attrib-p1uiv 
  #:vertex-attrib-p2ui #:vertex-attrib-p2uiv #:vertex-attrib-p3ui 
  #:vertex-attrib-p3uiv #:vertex-attrib-p4ui #:vertex-attrib-p4uiv 
  #:draw-arrays-indirect #:draw-elements-indirect #:uniform-1d 
  #:uniform-2d #:uniform-3d #:uniform-4d #:uniform-1dv #:uniform-2dv 
  #:uniform-3dv #:uniform-4dv #:uniform-matrix-2dv 
  #:uniform-matrix-3dv #:uniform-matrix-4dv #:uniform-matrix-2x3-dv 
  #:uniform-matrix-2x4-dv #:uniform-matrix-3x2-dv 
  #:uniform-matrix-3x4-dv #:uniform-matrix-4x2-dv 
  #:uniform-matrix-4x3-dv #:get-uniform-dv 
  #:get-subroutine-uniform-location #:get-subroutine-index 
  #:get-active-subroutine-uniform-iv 
  #:get-active-subroutine-uniform-name #:get-active-subroutine-name 
  #:uniform-subroutines-uiv #:get-uniform-subroutine-uiv 
  #:get-program-stage-iv #:patch-parameter-i #:patch-parameter-fv 
  #:bind-transform-feedback #:delete-transform-feedbacks 
  #:gen-transform-feedbacks #:is-transform-feedback 
  #:pause-transform-feedback #:resume-transform-feedback 
  #:draw-transform-feedback #:draw-transform-feedback-stream 
  #:begin-query-indexed #:end-query-indexed #:get-query-indexed-iv 
  #:release-shader-compiler #:shader-binary 
  #:get-shader-precision-format #:depth-range-f #:clear-depth-f 
  #:get-program-binary #:program-binary #:program-parameter-i 
  #:use-program-stages #:active-shader-program 
  #:create-shader-program-v #:bind-program-pipeline 
  #:delete-program-pipelines #:gen-program-pipelines 
  #:is-program-pipeline #:get-program-pipeline-iv 
  #:program-uniform-1i #:program-uniform-1iv #:program-uniform-1f 
  #:program-uniform-1fv #:program-uniform-1d #:program-uniform-1dv 
  #:program-uniform-1ui #:program-uniform-1uiv #:program-uniform-2i 
  #:program-uniform-2iv #:program-uniform-2f #:program-uniform-2fv 
  #:program-uniform-2d #:program-uniform-2dv #:program-uniform-2ui 
  #:program-uniform-2uiv #:program-uniform-3i #:program-uniform-3iv 
  #:program-uniform-3f #:program-uniform-3fv #:program-uniform-3d 
  #:program-uniform-3dv #:program-uniform-3ui #:program-uniform-3uiv 
  #:program-uniform-4i #:program-uniform-4iv #:program-uniform-4f 
  #:program-uniform-4fv #:program-uniform-4d #:program-uniform-4dv 
  #:program-uniform-4ui #:program-uniform-4uiv 
  #:program-uniform-matrix-2fv #:program-uniform-matrix-3fv 
  #:program-uniform-matrix-4fv #:program-uniform-matrix-2dv 
  #:program-uniform-matrix-3dv #:program-uniform-matrix-4dv 
  #:program-uniform-matrix-2x3-fv #:program-uniform-matrix-3x2-fv 
  #:program-uniform-matrix-2x4-fv #:program-uniform-matrix-4x2-fv 
  #:program-uniform-matrix-3x4-fv #:program-uniform-matrix-4x3-fv 
  #:program-uniform-matrix-2x3-dv #:program-uniform-matrix-3x2-dv 
  #:program-uniform-matrix-2x4-dv #:program-uniform-matrix-4x2-dv 
  #:program-uniform-matrix-3x4-dv #:program-uniform-matrix-4x3-dv 
  #:validate-program-pipeline #:get-program-pipeline-info-log 
  #:vertex-attrib-l1d #:vertex-attrib-l2d #:vertex-attrib-l3d 
  #:vertex-attrib-l4d #:vertex-attrib-l1dv #:vertex-attrib-l2dv 
  #:vertex-attrib-l3dv #:vertex-attrib-l4dv #:vertex-attrib-lpointer 
  #:get-vertex-attrib-ldv #:viewport-array-v #:viewport-indexed-f 
  #:viewport-indexed-fv #:scissor-array-v #:scissor-indexed 
  #:scissor-indexed-v #:depth-range-array-v #:depth-range-indexed 
  #:get-float-i-v #:get-double-i-v #:create-sync-from-cl-event-arb 
  #:debug-message-control-arb #:debug-message-insert-arb 
  #:debug-message-callback-arb #:get-debug-message-log-arb 
  #:get-graphics-reset-status-arb #:getn-map-dv-arb 
  #:getn-map-fv-arb #:getn-map-iv-arb #:getn-pixel-map-fv-arb 
  #:getn-pixel-map-uiv-arb #:getn-pixel-map-usv-arb 
  #:getn-polygon-stipple-arb #:getn-color-table-arb 
  #:getn-convolution-filter-arb #:getn-separable-filter-arb 
  #:getn-histogram-arb #:getn-minmax-arb #:getn-tex-image-arb 
  #:readn-pixels-arb #:getn-compressed-tex-image-arb 
  #:getn-uniform-fv-arb #:getn-uniform-iv-arb #:getn-uniform-uiv-arb 
  #:getn-uniform-dv-arb #:blend-color-ext #:polygon-offset-ext 
  #:tex-image-3d-ext #:tex-sub-image-3d-ext 
  #:get-tex-filter-func-sgis #:tex-filter-func-sgis 
  #:tex-sub-image-1d-ext #:tex-sub-image-2d-ext 
  #:copy-tex-image-1d-ext #:copy-tex-image-2d-ext 
  #:copy-tex-sub-image-1d-ext #:copy-tex-sub-image-2d-ext 
  #:copy-tex-sub-image-3d-ext #:get-histogram-ext 
  #:get-histogram-parameter-fv-ext #:get-histogram-parameter-iv-ext 
  #:get-minmax-ext #:get-minmax-parameter-fv-ext 
  #:get-minmax-parameter-iv-ext #:histogram-ext #:minmax-ext 
  #:reset-histogram-ext #:reset-minmax-ext 
  #:convolution-filter-1d-ext #:convolution-filter-2d-ext 
  #:convolution-parameter-f-ext #:convolution-parameter-fv-ext 
  #:convolution-parameter-i-ext #:convolution-parameter-iv-ext 
  #:copy-convolution-filter-1d-ext #:copy-convolution-filter-2d-ext 
  #:get-convolution-filter-ext #:get-convolution-parameter-fv-ext 
  #:get-convolution-parameter-iv-ext #:get-separable-filter-ext 
  #:separable-filter-2d-ext #:color-table-sgi 
  #:color-table-parameter-fv-sgi #:color-table-parameter-iv-sgi 
  #:copy-color-table-sgi #:get-color-table-sgi 
  #:get-color-table-parameter-fv-sgi 
  #:get-color-table-parameter-iv-sgi #:pixel-tex-gen-sgix 
  #:pixel-tex-gen-parameter-i-sgis #:pixel-tex-gen-parameter-iv-sgis 
  #:pixel-tex-gen-parameter-f-sgis #:pixel-tex-gen-parameter-fv-sgis 
  #:get-pixel-tex-gen-parameter-iv-sgis 
  #:get-pixel-tex-gen-parameter-fv-sgis #:tex-image-4d-sgis 
  #:tex-sub-image-4d-sgis #:are-textures-resident-ext 
  #:bind-texture-ext #:delete-textures-ext #:gen-textures-ext 
  #:is-texture-ext #:prioritize-textures-ext #:detail-tex-func-sgis 
  #:get-detail-tex-func-sgis #:sharpen-tex-func-sgis 
  #:get-sharpen-tex-func-sgis #:sample-mask-sgis 
  #:sample-pattern-sgis #:array-element-ext #:color-pointer-ext 
  #:draw-arrays-ext #:edge-flag-pointer-ext #:get-pointer-v-ext 
  #:index-pointer-ext #:normal-pointer-ext #:tex-coord-pointer-ext 
  #:vertex-pointer-ext #:blend-equation-ext 
  #:sprite-parameter-f-sgix #:sprite-parameter-fv-sgix 
  #:sprite-parameter-i-sgix #:sprite-parameter-iv-sgix 
  #:point-parameter-f-ext #:point-parameter-fv-ext 
  #:point-parameter-f-sgis #:point-parameter-fv-sgis 
  #:get-instruments-sgix #:instruments-buffer-sgix 
  #:poll-instruments-sgix #:read-instruments-sgix 
  #:start-instruments-sgix #:stop-instruments-sgix #:frame-zoom-sgix 
  #:tag-sample-buffer-sgix #:deformation-map-3d-sgix 
  #:deformation-map-3f-sgix #:deform-sgix 
  #:load-identity-deformation-map-sgix #:reference-plane-sgix 
  #:flush-raster-sgix #:fog-func-sgis #:get-fog-func-sgis 
  #:image-transform-parameter-i-hp #:image-transform-parameter-f-hp 
  #:image-transform-parameter-iv-hp 
  #:image-transform-parameter-fv-hp 
  #:get-image-transform-parameter-iv-hp 
  #:get-image-transform-parameter-fv-hp #:color-sub-table-ext 
  #:copy-color-sub-table-ext #:hint-pgi #:color-table-ext 
  #:get-color-table-ext #:get-color-table-parameter-iv-ext 
  #:get-color-table-parameter-fv-ext #:get-list-parameter-fv-sgix 
  #:get-list-parameter-iv-sgix #:list-parameter-f-sgix 
  #:list-parameter-fv-sgix #:list-parameter-i-sgix 
  #:list-parameter-iv-sgix #:index-material-ext #:index-func-ext 
  #:lock-arrays-ext #:unlock-arrays-ext #:cull-parameter-dv-ext 
  #:cull-parameter-fv-ext #:fragment-color-material-sgix 
  #:fragment-light-f-sgix #:fragment-light-fv-sgix 
  #:fragment-light-i-sgix #:fragment-light-iv-sgix 
  #:fragment-light-model-f-sgix #:fragment-light-model-fv-sgix 
  #:fragment-light-model-i-sgix #:fragment-light-model-iv-sgix 
  #:fragment-material-f-sgix #:fragment-material-fv-sgix 
  #:fragment-material-i-sgix #:fragment-material-iv-sgix 
  #:get-fragment-light-fv-sgix #:get-fragment-light-iv-sgix 
  #:get-fragment-material-fv-sgix #:get-fragment-material-iv-sgix 
  #:light-env-i-sgix #:draw-range-elements-ext #:apply-texture-ext 
  #:texture-light-ext #:texture-material-ext #:async-marker-sgix 
  #:finish-async-sgix #:poll-async-sgix #:gen-async-markers-sgix 
  #:delete-async-markers-sgix #:is-async-marker-sgix 
  #:vertex-pointer-v-intel #:normal-pointer-v-intel 
  #:color-pointer-v-intel #:tex-coord-pointer-v-intel 
  #:pixel-transform-parameter-i-ext 
  #:pixel-transform-parameter-f-ext 
  #:pixel-transform-parameter-iv-ext 
  #:pixel-transform-parameter-fv-ext #:secondary-color-3b-ext 
  #:secondary-color-3bv-ext #:secondary-color-3d-ext 
  #:secondary-color-3dv-ext #:secondary-color-3f-ext 
  #:secondary-color-3fv-ext #:secondary-color-3i-ext 
  #:secondary-color-3iv-ext #:secondary-color-3s-ext 
  #:secondary-color-3sv-ext #:secondary-color-3ub-ext 
  #:secondary-color-3ubv-ext #:secondary-color-3ui-ext 
  #:secondary-color-3uiv-ext #:secondary-color-3us-ext 
  #:secondary-color-3usv-ext #:secondary-color-pointer-ext 
  #:texture-normal-ext #:multi-draw-arrays-ext 
  #:multi-draw-elements-ext #:fog-coord-f-ext #:fog-coord-fv-ext 
  #:fog-coord-d-ext #:fog-coord-dv-ext #:fog-coord-pointer-ext 
  #:tangent-3b-ext #:tangent-3bv-ext #:tangent-3d-ext 
  #:tangent-3dv-ext #:tangent-3f-ext #:tangent-3fv-ext 
  #:tangent-3i-ext #:tangent-3iv-ext #:tangent-3s-ext 
  #:tangent-3sv-ext #:binormal-3b-ext #:binormal-3bv-ext 
  #:binormal-3d-ext #:binormal-3dv-ext #:binormal-3f-ext 
  #:binormal-3fv-ext #:binormal-3i-ext #:binormal-3iv-ext 
  #:binormal-3s-ext #:binormal-3sv-ext #:tangent-pointer-ext 
  #:binormal-pointer-ext #:finish-texture-sunx 
  #:global-alpha-factor-b-sun #:global-alpha-factor-s-sun 
  #:global-alpha-factor-i-sun #:global-alpha-factor-f-sun 
  #:global-alpha-factor-d-sun #:global-alpha-factor-ub-sun 
  #:global-alpha-factor-us-sun #:global-alpha-factor-ui-sun 
  #:replacement-code-ui-sun #:replacement-code-us-sun 
  #:replacement-code-ub-sun #:replacement-code-uiv-sun 
  #:replacement-code-usv-sun #:replacement-code-ubv-sun 
  #:replacement-code-pointer-sun #:color-4ub-vertex-2f-sun 
  #:color-4ub-vertex-2fv-sun #:color-4ub-vertex-3f-sun 
  #:color-4ub-vertex-3fv-sun #:color-3f-vertex-3f-sun 
  #:color-3f-vertex-3fv-sun #:normal-3f-vertex-3f-sun 
  #:normal-3f-vertex-3fv-sun #:color-4f-normal-3f-vertex-3f-sun 
  #:color-4f-normal-3f-vertex-3fv-sun #:tex-coord-2f-vertex-3f-sun 
  #:tex-coord-2f-vertex-3fv-sun #:tex-coord-4f-vertex-4f-sun 
  #:tex-coord-4f-vertex-4fv-sun 
  #:tex-coord-2f-color-4ub-vertex-3f-sun 
  #:tex-coord-2f-color-4ub-vertex-3fv-sun 
  #:tex-coord-2f-color-3f-vertex-3f-sun 
  #:tex-coord-2f-color-3f-vertex-3fv-sun 
  #:tex-coord-2f-normal-3f-vertex-3f-sun 
  #:tex-coord-2f-normal-3f-vertex-3fv-sun 
  #:tex-coord-2f-color-4f-normal-3f-vertex-3f-sun 
  #:tex-coord-2f-color-4f-normal-3f-vertex-3fv-sun 
  #:tex-coord-4f-color-4f-normal-3f-vertex-4f-sun 
  #:tex-coord-4f-color-4f-normal-3f-vertex-4fv-sun 
  #:replacement-code-ui-vertex-3f-sun 
  #:replacement-code-ui-vertex-3fv-sun 
  #:replacement-code-ui-color-4ub-vertex-3f-sun 
  #:replacement-code-ui-color-4ub-vertex-3fv-sun 
  #:replacement-code-ui-color-3f-vertex-3f-sun 
  #:replacement-code-ui-color-3f-vertex-3fv-sun 
  #:replacement-code-ui-normal-3f-vertex-3f-sun 
  #:replacement-code-ui-normal-3f-vertex-3fv-sun 
  #:replacement-code-ui-color-4f-normal-3f-vertex-3f-sun 
  #:replacement-code-ui-color-4f-normal-3f-vertex-3fv-sun 
  #:replacement-code-ui-tex-coord-2f-vertex-3f-sun 
  #:replacement-code-ui-tex-coord-2f-vertex-3fv-sun 
  #:replacement-code-ui-tex-coord-2f-normal-3f-vertex-3f-sun 
  #:replacement-code-ui-tex-coord-2f-normal-3f-vertex-3fv-sun 
  #:replacement-code-ui-tex-coord-2f-color-4f-normal-3f-vertex-3f-sun 
  #:replacement-code-ui-tex-coord-2f-color-4f-normal-3f-vertex-3fv-sun 
  #:blend-func-separate-ext #:blend-func-separate-ingr 
  #:vertex-weight-f-ext #:vertex-weight-fv-ext 
  #:vertex-weight-pointer-ext #:flush-vertex-array-range-nv 
  #:vertex-array-range-nv #:combiner-parameter-fv-nv 
  #:combiner-parameter-f-nv #:combiner-parameter-iv-nv 
  #:combiner-parameter-i-nv #:combiner-input-nv #:combiner-output-nv 
  #:final-combiner-input-nv #:get-combiner-input-parameter-fv-nv 
  #:get-combiner-input-parameter-iv-nv 
  #:get-combiner-output-parameter-fv-nv 
  #:get-combiner-output-parameter-iv-nv 
  #:get-final-combiner-input-parameter-fv-nv 
  #:get-final-combiner-input-parameter-iv-nv #:resize-buffers-mesa 
  #:window-pos-2d-mesa #:window-pos-2dv-mesa #:window-pos-2f-mesa 
  #:window-pos-2fv-mesa #:window-pos-2i-mesa #:window-pos-2iv-mesa 
  #:window-pos-2s-mesa #:window-pos-2sv-mesa #:window-pos-3d-mesa 
  #:window-pos-3dv-mesa #:window-pos-3f-mesa #:window-pos-3fv-mesa 
  #:window-pos-3i-mesa #:window-pos-3iv-mesa #:window-pos-3s-mesa 
  #:window-pos-3sv-mesa #:window-pos-4d-mesa #:window-pos-4dv-mesa 
  #:window-pos-4f-mesa #:window-pos-4fv-mesa #:window-pos-4i-mesa 
  #:window-pos-4iv-mesa #:window-pos-4s-mesa #:window-pos-4sv-mesa 
  #:multi-mode-draw-arrays-ibm #:multi-mode-draw-elements-ibm 
  #:color-pointer-list-ibm #:secondary-color-pointer-list-ibm 
  #:edge-flag-pointer-list-ibm #:fog-coord-pointer-list-ibm 
  #:index-pointer-list-ibm #:normal-pointer-list-ibm 
  #:tex-coord-pointer-list-ibm #:vertex-pointer-list-ibm 
  #:tbuffer-mask-3dfx #:sample-mask-ext #:sample-pattern-ext 
  #:texture-color-mask-sgis #:igloo-interface-sgix 
  #:delete-fences-nv #:gen-fences-nv #:is-fence-nv #:test-fence-nv 
  #:get-fence-iv-nv #:finish-fence-nv #:set-fence-nv 
  #:map-control-points-nv #:map-parameter-iv-nv 
  #:map-parameter-fv-nv #:get-map-control-points-nv 
  #:get-map-parameter-iv-nv #:get-map-parameter-fv-nv 
  #:get-map-attrib-parameter-iv-nv #:get-map-attrib-parameter-fv-nv 
  #:eval-maps-nv #:combiner-stage-parameter-fv-nv 
  #:get-combiner-stage-parameter-fv-nv #:are-programs-resident-nv 
  #:bind-program-nv #:delete-programs-nv #:execute-program-nv 
  #:gen-programs-nv #:get-program-parameter-dv-nv 
  #:get-program-parameter-fv-nv #:get-program-iv-nv 
  #:get-program-string-nv #:get-track-matrix-iv-nv 
  #:get-vertex-attrib-dv-nv #:get-vertex-attrib-fv-nv 
  #:get-vertex-attrib-iv-nv #:get-vertex-attrib-pointer-v-nv 
  #:is-program-nv #:load-program-nv #:program-parameter-4d-nv 
  #:program-parameter-4dv-nv #:program-parameter-4f-nv 
  #:program-parameter-4fv-nv #:program-parameters-4dv-nv 
  #:program-parameters-4fv-nv #:request-resident-programs-nv 
  #:track-matrix-nv #:vertex-attrib-pointer-nv #:vertex-attrib-1d-nv 
  #:vertex-attrib-1dv-nv #:vertex-attrib-1f-nv 
  #:vertex-attrib-1fv-nv #:vertex-attrib-1s-nv 
  #:vertex-attrib-1sv-nv #:vertex-attrib-2d-nv 
  #:vertex-attrib-2dv-nv #:vertex-attrib-2f-nv 
  #:vertex-attrib-2fv-nv #:vertex-attrib-2s-nv 
  #:vertex-attrib-2sv-nv #:vertex-attrib-3d-nv 
  #:vertex-attrib-3dv-nv #:vertex-attrib-3f-nv 
  #:vertex-attrib-3fv-nv #:vertex-attrib-3s-nv 
  #:vertex-attrib-3sv-nv #:vertex-attrib-4d-nv 
  #:vertex-attrib-4dv-nv #:vertex-attrib-4f-nv 
  #:vertex-attrib-4fv-nv #:vertex-attrib-4s-nv 
  #:vertex-attrib-4sv-nv #:vertex-attrib-4ub-nv 
  #:vertex-attrib-4ubv-nv #:vertex-attribs-1dv-nv 
  #:vertex-attribs-1fv-nv #:vertex-attribs-1sv-nv 
  #:vertex-attribs-2dv-nv #:vertex-attribs-2fv-nv 
  #:vertex-attribs-2sv-nv #:vertex-attribs-3dv-nv 
  #:vertex-attribs-3fv-nv #:vertex-attribs-3sv-nv 
  #:vertex-attribs-4dv-nv #:vertex-attribs-4fv-nv 
  #:vertex-attribs-4sv-nv #:vertex-attribs-4ubv-nv 
  #:tex-bump-parameter-iv-ati #:tex-bump-parameter-fv-ati 
  #:get-tex-bump-parameter-iv-ati #:get-tex-bump-parameter-fv-ati 
  #:gen-fragment-shaders-ati #:bind-fragment-shader-ati 
  #:delete-fragment-shader-ati #:begin-fragment-shader-ati 
  #:end-fragment-shader-ati #:pass-tex-coord-ati #:sample-map-ati 
  #:color-fragment-op-1-ati #:color-fragment-op-2-ati 
  #:color-fragment-op-3-ati #:alpha-fragment-op-1-ati 
  #:alpha-fragment-op-2-ati #:alpha-fragment-op-3-ati 
  #:set-fragment-shader-constant-ati #:pntriangles-i-ati 
  #:pntriangles-f-ati #:new-object-buffer-ati #:is-object-buffer-ati 
  #:update-object-buffer-ati #:get-object-buffer-fv-ati 
  #:get-object-buffer-iv-ati #:free-object-buffer-ati 
  #:array-object-ati #:get-array-object-fv-ati 
  #:get-array-object-iv-ati #:variant-array-object-ati 
  #:get-variant-array-object-fv-ati 
  #:get-variant-array-object-iv-ati #:begin-vertex-shader-ext 
  #:end-vertex-shader-ext #:bind-vertex-shader-ext 
  #:gen-vertex-shaders-ext #:delete-vertex-shader-ext 
  #:shader-op-1-ext #:shader-op-2-ext #:shader-op-3-ext 
  #:swizzle-ext #:write-mask-ext #:insert-component-ext 
  #:extract-component-ext #:gen-symbols-ext #:set-invariant-ext 
  #:set-local-constant-ext #:variant-bv-ext #:variant-sv-ext 
  #:variant-iv-ext #:variant-fv-ext #:variant-dv-ext 
  #:variant-ubv-ext #:variant-usv-ext #:variant-uiv-ext 
  #:variant-pointer-ext #:enable-variant-client-state-ext 
  #:disable-variant-client-state-ext #:bind-light-parameter-ext 
  #:bind-material-parameter-ext #:bind-tex-gen-parameter-ext 
  #:bind-texture-unit-parameter-ext #:bind-parameter-ext 
  #:is-variant-enabled-ext #:get-variant-boolean-v-ext 
  #:get-variant-integer-v-ext #:get-variant-float-v-ext 
  #:get-variant-pointer-v-ext #:get-invariant-boolean-v-ext 
  #:get-invariant-integer-v-ext #:get-invariant-float-v-ext 
  #:get-local-constant-boolean-v-ext 
  #:get-local-constant-integer-v-ext 
  #:get-local-constant-float-v-ext #:vertex-stream-1s-ati 
  #:vertex-stream-1sv-ati #:vertex-stream-1i-ati 
  #:vertex-stream-1iv-ati #:vertex-stream-1f-ati 
  #:vertex-stream-1fv-ati #:vertex-stream-1d-ati 
  #:vertex-stream-1dv-ati #:vertex-stream-2s-ati 
  #:vertex-stream-2sv-ati #:vertex-stream-2i-ati 
  #:vertex-stream-2iv-ati #:vertex-stream-2f-ati 
  #:vertex-stream-2fv-ati #:vertex-stream-2d-ati 
  #:vertex-stream-2dv-ati #:vertex-stream-3s-ati 
  #:vertex-stream-3sv-ati #:vertex-stream-3i-ati 
  #:vertex-stream-3iv-ati #:vertex-stream-3f-ati 
  #:vertex-stream-3fv-ati #:vertex-stream-3d-ati 
  #:vertex-stream-3dv-ati #:vertex-stream-4s-ati 
  #:vertex-stream-4sv-ati #:vertex-stream-4i-ati 
  #:vertex-stream-4iv-ati #:vertex-stream-4f-ati 
  #:vertex-stream-4fv-ati #:vertex-stream-4d-ati 
  #:vertex-stream-4dv-ati #:normal-stream-3b-ati 
  #:normal-stream-3bv-ati #:normal-stream-3s-ati 
  #:normal-stream-3sv-ati #:normal-stream-3i-ati 
  #:normal-stream-3iv-ati #:normal-stream-3f-ati 
  #:normal-stream-3fv-ati #:normal-stream-3d-ati 
  #:normal-stream-3dv-ati #:client-active-vertex-stream-ati 
  #:vertex-blend-env-i-ati #:vertex-blend-env-f-ati 
  #:element-pointer-ati #:draw-element-array-ati 
  #:draw-range-element-array-ati #:draw-mesh-arrays-sun 
  #:gen-occlusion-queries-nv #:delete-occlusion-queries-nv 
  #:is-occlusion-query-nv #:begin-occlusion-query-nv 
  #:end-occlusion-query-nv #:get-occlusion-query-iv-nv 
  #:get-occlusion-query-uiv-nv #:point-parameter-i-nv 
  #:point-parameter-iv-nv #:active-stencil-face-ext 
  #:element-pointer-apple #:draw-element-array-apple 
  #:draw-range-element-array-apple #:multi-draw-element-array-apple 
  #:multi-draw-range-element-array-apple #:gen-fences-apple 
  #:delete-fences-apple #:set-fence-apple #:is-fence-apple 
  #:test-fence-apple #:finish-fence-apple #:test-object-apple 
  #:finish-object-apple #:bind-vertex-array-apple 
  #:delete-vertex-arrays-apple #:gen-vertex-arrays-apple 
  #:is-vertex-array-apple #:vertex-array-range-apple 
  #:flush-vertex-array-range-apple #:vertex-array-parameter-i-apple 
  #:draw-buffers-ati #:program-named-parameter-4f-nv 
  #:program-named-parameter-4d-nv #:program-named-parameter-4fv-nv 
  #:program-named-parameter-4dv-nv 
  #:get-program-named-parameter-fv-nv 
  #:get-program-named-parameter-dv-nv #:vertex-2h-nv #:vertex-2hv-nv 
  #:vertex-3h-nv #:vertex-3hv-nv #:vertex-4h-nv #:vertex-4hv-nv 
  #:normal-3h-nv #:normal-3hv-nv #:color-3h-nv #:color-3hv-nv 
  #:color-4h-nv #:color-4hv-nv #:tex-coord-1h-nv #:tex-coord-1hv-nv 
  #:tex-coord-2h-nv #:tex-coord-2hv-nv #:tex-coord-3h-nv 
  #:tex-coord-3hv-nv #:tex-coord-4h-nv #:tex-coord-4hv-nv 
  #:multi-tex-coord-1h-nv #:multi-tex-coord-1hv-nv 
  #:multi-tex-coord-2h-nv #:multi-tex-coord-2hv-nv 
  #:multi-tex-coord-3h-nv #:multi-tex-coord-3hv-nv 
  #:multi-tex-coord-4h-nv #:multi-tex-coord-4hv-nv #:fog-coord-h-nv 
  #:fog-coord-hv-nv #:secondary-color-3h-nv #:secondary-color-3hv-nv 
  #:vertex-weight-h-nv #:vertex-weight-hv-nv #:vertex-attrib-1h-nv 
  #:vertex-attrib-1hv-nv #:vertex-attrib-2h-nv 
  #:vertex-attrib-2hv-nv #:vertex-attrib-3h-nv 
  #:vertex-attrib-3hv-nv #:vertex-attrib-4h-nv 
  #:vertex-attrib-4hv-nv #:vertex-attribs-1hv-nv 
  #:vertex-attribs-2hv-nv #:vertex-attribs-3hv-nv 
  #:vertex-attribs-4hv-nv #:pixel-data-range-nv 
  #:flush-pixel-data-range-nv #:primitive-restart-nv 
  #:primitive-restart-index-nv #:map-object-buffer-ati 
  #:unmap-object-buffer-ati #:stencil-op-separate-ati 
  #:stencil-func-separate-ati #:vertex-attrib-array-object-ati 
  #:get-vertex-attrib-array-object-fv-ati 
  #:get-vertex-attrib-array-object-iv-ati #:depth-bounds-ext 
  #:blend-equation-separate-ext #:is-renderbuffer-ext 
  #:bind-renderbuffer-ext #:delete-renderbuffers-ext 
  #:gen-renderbuffers-ext #:renderbuffer-storage-ext 
  #:get-renderbuffer-parameter-iv-ext #:is-framebuffer-ext 
  #:bind-framebuffer-ext #:delete-framebuffers-ext 
  #:gen-framebuffers-ext #:check-framebuffer-status-ext 
  #:framebuffer-texture-1d-ext #:framebuffer-texture-2d-ext 
  #:framebuffer-texture-3d-ext #:framebuffer-renderbuffer-ext 
  #:get-framebuffer-attachment-parameter-iv-ext 
  #:generate-mipmap-ext #:string-marker-gremedy 
  #:stencil-clear-tag-ext #:blit-framebuffer-ext 
  #:renderbuffer-storage-multisample-ext #:get-query-object-i64v-ext 
  #:get-query-object-ui64v-ext #:program-env-parameters-4fv-ext 
  #:program-local-parameters-4fv-ext #:buffer-parameter-i-apple 
  #:flush-mapped-buffer-range-apple #:program-local-parameter-i4i-nv 
  #:program-local-parameter-i4iv-nv 
  #:program-local-parameters-i4iv-nv 
  #:program-local-parameter-i4ui-nv 
  #:program-local-parameter-i4uiv-nv 
  #:program-local-parameters-i4uiv-nv #:program-env-parameter-i4i-nv 
  #:program-env-parameter-i4iv-nv #:program-env-parameters-i4iv-nv 
  #:program-env-parameter-i4ui-nv #:program-env-parameter-i4uiv-nv 
  #:program-env-parameters-i4uiv-nv 
  #:get-program-local-parameter-iiv-nv 
  #:get-program-local-parameter-iuiv-nv 
  #:get-program-env-parameter-iiv-nv 
  #:get-program-env-parameter-iuiv-nv #:program-vertex-limit-nv 
  #:framebuffer-texture-ext #:framebuffer-texture-layer-ext 
  #:framebuffer-texture-face-ext #:program-parameter-i-ext 
  #:vertex-attrib-i1i-ext #:vertex-attrib-i2i-ext 
  #:vertex-attrib-i3i-ext #:vertex-attrib-i4i-ext 
  #:vertex-attrib-i1ui-ext #:vertex-attrib-i2ui-ext 
  #:vertex-attrib-i3ui-ext #:vertex-attrib-i4ui-ext 
  #:vertex-attrib-i1iv-ext #:vertex-attrib-i2iv-ext 
  #:vertex-attrib-i3iv-ext #:vertex-attrib-i4iv-ext 
  #:vertex-attrib-i1uiv-ext #:vertex-attrib-i2uiv-ext 
  #:vertex-attrib-i3uiv-ext #:vertex-attrib-i4uiv-ext 
  #:vertex-attrib-i4bv-ext #:vertex-attrib-i4sv-ext 
  #:vertex-attrib-i4ubv-ext #:vertex-attrib-i4usv-ext 
  #:vertex-attrib-ipointer-ext #:get-vertex-attrib-iiv-ext 
  #:get-vertex-attrib-iuiv-ext #:get-uniform-uiv-ext 
  #:bind-frag-data-location-ext #:get-frag-data-location-ext 
  #:uniform-1ui-ext #:uniform-2ui-ext #:uniform-3ui-ext 
  #:uniform-4ui-ext #:uniform-1uiv-ext #:uniform-2uiv-ext 
  #:uniform-3uiv-ext #:uniform-4uiv-ext #:draw-arrays-instanced-ext 
  #:draw-elements-instanced-ext #:tex-buffer-ext #:depth-range-d-nv 
  #:clear-depth-d-nv #:depth-bounds-d-nv 
  #:renderbuffer-storage-multisample-coverage-nv 
  #:program-buffer-parameters-fv-nv 
  #:program-buffer-parameters-iiv-nv 
  #:program-buffer-parameters-iuiv-nv #:color-mask-indexed-ext 
  #:get-boolean-indexed-v-ext #:get-integer-indexed-v-ext 
  #:enable-indexed-ext #:disable-indexed-ext 
  #:is-enabled-indexed-ext #:begin-transform-feedback-nv 
  #:end-transform-feedback-nv #:transform-feedback-attribs-nv 
  #:bind-buffer-range-nv #:bind-buffer-offset-nv 
  #:bind-buffer-base-nv #:transform-feedback-varyings-nv 
  #:active-varying-nv #:get-varying-location-nv 
  #:get-active-varying-nv #:get-transform-feedback-varying-nv 
  #:transform-feedback-stream-attribs-nv #:uniform-buffer-ext 
  #:get-uniform-buffer-size-ext #:get-uniform-offset-ext 
  #:tex-parameter-iiv-ext #:tex-parameter-iuiv-ext 
  #:get-tex-parameter-iiv-ext #:get-tex-parameter-iuiv-ext 
  #:clear-color-ii-ext #:clear-color-iui-ext 
  #:frame-terminator-gremedy #:begin-conditional-render-nv 
  #:end-conditional-render-nv #:present-frame-keyed-nv 
  #:present-frame-dual-fill-nv #:get-video-iv-nv #:get-video-uiv-nv 
  #:get-video-i64v-nv #:get-video-ui64v-nv 
  #:begin-transform-feedback-ext #:end-transform-feedback-ext 
  #:bind-buffer-range-ext #:bind-buffer-offset-ext 
  #:bind-buffer-base-ext #:transform-feedback-varyings-ext 
  #:get-transform-feedback-varying-ext #:client-attrib-default-ext 
  #:push-client-attrib-default-ext #:matrix-load-f-ext 
  #:matrix-load-d-ext #:matrix-mult-f-ext #:matrix-mult-d-ext 
  #:matrix-load-identity-ext #:matrix-rotate-f-ext 
  #:matrix-rotate-d-ext #:matrix-scale-f-ext #:matrix-scale-d-ext 
  #:matrix-translate-f-ext #:matrix-translate-d-ext 
  #:matrix-frustum-ext #:matrix-ortho-ext #:matrix-pop-ext 
  #:matrix-push-ext #:matrix-load-transpose-f-ext 
  #:matrix-load-transpose-d-ext #:matrix-mult-transpose-f-ext 
  #:matrix-mult-transpose-d-ext #:texture-parameter-f-ext 
  #:texture-parameter-fv-ext #:texture-parameter-i-ext 
  #:texture-parameter-iv-ext #:texture-image-1d-ext 
  #:texture-image-2d-ext #:texture-sub-image-1d-ext 
  #:texture-sub-image-2d-ext #:copy-texture-image-1d-ext 
  #:copy-texture-image-2d-ext #:copy-texture-sub-image-1d-ext 
  #:copy-texture-sub-image-2d-ext #:get-texture-image-ext 
  #:get-texture-parameter-fv-ext #:get-texture-parameter-iv-ext 
  #:get-texture-level-parameter-fv-ext 
  #:get-texture-level-parameter-iv-ext #:texture-image-3d-ext 
  #:texture-sub-image-3d-ext #:copy-texture-sub-image-3d-ext 
  #:multi-tex-parameter-f-ext #:multi-tex-parameter-fv-ext 
  #:multi-tex-parameter-i-ext #:multi-tex-parameter-iv-ext 
  #:multi-tex-image-1d-ext #:multi-tex-image-2d-ext 
  #:multi-tex-sub-image-1d-ext #:multi-tex-sub-image-2d-ext 
  #:copy-multi-tex-image-1d-ext #:copy-multi-tex-image-2d-ext 
  #:copy-multi-tex-sub-image-1d-ext 
  #:copy-multi-tex-sub-image-2d-ext #:get-multi-tex-image-ext 
  #:get-multi-tex-parameter-fv-ext #:get-multi-tex-parameter-iv-ext 
  #:get-multi-tex-level-parameter-fv-ext 
  #:get-multi-tex-level-parameter-iv-ext #:multi-tex-image-3d-ext 
  #:multi-tex-sub-image-3d-ext #:copy-multi-tex-sub-image-3d-ext 
  #:bind-multi-texture-ext #:enable-client-state-indexed-ext 
  #:disable-client-state-indexed-ext #:multi-tex-coord-pointer-ext 
  #:multi-tex-env-f-ext #:multi-tex-env-fv-ext #:multi-tex-env-i-ext 
  #:multi-tex-env-iv-ext #:multi-tex-gen-d-ext 
  #:multi-tex-gen-dv-ext #:multi-tex-gen-f-ext 
  #:multi-tex-gen-fv-ext #:multi-tex-gen-i-ext 
  #:multi-tex-gen-iv-ext #:get-multi-tex-env-fv-ext 
  #:get-multi-tex-env-iv-ext #:get-multi-tex-gen-dv-ext 
  #:get-multi-tex-gen-fv-ext #:get-multi-tex-gen-iv-ext 
  #:get-float-indexed-v-ext #:get-double-indexed-v-ext 
  #:get-pointer-indexed-v-ext #:compressed-texture-image-3d-ext 
  #:compressed-texture-image-2d-ext 
  #:compressed-texture-image-1d-ext 
  #:compressed-texture-sub-image-3d-ext 
  #:compressed-texture-sub-image-2d-ext 
  #:compressed-texture-sub-image-1d-ext 
  #:get-compressed-texture-image-ext 
  #:compressed-multi-tex-image-3d-ext 
  #:compressed-multi-tex-image-2d-ext 
  #:compressed-multi-tex-image-1d-ext 
  #:compressed-multi-tex-sub-image-3d-ext 
  #:compressed-multi-tex-sub-image-2d-ext 
  #:compressed-multi-tex-sub-image-1d-ext 
  #:get-compressed-multi-tex-image-ext #:named-program-string-ext 
  #:named-program-local-parameter-4d-ext 
  #:named-program-local-parameter-4dv-ext 
  #:named-program-local-parameter-4f-ext 
  #:named-program-local-parameter-4fv-ext 
  #:get-named-program-local-parameter-dv-ext 
  #:get-named-program-local-parameter-fv-ext 
  #:get-named-program-iv-ext #:get-named-program-string-ext 
  #:named-program-local-parameters-4fv-ext 
  #:named-program-local-parameter-i4i-ext 
  #:named-program-local-parameter-i4iv-ext 
  #:named-program-local-parameters-i4iv-ext 
  #:named-program-local-parameter-i4ui-ext 
  #:named-program-local-parameter-i4uiv-ext 
  #:named-program-local-parameters-i4uiv-ext 
  #:get-named-program-local-parameter-iiv-ext 
  #:get-named-program-local-parameter-iuiv-ext 
  #:texture-parameter-iiv-ext #:texture-parameter-iuiv-ext 
  #:get-texture-parameter-iiv-ext #:get-texture-parameter-iuiv-ext 
  #:multi-tex-parameter-iiv-ext #:multi-tex-parameter-iuiv-ext 
  #:get-multi-tex-parameter-iiv-ext 
  #:get-multi-tex-parameter-iuiv-ext #:program-uniform-1f-ext 
  #:program-uniform-2f-ext #:program-uniform-3f-ext 
  #:program-uniform-4f-ext #:program-uniform-1i-ext 
  #:program-uniform-2i-ext #:program-uniform-3i-ext 
  #:program-uniform-4i-ext #:program-uniform-1fv-ext 
  #:program-uniform-2fv-ext #:program-uniform-3fv-ext 
  #:program-uniform-4fv-ext #:program-uniform-1iv-ext 
  #:program-uniform-2iv-ext #:program-uniform-3iv-ext 
  #:program-uniform-4iv-ext #:program-uniform-matrix-2fv-ext 
  #:program-uniform-matrix-3fv-ext #:program-uniform-matrix-4fv-ext 
  #:program-uniform-matrix-2x3-fv-ext 
  #:program-uniform-matrix-3x2-fv-ext 
  #:program-uniform-matrix-2x4-fv-ext 
  #:program-uniform-matrix-4x2-fv-ext 
  #:program-uniform-matrix-3x4-fv-ext 
  #:program-uniform-matrix-4x3-fv-ext #:program-uniform-1ui-ext 
  #:program-uniform-2ui-ext #:program-uniform-3ui-ext 
  #:program-uniform-4ui-ext #:program-uniform-1uiv-ext 
  #:program-uniform-2uiv-ext #:program-uniform-3uiv-ext 
  #:program-uniform-4uiv-ext #:named-buffer-data-ext 
  #:named-buffer-sub-data-ext #:map-named-buffer-ext 
  #:unmap-named-buffer-ext #:map-named-buffer-range-ext 
  #:flush-mapped-named-buffer-range-ext 
  #:named-copy-buffer-sub-data-ext 
  #:get-named-buffer-parameter-iv-ext 
  #:get-named-buffer-pointer-v-ext #:get-named-buffer-sub-data-ext 
  #:texture-buffer-ext #:multi-tex-buffer-ext 
  #:named-renderbuffer-storage-ext 
  #:get-named-renderbuffer-parameter-iv-ext 
  #:check-named-framebuffer-status-ext 
  #:named-framebuffer-texture-1d-ext 
  #:named-framebuffer-texture-2d-ext 
  #:named-framebuffer-texture-3d-ext 
  #:named-framebuffer-renderbuffer-ext 
  #:get-named-framebuffer-attachment-parameter-iv-ext 
  #:generate-texture-mipmap-ext #:generate-multi-tex-mipmap-ext 
  #:framebuffer-draw-buffer-ext #:framebuffer-draw-buffers-ext 
  #:framebuffer-read-buffer-ext #:get-framebuffer-parameter-iv-ext 
  #:named-renderbuffer-storage-multisample-ext 
  #:named-renderbuffer-storage-multisample-coverage-ext 
  #:named-framebuffer-texture-ext 
  #:named-framebuffer-texture-layer-ext 
  #:named-framebuffer-texture-face-ext #:texture-renderbuffer-ext 
  #:multi-tex-renderbuffer-ext #:program-uniform-1d-ext 
  #:program-uniform-2d-ext #:program-uniform-3d-ext 
  #:program-uniform-4d-ext #:program-uniform-1dv-ext 
  #:program-uniform-2dv-ext #:program-uniform-3dv-ext 
  #:program-uniform-4dv-ext #:program-uniform-matrix-2dv-ext 
  #:program-uniform-matrix-3dv-ext #:program-uniform-matrix-4dv-ext 
  #:program-uniform-matrix-2x3-dv-ext 
  #:program-uniform-matrix-2x4-dv-ext 
  #:program-uniform-matrix-3x2-dv-ext 
  #:program-uniform-matrix-3x4-dv-ext 
  #:program-uniform-matrix-4x2-dv-ext 
  #:program-uniform-matrix-4x3-dv-ext #:get-multisample-fv-nv 
  #:sample-mask-indexed-nv #:tex-renderbuffer-nv 
  #:bind-transform-feedback-nv #:delete-transform-feedbacks-nv 
  #:gen-transform-feedbacks-nv #:is-transform-feedback-nv 
  #:pause-transform-feedback-nv #:resume-transform-feedback-nv 
  #:draw-transform-feedback-nv #:get-perf-monitor-groups-amd 
  #:get-perf-monitor-counters-amd 
  #:get-perf-monitor-group-string-amd 
  #:get-perf-monitor-counter-string-amd 
  #:get-perf-monitor-counter-info-amd #:gen-perf-monitors-amd 
  #:delete-perf-monitors-amd #:select-perf-monitor-counters-amd 
  #:begin-perf-monitor-amd #:end-perf-monitor-amd 
  #:get-perf-monitor-counter-data-amd #:tessellation-factor-amd 
  #:tessellation-mode-amd #:provoking-vertex-ext 
  #:blend-func-indexed-amd #:blend-func-separate-indexed-amd 
  #:blend-equation-indexed-amd #:blend-equation-separate-indexed-amd 
  #:texture-range-apple #:get-tex-parameter-pointer-v-apple 
  #:enable-vertex-attrib-apple #:disable-vertex-attrib-apple 
  #:is-vertex-attrib-enabled-apple #:map-vertex-attrib-1d-apple 
  #:map-vertex-attrib-1f-apple #:map-vertex-attrib-2d-apple 
  #:map-vertex-attrib-2f-apple #:object-purgeable-apple 
  #:object-unpurgeable-apple #:get-object-parameter-iv-apple 
  #:begin-video-capture-nv #:bind-video-capture-stream-buffer-nv 
  #:bind-video-capture-stream-texture-nv #:end-video-capture-nv 
  #:get-video-capture-iv-nv #:get-video-capture-stream-iv-nv 
  #:get-video-capture-stream-fv-nv #:get-video-capture-stream-dv-nv 
  #:video-capture-nv #:video-capture-stream-parameter-iv-nv 
  #:video-capture-stream-parameter-fv-nv 
  #:video-capture-stream-parameter-dv-nv #:copy-image-sub-data-nv 
  #:use-shader-program-ext #:active-program-ext 
  #:create-shader-program-ext #:make-buffer-resident-nv 
  #:make-buffer-non-resident-nv #:is-buffer-resident-nv 
  #:make-named-buffer-resident-nv 
  #:make-named-buffer-non-resident-nv #:is-named-buffer-resident-nv 
  #:get-buffer-parameter-ui64v-nv 
  #:get-named-buffer-parameter-ui64v-nv #:get-integer-ui64v-nv 
  #:uniform-ui64-nv #:uniform-ui64v-nv #:get-uniform-ui64v-nv 
  #:program-uniform-ui64-nv #:program-uniform-ui64v-nv 
  #:buffer-address-range-nv #:vertex-format-nv #:normal-format-nv 
  #:color-format-nv #:index-format-nv #:tex-coord-format-nv 
  #:edge-flag-format-nv #:secondary-color-format-nv 
  #:fog-coord-format-nv #:vertex-attrib-format-nv 
  #:vertex-attrib-i-format-nv #:get-integer-ui64i-v-nv 
  #:texture-barrier-nv #:bind-image-texture-ext #:memory-barrier-ext 
  #:vertex-attrib-l1d-ext #:vertex-attrib-l2d-ext 
  #:vertex-attrib-l3d-ext #:vertex-attrib-l4d-ext 
  #:vertex-attrib-l1dv-ext #:vertex-attrib-l2dv-ext 
  #:vertex-attrib-l3dv-ext #:vertex-attrib-l4dv-ext 
  #:vertex-attrib-lpointer-ext #:get-vertex-attrib-ldv-ext 
  #:vertex-array-vertex-attrib-loffset-ext 
  #:program-subroutine-parameters-uiv-nv 
  #:get-program-subroutine-parameter-uiv-nv #:uniform-1i64-nv 
  #:uniform-2i64-nv #:uniform-3i64-nv #:uniform-4i64-nv 
  #:uniform-1i64v-nv #:uniform-2i64v-nv #:uniform-3i64v-nv 
  #:uniform-4i64v-nv #:uniform-1ui64-nv #:uniform-2ui64-nv 
  #:uniform-3ui64-nv #:uniform-4ui64-nv #:uniform-1ui64v-nv 
  #:uniform-2ui64v-nv #:uniform-3ui64v-nv #:uniform-4ui64v-nv 
  #:get-uniform-i64v-nv #:program-uniform-1i64-nv 
  #:program-uniform-2i64-nv #:program-uniform-3i64-nv 
  #:program-uniform-4i64-nv #:program-uniform-1i64v-nv 
  #:program-uniform-2i64v-nv #:program-uniform-3i64v-nv 
  #:program-uniform-4i64v-nv #:program-uniform-1ui64-nv 
  #:program-uniform-2ui64-nv #:program-uniform-3ui64-nv 
  #:program-uniform-4ui64-nv #:program-uniform-1ui64v-nv 
  #:program-uniform-2ui64v-nv #:program-uniform-3ui64v-nv 
  #:program-uniform-4ui64v-nv #:vertex-attrib-l1i64-nv 
  #:vertex-attrib-l2i64-nv #:vertex-attrib-l3i64-nv 
  #:vertex-attrib-l4i64-nv #:vertex-attrib-l1i64v-nv 
  #:vertex-attrib-l2i64v-nv #:vertex-attrib-l3i64v-nv 
  #:vertex-attrib-l4i64v-nv #:vertex-attrib-l1ui64-nv 
  #:vertex-attrib-l2ui64-nv #:vertex-attrib-l3ui64-nv 
  #:vertex-attrib-l4ui64-nv #:vertex-attrib-l1ui64v-nv 
  #:vertex-attrib-l2ui64v-nv #:vertex-attrib-l3ui64v-nv 
  #:vertex-attrib-l4ui64v-nv #:get-vertex-attrib-li64v-nv 
  #:get-vertex-attrib-lui64v-nv #:vertex-attrib-lformat-nv 
  #:gen-names-amd #:delete-names-amd #:is-name-amd 
  #:debug-message-enable-amd #:debug-message-insert-amd 
  #:debug-message-callback-amd #:get-debug-message-log-amd 
  #:vdpau-init-nv #:vdpau-fini-nv #:vdpau-register-video-surface-nv 
  #:vdpau-register-output-surface-nv #:vdpau-is-surface-nv 
  #:vdpau-unregister-surface-nv #:vdpau-get-surface-iv-nv 
  #:vdpau-surface-access-nv #:vdpau-map-surfaces-nv 
  #:vdpau-unmap-surfaces-nv ))

