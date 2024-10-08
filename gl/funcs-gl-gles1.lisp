;;; this file is automatically generated, do not edit
;;; generated from files with the following copyright:
;;;
;;; Copyright 2013-2020 The Khronos Group Inc.
;;; SPDX-License-Identifier: Apache-2.0

(in-package #:cl-opengl-bindings)

;;; generated 2024-08-16T20:46:56Z
;;; from gl.xml @ git sha 4f845dc97972c72cad684cc22c7bf96e6d5319a6, 2024-08-15T14:04:09Z

(defglfun ("glPointSize" point-size 3071) :void
  (size float))

(defglfun ("glLogicOp" logic-op 3072) :void
  (opcode enum))

(defglfun ("glColor4f" color-4f 3073) :void
  (red float)
  (green float)
  (blue float)
  (alpha float))

(defglfun ("glColor4ub" color-4ub 3074) :void
  (red ubyte)
  (green ubyte)
  (blue ubyte)
  (alpha ubyte))

(defglfun ("glNormal3f" normal-3f 3075) :void
  (nx float)
  (ny float)
  (nz float))

(defglfun ("glFogf" fog-f 3076) :void
  (pname enum)
  (param float))

(defglfun ("glFogfv" fog-fv 3077) :void
  (pname enum)
  (params (:pointer float)))

(defglfun ("glLightf" light-f 3078) :void
  (light enum)
  (pname enum)
  (param float))

(defglfun ("glLightfv" light-fv 3079) :void
  (light enum)
  (pname enum)
  (params (:pointer float)))

(defglfun ("glLightModelf" light-model-f 3080) :void
  (pname enum)
  (param float))

(defglfun ("glLightModelfv" light-model-fv 3081) :void
  (pname enum)
  (params (:pointer float)))

(defglfun ("glMaterialf" material-f 3082) :void
  (face enum)
  (pname enum)
  (param float))

(defglfun ("glMaterialfv" material-fv 3083) :void
  (face enum)
  (pname enum)
  (params (:pointer float)))

(defglfun ("glShadeModel" shade-model 3084) :void
  (mode enum))

(defglfun ("glTexEnvf" tex-env-f 3085) :void
  (target enum)
  (pname enum)
  (param float))

(defglfun ("glTexEnvfv" tex-env-fv 3086) :void
  (target enum)
  (pname enum)
  (params (:pointer float)))

(defglfun ("glTexEnvi" tex-env-i 3087) :void
  (target enum)
  (pname enum)
  (param int))

(defglfun ("glTexEnviv" tex-env-iv 3088) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

(defglfun ("glAlphaFunc" alpha-func 3089) :void
  (func enum)
  (ref float))

(defglfun ("glGetLightfv" get-light-fv 3090) :void
  (light enum)
  (pname enum)
  (params (:pointer float)))

(defglfun ("glGetMaterialfv" get-material-fv 3091) :void
  (face enum)
  (pname enum)
  (params (:pointer float)))

(defglfun ("glGetTexEnvfv" get-tex-env-fv 3092) :void
  (target enum)
  (pname enum)
  (params (:pointer float)))

(defglfun ("glGetTexEnviv" get-tex-env-iv 3093) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

(defglfun ("glLoadIdentity" load-identity 3094) :void)

(defglfun ("glLoadMatrixf" load-matrix-f 3095) :void
  (m (:pointer float)))

(defglfun ("glMatrixMode" matrix-mode 3096) :void
  (mode enum))

(defglfun ("glMultMatrixf" mult-matrix-f 3097) :void
  (m (:pointer float)))

(defglfun ("glPopMatrix" pop-matrix 3098) :void)

(defglfun ("glPushMatrix" push-matrix 3099) :void)

(defglfun ("glRotatef" rotate-f 3100) :void
  (angle float)
  (x float)
  (y float)
  (z float))

(defglfun ("glScalef" scale-f 3101) :void
  (x float)
  (y float)
  (z float))

(defglfun ("glTranslatef" translate-f 3102) :void
  (x float)
  (y float)
  (z float))

(defglfun ("glColorPointer" color-pointer 3103) :void
  (size int)
  (type enum)
  (stride sizei)
  (pointer offset-or-pointer))

(defglfun ("glDisableClientState" disable-client-state 3104) :void
  (array enum))

(defglfun ("glEnableClientState" enable-client-state 3105) :void
  (array enum))

(defglfun ("glNormalPointer" normal-pointer 3106) :void
  (type enum)
  (stride sizei)
  (pointer offset-or-pointer))

(defglfun ("glTexCoordPointer" tex-coord-pointer 3107) :void
  (size int)
  (type enum)
  (stride sizei)
  (pointer offset-or-pointer))

(defglfun ("glVertexPointer" vertex-pointer 3108) :void
  (size int)
  (type enum)
  (stride sizei)
  (pointer offset-or-pointer))

(defglextfun ("glClientActiveTexture" client-active-texture 3109) :void
  (texture enum))

(defglextfun ("glMultiTexCoord4f" multi-tex-coord-4f 3110) :void
  (target enum)
  (s float)
  (tee float)
  (r float)
  (q float))

(defglextfun ("glPointParameterf" point-parameter-f 3111) :void
  (pname enum)
  (param float))

(defglextfun ("glPointParameterfv" point-parameter-fv 3112) :void
  (pname enum)
  (params (:pointer float)))

(defglextfun ("glMultiTexCoord1bOES" multi-tex-coord-1b-oes 3113) :void
  (texture enum)
  (s byte))

(defglextfun ("glMultiTexCoord1bvOES" multi-tex-coord-1bv-oes 3114) :void
  (texture enum)
  (coords (:pointer byte)))

(defglextfun ("glMultiTexCoord2bOES" multi-tex-coord-2b-oes 3115) :void
  (texture enum)
  (s byte)
  (tee byte))

(defglextfun ("glMultiTexCoord2bvOES" multi-tex-coord-2bv-oes 3116) :void
  (texture enum)
  (coords (:pointer byte)))

(defglextfun ("glMultiTexCoord3bOES" multi-tex-coord-3b-oes 3117) :void
  (texture enum)
  (s byte)
  (tee byte)
  (r byte))

(defglextfun ("glMultiTexCoord3bvOES" multi-tex-coord-3bv-oes 3118) :void
  (texture enum)
  (coords (:pointer byte)))

(defglextfun ("glMultiTexCoord4bOES" multi-tex-coord-4b-oes 3119) :void
  (texture enum)
  (s byte)
  (tee byte)
  (r byte)
  (q byte))

(defglextfun ("glMultiTexCoord4bvOES" multi-tex-coord-4bv-oes 3120) :void
  (texture enum)
  (coords (:pointer byte)))

(defglextfun ("glTexCoord1bOES" tex-coord-1b-oes 3121) :void
  (s byte))

(defglextfun ("glTexCoord1bvOES" tex-coord-1bv-oes 3122) :void
  (coords (:pointer byte)))

(defglextfun ("glTexCoord2bOES" tex-coord-2b-oes 3123) :void
  (s byte)
  (tee byte))

(defglextfun ("glTexCoord2bvOES" tex-coord-2bv-oes 3124) :void
  (coords (:pointer byte)))

(defglextfun ("glTexCoord3bOES" tex-coord-3b-oes 3125) :void
  (s byte)
  (tee byte)
  (r byte))

(defglextfun ("glTexCoord3bvOES" tex-coord-3bv-oes 3126) :void
  (coords (:pointer byte)))

(defglextfun ("glTexCoord4bOES" tex-coord-4b-oes 3127) :void
  (s byte)
  (tee byte)
  (r byte)
  (q byte))

(defglextfun ("glTexCoord4bvOES" tex-coord-4bv-oes 3128) :void
  (coords (:pointer byte)))

(defglextfun ("glVertex2bOES" vertex-2b-oes 3129) :void
  (x byte)
  (y byte))

(defglextfun ("glVertex2bvOES" vertex-2bv-oes 3130) :void
  (coords (:pointer byte)))

(defglextfun ("glVertex3bOES" vertex-3b-oes 3131) :void
  (x byte)
  (y byte)
  (z byte))

(defglextfun ("glVertex3bvOES" vertex-3bv-oes 3132) :void
  (coords (:pointer byte)))

(defglextfun ("glVertex4bOES" vertex-4b-oes 3133) :void
  (x byte)
  (y byte)
  (z byte)
  (w byte))

(defglextfun ("glVertex4bvOES" vertex-4bv-oes 3134) :void
  (coords (:pointer byte)))

(defglextfun ("glAlphaFuncxOES" alpha-func-x-oes 3135) :void
  (func enum)
  (ref fixed))

(defglextfun ("glClearColorxOES" clear-color-x-oes 3136) :void
  (red fixed)
  (green fixed)
  (blue fixed)
  (alpha fixed))

(defglextfun ("glClearDepthxOES" clear-depth-x-oes 3137) :void
  (depth fixed))

(defglextfun ("glClipPlanexOES" clip-plane-x-oes 3138) :void
  (plane enum)
  (equation (:pointer fixed)))

(defglextfun ("glColor4xOES" color-4x-oes 3139) :void
  (red fixed)
  (green fixed)
  (blue fixed)
  (alpha fixed))

(defglextfun ("glDepthRangexOES" depth-range-x-oes 3140) :void
  (n fixed)
  (f fixed))

(defglextfun ("glFogxOES" fog-x-oes 3141) :void
  (pname enum)
  (param fixed))

(defglextfun ("glFogxvOES" fog-xv-oes 3142) :void
  (pname enum)
  (param (:pointer fixed)))

(defglextfun ("glFrustumxOES" frustum-x-oes 3143) :void
  (l fixed)
  (r fixed)
  (b fixed)
  (tee fixed)
  (n fixed)
  (f fixed))

(defglextfun ("glGetClipPlanexOES" get-clip-plane-x-oes 3144) :void
  (plane enum)
  (equation (:pointer fixed)))

(defglextfun ("glGetFixedvOES" get-fixed-v-oes 3145) :void
  (pname enum)
  (params (:pointer fixed)))

(defglextfun ("glGetTexEnvxvOES" get-tex-env-xv-oes 3146) :void
  (target enum)
  (pname enum)
  (params (:pointer fixed)))

(defglextfun ("glGetTexParameterxvOES" get-tex-parameter-xv-oes 3147) :void
  (target enum)
  (pname enum)
  (params (:pointer fixed)))

(defglextfun ("glLightModelxOES" light-model-x-oes 3148) :void
  (pname enum)
  (param fixed))

(defglextfun ("glLightModelxvOES" light-model-xv-oes 3149) :void
  (pname enum)
  (param (:pointer fixed)))

(defglextfun ("glLightxOES" light-x-oes 3150) :void
  (light enum)
  (pname enum)
  (param fixed))

(defglextfun ("glLightxvOES" light-xv-oes 3151) :void
  (light enum)
  (pname enum)
  (params (:pointer fixed)))

(defglextfun ("glLineWidthxOES" line-width-x-oes 3152) :void
  (width fixed))

(defglextfun ("glLoadMatrixxOES" load-matrix-x-oes 3153) :void
  (m (:pointer fixed)))

(defglextfun ("glMaterialxOES" material-x-oes 3154) :void
  (face enum)
  (pname enum)
  (param fixed))

(defglextfun ("glMaterialxvOES" material-xv-oes 3155) :void
  (face enum)
  (pname enum)
  (param (:pointer fixed)))

(defglextfun ("glMultMatrixxOES" mult-matrix-x-oes 3156) :void
  (m (:pointer fixed)))

(defglextfun ("glMultiTexCoord4xOES" multi-tex-coord-4x-oes 3157) :void
  (texture enum)
  (s fixed)
  (tee fixed)
  (r fixed)
  (q fixed))

(defglextfun ("glNormal3xOES" normal-3x-oes 3158) :void
  (nx fixed)
  (ny fixed)
  (nz fixed))

(defglextfun ("glOrthoxOES" ortho-x-oes 3159) :void
  (l fixed)
  (r fixed)
  (b fixed)
  (tee fixed)
  (n fixed)
  (f fixed))

(defglextfun ("glPointParameterxvOES" point-parameter-xv-oes 3160) :void
  (pname enum)
  (params (:pointer fixed)))

(defglextfun ("glPointSizexOES" point-size-x-oes 3161) :void
  (size fixed))

(defglextfun ("glPolygonOffsetxOES" polygon-offset-x-oes 3162) :void
  (factor fixed)
  (units fixed))

(defglextfun ("glRotatexOES" rotate-x-oes 3163) :void
  (angle fixed)
  (x fixed)
  (y fixed)
  (z fixed))

(defglextfun ("glScalexOES" scale-x-oes 3164) :void
  (x fixed)
  (y fixed)
  (z fixed))

(defglextfun ("glTexEnvxOES" tex-env-x-oes 3165) :void
  (target enum)
  (pname enum)
  (param fixed))

(defglextfun ("glTexEnvxvOES" tex-env-xv-oes 3166) :void
  (target enum)
  (pname enum)
  (params (:pointer fixed)))

(defglextfun ("glTexParameterxOES" tex-parameter-x-oes 3167) :void
  (target enum)
  (pname enum)
  (param fixed))

(defglextfun ("glTexParameterxvOES" tex-parameter-xv-oes 3168) :void
  (target enum)
  (pname enum)
  (params (:pointer fixed)))

(defglextfun ("glTranslatexOES" translate-x-oes 3169) :void
  (x fixed)
  (y fixed)
  (z fixed))

(defglextfun ("glGetLightxvOES" get-light-xv-oes 3170) :void
  (light enum)
  (pname enum)
  (params (:pointer fixed)))

(defglextfun ("glGetMaterialxvOES" get-material-xv-oes 3171) :void
  (face enum)
  (pname enum)
  (params (:pointer fixed)))

(defglextfun ("glPointParameterxOES" point-parameter-x-oes 3172) :void
  (pname enum)
  (param fixed))

(defglextfun ("glSampleCoveragexOES" sample-coverage-x-oes 3173) :void
  (value clampx)
  (invert boolean))

(defglextfun ("glAccumxOES" accum-x-oes 3174) :void
  (op enum)
  (value fixed))

(defglextfun ("glBitmapxOES" bitmap-x-oes 3175) :void
  (width sizei)
  (height sizei)
  (xorig fixed)
  (yorig fixed)
  (xmove fixed)
  (ymove fixed)
  (bitmap (:pointer ubyte)))

(defglextfun ("glBlendColorxOES" blend-color-x-oes 3176) :void
  (red fixed)
  (green fixed)
  (blue fixed)
  (alpha fixed))

(defglextfun ("glClearAccumxOES" clear-accum-x-oes 3177) :void
  (red fixed)
  (green fixed)
  (blue fixed)
  (alpha fixed))

(defglextfun ("glColor3xOES" color-3x-oes 3178) :void
  (red fixed)
  (green fixed)
  (blue fixed))

(defglextfun ("glColor3xvOES" color-3xv-oes 3179) :void
  (components (:pointer fixed)))

(defglextfun ("glColor4xvOES" color-4xv-oes 3180) :void
  (components (:pointer fixed)))

(defglextfun ("glConvolutionParameterxOES" convolution-parameter-x-oes 3181) :void
  (target enum)
  (pname enum)
  (param fixed))

(defglextfun ("glConvolutionParameterxvOES" convolution-parameter-xv-oes 3182) :void
  (target enum)
  (pname enum)
  (params (:pointer fixed)))

(defglextfun ("glEvalCoord1xOES" eval-coord-1x-oes 3183) :void
  (u fixed))

(defglextfun ("glEvalCoord1xvOES" eval-coord-1xv-oes 3184) :void
  (coords (:pointer fixed)))

(defglextfun ("glEvalCoord2xOES" eval-coord-2x-oes 3185) :void
  (u fixed)
  (v fixed))

(defglextfun ("glEvalCoord2xvOES" eval-coord-2xv-oes 3186) :void
  (coords (:pointer fixed)))

(defglextfun ("glFeedbackBufferxOES" feedback-buffer-x-oes 3187) :void
  (n sizei)
  (type enum)
  (buffer (:pointer fixed)))

(defglextfun ("glGetConvolutionParameterxvOES" get-convolution-parameter-xv-oes 3188) :void
  (target enum)
  (pname enum)
  (params (:pointer fixed)))

(defglextfun ("glGetHistogramParameterxvOES" get-histogram-parameter-xv-oes 3189) :void
  (target enum)
  (pname enum)
  (params (:pointer fixed)))

(defglextfun ("glGetLightxOES" get-light-x-oes 3190) :void
  (light enum)
  (pname enum)
  (params (:pointer fixed)))

(defglextfun ("glGetMapxvOES" get-map-xv-oes 3191) :void
  (target enum)
  (query enum)
  (v (:pointer fixed)))

(defglextfun ("glGetMaterialxOES" get-material-x-oes 3192) :void
  (face enum)
  (pname enum)
  (param fixed))

(defglextfun ("glGetPixelMapxv" get-pixel-map-xv 3193) :void
  (map enum)
  (size int)
  (values (:pointer fixed)))

(defglextfun ("glGetTexGenxvOES" get-tex-gen-xv-oes 3194) :void
  (coord enum)
  (pname enum)
  (params (:pointer fixed)))

(defglextfun ("glGetTexLevelParameterxvOES" get-tex-level-parameter-xv-oes 3195) :void
  (target enum)
  (level int)
  (pname enum)
  (params (:pointer fixed)))

(defglextfun ("glIndexxOES" index-x-oes 3196) :void
  (component fixed))

(defglextfun ("glIndexxvOES" index-xv-oes 3197) :void
  (component (:pointer fixed)))

(defglextfun ("glLoadTransposeMatrixxOES" load-transpose-matrix-x-oes 3198) :void
  (m (:pointer fixed)))

(defglextfun ("glMap1xOES" map-1x-oes 3199) :void
  (target enum)
  (u1 fixed)
  (u2 fixed)
  (stride int)
  (order int)
  (points fixed))

(defglextfun ("glMap2xOES" map-2x-oes 3200) :void
  (target enum)
  (u1 fixed)
  (u2 fixed)
  (ustride int)
  (uorder int)
  (v1 fixed)
  (v2 fixed)
  (vstride int)
  (vorder int)
  (points fixed))

(defglextfun ("glMapGrid1xOES" map-grid-1x-oes 3201) :void
  (n int)
  (u1 fixed)
  (u2 fixed))

(defglextfun ("glMapGrid2xOES" map-grid-2x-oes 3202) :void
  (n int)
  (u1 fixed)
  (u2 fixed)
  (v1 fixed)
  (v2 fixed))

(defglextfun ("glMultTransposeMatrixxOES" mult-transpose-matrix-x-oes 3203) :void
  (m (:pointer fixed)))

(defglextfun ("glMultiTexCoord1xOES" multi-tex-coord-1x-oes 3204) :void
  (texture enum)
  (s fixed))

(defglextfun ("glMultiTexCoord1xvOES" multi-tex-coord-1xv-oes 3205) :void
  (texture enum)
  (coords (:pointer fixed)))

(defglextfun ("glMultiTexCoord2xOES" multi-tex-coord-2x-oes 3206) :void
  (texture enum)
  (s fixed)
  (tee fixed))

(defglextfun ("glMultiTexCoord2xvOES" multi-tex-coord-2xv-oes 3207) :void
  (texture enum)
  (coords (:pointer fixed)))

(defglextfun ("glMultiTexCoord3xOES" multi-tex-coord-3x-oes 3208) :void
  (texture enum)
  (s fixed)
  (tee fixed)
  (r fixed))

(defglextfun ("glMultiTexCoord3xvOES" multi-tex-coord-3xv-oes 3209) :void
  (texture enum)
  (coords (:pointer fixed)))

(defglextfun ("glMultiTexCoord4xvOES" multi-tex-coord-4xv-oes 3210) :void
  (texture enum)
  (coords (:pointer fixed)))

(defglextfun ("glNormal3xvOES" normal-3xv-oes 3211) :void
  (coords (:pointer fixed)))

(defglextfun ("glPassThroughxOES" pass-through-x-oes 3212) :void
  (token fixed))

(defglextfun ("glPixelMapx" pixel-map-x 3213) :void
  (map enum)
  (size int)
  (values (:pointer fixed)))

(defglextfun ("glPixelStorex" pixel-store-x 3214) :void
  (pname enum)
  (param fixed))

(defglextfun ("glPixelTransferxOES" pixel-transfer-x-oes 3215) :void
  (pname enum)
  (param fixed))

(defglextfun ("glPixelZoomxOES" pixel-zoom-x-oes 3216) :void
  (xfactor fixed)
  (yfactor fixed))

(defglextfun ("glPrioritizeTexturesxOES" prioritize-textures-x-oes 3217) :void
  (n sizei)
  (textures (:pointer uint))
  (priorities (:pointer fixed)))

(defglextfun ("glRasterPos2xOES" raster-pos-2x-oes 3218) :void
  (x fixed)
  (y fixed))

(defglextfun ("glRasterPos2xvOES" raster-pos-2xv-oes 3219) :void
  (coords (:pointer fixed)))

(defglextfun ("glRasterPos3xOES" raster-pos-3x-oes 3220) :void
  (x fixed)
  (y fixed)
  (z fixed))

(defglextfun ("glRasterPos3xvOES" raster-pos-3xv-oes 3221) :void
  (coords (:pointer fixed)))

(defglextfun ("glRasterPos4xOES" raster-pos-4x-oes 3222) :void
  (x fixed)
  (y fixed)
  (z fixed)
  (w fixed))

(defglextfun ("glRasterPos4xvOES" raster-pos-4xv-oes 3223) :void
  (coords (:pointer fixed)))

(defglextfun ("glRectxOES" rect-x-oes 3224) :void
  (x1 fixed)
  (y1 fixed)
  (x2 fixed)
  (y2 fixed))

(defglextfun ("glRectxvOES" rect-xv-oes 3225) :void
  (v1 (:pointer fixed))
  (v2 (:pointer fixed)))

(defglextfun ("glTexCoord1xOES" tex-coord-1x-oes 3226) :void
  (s fixed))

(defglextfun ("glTexCoord1xvOES" tex-coord-1xv-oes 3227) :void
  (coords (:pointer fixed)))

(defglextfun ("glTexCoord2xOES" tex-coord-2x-oes 3228) :void
  (s fixed)
  (tee fixed))

(defglextfun ("glTexCoord2xvOES" tex-coord-2xv-oes 3229) :void
  (coords (:pointer fixed)))

(defglextfun ("glTexCoord3xOES" tex-coord-3x-oes 3230) :void
  (s fixed)
  (tee fixed)
  (r fixed))

(defglextfun ("glTexCoord3xvOES" tex-coord-3xv-oes 3231) :void
  (coords (:pointer fixed)))

(defglextfun ("glTexCoord4xOES" tex-coord-4x-oes 3232) :void
  (s fixed)
  (tee fixed)
  (r fixed)
  (q fixed))

(defglextfun ("glTexCoord4xvOES" tex-coord-4xv-oes 3233) :void
  (coords (:pointer fixed)))

(defglextfun ("glTexGenxOES" tex-gen-x-oes 3234) :void
  (coord enum)
  (pname enum)
  (param fixed))

(defglextfun ("glTexGenxvOES" tex-gen-xv-oes 3235) :void
  (coord enum)
  (pname enum)
  (params (:pointer fixed)))

(defglextfun ("glVertex2xOES" vertex-2x-oes 3236) :void
  (x fixed))

(defglextfun ("glVertex2xvOES" vertex-2xv-oes 3237) :void
  (coords (:pointer fixed)))

(defglextfun ("glVertex3xOES" vertex-3x-oes 3238) :void
  (x fixed)
  (y fixed))

(defglextfun ("glVertex3xvOES" vertex-3xv-oes 3239) :void
  (coords (:pointer fixed)))

(defglextfun ("glVertex4xOES" vertex-4x-oes 3240) :void
  (x fixed)
  (y fixed)
  (z fixed))

(defglextfun ("glVertex4xvOES" vertex-4xv-oes 3241) :void
  (coords (:pointer fixed)))

(defglextfun ("glQueryMatrixxOES" query-matrix-x-oes 3242) bitfield
  (mantissa (:pointer fixed))
  (exponent (:pointer int)))

(defglextfun ("glClearDepthfOES" clear-depth-f-oes 3243) :void
  (depth clampf))

(defglextfun ("glClipPlanefOES" clip-plane-f-oes 3244) :void
  (plane enum)
  (equation (:pointer float)))

(defglextfun ("glDepthRangefOES" depth-range-f-oes 3245) :void
  (n clampf)
  (f clampf))

(defglextfun ("glFrustumfOES" frustum-f-oes 3246) :void
  (l float)
  (r float)
  (b float)
  (tee float)
  (n float)
  (f float))

(defglextfun ("glGetClipPlanefOES" get-clip-plane-f-oes 3247) :void
  (plane enum)
  (equation (:pointer float)))

(defglextfun ("glOrthofOES" ortho-f-oes 3248) :void
  (l float)
  (r float)
  (b float)
  (tee float)
  (n float)
  (f float))

