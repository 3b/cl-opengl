;;; generated file, do not edit
;;; glext version 40 ( 2008/03/24 )

(defpackage #:cl-opengl-bindings
  (:nicknames #:%gl)
  (:use #:common-lisp #:cffi)
  (:shadow #:char #:float #:byte #:boolean #:string)
  (:export
   #:enum
   #:*glext-version*
   #:*glext-last-updated*
   #:*gl-get-proc-address*

  ;; Types.
  #:char #:char-arb #:intptr #:sizeiptr #:intptr-arb #:sizeiptr-arb 
  #:handle-arb #:half #:half-arb #:half-nv #:int64 #:uint64 #:clampd 
  #:double #:clampf #:float #:sizei #:uint #:ushort #:ubyte #:int 
  #:short #:byte #:void #:bitfield #:boolean #:string #:int64-ext 
  #:uint64-ext 

  ;; Functions.
  #:new-list #:end-list #:call-list #:call-lists #:delete-lists 
  #:gen-lists #:list-base #:begin #:bitmap #:color-3b #:color-3bv 
  #:color-3d #:color-3dv #:color-3f #:color-3fv #:color-3i 
  #:color-3iv #:color-3s #:color-3sv #:color-3ub #:color-3ubv 
  #:color-3ui #:color-3uiv #:color-3us #:color-3usv #:color-4b 
  #:color-4bv #:color-4d #:color-4dv #:color-4f #:color-4fv 
  #:color-4i #:color-4iv #:color-4s #:color-4sv #:color-4ub 
  #:color-4ubv #:color-4ui #:color-4uiv #:color-4us #:color-4usv 
  #:edge-flag #:edge-flag-v #:end #:index-d #:index-dv #:index-f 
  #:index-fv #:index-i #:index-iv #:index-s #:index-sv #:normal-3b 
  #:normal-3bv #:normal-3d #:normal-3dv #:normal-3f #:normal-3fv 
  #:normal-3i #:normal-3iv #:normal-3s #:normal-3sv #:raster-pos-2d 
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
  #:color-material #:cull-face #:fog-f #:fog-fv #:fog-i #:fog-iv 
  #:front-face #:hint #:light-f #:light-fv #:light-i #:light-iv 
  #:light-model-f #:light-model-fv #:light-model-i #:light-model-iv 
  #:line-stipple #:line-width #:material-f #:material-fv 
  #:material-i #:material-iv #:point-size #:polygon-mode 
  #:polygon-stipple #:scissor #:shade-model #:tex-parameter-f 
  #:tex-parameter-fv #:tex-parameter-i #:tex-parameter-iv 
  #:tex-image-1d #:tex-image-2d #:tex-env-f #:tex-env-fv #:tex-env-i 
  #:tex-env-iv #:tex-gen-d #:tex-gen-dv #:tex-gen-f #:tex-gen-fv 
  #:tex-gen-i #:tex-gen-iv #:feedback-buffer #:select-buffer 
  #:render-mode #:init-names #:load-name #:pass-through #:pop-name 
  #:push-name #:draw-buffer #:clear #:clear-accum #:clear-index 
  #:clear-color #:clear-stencil #:clear-depth #:stencil-mask 
  #:color-mask #:depth-mask #:index-mask #:accum #:disable #:enable 
  #:finish #:flush #:pop-attrib #:push-attrib #:map-1d #:map-1f 
  #:map-2d #:map-2f #:map-grid-1d #:map-grid-1f #:map-grid-2d 
  #:map-grid-2f #:eval-coord-1d #:eval-coord-1dv #:eval-coord-1f 
  #:eval-coord-1fv #:eval-coord-2d #:eval-coord-2dv #:eval-coord-2f 
  #:eval-coord-2fv #:eval-mesh-1 #:eval-point-1 #:eval-mesh-2 
  #:eval-point-2 #:alpha-func #:blend-func #:logic-op #:stencil-func 
  #:stencil-op #:depth-func #:pixel-zoom #:pixel-transfer-f 
  #:pixel-transfer-i #:pixel-store-f #:pixel-store-i #:pixel-map-fv 
  #:pixel-map-uiv #:pixel-map-usv #:read-buffer #:copy-pixels 
  #:read-pixels #:draw-pixels #:get-boolean-v #:get-clip-plane 
  #:get-double-v #:get-error #:get-float-v #:get-integer-v 
  #:get-light-fv #:get-light-iv #:get-map-dv #:get-map-fv 
  #:get-map-iv #:get-material-fv #:get-material-iv 
  #:get-pixel-map-fv #:get-pixel-map-uiv #:get-pixel-map-usv 
  #:get-polygon-stipple #:get-string #:get-tex-env-fv 
  #:get-tex-env-iv #:get-tex-gen-dv #:get-tex-gen-fv 
  #:get-tex-gen-iv #:get-tex-image #:get-tex-parameter-fv 
  #:get-tex-parameter-iv #:get-tex-level-parameter-fv 
  #:get-tex-level-parameter-iv #:is-enabled #:is-list #:depth-range 
  #:frustum #:load-identity #:load-matrix-f #:load-matrix-d 
  #:matrix-mode #:mult-matrix-f #:mult-matrix-d #:ortho #:pop-matrix 
  #:push-matrix #:rotate-d #:rotate-f #:scale-d #:scale-f 
  #:translate-d #:translate-f #:viewport #:array-element 
  #:color-pointer #:disable-client-state #:draw-arrays 
  #:draw-elements #:edge-flag-pointer #:enable-client-state 
  #:get-pointer-v #:index-pointer #:interleaved-arrays 
  #:normal-pointer #:tex-coord-pointer #:vertex-pointer 
  #:polygon-offset #:copy-tex-image-1d #:copy-tex-image-2d 
  #:copy-tex-sub-image-1d #:copy-tex-sub-image-2d #:tex-sub-image-1d 
  #:tex-sub-image-2d #:are-textures-resident #:bind-texture 
  #:delete-textures #:gen-textures #:is-texture 
  #:prioritize-textures #:index-ub #:index-ubv #:pop-client-attrib 
  #:push-client-attrib #:blend-color #:blend-equation 
  #:draw-range-elements #:color-table #:color-table-parameter-fv 
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
  #:tex-image-3d #:tex-sub-image-3d #:copy-tex-sub-image-3d 
  #:active-texture #:client-active-texture #:multi-tex-coord-1d 
  #:multi-tex-coord-1dv #:multi-tex-coord-1f #:multi-tex-coord-1fv 
  #:multi-tex-coord-1i #:multi-tex-coord-1iv #:multi-tex-coord-1s 
  #:multi-tex-coord-1sv #:multi-tex-coord-2d #:multi-tex-coord-2dv 
  #:multi-tex-coord-2f #:multi-tex-coord-2fv #:multi-tex-coord-2i 
  #:multi-tex-coord-2iv #:multi-tex-coord-2s #:multi-tex-coord-2sv 
  #:multi-tex-coord-3d #:multi-tex-coord-3dv #:multi-tex-coord-3f 
  #:multi-tex-coord-3fv #:multi-tex-coord-3i #:multi-tex-coord-3iv 
  #:multi-tex-coord-3s #:multi-tex-coord-3sv #:multi-tex-coord-4d 
  #:multi-tex-coord-4dv #:multi-tex-coord-4f #:multi-tex-coord-4fv 
  #:multi-tex-coord-4i #:multi-tex-coord-4iv #:multi-tex-coord-4s 
  #:multi-tex-coord-4sv #:load-transpose-matrix-f 
  #:load-transpose-matrix-d #:mult-transpose-matrix-f 
  #:mult-transpose-matrix-d #:sample-coverage 
  #:compressed-tex-image-3d #:compressed-tex-image-2d 
  #:compressed-tex-image-1d #:compressed-tex-sub-image-3d 
  #:compressed-tex-sub-image-2d #:compressed-tex-sub-image-1d 
  #:get-compressed-tex-image #:blend-func-separate #:fog-coord-f 
  #:fog-coord-fv #:fog-coord-d #:fog-coord-dv #:fog-coord-pointer 
  #:multi-draw-arrays #:multi-draw-elements #:point-parameter-f 
  #:point-parameter-fv #:point-parameter-i #:point-parameter-iv 
  #:secondary-color-3b #:secondary-color-3bv #:secondary-color-3d 
  #:secondary-color-3dv #:secondary-color-3f #:secondary-color-3fv 
  #:secondary-color-3i #:secondary-color-3iv #:secondary-color-3s 
  #:secondary-color-3sv #:secondary-color-3ub #:secondary-color-3ubv 
  #:secondary-color-3ui #:secondary-color-3uiv #:secondary-color-3us 
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
  #:uniform-matrix-4x3-fv #:active-texture-arb 
  #:client-active-texture-arb #:multi-tex-coord-1d-arb 
  #:multi-tex-coord-1dv-arb #:multi-tex-coord-1f-arb 
  #:multi-tex-coord-1fv-arb #:multi-tex-coord-1i-arb 
  #:multi-tex-coord-1iv-arb #:multi-tex-coord-1s-arb 
  #:multi-tex-coord-1sv-arb #:multi-tex-coord-2d-arb 
  #:multi-tex-coord-2dv-arb #:multi-tex-coord-2f-arb 
  #:multi-tex-coord-2fv-arb #:multi-tex-coord-2i-arb 
  #:multi-tex-coord-2iv-arb #:multi-tex-coord-2s-arb 
  #:multi-tex-coord-2sv-arb #:multi-tex-coord-3d-arb 
  #:multi-tex-coord-3dv-arb #:multi-tex-coord-3f-arb 
  #:multi-tex-coord-3fv-arb #:multi-tex-coord-3i-arb 
  #:multi-tex-coord-3iv-arb #:multi-tex-coord-3s-arb 
  #:multi-tex-coord-3sv-arb #:multi-tex-coord-4d-arb 
  #:multi-tex-coord-4dv-arb #:multi-tex-coord-4f-arb 
  #:multi-tex-coord-4fv-arb #:multi-tex-coord-4i-arb 
  #:multi-tex-coord-4iv-arb #:multi-tex-coord-4s-arb 
  #:multi-tex-coord-4sv-arb #:load-transpose-matrix-f-arb 
  #:load-transpose-matrix-d-arb #:mult-transpose-matrix-f-arb 
  #:mult-transpose-matrix-d-arb #:sample-coverage-arb 
  #:compressed-tex-image-3d-arb #:compressed-tex-image-2d-arb 
  #:compressed-tex-image-1d-arb #:compressed-tex-sub-image-3d-arb 
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
  #:blend-color-ext #:polygon-offset-ext #:tex-image-3d-ext 
  #:tex-sub-image-3d-ext #:get-tex-filter-func-sgis 
  #:tex-filter-func-sgis #:tex-sub-image-1d-ext 
  #:tex-sub-image-2d-ext #:copy-tex-image-1d-ext 
  #:copy-tex-image-2d-ext #:copy-tex-sub-image-1d-ext 
  #:copy-tex-sub-image-2d-ext #:copy-tex-sub-image-3d-ext 
  #:get-histogram-ext #:get-histogram-parameter-fv-ext 
  #:get-histogram-parameter-iv-ext #:get-minmax-ext 
  #:get-minmax-parameter-fv-ext #:get-minmax-parameter-iv-ext 
  #:histogram-ext #:minmax-ext #:reset-histogram-ext 
  #:reset-minmax-ext #:convolution-filter-1d-ext 
  #:convolution-filter-2d-ext #:convolution-parameter-f-ext 
  #:convolution-parameter-fv-ext #:convolution-parameter-i-ext 
  #:convolution-parameter-iv-ext #:copy-convolution-filter-1d-ext 
  #:copy-convolution-filter-2d-ext #:get-convolution-filter-ext 
  #:get-convolution-parameter-fv-ext 
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
  #:uniform-buffer-ext #:get-uniform-buffer-size-ext 
  #:get-uniform-offset-ext #:tex-parameter-iiv-ext 
  #:tex-parameter-iuiv-ext #:get-tex-parameter-iiv-ext 
  #:get-tex-parameter-iuiv-ext #:clear-color-ii-ext 
  #:clear-color-iui-ext #:frame-terminator-gremedy ))

