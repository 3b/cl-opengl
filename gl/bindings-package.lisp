;;; generated file, do not edit
;;; glext version 20171003 ( 2017-10-03T15:09:09Z )

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
  #:draw-range-elements #:tex-image-3d #:tex-sub-image-3d
  #:copy-tex-sub-image-3d #:active-texture #:sample-coverage
  #:compressed-tex-image-3d #:compressed-tex-image-2d
  #:compressed-tex-image-1d #:compressed-tex-sub-image-3d
  #:compressed-tex-sub-image-2d #:compressed-tex-sub-image-1d
  #:get-compressed-tex-image #:client-active-texture
  #:multi-tex-coord-1d #:multi-tex-coord-1dv #:multi-tex-coord-1f
  #:multi-tex-coord-1fv #:multi-tex-coord-1i #:multi-tex-coord-1iv
  #:multi-tex-coord-1s #:multi-tex-coord-1sv #:multi-tex-coord-2d
  #:multi-tex-coord-2dv #:multi-tex-coord-2f #:multi-tex-coord-2fv
  #:multi-tex-coord-2i #:multi-tex-coord-2iv #:multi-tex-coord-2s
  #:multi-tex-coord-2sv #:multi-tex-coord-3d #:multi-tex-coord-3dv
  #:multi-tex-coord-3f #:multi-tex-coord-3fv #:multi-tex-coord-3i
  #:multi-tex-coord-3iv #:multi-tex-coord-3s #:multi-tex-coord-3sv
  #:multi-tex-coord-4d #:multi-tex-coord-4dv #:multi-tex-coord-4f
  #:multi-tex-coord-4fv #:multi-tex-coord-4i #:multi-tex-coord-4iv
  #:multi-tex-coord-4s #:multi-tex-coord-4sv
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
  #:window-pos-3iv #:window-pos-3s #:window-pos-3sv #:blend-color
  #:blend-equation #:gen-queries #:delete-queries #:is-query
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
  #:get-string-i #:is-renderbuffer #:bind-renderbuffer
  #:delete-renderbuffers #:gen-renderbuffers #:renderbuffer-storage
  #:get-renderbuffer-parameter-iv #:is-framebuffer
  #:bind-framebuffer #:delete-framebuffers #:gen-framebuffers
  #:check-framebuffer-status #:framebuffer-texture-1d
  #:framebuffer-texture-2d #:framebuffer-texture-3d
  #:framebuffer-renderbuffer
  #:get-framebuffer-attachment-parameter-iv #:generate-mipmap
  #:blit-framebuffer #:renderbuffer-storage-multisample
  #:framebuffer-texture-layer #:map-buffer-range
  #:flush-mapped-buffer-range #:bind-vertex-array
  #:delete-vertex-arrays #:gen-vertex-arrays #:is-vertex-array
  #:draw-arrays-instanced #:draw-elements-instanced #:tex-buffer
  #:primitive-restart-index #:copy-buffer-sub-data
  #:get-uniform-indices #:get-active-uniforms-iv
  #:get-active-uniform-name #:get-uniform-block-index
  #:get-active-uniform-block-iv #:get-active-uniform-block-name
  #:uniform-block-binding #:draw-elements-base-vertex
  #:draw-range-elements-base-vertex
  #:draw-elements-instanced-base-vertex
  #:multi-draw-elements-base-vertex #:provoking-vertex #:fence-sync
  #:is-sync #:delete-sync #:client-wait-sync #:wait-sync
  #:get-integer-64-v #:get-sync-iv #:get-integer-64-i-v
  #:get-buffer-parameter-i64v #:framebuffer-texture
  #:tex-image-2d-multisample #:tex-image-3d-multisample
  #:get-multisample-fv #:sample-mask-i
  #:bind-frag-data-location-indexed #:get-frag-data-index
  #:gen-samplers #:delete-samplers #:is-sampler #:bind-sampler
  #:sampler-parameter-i #:sampler-parameter-iv #:sampler-parameter-f
  #:sampler-parameter-fv #:sampler-parameter-iiv
  #:sampler-parameter-iuiv #:get-sampler-parameter-iv
  #:get-sampler-parameter-iiv #:get-sampler-parameter-fv
  #:get-sampler-parameter-iuiv #:query-counter
  #:get-query-object-i64v #:get-query-object-ui64v
  #:vertex-attrib-divisor #:vertex-attrib-p1ui #:vertex-attrib-p1uiv
  #:vertex-attrib-p2ui #:vertex-attrib-p2uiv #:vertex-attrib-p3ui
  #:vertex-attrib-p3uiv #:vertex-attrib-p4ui #:vertex-attrib-p4uiv
  #:vertex-p2ui #:vertex-p2uiv #:vertex-p3ui #:vertex-p3uiv
  #:vertex-p4ui #:vertex-p4uiv #:tex-coord-p1ui #:tex-coord-p1uiv
  #:tex-coord-p2ui #:tex-coord-p2uiv #:tex-coord-p3ui
  #:tex-coord-p3uiv #:tex-coord-p4ui #:tex-coord-p4uiv
  #:multi-tex-coord-p1ui #:multi-tex-coord-p1uiv
  #:multi-tex-coord-p2ui #:multi-tex-coord-p2uiv
  #:multi-tex-coord-p3ui #:multi-tex-coord-p3uiv
  #:multi-tex-coord-p4ui #:multi-tex-coord-p4uiv #:normal-p3ui
  #:normal-p3uiv #:color-p3ui #:color-p3uiv #:color-p4ui
  #:color-p4uiv #:secondary-color-p3ui #:secondary-color-p3uiv
  #:min-sample-shading #:blend-equation-i
  #:blend-equation-separate-i #:blend-func-i #:blend-func-separate-i
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
  #:get-float-i-v #:get-double-i-v
  #:draw-arrays-instanced-base-instance
  #:draw-elements-instanced-base-instance
  #:draw-elements-instanced-base-vertex-base-instance
  #:get-internal-format-iv #:get-active-atomic-counter-buffer-iv
  #:bind-image-texture #:memory-barrier #:tex-storage-1d
  #:tex-storage-2d #:tex-storage-3d
  #:draw-transform-feedback-instanced
  #:draw-transform-feedback-stream-instanced #:clear-buffer-data
  #:clear-buffer-sub-data #:dispatch-compute
  #:dispatch-compute-indirect #:copy-image-sub-data
  #:framebuffer-parameter-i #:get-framebuffer-parameter-iv
  #:get-internal-format-i64v #:invalidate-tex-sub-image
  #:invalidate-tex-image #:invalidate-buffer-sub-data
  #:invalidate-buffer-data #:invalidate-framebuffer
  #:invalidate-sub-framebuffer #:multi-draw-arrays-indirect
  #:multi-draw-elements-indirect #:get-program-interface-iv
  #:get-program-resource-index #:get-program-resource-name
  #:get-program-resource-iv #:get-program-resource-location
  #:get-program-resource-location-index
  #:shader-storage-block-binding #:tex-buffer-range
  #:tex-storage-2d-multisample #:tex-storage-3d-multisample
  #:texture-view #:bind-vertex-buffer #:vertex-attrib-format
  #:vertex-attrib-i-format #:vertex-attrib-l-format
  #:vertex-attrib-binding #:vertex-binding-divisor
  #:debug-message-control #:debug-message-insert
  #:debug-message-callback #:get-debug-message-log
  #:push-debug-group #:pop-debug-group #:object-label
  #:get-object-label #:object-ptr-label #:get-object-ptr-label
  #:buffer-storage #:clear-tex-image #:clear-tex-sub-image
  #:bind-buffers-base #:bind-buffers-range #:bind-textures
  #:bind-samplers #:bind-image-textures #:bind-vertex-buffers
  #:clip-control #:create-transform-feedbacks
  #:transform-feedback-buffer-base #:transform-feedback-buffer-range
  #:get-transform-feedback-iv #:get-transform-feedback-i-v
  #:get-transform-feedback-i64-v #:create-buffers
  #:named-buffer-storage #:named-buffer-data #:named-buffer-sub-data
  #:copy-named-buffer-sub-data #:clear-named-buffer-data
  #:clear-named-buffer-sub-data #:map-named-buffer
  #:map-named-buffer-range #:unmap-named-buffer
  #:flush-mapped-named-buffer-range #:get-named-buffer-parameter-iv
  #:get-named-buffer-parameter-i64v #:get-named-buffer-pointer-v
  #:get-named-buffer-sub-data #:create-framebuffers
  #:named-framebuffer-renderbuffer #:named-framebuffer-parameter-i
  #:named-framebuffer-texture #:named-framebuffer-texture-layer
  #:named-framebuffer-draw-buffer #:named-framebuffer-draw-buffers
  #:named-framebuffer-read-buffer
  #:invalidate-named-framebuffer-data
  #:invalidate-named-framebuffer-sub-data
  #:clear-named-framebuffer-iv #:clear-named-framebuffer-uiv
  #:clear-named-framebuffer-fv #:clear-named-framebuffer-fi
  #:blit-named-framebuffer #:check-named-framebuffer-status
  #:get-named-framebuffer-parameter-iv
  #:get-named-framebuffer-attachment-parameter-iv
  #:create-renderbuffers #:named-renderbuffer-storage
  #:named-renderbuffer-storage-multisample
  #:get-named-renderbuffer-parameter-iv #:create-textures
  #:texture-buffer #:texture-buffer-range #:texture-storage-1d
  #:texture-storage-2d #:texture-storage-3d
  #:texture-storage-2d-multisample #:texture-storage-3d-multisample
  #:texture-sub-image-1d #:texture-sub-image-2d
  #:texture-sub-image-3d #:compressed-texture-sub-image-1d
  #:compressed-texture-sub-image-2d
  #:compressed-texture-sub-image-3d #:copy-texture-sub-image-1d
  #:copy-texture-sub-image-2d #:copy-texture-sub-image-3d
  #:texture-parameter-f #:texture-parameter-fv #:texture-parameter-i
  #:texture-parameter-iiv #:texture-parameter-iuiv
  #:texture-parameter-iv #:generate-texture-mipmap
  #:bind-texture-unit #:get-texture-image
  #:get-compressed-texture-image #:get-texture-level-parameter-fv
  #:get-texture-level-parameter-iv #:get-texture-parameter-fv
  #:get-texture-parameter-iiv #:get-texture-parameter-iuiv
  #:get-texture-parameter-iv #:create-vertex-arrays
  #:disable-vertex-array-attrib #:enable-vertex-array-attrib
  #:vertex-array-element-buffer #:vertex-array-vertex-buffer
  #:vertex-array-vertex-buffers #:vertex-array-attrib-binding
  #:vertex-array-attrib-format #:vertex-array-attrib-i-format
  #:vertex-array-attrib-l-format #:vertex-array-binding-divisor
  #:get-vertex-array-iv #:get-vertex-array-indexed-iv
  #:get-vertex-array-indexed-64iv #:create-samplers
  #:create-program-pipelines #:create-queries
  #:get-query-buffer-object-i64v #:get-query-buffer-object-iv
  #:get-query-buffer-object-ui64v #:get-query-buffer-object-uiv
  #:memory-barrier-by-region #:get-texture-sub-image
  #:get-compressed-texture-sub-image #:get-graphics-reset-status
  #:getn-compressed-tex-image #:getn-tex-image #:getn-uniform-dv
  #:getn-uniform-fv #:getn-uniform-iv #:getn-uniform-uiv
  #:readn-pixels #:getn-map-dv #:getn-map-fv #:getn-map-iv
  #:getn-pixel-map-fv #:getn-pixel-map-uiv #:getn-pixel-map-usv
  #:getn-polygon-stipple #:getn-color-table
  #:getn-convolution-filter #:getn-separable-filter #:getn-histogram
  #:getn-minmax #:texture-barrier #:specialize-shader
  #:multi-draw-arrays-indirect-count
  #:multi-draw-elements-indirect-count #:polygon-offset-clamp
  #:clip-plane-f #:frustum-f #:get-clip-plane-f #:ortho-f
  #:alpha-func-x #:clear-color-x #:clear-depth-x #:clip-plane-x
  #:color-4x #:depth-range-x #:fog-x #:fog-xv #:frustum-x
  #:get-clip-plane-x #:get-fixed-v #:get-light-xv #:get-material-xv
  #:get-tex-env-xv #:get-tex-parameter-xv #:light-model-x
  #:light-model-xv #:light-x #:light-xv #:line-width-x
  #:load-matrix-x #:material-x #:material-xv #:mult-matrix-x
  #:multi-tex-coord-4x #:normal-3x #:ortho-x #:point-parameter-x
  #:point-parameter-xv #:point-size-x #:polygon-offset-x #:rotate-x
  #:sample-coverage-x #:scale-x #:tex-env-x #:tex-env-xv
  #:tex-parameter-x #:tex-parameter-xv #:translate-x #:blend-barrier
  #:primitive-bounding-box #:tbuffer-mask-3dfx
  #:debug-message-enable-amd #:debug-message-insert-amd
  #:debug-message-callback-amd #:get-debug-message-log-amd
  #:blend-func-indexed-amd #:blend-func-separate-indexed-amd
  #:blend-equation-indexed-amd #:blend-equation-separate-indexed-amd
  #:framebuffer-sample-positions-fv-amd
  #:named-framebuffer-sample-positions-fv-amd
  #:get-framebuffer-parameter-fv-amd
  #:get-named-framebuffer-parameter-fv-amd #:uniform-1i64-nv
  #:uniform-2i64-nv #:uniform-3i64-nv #:uniform-4i64-nv
  #:uniform-1i64v-nv #:uniform-2i64v-nv #:uniform-3i64v-nv
  #:uniform-4i64v-nv #:uniform-1ui64-nv #:uniform-2ui64-nv
  #:uniform-3ui64-nv #:uniform-4ui64-nv #:uniform-1ui64v-nv
  #:uniform-2ui64v-nv #:uniform-3ui64v-nv #:uniform-4ui64v-nv
  #:get-uniform-i64v-nv #:get-uniform-ui64v-nv
  #:program-uniform-1i64-nv #:program-uniform-2i64-nv
  #:program-uniform-3i64-nv #:program-uniform-4i64-nv
  #:program-uniform-1i64v-nv #:program-uniform-2i64v-nv
  #:program-uniform-3i64v-nv #:program-uniform-4i64v-nv
  #:program-uniform-1ui64-nv #:program-uniform-2ui64-nv
  #:program-uniform-3ui64-nv #:program-uniform-4ui64-nv
  #:program-uniform-1ui64v-nv #:program-uniform-2ui64v-nv
  #:program-uniform-3ui64v-nv #:program-uniform-4ui64v-nv
  #:vertex-attrib-parameter-i-amd #:multi-draw-arrays-indirect-amd
  #:multi-draw-elements-indirect-amd #:gen-names-amd
  #:delete-names-amd #:is-name-amd #:query-object-parameter-ui-amd
  #:get-perf-monitor-groups-amd #:get-perf-monitor-counters-amd
  #:get-perf-monitor-group-string-amd
  #:get-perf-monitor-counter-string-amd
  #:get-perf-monitor-counter-info-amd #:gen-perf-monitors-amd
  #:delete-perf-monitors-amd #:select-perf-monitor-counters-amd
  #:begin-perf-monitor-amd #:end-perf-monitor-amd
  #:get-perf-monitor-counter-data-amd #:set-multisample-fv-amd
  #:tex-storage-sparse-amd #:texture-storage-sparse-amd
  #:stencil-op-value-amd #:tessellation-factor-amd
  #:tessellation-mode-amd #:blit-framebuffer-angle
  #:renderbuffer-storage-multisample-angle
  #:draw-arrays-instanced-angle #:draw-elements-instanced-angle
  #:vertex-attrib-divisor-angle #:get-translated-shader-source-angle
  #:copy-texture-levels-apple #:element-pointer-apple
  #:draw-element-array-apple #:draw-range-element-array-apple
  #:multi-draw-element-array-apple
  #:multi-draw-range-element-array-apple #:gen-fences-apple
  #:delete-fences-apple #:set-fence-apple #:is-fence-apple
  #:test-fence-apple #:finish-fence-apple #:test-object-apple
  #:finish-object-apple #:buffer-parameter-i-apple
  #:flush-mapped-buffer-range-apple
  #:renderbuffer-storage-multisample-apple
  #:resolve-multisample-framebuffer-apple #:object-purgeable-apple
  #:object-unpurgeable-apple #:get-object-parameter-iv-apple
  #:fence-sync-apple #:is-sync-apple #:delete-sync-apple
  #:client-wait-sync-apple #:wait-sync-apple
  #:get-integer-64-v-apple #:get-sync-iv-apple #:texture-range-apple
  #:get-tex-parameter-pointer-v-apple #:bind-vertex-array-apple
  #:delete-vertex-arrays-apple #:gen-vertex-arrays-apple
  #:is-vertex-array-apple #:vertex-array-range-apple
  #:flush-vertex-array-range-apple #:vertex-array-parameter-i-apple
  #:enable-vertex-attrib-apple #:disable-vertex-attrib-apple
  #:is-vertex-attrib-enabled-apple #:map-vertex-attrib-1d-apple
  #:map-vertex-attrib-1f-apple #:map-vertex-attrib-2d-apple
  #:map-vertex-attrib-2f-apple #:primitive-bounding-box-arb
  #:get-texture-handle-arb #:get-texture-sampler-handle-arb
  #:make-texture-handle-resident-arb
  #:make-texture-handle-non-resident-arb #:get-image-handle-arb
  #:make-image-handle-resident-arb
  #:make-image-handle-non-resident-arb #:uniform-handle-ui64-arb
  #:uniform-handle-ui64v-arb #:program-uniform-handle-ui64-arb
  #:program-uniform-handle-ui64v-arb
  #:is-texture-handle-resident-arb #:is-image-handle-resident-arb
  #:vertex-attrib-l1ui64-arb #:vertex-attrib-l1ui64v-arb
  #:get-vertex-attrib-lui64v-arb #:create-sync-from-cl-event-arb
  #:clamp-color-arb #:dispatch-compute-group-size-arb
  #:debug-message-control-arb #:debug-message-insert-arb
  #:debug-message-callback-arb #:get-debug-message-log-arb
  #:draw-buffers-arb #:blend-equation-i-arb
  #:blend-equation-separate-i-arb #:blend-func-i-arb
  #:blend-func-separate-i-arb #:draw-arrays-instanced-arb
  #:draw-elements-instanced-arb #:program-string-arb
  #:bind-program-arb #:delete-programs-arb #:gen-programs-arb
  #:program-env-parameter-4d-arb #:program-env-parameter-4dv-arb
  #:program-env-parameter-4f-arb #:program-env-parameter-4fv-arb
  #:program-local-parameter-4d-arb #:program-local-parameter-4dv-arb
  #:program-local-parameter-4f-arb #:program-local-parameter-4fv-arb
  #:get-program-env-parameter-dv-arb
  #:get-program-env-parameter-fv-arb
  #:get-program-local-parameter-dv-arb
  #:get-program-local-parameter-fv-arb #:get-program-iv-arb
  #:get-program-string-arb #:is-program-arb
  #:program-parameter-i-arb #:framebuffer-texture-arb
  #:framebuffer-texture-layer-arb #:framebuffer-texture-face-arb
  #:specialize-shader-arb #:uniform-1i64-arb #:uniform-2i64-arb
  #:uniform-3i64-arb #:uniform-4i64-arb #:uniform-1i64v-arb
  #:uniform-2i64v-arb #:uniform-3i64v-arb #:uniform-4i64v-arb
  #:uniform-1ui64-arb #:uniform-2ui64-arb #:uniform-3ui64-arb
  #:uniform-4ui64-arb #:uniform-1ui64v-arb #:uniform-2ui64v-arb
  #:uniform-3ui64v-arb #:uniform-4ui64v-arb #:get-uniform-i64v-arb
  #:get-uniform-ui64v-arb #:getn-uniform-i64v-arb
  #:getn-uniform-ui64v-arb #:program-uniform-1i64-arb
  #:program-uniform-2i64-arb #:program-uniform-3i64-arb
  #:program-uniform-4i64-arb #:program-uniform-1i64v-arb
  #:program-uniform-2i64v-arb #:program-uniform-3i64v-arb
  #:program-uniform-4i64v-arb #:program-uniform-1ui64-arb
  #:program-uniform-2ui64-arb #:program-uniform-3ui64-arb
  #:program-uniform-4ui64-arb #:program-uniform-1ui64v-arb
  #:program-uniform-2ui64v-arb #:program-uniform-3ui64v-arb
  #:program-uniform-4ui64v-arb #:color-table
  #:color-table-parameter-fv #:color-table-parameter-iv
  #:copy-color-table #:get-color-table
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
  #:multi-draw-arrays-indirect-count-arb
  #:multi-draw-elements-indirect-count-arb
  #:vertex-attrib-divisor-arb #:current-palette-matrix-arb
  #:matrix-index-ubv-arb #:matrix-index-usv-arb
  #:matrix-index-uiv-arb #:matrix-index-pointer-arb
  #:sample-coverage-arb #:active-texture-arb
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
  #:multi-tex-coord-4sv-arb #:gen-queries-arb #:delete-queries-arb
  #:is-query-arb #:begin-query-arb #:end-query-arb
  #:get-query-iv-arb #:get-query-object-iv-arb
  #:get-query-object-uiv-arb #:max-shader-compiler-threads-arb
  #:point-parameter-f-arb #:point-parameter-fv-arb
  #:get-graphics-reset-status-arb #:getn-tex-image-arb
  #:readn-pixels-arb #:getn-compressed-tex-image-arb
  #:getn-uniform-fv-arb #:getn-uniform-iv-arb #:getn-uniform-uiv-arb
  #:getn-uniform-dv-arb #:getn-map-dv-arb #:getn-map-fv-arb
  #:getn-map-iv-arb #:getn-pixel-map-fv-arb #:getn-pixel-map-uiv-arb
  #:getn-pixel-map-usv-arb #:getn-polygon-stipple-arb
  #:getn-color-table-arb #:getn-convolution-filter-arb
  #:getn-separable-filter-arb #:getn-histogram-arb #:getn-minmax-arb
  #:framebuffer-sample-locations-fv-arb
  #:named-framebuffer-sample-locations-fv-arb
  #:evaluate-depth-values-arb #:min-sample-shading-arb
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
  #:named-string-arb #:delete-named-string-arb
  #:compile-shader-include-arb #:is-named-string-arb
  #:get-named-string-arb #:get-named-string-iv-arb
  #:buffer-page-commitment-arb #:named-buffer-page-commitment-ext
  #:named-buffer-page-commitment-arb #:tex-page-commitment-arb
  #:tex-buffer-arb #:compressed-tex-image-3d-arb
  #:compressed-tex-image-2d-arb #:compressed-tex-image-1d-arb
  #:compressed-tex-sub-image-3d-arb
  #:compressed-tex-sub-image-2d-arb
  #:compressed-tex-sub-image-1d-arb #:get-compressed-tex-image-arb
  #:load-transpose-matrix-f-arb #:load-transpose-matrix-d-arb
  #:mult-transpose-matrix-f-arb #:mult-transpose-matrix-d-arb
  #:weight-bv-arb #:weight-sv-arb #:weight-iv-arb #:weight-fv-arb
  #:weight-dv-arb #:weight-ubv-arb #:weight-usv-arb #:weight-uiv-arb
  #:weight-pointer-arb #:vertex-blend-arb #:bind-buffer-arb
  #:delete-buffers-arb #:gen-buffers-arb #:is-buffer-arb
  #:buffer-data-arb #:buffer-sub-data-arb #:get-buffer-sub-data-arb
  #:map-buffer-arb #:unmap-buffer-arb #:get-buffer-parameter-iv-arb
  #:get-buffer-pointer-v-arb #:vertex-attrib-1d-arb
  #:vertex-attrib-1dv-arb #:vertex-attrib-1f-arb
  #:vertex-attrib-1fv-arb #:vertex-attrib-1s-arb
  #:vertex-attrib-1sv-arb #:vertex-attrib-2d-arb
  #:vertex-attrib-2dv-arb #:vertex-attrib-2f-arb
  #:vertex-attrib-2fv-arb #:vertex-attrib-2s-arb
  #:vertex-attrib-2sv-arb #:vertex-attrib-3d-arb
  #:vertex-attrib-3dv-arb #:vertex-attrib-3f-arb
  #:vertex-attrib-3fv-arb #:vertex-attrib-3s-arb
  #:vertex-attrib-3sv-arb #:vertex-attrib-4nbv-arb
  #:vertex-attrib-4niv-arb #:vertex-attrib-4nsv-arb
  #:vertex-attrib-4nub-arb #:vertex-attrib-4nubv-arb
  #:vertex-attrib-4nuiv-arb #:vertex-attrib-4nusv-arb
  #:vertex-attrib-4bv-arb #:vertex-attrib-4d-arb
  #:vertex-attrib-4dv-arb #:vertex-attrib-4f-arb
  #:vertex-attrib-4fv-arb #:vertex-attrib-4iv-arb
  #:vertex-attrib-4s-arb #:vertex-attrib-4sv-arb
  #:vertex-attrib-4ubv-arb #:vertex-attrib-4uiv-arb
  #:vertex-attrib-4usv-arb #:vertex-attrib-pointer-arb
  #:enable-vertex-attrib-array-arb #:disable-vertex-attrib-array-arb
  #:get-vertex-attrib-dv-arb #:get-vertex-attrib-fv-arb
  #:get-vertex-attrib-iv-arb #:get-vertex-attrib-pointer-v-arb
  #:bind-attrib-location-arb #:get-active-attrib-arb
  #:get-attrib-location-arb #:window-pos-2d-arb #:window-pos-2dv-arb
  #:window-pos-2f-arb #:window-pos-2fv-arb #:window-pos-2i-arb
  #:window-pos-2iv-arb #:window-pos-2s-arb #:window-pos-2sv-arb
  #:window-pos-3d-arb #:window-pos-3dv-arb #:window-pos-3f-arb
  #:window-pos-3fv-arb #:window-pos-3i-arb #:window-pos-3iv-arb
  #:window-pos-3s-arb #:window-pos-3sv-arb #:draw-buffers-ati
  #:element-pointer-ati #:draw-element-array-ati
  #:draw-range-element-array-ati #:tex-bump-parameter-iv-ati
  #:tex-bump-parameter-fv-ati #:get-tex-bump-parameter-iv-ati
  #:get-tex-bump-parameter-fv-ati #:gen-fragment-shaders-ati
  #:bind-fragment-shader-ati #:delete-fragment-shader-ati
  #:begin-fragment-shader-ati #:end-fragment-shader-ati
  #:pass-tex-coord-ati #:sample-map-ati #:color-fragment-op-1-ati
  #:color-fragment-op-2-ati #:color-fragment-op-3-ati
  #:alpha-fragment-op-1-ati #:alpha-fragment-op-2-ati
  #:alpha-fragment-op-3-ati #:set-fragment-shader-constant-ati
  #:map-object-buffer-ati #:unmap-object-buffer-ati
  #:pntriangles-i-ati #:pntriangles-f-ati #:stencil-op-separate-ati
  #:stencil-func-separate-ati #:new-object-buffer-ati
  #:is-object-buffer-ati #:update-object-buffer-ati
  #:get-object-buffer-fv-ati #:get-object-buffer-iv-ati
  #:free-object-buffer-ati #:array-object-ati
  #:get-array-object-fv-ati #:get-array-object-iv-ati
  #:variant-array-object-ati #:get-variant-array-object-fv-ati
  #:get-variant-array-object-iv-ati #:vertex-attrib-array-object-ati
  #:get-vertex-attrib-array-object-fv-ati
  #:get-vertex-attrib-array-object-iv-ati #:vertex-stream-1s-ati
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
  #:draw-arrays-instanced-base-instance-ext
  #:draw-elements-instanced-base-instance-ext
  #:draw-elements-instanced-base-vertex-base-instance-ext
  #:uniform-buffer-ext #:get-uniform-buffer-size-ext
  #:get-uniform-offset-ext #:blend-color-ext
  #:blend-equation-separate-ext
  #:bind-frag-data-location-indexed-ext
  #:bind-frag-data-location-ext
  #:get-program-resource-location-index-ext
  #:get-frag-data-index-ext #:blend-func-separate-ext
  #:blend-equation-ext #:buffer-storage-ext #:clear-tex-image-ext
  #:clear-tex-sub-image-ext #:clip-control-ext #:color-sub-table-ext
  #:copy-color-sub-table-ext #:lock-arrays-ext #:unlock-arrays-ext
  #:convolution-filter-1d-ext #:convolution-filter-2d-ext
  #:convolution-parameter-f-ext #:convolution-parameter-fv-ext
  #:convolution-parameter-i-ext #:convolution-parameter-iv-ext
  #:copy-convolution-filter-1d-ext #:copy-convolution-filter-2d-ext
  #:get-convolution-filter-ext #:get-convolution-parameter-fv-ext
  #:get-convolution-parameter-iv-ext #:get-separable-filter-ext
  #:separable-filter-2d-ext #:tangent-3b-ext #:tangent-3bv-ext
  #:tangent-3d-ext #:tangent-3dv-ext #:tangent-3f-ext
  #:tangent-3fv-ext #:tangent-3i-ext #:tangent-3iv-ext
  #:tangent-3s-ext #:tangent-3sv-ext #:binormal-3b-ext
  #:binormal-3bv-ext #:binormal-3d-ext #:binormal-3dv-ext
  #:binormal-3f-ext #:binormal-3fv-ext #:binormal-3i-ext
  #:binormal-3iv-ext #:binormal-3s-ext #:binormal-3sv-ext
  #:tangent-pointer-ext #:binormal-pointer-ext
  #:copy-image-sub-data-ext #:copy-tex-image-1d-ext
  #:copy-tex-image-2d-ext #:copy-tex-sub-image-1d-ext
  #:copy-tex-sub-image-2d-ext #:copy-tex-sub-image-3d-ext
  #:cull-parameter-dv-ext #:cull-parameter-fv-ext #:label-object-ext
  #:get-object-label-ext #:insert-event-marker-ext
  #:push-group-marker-ext #:pop-group-marker-ext #:depth-bounds-ext
  #:matrix-load-f-ext #:matrix-load-d-ext #:matrix-mult-f-ext
  #:matrix-mult-d-ext #:matrix-load-identity-ext
  #:matrix-rotate-f-ext #:matrix-rotate-d-ext #:matrix-scale-f-ext
  #:matrix-scale-d-ext #:matrix-translate-f-ext
  #:matrix-translate-d-ext #:matrix-frustum-ext #:matrix-ortho-ext
  #:matrix-pop-ext #:matrix-push-ext #:client-attrib-default-ext
  #:push-client-attrib-default-ext #:texture-parameter-f-ext
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
  #:bind-multi-texture-ext #:multi-tex-coord-pointer-ext
  #:multi-tex-env-f-ext #:multi-tex-env-fv-ext #:multi-tex-env-i-ext
  #:multi-tex-env-iv-ext #:multi-tex-gen-d-ext
  #:multi-tex-gen-dv-ext #:multi-tex-gen-f-ext
  #:multi-tex-gen-fv-ext #:multi-tex-gen-i-ext
  #:multi-tex-gen-iv-ext #:get-multi-tex-env-fv-ext
  #:get-multi-tex-env-iv-ext #:get-multi-tex-gen-dv-ext
  #:get-multi-tex-gen-fv-ext #:get-multi-tex-gen-iv-ext
  #:multi-tex-parameter-i-ext #:multi-tex-parameter-iv-ext
  #:multi-tex-parameter-f-ext #:multi-tex-parameter-fv-ext
  #:multi-tex-image-1d-ext #:multi-tex-image-2d-ext
  #:multi-tex-sub-image-1d-ext #:multi-tex-sub-image-2d-ext
  #:copy-multi-tex-image-1d-ext #:copy-multi-tex-image-2d-ext
  #:copy-multi-tex-sub-image-1d-ext
  #:copy-multi-tex-sub-image-2d-ext #:get-multi-tex-image-ext
  #:get-multi-tex-parameter-fv-ext #:get-multi-tex-parameter-iv-ext
  #:get-multi-tex-level-parameter-fv-ext
  #:get-multi-tex-level-parameter-iv-ext #:multi-tex-image-3d-ext
  #:multi-tex-sub-image-3d-ext #:copy-multi-tex-sub-image-3d-ext
  #:enable-client-state-indexed-ext
  #:disable-client-state-indexed-ext #:get-float-indexed-v-ext
  #:get-double-indexed-v-ext #:get-pointer-indexed-v-ext
  #:enable-indexed-ext #:disable-indexed-ext
  #:is-enabled-indexed-ext #:get-integer-indexed-v-ext
  #:get-boolean-indexed-v-ext #:compressed-texture-image-3d-ext
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
  #:get-compressed-multi-tex-image-ext #:matrix-load-transpose-f-ext
  #:matrix-load-transpose-d-ext #:matrix-mult-transpose-f-ext
  #:matrix-mult-transpose-d-ext #:named-buffer-data-ext
  #:named-buffer-sub-data-ext #:map-named-buffer-ext
  #:unmap-named-buffer-ext #:get-named-buffer-parameter-iv-ext
  #:get-named-buffer-pointer-v-ext #:get-named-buffer-sub-data-ext
  #:program-uniform-1f-ext #:program-uniform-2f-ext
  #:program-uniform-3f-ext #:program-uniform-4f-ext
  #:program-uniform-1i-ext #:program-uniform-2i-ext
  #:program-uniform-3i-ext #:program-uniform-4i-ext
  #:program-uniform-1fv-ext #:program-uniform-2fv-ext
  #:program-uniform-3fv-ext #:program-uniform-4fv-ext
  #:program-uniform-1iv-ext #:program-uniform-2iv-ext
  #:program-uniform-3iv-ext #:program-uniform-4iv-ext
  #:program-uniform-matrix-2fv-ext #:program-uniform-matrix-3fv-ext
  #:program-uniform-matrix-4fv-ext
  #:program-uniform-matrix-2x3-fv-ext
  #:program-uniform-matrix-3x2-fv-ext
  #:program-uniform-matrix-2x4-fv-ext
  #:program-uniform-matrix-4x2-fv-ext
  #:program-uniform-matrix-3x4-fv-ext
  #:program-uniform-matrix-4x3-fv-ext #:texture-buffer-ext
  #:multi-tex-buffer-ext #:texture-parameter-iiv-ext
  #:texture-parameter-iuiv-ext #:get-texture-parameter-iiv-ext
  #:get-texture-parameter-iuiv-ext #:multi-tex-parameter-iiv-ext
  #:multi-tex-parameter-iuiv-ext #:get-multi-tex-parameter-iiv-ext
  #:get-multi-tex-parameter-iuiv-ext #:program-uniform-1ui-ext
  #:program-uniform-2ui-ext #:program-uniform-3ui-ext
  #:program-uniform-4ui-ext #:program-uniform-1uiv-ext
  #:program-uniform-2uiv-ext #:program-uniform-3uiv-ext
  #:program-uniform-4uiv-ext
  #:named-program-local-parameters-4fv-ext
  #:named-program-local-parameter-i4i-ext
  #:named-program-local-parameter-i4iv-ext
  #:named-program-local-parameters-i4iv-ext
  #:named-program-local-parameter-i4ui-ext
  #:named-program-local-parameter-i4uiv-ext
  #:named-program-local-parameters-i4uiv-ext
  #:get-named-program-local-parameter-iiv-ext
  #:get-named-program-local-parameter-iuiv-ext
  #:enable-client-state-i-ext #:disable-client-state-i-ext
  #:get-float-i-v-ext #:get-double-i-v-ext #:get-pointer-i-v-ext
  #:named-program-string-ext #:named-program-local-parameter-4d-ext
  #:named-program-local-parameter-4dv-ext
  #:named-program-local-parameter-4f-ext
  #:named-program-local-parameter-4fv-ext
  #:get-named-program-local-parameter-dv-ext
  #:get-named-program-local-parameter-fv-ext
  #:get-named-program-iv-ext #:get-named-program-string-ext
  #:named-renderbuffer-storage-ext
  #:get-named-renderbuffer-parameter-iv-ext
  #:named-renderbuffer-storage-multisample-ext
  #:named-renderbuffer-storage-multisample-coverage-ext
  #:check-named-framebuffer-status-ext
  #:named-framebuffer-texture-1d-ext
  #:named-framebuffer-texture-2d-ext
  #:named-framebuffer-texture-3d-ext
  #:named-framebuffer-renderbuffer-ext
  #:get-named-framebuffer-attachment-parameter-iv-ext
  #:generate-texture-mipmap-ext #:generate-multi-tex-mipmap-ext
  #:framebuffer-draw-buffer-ext #:framebuffer-draw-buffers-ext
  #:framebuffer-read-buffer-ext #:get-framebuffer-parameter-iv-ext
  #:named-copy-buffer-sub-data-ext #:named-framebuffer-texture-ext
  #:named-framebuffer-texture-layer-ext
  #:named-framebuffer-texture-face-ext #:texture-renderbuffer-ext
  #:multi-tex-renderbuffer-ext #:vertex-array-vertex-offset-ext
  #:vertex-array-color-offset-ext
  #:vertex-array-edge-flag-offset-ext
  #:vertex-array-index-offset-ext #:vertex-array-normal-offset-ext
  #:vertex-array-tex-coord-offset-ext
  #:vertex-array-multi-tex-coord-offset-ext
  #:vertex-array-fog-coord-offset-ext
  #:vertex-array-secondary-color-offset-ext
  #:vertex-array-vertex-attrib-offset-ext
  #:vertex-array-vertex-attrib-i-offset-ext
  #:enable-vertex-array-ext #:disable-vertex-array-ext
  #:enable-vertex-array-attrib-ext #:disable-vertex-array-attrib-ext
  #:get-vertex-array-integer-v-ext #:get-vertex-array-pointer-v-ext
  #:get-vertex-array-integer-i-v-ext
  #:get-vertex-array-pointer-i-v-ext #:map-named-buffer-range-ext
  #:flush-mapped-named-buffer-range-ext #:named-buffer-storage-ext
  #:clear-named-buffer-data-ext #:clear-named-buffer-sub-data-ext
  #:named-framebuffer-parameter-i-ext
  #:get-named-framebuffer-parameter-iv-ext #:program-uniform-1d-ext
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
  #:program-uniform-matrix-4x3-dv-ext #:texture-buffer-range-ext
  #:texture-storage-1d-ext #:texture-storage-2d-ext
  #:texture-storage-3d-ext #:texture-storage-2d-multisample-ext
  #:texture-storage-3d-multisample-ext
  #:vertex-array-bind-vertex-buffer-ext
  #:vertex-array-vertex-attrib-format-ext
  #:vertex-array-vertex-attrib-i-format-ext
  #:vertex-array-vertex-attrib-l-format-ext
  #:vertex-array-vertex-attrib-binding-ext
  #:vertex-array-vertex-binding-divisor-ext
  #:vertex-array-vertex-attrib-loffset-ext
  #:texture-page-commitment-ext
  #:vertex-array-vertex-attrib-divisor-ext #:discard-framebuffer-ext
  #:gen-queries-ext #:delete-queries-ext #:is-query-ext
  #:begin-query-ext #:end-query-ext #:query-counter-ext
  #:get-query-iv-ext #:get-query-object-iv-ext
  #:get-query-object-uiv-ext #:get-query-object-i64v-ext
  #:get-query-object-ui64v-ext #:draw-buffers-ext
  #:color-mask-indexed-ext #:enable-i-ext #:disable-i-ext
  #:blend-equation-i-ext #:blend-equation-separate-i-ext
  #:blend-func-i-ext #:blend-func-separate-i-ext #:color-mask-i-ext
  #:is-enabled-i-ext #:draw-elements-base-vertex-ext
  #:draw-range-elements-base-vertex-ext
  #:draw-elements-instanced-base-vertex-ext
  #:multi-draw-elements-base-vertex-ext #:draw-arrays-instanced-ext
  #:draw-elements-instanced-ext #:draw-range-elements-ext
  #:draw-transform-feedback-ext
  #:draw-transform-feedback-instanced-ext
  #:buffer-storage-external-ext #:named-buffer-storage-external-ext
  #:fog-coord-f-ext #:fog-coord-fv-ext #:fog-coord-d-ext
  #:fog-coord-dv-ext #:fog-coord-pointer-ext #:blit-framebuffer-ext
  #:renderbuffer-storage-multisample-ext #:is-renderbuffer-ext
  #:bind-renderbuffer-ext #:delete-renderbuffers-ext
  #:gen-renderbuffers-ext #:renderbuffer-storage-ext
  #:get-renderbuffer-parameter-iv-ext #:is-framebuffer-ext
  #:bind-framebuffer-ext #:delete-framebuffers-ext
  #:gen-framebuffers-ext #:check-framebuffer-status-ext
  #:framebuffer-texture-1d-ext #:framebuffer-texture-2d-ext
  #:framebuffer-texture-3d-ext #:framebuffer-renderbuffer-ext
  #:get-framebuffer-attachment-parameter-iv-ext
  #:generate-mipmap-ext #:framebuffer-texture-ext
  #:program-parameter-i-ext #:program-env-parameters-4fv-ext
  #:program-local-parameters-4fv-ext #:get-uniform-uiv-ext
  #:get-frag-data-location-ext #:uniform-1ui-ext #:uniform-2ui-ext
  #:uniform-3ui-ext #:uniform-4ui-ext #:uniform-1uiv-ext
  #:uniform-2uiv-ext #:uniform-3uiv-ext #:uniform-4uiv-ext
  #:get-histogram-ext #:get-histogram-parameter-fv-ext
  #:get-histogram-parameter-iv-ext #:get-minmax-ext
  #:get-minmax-parameter-fv-ext #:get-minmax-parameter-iv-ext
  #:histogram-ext #:minmax-ext #:reset-histogram-ext
  #:reset-minmax-ext #:index-func-ext #:index-material-ext
  #:vertex-attrib-divisor-ext #:apply-texture-ext
  #:texture-light-ext #:texture-material-ext #:map-buffer-range-ext
  #:flush-mapped-buffer-range-ext #:get-unsigned-byte-v-ext
  #:get-unsigned-byte-i-v-ext #:delete-memory-objects-ext
  #:is-memory-object-ext #:create-memory-objects-ext
  #:memory-object-parameter-iv-ext
  #:get-memory-object-parameter-iv-ext #:tex-storage-mem-2d-ext
  #:tex-storage-mem-2d-multisample-ext #:tex-storage-mem-3d-ext
  #:tex-storage-mem-3d-multisample-ext #:buffer-storage-mem-ext
  #:texture-storage-mem-2d-ext
  #:texture-storage-mem-2d-multisample-ext
  #:texture-storage-mem-3d-ext
  #:texture-storage-mem-3d-multisample-ext
  #:named-buffer-storage-mem-ext #:tex-storage-mem-1d-ext
  #:texture-storage-mem-1d-ext #:import-memory-fd-ext
  #:import-memory-win32-handle-ext #:import-memory-win32-name-ext
  #:multi-draw-arrays-ext #:multi-draw-elements-ext
  #:multi-draw-arrays-indirect-ext
  #:multi-draw-elements-indirect-ext #:sample-mask-ext
  #:sample-pattern-ext #:framebuffer-texture-2d-multisample-ext
  #:read-buffer-indexed-ext #:draw-buffers-indexed-ext
  #:get-integer-i-v-ext #:color-table-ext #:get-color-table-ext
  #:get-color-table-parameter-iv-ext
  #:get-color-table-parameter-fv-ext
  #:pixel-transform-parameter-i-ext
  #:pixel-transform-parameter-f-ext
  #:pixel-transform-parameter-iv-ext
  #:pixel-transform-parameter-fv-ext
  #:get-pixel-transform-parameter-iv-ext
  #:get-pixel-transform-parameter-fv-ext #:point-parameter-f-ext
  #:point-parameter-fv-ext #:polygon-offset-ext
  #:polygon-offset-clamp-ext #:primitive-bounding-box-ext
  #:provoking-vertex-ext #:raster-samples-ext
  #:get-graphics-reset-status-ext #:readn-pixels-ext
  #:getn-uniformfv-ext #:getn-uniformiv-ext #:gen-semaphores-ext
  #:delete-semaphores-ext #:is-semaphore-ext
  #:semaphore-parameter-ui64v-ext
  #:get-semaphore-parameter-ui64v-ext #:wait-semaphore-ext
  #:signal-semaphore-ext #:import-semaphore-fd-ext
  #:import-semaphore-win32-handle-ext
  #:import-semaphore-win32-name-ext #:secondary-color-3b-ext
  #:secondary-color-3bv-ext #:secondary-color-3d-ext
  #:secondary-color-3dv-ext #:secondary-color-3f-ext
  #:secondary-color-3fv-ext #:secondary-color-3i-ext
  #:secondary-color-3iv-ext #:secondary-color-3s-ext
  #:secondary-color-3sv-ext #:secondary-color-3ub-ext
  #:secondary-color-3ubv-ext #:secondary-color-3ui-ext
  #:secondary-color-3uiv-ext #:secondary-color-3us-ext
  #:secondary-color-3usv-ext #:secondary-color-pointer-ext
  #:use-shader-program-ext #:active-program-ext
  #:create-shader-program-ext #:active-shader-program-ext
  #:bind-program-pipeline-ext #:create-shader-programv-ext
  #:delete-program-pipelines-ext #:gen-program-pipelines-ext
  #:get-program-pipeline-info-log-ext #:get-program-pipeline-iv-ext
  #:is-program-pipeline-ext #:use-program-stages-ext
  #:validate-program-pipeline-ext #:bind-image-texture-ext
  #:memory-barrier-ext #:framebuffer-pixel-local-storage-size-ext
  #:get-framebuffer-pixel-local-storage-size-ext
  #:clear-pixel-local-storage-ui-ext #:tex-page-commitment-ext
  #:stencil-clear-tag-ext #:active-stencil-face-ext
  #:tex-sub-image-1d-ext #:tex-sub-image-2d-ext
  #:patch-parameter-i-ext #:tex-image-3d-ext #:tex-sub-image-3d-ext
  #:framebuffer-texture-layer-ext #:tex-parameter-iiv-ext
  #:tex-parameter-iuiv-ext #:get-tex-parameter-iiv-ext
  #:get-tex-parameter-iuiv-ext #:sampler-parameter-iiv-ext
  #:sampler-parameter-iuiv-ext #:get-sampler-parameter-iiv-ext
  #:get-sampler-parameter-iuiv-ext #:tex-buffer-ext
  #:tex-buffer-range-ext #:clear-color-ii-ext #:clear-color-iui-ext
  #:are-textures-resident-ext #:bind-texture-ext
  #:delete-textures-ext #:gen-textures-ext #:is-texture-ext
  #:prioritize-textures-ext #:texture-normal-ext
  #:tex-storage-1d-ext #:tex-storage-2d-ext #:tex-storage-3d-ext
  #:texture-view-ext #:begin-transform-feedback-ext
  #:end-transform-feedback-ext #:bind-buffer-range-ext
  #:bind-buffer-offset-ext #:bind-buffer-base-ext
  #:transform-feedback-varyings-ext
  #:get-transform-feedback-varying-ext #:array-element-ext
  #:color-pointer-ext #:draw-arrays-ext #:edge-flag-pointer-ext
  #:get-pointer-v-ext #:index-pointer-ext #:normal-pointer-ext
  #:tex-coord-pointer-ext #:vertex-pointer-ext
  #:vertex-attrib-l1d-ext #:vertex-attrib-l2d-ext
  #:vertex-attrib-l3d-ext #:vertex-attrib-l4d-ext
  #:vertex-attrib-l1dv-ext #:vertex-attrib-l2dv-ext
  #:vertex-attrib-l3dv-ext #:vertex-attrib-l4dv-ext
  #:vertex-attrib-lpointer-ext #:get-vertex-attrib-ldv-ext
  #:begin-vertex-shader-ext #:end-vertex-shader-ext
  #:bind-vertex-shader-ext #:gen-vertex-shaders-ext
  #:delete-vertex-shader-ext #:shader-op-1-ext #:shader-op-2-ext
  #:shader-op-3-ext #:swizzle-ext #:write-mask-ext
  #:insert-component-ext #:extract-component-ext #:gen-symbols-ext
  #:set-invariant-ext #:set-local-constant-ext #:variant-bv-ext
  #:variant-sv-ext #:variant-iv-ext #:variant-fv-ext
  #:variant-dv-ext #:variant-ubv-ext #:variant-usv-ext
  #:variant-uiv-ext #:variant-pointer-ext
  #:enable-variant-client-state-ext
  #:disable-variant-client-state-ext #:bind-light-parameter-ext
  #:bind-material-parameter-ext #:bind-tex-gen-parameter-ext
  #:bind-texture-unit-parameter-ext #:bind-parameter-ext
  #:is-variant-enabled-ext #:get-variant-boolean-v-ext
  #:get-variant-integer-v-ext #:get-variant-float-v-ext
  #:get-variant-pointer-v-ext #:get-invariant-boolean-v-ext
  #:get-invariant-integer-v-ext #:get-invariant-float-v-ext
  #:get-local-constant-boolean-v-ext
  #:get-local-constant-integer-v-ext
  #:get-local-constant-float-v-ext #:vertex-weight-f-ext
  #:vertex-weight-fv-ext #:vertex-weight-pointer-ext
  #:acquire-keyed-mutex-win32-ext #:release-keyed-mutex-win32-ext
  #:window-rectangles-ext #:import-sync-ext
  #:frame-terminator-gremedy #:string-marker-gremedy
  #:image-transform-parameter-i-hp #:image-transform-parameter-f-hp
  #:image-transform-parameter-iv-hp
  #:image-transform-parameter-fv-hp
  #:get-image-transform-parameter-iv-hp
  #:get-image-transform-parameter-fv-hp #:multi-mode-draw-arrays-ibm
  #:multi-mode-draw-elements-ibm #:flush-static-data-ibm
  #:color-pointer-list-ibm #:secondary-color-pointer-list-ibm
  #:edge-flag-pointer-list-ibm #:fog-coord-pointer-list-ibm
  #:index-pointer-list-ibm #:normal-pointer-list-ibm
  #:tex-coord-pointer-list-ibm #:vertex-pointer-list-ibm
  #:get-texture-handle-img #:get-texture-sampler-handle-img
  #:uniform-handleui64img #:uniform-handleui64v-img
  #:program-uniform-handleui64img #:program-uniform-handleui64v-img
  #:framebuffer-texture-2d-downsample-img
  #:framebuffer-texture-layer-downsample-img
  #:renderbuffer-storage-multisample-img
  #:framebuffer-texture-2d-multisample-img #:clip-plane-f-img
  #:clip-plane-x-img #:blend-func-separate-ingr
  #:apply-framebuffer-attachment-cmaa-intel #:sync-texture-intel
  #:unmap-texture-2d-intel #:map-texture-2d-intel
  #:vertex-pointer-v-intel #:normal-pointer-v-intel
  #:color-pointer-v-intel #:tex-coord-pointer-v-intel
  #:begin-perf-query-intel #:create-perf-query-intel
  #:delete-perf-query-intel #:end-perf-query-intel
  #:get-first-perf-query-id-intel #:get-next-perf-query-id-intel
  #:get-perf-counter-info-intel #:get-perf-query-data-intel
  #:get-perf-query-id-by-name-intel #:get-perf-query-info-intel
  #:blend-barrier-khr #:debug-message-control-khr
  #:debug-message-insert-khr #:debug-message-callback-khr
  #:get-debug-message-log-khr #:push-debug-group-khr
  #:pop-debug-group-khr #:object-label-khr #:get-object-label-khr
  #:object-ptr-label-khr #:get-object-ptr-label-khr
  #:get-pointer-v-khr #:get-graphics-reset-status-khr
  #:readn-pixels-khr #:getn-uniform-fv-khr #:getn-uniform-iv-khr
  #:getn-uniform-uiv-khr #:max-shader-compiler-threads-khr
  #:resize-buffers-mesa #:window-pos-2d-mesa #:window-pos-2dv-mesa
  #:window-pos-2f-mesa #:window-pos-2fv-mesa #:window-pos-2i-mesa
  #:window-pos-2iv-mesa #:window-pos-2s-mesa #:window-pos-2sv-mesa
  #:window-pos-3d-mesa #:window-pos-3dv-mesa #:window-pos-3f-mesa
  #:window-pos-3fv-mesa #:window-pos-3i-mesa #:window-pos-3iv-mesa
  #:window-pos-3s-mesa #:window-pos-3sv-mesa #:window-pos-4d-mesa
  #:window-pos-4dv-mesa #:window-pos-4f-mesa #:window-pos-4fv-mesa
  #:window-pos-4i-mesa #:window-pos-4iv-mesa #:window-pos-4s-mesa
  #:window-pos-4sv-mesa #:begin-conditional-render-nvx
  #:end-conditional-render-nvx #:lgpu-named-buffer-sub-data-nvx
  #:lgpu-copy-image-sub-data-nvx #:lgpu-interlock-nvx
  #:alpha-to-coverage-dither-control-nv
  #:multi-draw-arrays-indirect-bindless-nv
  #:multi-draw-elements-indirect-bindless-nv
  #:multi-draw-arrays-indirect-bindless-count-nv
  #:multi-draw-elements-indirect-bindless-count-nv
  #:get-texture-handle-nv #:get-texture-sampler-handle-nv
  #:make-texture-handle-resident-nv
  #:make-texture-handle-non-resident-nv #:get-image-handle-nv
  #:make-image-handle-resident-nv
  #:make-image-handle-non-resident-nv #:uniform-handle-ui64-nv
  #:uniform-handle-ui64v-nv #:program-uniform-handle-ui64-nv
  #:program-uniform-handle-ui64v-nv #:is-texture-handle-resident-nv
  #:is-image-handle-resident-nv #:blend-parameter-i-nv
  #:blend-barrier-nv #:viewport-position-w-scale-nv
  #:create-states-nv #:delete-states-nv #:is-state-nv
  #:state-capture-nv #:get-command-header-nv #:get-stage-index-nv
  #:draw-commands-nv #:draw-commands-address-nv
  #:draw-commands-states-nv #:draw-commands-states-address-nv
  #:create-command-lists-nv #:delete-command-lists-nv
  #:is-command-list-nv #:list-draw-commands-states-client-nv
  #:command-list-segments-nv #:compile-command-list-nv
  #:call-command-list-nv #:begin-conditional-render-nv
  #:end-conditional-render-nv #:subpixel-precision-bias-nv
  #:conservative-raster-parameter-f-nv
  #:conservative-raster-parameter-i-nv #:copy-buffer-sub-data-nv
  #:copy-image-sub-data-nv #:coverage-mask-nv
  #:coverage-operation-nv #:depth-range-d-nv #:clear-depth-d-nv
  #:depth-bounds-d-nv #:draw-buffers-nv #:draw-arrays-instanced-nv
  #:draw-elements-instanced-nv #:draw-texture-nv #:draw-vk-image-nv
  #:get-vk-proc-addr-nv #:wait-vk-semaphore-nv
  #:signal-vk-semaphore-nv #:signal-vk-fence-nv
  #:map-control-points-nv #:map-parameter-iv-nv
  #:map-parameter-fv-nv #:get-map-control-points-nv
  #:get-map-parameter-iv-nv #:get-map-parameter-fv-nv
  #:get-map-attrib-parameter-iv-nv #:get-map-attrib-parameter-fv-nv
  #:eval-maps-nv #:get-multisample-fv-nv #:sample-mask-indexed-nv
  #:tex-renderbuffer-nv #:delete-fences-nv #:gen-fences-nv
  #:is-fence-nv #:test-fence-nv #:get-fence-iv-nv #:finish-fence-nv
  #:set-fence-nv #:fragment-coverage-color-nv
  #:program-named-parameter-4f-nv #:program-named-parameter-4fv-nv
  #:program-named-parameter-4d-nv #:program-named-parameter-4dv-nv
  #:get-program-named-parameter-fv-nv
  #:get-program-named-parameter-dv-nv #:blit-framebuffer-nv
  #:coverage-modulation-table-nv #:get-coverage-modulation-table-nv
  #:coverage-modulation-nv #:renderbuffer-storage-multisample-nv
  #:renderbuffer-storage-multisample-coverage-nv
  #:program-vertex-limit-nv #:framebuffer-texture-face-ext
  #:program-local-parameter-i4i-nv #:program-local-parameter-i4iv-nv
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
  #:get-program-env-parameter-iuiv-nv
  #:program-subroutine-parameters-uiv-nv
  #:get-program-subroutine-parameter-uiv-nv #:vertex-2h-nv
  #:vertex-2hv-nv #:vertex-3h-nv #:vertex-3hv-nv #:vertex-4h-nv
  #:vertex-4hv-nv #:normal-3h-nv #:normal-3hv-nv #:color-3h-nv
  #:color-3hv-nv #:color-4h-nv #:color-4hv-nv #:tex-coord-1h-nv
  #:tex-coord-1hv-nv #:tex-coord-2h-nv #:tex-coord-2hv-nv
  #:tex-coord-3h-nv #:tex-coord-3hv-nv #:tex-coord-4h-nv
  #:tex-coord-4hv-nv #:multi-tex-coord-1h-nv
  #:multi-tex-coord-1hv-nv #:multi-tex-coord-2h-nv
  #:multi-tex-coord-2hv-nv #:multi-tex-coord-3h-nv
  #:multi-tex-coord-3hv-nv #:multi-tex-coord-4h-nv
  #:multi-tex-coord-4hv-nv #:fog-coord-h-nv #:fog-coord-hv-nv
  #:secondary-color-3h-nv #:secondary-color-3hv-nv
  #:vertex-weight-h-nv #:vertex-weight-hv-nv #:vertex-attrib-1h-nv
  #:vertex-attrib-1hv-nv #:vertex-attrib-2h-nv
  #:vertex-attrib-2hv-nv #:vertex-attrib-3h-nv
  #:vertex-attrib-3hv-nv #:vertex-attrib-4h-nv
  #:vertex-attrib-4hv-nv #:vertex-attribs-1hv-nv
  #:vertex-attribs-2hv-nv #:vertex-attribs-3hv-nv
  #:vertex-attribs-4hv-nv #:vertex-attrib-divisor-nv
  #:get-internal-format-sample-iv-nv #:render-gpu-mask-nv
  #:multicast-buffer-sub-data-nv #:multicast-copy-buffer-sub-data-nv
  #:multicast-copy-image-sub-data-nv #:multicast-blit-framebuffer-nv
  #:multicast-framebuffer-sample-locations-fv-nv
  #:multicast-barrier-nv #:multicast-wait-sync-nv
  #:multicast-get-query-object-iv-nv
  #:multicast-get-query-object-uiv-nv
  #:multicast-get-query-object-i64v-nv
  #:multicast-get-query-object-ui64v-nv #:uniform-matrix-2x3-fv-nv
  #:uniform-matrix-3x2-fv-nv #:uniform-matrix-2x4-fv-nv
  #:uniform-matrix-4x2-fv-nv #:uniform-matrix-3x4-fv-nv
  #:uniform-matrix-4x3-fv-nv #:gen-occlusion-queries-nv
  #:delete-occlusion-queries-nv #:is-occlusion-query-nv
  #:begin-occlusion-query-nv #:end-occlusion-query-nv
  #:get-occlusion-query-iv-nv #:get-occlusion-query-uiv-nv
  #:program-buffer-parameters-fv-nv
  #:program-buffer-parameters-iiv-nv
  #:program-buffer-parameters-iuiv-nv #:gen-paths-nv
  #:delete-paths-nv #:is-path-nv #:path-commands-nv #:path-coords-nv
  #:path-sub-commands-nv #:path-sub-coords-nv #:path-string-nv
  #:path-glyphs-nv #:path-glyph-range-nv #:weight-paths-nv
  #:copy-path-nv #:interpolate-paths-nv #:transform-path-nv
  #:path-parameter-iv-nv #:path-parameter-i-nv
  #:path-parameter-fv-nv #:path-parameter-f-nv #:path-dash-array-nv
  #:path-stencil-func-nv #:path-stencil-depth-offset-nv
  #:stencil-fill-path-nv #:stencil-stroke-path-nv
  #:stencil-fill-path-instanced-nv
  #:stencil-stroke-path-instanced-nv #:path-cover-depth-func-nv
  #:cover-fill-path-nv #:cover-stroke-path-nv
  #:cover-fill-path-instanced-nv #:cover-stroke-path-instanced-nv
  #:get-path-parameter-iv-nv #:get-path-parameter-fv-nv
  #:get-path-commands-nv #:get-path-coords-nv
  #:get-path-dash-array-nv #:get-path-metrics-nv
  #:get-path-metric-range-nv #:get-path-spacing-nv
  #:is-point-in-fill-path-nv #:is-point-in-stroke-path-nv
  #:get-path-length-nv #:point-along-path-nv #:matrix-load-3x2-f-nv
  #:matrix-load-3x3-f-nv #:matrix-load-transpose-3x3-f-nv
  #:matrix-mult-3x2-f-nv #:matrix-mult-3x3-f-nv
  #:matrix-mult-transpose-3x3-f-nv #:stencil-then-cover-fill-path-nv
  #:stencil-then-cover-stroke-path-nv
  #:stencil-then-cover-fill-path-instanced-nv
  #:stencil-then-cover-stroke-path-instanced-nv
  #:path-glyph-index-range-nv #:path-glyph-index-array-nv
  #:path-memory-glyph-index-array-nv
  #:program-path-fragment-input-gen-nv #:get-program-resource-fv-nv
  #:path-color-gen-nv #:path-tex-gen-nv #:path-fog-gen-nv
  #:get-path-color-gen-iv-nv #:get-path-color-gen-fv-nv
  #:get-path-tex-gen-iv-nv #:get-path-tex-gen-fv-nv
  #:pixel-data-range-nv #:flush-pixel-data-range-nv
  #:point-parameter-i-nv #:point-parameter-iv-nv #:polygon-mode-nv
  #:present-frame-keyed-nv #:present-frame-dual-fill-nv
  #:get-video-iv-nv #:get-video-uiv-nv #:get-video-i64v-nv
  #:get-video-ui64v-nv #:primitive-restart-nv
  #:primitive-restart-index-nv #:query-resource-nv
  #:gen-query-resource-tag-nv #:delete-query-resource-tag-nv
  #:query-resource-tag-nv #:read-buffer-nv
  #:combiner-parameter-fv-nv #:combiner-parameter-f-nv
  #:combiner-parameter-iv-nv #:combiner-parameter-i-nv
  #:combiner-input-nv #:combiner-output-nv #:final-combiner-input-nv
  #:get-combiner-input-parameter-fv-nv
  #:get-combiner-input-parameter-iv-nv
  #:get-combiner-output-parameter-fv-nv
  #:get-combiner-output-parameter-iv-nv
  #:get-final-combiner-input-parameter-fv-nv
  #:get-final-combiner-input-parameter-iv-nv
  #:combiner-stage-parameter-fv-nv
  #:get-combiner-stage-parameter-fv-nv
  #:framebuffer-sample-locations-fv-nv
  #:named-framebuffer-sample-locations-fv-nv
  #:resolve-depth-values-nv #:make-buffer-resident-nv
  #:make-buffer-non-resident-nv #:is-buffer-resident-nv
  #:make-named-buffer-resident-nv
  #:make-named-buffer-non-resident-nv #:is-named-buffer-resident-nv
  #:get-buffer-parameter-ui64v-nv
  #:get-named-buffer-parameter-ui64v-nv #:get-integer-ui64v-nv
  #:uniform-ui64-nv #:uniform-ui64v-nv #:program-uniform-ui64-nv
  #:program-uniform-ui64v-nv #:texture-barrier-nv
  #:tex-image-2d-multisample-coverage-nv
  #:tex-image-3d-multisample-coverage-nv
  #:texture-image-2d-multisample-nv
  #:texture-image-3d-multisample-nv
  #:texture-image-2d-multisample-coverage-nv
  #:texture-image-3d-multisample-coverage-nv
  #:begin-transform-feedback-nv #:end-transform-feedback-nv
  #:transform-feedback-attribs-nv #:bind-buffer-range-nv
  #:bind-buffer-offset-nv #:bind-buffer-base-nv
  #:transform-feedback-varyings-nv #:active-varying-nv
  #:get-varying-location-nv #:get-active-varying-nv
  #:get-transform-feedback-varying-nv
  #:transform-feedback-stream-attribs-nv
  #:bind-transform-feedback-nv #:delete-transform-feedbacks-nv
  #:gen-transform-feedbacks-nv #:is-transform-feedback-nv
  #:pause-transform-feedback-nv #:resume-transform-feedback-nv
  #:draw-transform-feedback-nv #:vdpau-init-nv #:vdpau-fini-nv
  #:vdpau-register-video-surface-nv
  #:vdpau-register-output-surface-nv #:vdpau-is-surface-nv
  #:vdpau-unregister-surface-nv #:vdpau-get-surface-iv-nv
  #:vdpau-surface-access-nv #:vdpau-map-surfaces-nv
  #:vdpau-unmap-surfaces-nv #:flush-vertex-array-range-nv
  #:vertex-array-range-nv #:vertex-attrib-l1i64-nv
  #:vertex-attrib-l2i64-nv #:vertex-attrib-l3i64-nv
  #:vertex-attrib-l4i64-nv #:vertex-attrib-l1i64v-nv
  #:vertex-attrib-l2i64v-nv #:vertex-attrib-l3i64v-nv
  #:vertex-attrib-l4i64v-nv #:vertex-attrib-l1ui64-nv
  #:vertex-attrib-l2ui64-nv #:vertex-attrib-l3ui64-nv
  #:vertex-attrib-l4ui64-nv #:vertex-attrib-l1ui64v-nv
  #:vertex-attrib-l2ui64v-nv #:vertex-attrib-l3ui64v-nv
  #:vertex-attrib-l4ui64v-nv #:get-vertex-attrib-li64v-nv
  #:get-vertex-attrib-lui64v-nv #:vertex-attrib-l-format-nv
  #:buffer-address-range-nv #:vertex-format-nv #:normal-format-nv
  #:color-format-nv #:index-format-nv #:tex-coord-format-nv
  #:edge-flag-format-nv #:secondary-color-format-nv
  #:fog-coord-format-nv #:vertex-attrib-format-nv
  #:vertex-attrib-i-format-nv #:get-integer-ui64i-v-nv
  #:are-programs-resident-nv #:bind-program-nv #:delete-programs-nv
  #:execute-program-nv #:gen-programs-nv
  #:get-program-parameter-dv-nv #:get-program-parameter-fv-nv
  #:get-program-iv-nv #:get-program-string-nv
  #:get-track-matrix-iv-nv #:get-vertex-attrib-dv-nv
  #:get-vertex-attrib-fv-nv #:get-vertex-attrib-iv-nv
  #:get-vertex-attrib-pointer-v-nv #:is-program-nv #:load-program-nv
  #:program-parameter-4d-nv #:program-parameter-4dv-nv
  #:program-parameter-4f-nv #:program-parameter-4fv-nv
  #:program-parameters-4dv-nv #:program-parameters-4fv-nv
  #:request-resident-programs-nv #:track-matrix-nv
  #:vertex-attrib-pointer-nv #:vertex-attrib-1d-nv
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
  #:get-vertex-attrib-iuiv-ext #:begin-video-capture-nv
  #:bind-video-capture-stream-buffer-nv
  #:bind-video-capture-stream-texture-nv #:end-video-capture-nv
  #:get-video-capture-iv-nv #:get-video-capture-stream-iv-nv
  #:get-video-capture-stream-fv-nv #:get-video-capture-stream-dv-nv
  #:video-capture-nv #:video-capture-stream-parameter-iv-nv
  #:video-capture-stream-parameter-fv-nv
  #:video-capture-stream-parameter-dv-nv #:viewport-array-v-nv
  #:viewport-indexed-f-nv #:viewport-indexed-fv-nv
  #:scissor-array-v-nv #:scissor-indexed-nv #:scissor-indexed-v-nv
  #:depth-range-array-fv-nv #:depth-range-indexed-f-nv
  #:get-float-i-v-nv #:enable-i-nv #:disable-i-nv #:is-enabled-i-nv
  #:viewport-swizzle-nv #:egl-image-target-texture-2d-oes
  #:egl-image-target-renderbuffer-storage-oes
  #:blend-equation-separate-oes #:blend-func-separate-oes
  #:blend-equation-oes #:multi-tex-coord-1b-oes
  #:multi-tex-coord-1bv-oes #:multi-tex-coord-2b-oes
  #:multi-tex-coord-2bv-oes #:multi-tex-coord-3b-oes
  #:multi-tex-coord-3bv-oes #:multi-tex-coord-4b-oes
  #:multi-tex-coord-4bv-oes #:tex-coord-1b-oes #:tex-coord-1bv-oes
  #:tex-coord-2b-oes #:tex-coord-2bv-oes #:tex-coord-3b-oes
  #:tex-coord-3bv-oes #:tex-coord-4b-oes #:tex-coord-4bv-oes
  #:vertex-2b-oes #:vertex-2bv-oes #:vertex-3b-oes #:vertex-3bv-oes
  #:vertex-4b-oes #:vertex-4bv-oes #:copy-image-sub-data-oes
  #:enable-i-oes #:disable-i-oes #:blend-equation-i-oes
  #:blend-equation-separate-i-oes #:blend-func-i-oes
  #:blend-func-separate-i-oes #:color-mask-i-oes #:is-enabled-i-oes
  #:draw-elements-base-vertex-oes
  #:draw-range-elements-base-vertex-oes
  #:draw-elements-instanced-base-vertex-oes #:draw-tex-s-oes
  #:draw-tex-i-oes #:draw-tex-x-oes #:draw-tex-sv-oes
  #:draw-tex-iv-oes #:draw-tex-xv-oes #:draw-tex-f-oes
  #:draw-tex-fv-oes #:alpha-func-x-oes #:clear-color-x-oes
  #:clear-depth-x-oes #:clip-plane-x-oes #:color-4x-oes
  #:depth-range-x-oes #:fog-x-oes #:fog-xv-oes #:frustum-x-oes
  #:get-clip-plane-x-oes #:get-fixed-v-oes #:get-tex-env-xv-oes
  #:get-tex-parameter-xv-oes #:light-model-x-oes
  #:light-model-xv-oes #:light-x-oes #:light-xv-oes
  #:line-width-x-oes #:load-matrix-x-oes #:material-x-oes
  #:material-xv-oes #:mult-matrix-x-oes #:multi-tex-coord-4x-oes
  #:normal-3x-oes #:ortho-x-oes #:point-parameter-xv-oes
  #:point-size-x-oes #:polygon-offset-x-oes #:rotate-x-oes
  #:scale-x-oes #:tex-env-x-oes #:tex-env-xv-oes
  #:tex-parameter-x-oes #:tex-parameter-xv-oes #:translate-x-oes
  #:get-light-xv-oes #:get-material-xv-oes #:point-parameter-x-oes
  #:sample-coverage-x-oes #:accum-x-oes #:bitmap-x-oes
  #:blend-color-x-oes #:clear-accum-x-oes #:color-3x-oes
  #:color-3xv-oes #:color-4xv-oes #:convolution-parameter-x-oes
  #:convolution-parameter-xv-oes #:eval-coord-1x-oes
  #:eval-coord-1xv-oes #:eval-coord-2x-oes #:eval-coord-2xv-oes
  #:feedback-buffer-x-oes #:get-convolution-parameter-xv-oes
  #:get-histogram-parameter-xv-oes #:get-light-x-oes
  #:get-map-xv-oes #:get-material-x-oes #:get-pixel-map-xv
  #:get-tex-gen-xv-oes #:get-tex-level-parameter-xv-oes
  #:index-x-oes #:index-xv-oes #:load-transpose-matrix-x-oes
  #:map-1x-oes #:map-2x-oes #:map-grid-1x-oes #:map-grid-2x-oes
  #:mult-transpose-matrix-x-oes #:multi-tex-coord-1x-oes
  #:multi-tex-coord-1xv-oes #:multi-tex-coord-2x-oes
  #:multi-tex-coord-2xv-oes #:multi-tex-coord-3x-oes
  #:multi-tex-coord-3xv-oes #:multi-tex-coord-4xv-oes
  #:normal-3xv-oes #:pass-through-x-oes #:pixel-map-x
  #:pixel-store-x #:pixel-transfer-x-oes #:pixel-zoom-x-oes
  #:prioritize-textures-x-oes #:raster-pos-2x-oes
  #:raster-pos-2xv-oes #:raster-pos-3x-oes #:raster-pos-3xv-oes
  #:raster-pos-4x-oes #:raster-pos-4xv-oes #:rect-x-oes
  #:rect-xv-oes #:tex-coord-1x-oes #:tex-coord-1xv-oes
  #:tex-coord-2x-oes #:tex-coord-2xv-oes #:tex-coord-3x-oes
  #:tex-coord-3xv-oes #:tex-coord-4x-oes #:tex-coord-4xv-oes
  #:tex-gen-x-oes #:tex-gen-xv-oes #:vertex-2x-oes #:vertex-2xv-oes
  #:vertex-3x-oes #:vertex-3xv-oes #:vertex-4x-oes #:vertex-4xv-oes
  #:is-renderbuffer-oes #:bind-renderbuffer-oes
  #:delete-renderbuffers-oes #:gen-renderbuffers-oes
  #:renderbuffer-storage-oes #:get-renderbuffer-parameter-iv-oes
  #:is-framebuffer-oes #:bind-framebuffer-oes
  #:delete-framebuffers-oes #:gen-framebuffers-oes
  #:check-framebuffer-status-oes #:framebuffer-renderbuffer-oes
  #:framebuffer-texture-2d-oes
  #:get-framebuffer-attachment-parameter-iv-oes
  #:generate-mipmap-oes #:framebuffer-texture-oes
  #:get-program-binary-oes #:program-binary-oes #:map-buffer-oes
  #:unmap-buffer-oes #:get-buffer-pointer-v-oes
  #:current-palette-matrix-oes
  #:load-palette-from-model-view-matrix-oes
  #:matrix-index-pointer-oes #:weight-pointer-oes
  #:point-size-pointer-oes #:primitive-bounding-box-oes
  #:query-matrix-x-oes #:min-sample-shading-oes #:clear-depth-f-oes
  #:clip-plane-f-oes #:depth-range-f-oes #:frustum-f-oes
  #:get-clip-plane-f-oes #:ortho-f-oes #:patch-parameter-i-oes
  #:tex-image-3d-oes #:tex-sub-image-3d-oes
  #:copy-tex-sub-image-3d-oes #:compressed-tex-image-3d-oes
  #:compressed-tex-sub-image-3d-oes #:framebuffer-texture-3d-oes
  #:tex-parameter-iiv-oes #:tex-parameter-iuiv-oes
  #:get-tex-parameter-iiv-oes #:get-tex-parameter-iuiv-oes
  #:sampler-parameter-iiv-oes #:sampler-parameter-iuiv-oes
  #:get-sampler-parameter-iiv-oes #:get-sampler-parameter-iuiv-oes
  #:tex-buffer-oes #:tex-buffer-range-oes #:tex-gen-f-oes
  #:tex-gen-fv-oes #:tex-gen-i-oes #:tex-gen-iv-oes
  #:get-tex-gen-fv-oes #:get-tex-gen-iv-oes
  #:tex-storage-3d-multisample-oes #:texture-view-oes
  #:bind-vertex-array-oes #:delete-vertex-arrays-oes
  #:gen-vertex-arrays-oes #:is-vertex-array-oes
  #:viewport-array-v-oes #:viewport-indexed-f-oes
  #:viewport-indexed-fv-oes #:scissor-array-v-oes
  #:scissor-indexed-oes #:scissor-indexed-v-oes
  #:depth-range-array-fv-oes #:depth-range-indexed-f-oes
  #:get-float-i-v-oes #:framebuffer-texture-multiview-ovr
  #:framebuffer-texture-multisample-multiview-ovr #:hint-pgi
  #:alpha-func-qcom #:get-driver-controls-qcom
  #:get-driver-control-string-qcom #:enable-driver-control-qcom
  #:disable-driver-control-qcom #:ext-get-textures-qcom
  #:ext-get-buffers-qcom #:ext-get-renderbuffers-qcom
  #:ext-get-framebuffers-qcom #:ext-get-tex-level-parameter-iv-qcom
  #:ext-tex-object-state-override-i-qcom
  #:ext-get-tex-sub-image-qcom #:ext-get-buffer-pointer-v-qcom
  #:ext-get-shaders-qcom #:ext-get-programs-qcom
  #:ext-is-program-binary-qcom #:ext-get-program-binary-source-qcom
  #:framebuffer-foveation-config-qcom
  #:framebuffer-foveation-parameters-qcom
  #:framebuffer-fetch-barrier-qcom #:start-tiling-qcom
  #:end-tiling-qcom #:detail-tex-func-sgis
  #:get-detail-tex-func-sgis #:fog-func-sgis #:get-fog-func-sgis
  #:sample-mask-sgis #:sample-pattern-sgis
  #:pixel-tex-gen-parameter-i-sgis #:pixel-tex-gen-parameter-iv-sgis
  #:pixel-tex-gen-parameter-f-sgis #:pixel-tex-gen-parameter-fv-sgis
  #:get-pixel-tex-gen-parameter-iv-sgis
  #:get-pixel-tex-gen-parameter-fv-sgis #:point-parameter-f-sgis
  #:point-parameter-fv-sgis #:sharpen-tex-func-sgis
  #:get-sharpen-tex-func-sgis #:tex-image-4d-sgis
  #:tex-sub-image-4d-sgis #:texture-color-mask-sgis
  #:get-tex-filter-func-sgis #:tex-filter-func-sgis
  #:async-marker-sgix #:finish-async-sgix #:poll-async-sgix
  #:gen-async-markers-sgix #:delete-async-markers-sgix
  #:is-async-marker-sgix #:flush-raster-sgix
  #:fragment-color-material-sgix #:fragment-light-f-sgix
  #:fragment-light-fv-sgix #:fragment-light-i-sgix
  #:fragment-light-iv-sgix #:fragment-light-model-f-sgix
  #:fragment-light-model-fv-sgix #:fragment-light-model-i-sgix
  #:fragment-light-model-iv-sgix #:fragment-material-f-sgix
  #:fragment-material-fv-sgix #:fragment-material-i-sgix
  #:fragment-material-iv-sgix #:get-fragment-light-fv-sgix
  #:get-fragment-light-iv-sgix #:get-fragment-material-fv-sgix
  #:get-fragment-material-iv-sgix #:light-env-i-sgix
  #:frame-zoom-sgix #:igloo-interface-sgix #:get-instruments-sgix
  #:instruments-buffer-sgix #:poll-instruments-sgix
  #:read-instruments-sgix #:start-instruments-sgix
  #:stop-instruments-sgix #:get-list-parameter-fv-sgix
  #:get-list-parameter-iv-sgix #:list-parameter-f-sgix
  #:list-parameter-fv-sgix #:list-parameter-i-sgix
  #:list-parameter-iv-sgix #:pixel-tex-gen-sgix
  #:deformation-map-3d-sgix #:deformation-map-3f-sgix #:deform-sgix
  #:load-identity-deformation-map-sgix #:reference-plane-sgix
  #:sprite-parameter-f-sgix #:sprite-parameter-fv-sgix
  #:sprite-parameter-i-sgix #:sprite-parameter-iv-sgix
  #:tag-sample-buffer-sgix #:color-table-sgi
  #:color-table-parameter-fv-sgi #:color-table-parameter-iv-sgi
  #:copy-color-table-sgi #:get-color-table-sgi
  #:get-color-table-parameter-fv-sgi
  #:get-color-table-parameter-iv-sgi #:finish-texture-sunx
  #:global-alpha-factor-b-sun #:global-alpha-factor-s-sun
  #:global-alpha-factor-i-sun #:global-alpha-factor-f-sun
  #:global-alpha-factor-d-sun #:global-alpha-factor-ub-sun
  #:global-alpha-factor-us-sun #:global-alpha-factor-ui-sun
  #:draw-mesh-arrays-sun #:replacement-code-ui-sun
  #:replacement-code-us-sun #:replacement-code-ub-sun
  #:replacement-code-uiv-sun #:replacement-code-usv-sun
  #:replacement-code-ubv-sun #:replacement-code-pointer-sun
  #:color-4ub-vertex-2f-sun #:color-4ub-vertex-2fv-sun
  #:color-4ub-vertex-3f-sun #:color-4ub-vertex-3fv-sun
  #:color-3f-vertex-3f-sun #:color-3f-vertex-3fv-sun
  #:normal-3f-vertex-3f-sun #:normal-3f-vertex-3fv-sun
  #:color-4f-normal-3f-vertex-3f-sun
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
  #:replacement-code-ui-tex-coord-2f-color-4f-normal-3f-vertex-3fv-sun))

