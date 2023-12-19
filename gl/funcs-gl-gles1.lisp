;;; this file is automatically generated, do not edit
;;; generated from files with the following copyright:
;;;
;;; Copyright 2013-2020 The Khronos Group Inc.
;;; SPDX-License-Identifier: Apache-2.0

(in-package #:cl-opengl-bindings)

;;; generated 2023-12-19T22:38:41Z
;;; from gl.xml @ git sha bb9a7d9bd49408d709e7481e34b689db3b13317c, 2023-12-06T16:19:18Z

(defglfun ("glPointSize" point-size) :void
  (size float))

(defglfun ("glLogicOp" logic-op) :void
  (opcode enum))

(defglfun ("glColor4f" color-4f) :void
  (red float)
  (green float)
  (blue float)
  (alpha float))

(defglfun ("glColor4ub" color-4ub) :void
  (red ubyte)
  (green ubyte)
  (blue ubyte)
  (alpha ubyte))

(defglfun ("glNormal3f" normal-3f) :void
  (nx float)
  (ny float)
  (nz float))

(defglfun ("glFogf" fog-f) :void
  (pname enum)
  (param float))

(defglfun ("glFogfv" fog-fv) :void
  (pname enum)
  (params (:pointer float)))

(defglfun ("glLightf" light-f) :void
  (light enum)
  (pname enum)
  (param float))

(defglfun ("glLightfv" light-fv) :void
  (light enum)
  (pname enum)
  (params (:pointer float)))

(defglfun ("glLightModelf" light-model-f) :void
  (pname enum)
  (param float))

(defglfun ("glLightModelfv" light-model-fv) :void
  (pname enum)
  (params (:pointer float)))

(defglfun ("glMaterialf" material-f) :void
  (face enum)
  (pname enum)
  (param float))

(defglfun ("glMaterialfv" material-fv) :void
  (face enum)
  (pname enum)
  (params (:pointer float)))

(defglfun ("glShadeModel" shade-model) :void
  (mode enum))

(defglfun ("glTexEnvf" tex-env-f) :void
  (target enum)
  (pname enum)
  (param float))

(defglfun ("glTexEnvfv" tex-env-fv) :void
  (target enum)
  (pname enum)
  (params (:pointer float)))

(defglfun ("glTexEnvi" tex-env-i) :void
  (target enum)
  (pname enum)
  (param int))

(defglfun ("glTexEnviv" tex-env-iv) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

(defglfun ("glAlphaFunc" alpha-func) :void
  (func enum)
  (ref float))

(defglfun ("glGetLightfv" get-light-fv) :void
  (light enum)
  (pname enum)
  (params (:pointer float)))

(defglfun ("glGetMaterialfv" get-material-fv) :void
  (face enum)
  (pname enum)
  (params (:pointer float)))

(defglfun ("glGetTexEnvfv" get-tex-env-fv) :void
  (target enum)
  (pname enum)
  (params (:pointer float)))

(defglfun ("glGetTexEnviv" get-tex-env-iv) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

(defglfun ("glLoadIdentity" load-identity) :void)

(defglfun ("glLoadMatrixf" load-matrix-f) :void
  (m (:pointer float)))

(defglfun ("glMatrixMode" matrix-mode) :void
  (mode enum))

(defglfun ("glMultMatrixf" mult-matrix-f) :void
  (m (:pointer float)))

(defglfun ("glPopMatrix" pop-matrix) :void)

(defglfun ("glPushMatrix" push-matrix) :void)

(defglfun ("glRotatef" rotate-f) :void
  (angle float)
  (x float)
  (y float)
  (z float))

(defglfun ("glScalef" scale-f) :void
  (x float)
  (y float)
  (z float))

(defglfun ("glTranslatef" translate-f) :void
  (x float)
  (y float)
  (z float))

(defglfun ("glColorPointer" color-pointer) :void
  (size int)
  (type enum)
  (stride sizei)
  (pointer offset-or-pointer))

(defglfun ("glDisableClientState" disable-client-state) :void
  (array enum))

(defglfun ("glEnableClientState" enable-client-state) :void
  (array enum))

(defglfun ("glNormalPointer" normal-pointer) :void
  (type enum)
  (stride sizei)
  (pointer offset-or-pointer))

(defglfun ("glTexCoordPointer" tex-coord-pointer) :void
  (size int)
  (type enum)
  (stride sizei)
  (pointer offset-or-pointer))

(defglfun ("glVertexPointer" vertex-pointer) :void
  (size int)
  (type enum)
  (stride sizei)
  (pointer offset-or-pointer))

(defglextfun ("glClientActiveTexture" client-active-texture 2810) :void
  (texture enum))

(defglextfun ("glMultiTexCoord4f" multi-tex-coord-4f 2811) :void
  (target enum)
  (s float)
  (tee float)
  (r float)
  (q float))

(defglextfun ("glPointParameterf" point-parameter-f 2812) :void
  (pname enum)
  (param float))

(defglextfun ("glPointParameterfv" point-parameter-fv 2813) :void
  (pname enum)
  (params (:pointer float)))

(defglextfun ("glMultiTexCoord1bOES" multi-tex-coord-1b-oes 2814) :void
  (texture enum)
  (s byte))

(defglextfun ("glMultiTexCoord1bvOES" multi-tex-coord-1bv-oes 2815) :void
  (texture enum)
  (coords (:pointer byte)))

(defglextfun ("glMultiTexCoord2bOES" multi-tex-coord-2b-oes 2816) :void
  (texture enum)
  (s byte)
  (tee byte))

(defglextfun ("glMultiTexCoord2bvOES" multi-tex-coord-2bv-oes 2817) :void
  (texture enum)
  (coords (:pointer byte)))

(defglextfun ("glMultiTexCoord3bOES" multi-tex-coord-3b-oes 2818) :void
  (texture enum)
  (s byte)
  (tee byte)
  (r byte))

(defglextfun ("glMultiTexCoord3bvOES" multi-tex-coord-3bv-oes 2819) :void
  (texture enum)
  (coords (:pointer byte)))

(defglextfun ("glMultiTexCoord4bOES" multi-tex-coord-4b-oes 2820) :void
  (texture enum)
  (s byte)
  (tee byte)
  (r byte)
  (q byte))

(defglextfun ("glMultiTexCoord4bvOES" multi-tex-coord-4bv-oes 2821) :void
  (texture enum)
  (coords (:pointer byte)))

(defglextfun ("glTexCoord1bOES" tex-coord-1b-oes 2822) :void
  (s byte))

(defglextfun ("glTexCoord1bvOES" tex-coord-1bv-oes 2823) :void
  (coords (:pointer byte)))

(defglextfun ("glTexCoord2bOES" tex-coord-2b-oes 2824) :void
  (s byte)
  (tee byte))

(defglextfun ("glTexCoord2bvOES" tex-coord-2bv-oes 2825) :void
  (coords (:pointer byte)))

(defglextfun ("glTexCoord3bOES" tex-coord-3b-oes 2826) :void
  (s byte)
  (tee byte)
  (r byte))

(defglextfun ("glTexCoord3bvOES" tex-coord-3bv-oes 2827) :void
  (coords (:pointer byte)))

(defglextfun ("glTexCoord4bOES" tex-coord-4b-oes 2828) :void
  (s byte)
  (tee byte)
  (r byte)
  (q byte))

(defglextfun ("glTexCoord4bvOES" tex-coord-4bv-oes 2829) :void
  (coords (:pointer byte)))

(defglextfun ("glVertex2bOES" vertex-2b-oes 2830) :void
  (x byte)
  (y byte))

(defglextfun ("glVertex2bvOES" vertex-2bv-oes 2831) :void
  (coords (:pointer byte)))

(defglextfun ("glVertex3bOES" vertex-3b-oes 2832) :void
  (x byte)
  (y byte)
  (z byte))

(defglextfun ("glVertex3bvOES" vertex-3bv-oes 2833) :void
  (coords (:pointer byte)))

(defglextfun ("glVertex4bOES" vertex-4b-oes 2834) :void
  (x byte)
  (y byte)
  (z byte)
  (w byte))

(defglextfun ("glVertex4bvOES" vertex-4bv-oes 2835) :void
  (coords (:pointer byte)))

(defglextfun ("glAlphaFuncxOES" alpha-func-x-oes 2836) :void
  (func enum)
  (ref fixed))

(defglextfun ("glClearColorxOES" clear-color-x-oes 2837) :void
  (red fixed)
  (green fixed)
  (blue fixed)
  (alpha fixed))

(defglextfun ("glClearDepthxOES" clear-depth-x-oes 2838) :void
  (depth fixed))

(defglextfun ("glClipPlanexOES" clip-plane-x-oes 2839) :void
  (plane enum)
  (equation (:pointer fixed)))

(defglextfun ("glColor4xOES" color-4x-oes 2840) :void
  (red fixed)
  (green fixed)
  (blue fixed)
  (alpha fixed))

(defglextfun ("glDepthRangexOES" depth-range-x-oes 2841) :void
  (n fixed)
  (f fixed))

(defglextfun ("glFogxOES" fog-x-oes 2842) :void
  (pname enum)
  (param fixed))

(defglextfun ("glFogxvOES" fog-xv-oes 2843) :void
  (pname enum)
  (param (:pointer fixed)))

(defglextfun ("glFrustumxOES" frustum-x-oes 2844) :void
  (l fixed)
  (r fixed)
  (b fixed)
  (tee fixed)
  (n fixed)
  (f fixed))

(defglextfun ("glGetClipPlanexOES" get-clip-plane-x-oes 2845) :void
  (plane enum)
  (equation (:pointer fixed)))

(defglextfun ("glGetFixedvOES" get-fixed-v-oes 2846) :void
  (pname enum)
  (params (:pointer fixed)))

(defglextfun ("glGetTexEnvxvOES" get-tex-env-xv-oes 2847) :void
  (target enum)
  (pname enum)
  (params (:pointer fixed)))

(defglextfun ("glGetTexParameterxvOES" get-tex-parameter-xv-oes 2848) :void
  (target enum)
  (pname enum)
  (params (:pointer fixed)))

(defglextfun ("glLightModelxOES" light-model-x-oes 2849) :void
  (pname enum)
  (param fixed))

(defglextfun ("glLightModelxvOES" light-model-xv-oes 2850) :void
  (pname enum)
  (param (:pointer fixed)))

(defglextfun ("glLightxOES" light-x-oes 2851) :void
  (light enum)
  (pname enum)
  (param fixed))

(defglextfun ("glLightxvOES" light-xv-oes 2852) :void
  (light enum)
  (pname enum)
  (params (:pointer fixed)))

(defglextfun ("glLineWidthxOES" line-width-x-oes 2853) :void
  (width fixed))

(defglextfun ("glLoadMatrixxOES" load-matrix-x-oes 2854) :void
  (m (:pointer fixed)))

(defglextfun ("glMaterialxOES" material-x-oes 2855) :void
  (face enum)
  (pname enum)
  (param fixed))

(defglextfun ("glMaterialxvOES" material-xv-oes 2856) :void
  (face enum)
  (pname enum)
  (param (:pointer fixed)))

(defglextfun ("glMultMatrixxOES" mult-matrix-x-oes 2857) :void
  (m (:pointer fixed)))

(defglextfun ("glMultiTexCoord4xOES" multi-tex-coord-4x-oes 2858) :void
  (texture enum)
  (s fixed)
  (tee fixed)
  (r fixed)
  (q fixed))

(defglextfun ("glNormal3xOES" normal-3x-oes 2859) :void
  (nx fixed)
  (ny fixed)
  (nz fixed))

(defglextfun ("glOrthoxOES" ortho-x-oes 2860) :void
  (l fixed)
  (r fixed)
  (b fixed)
  (tee fixed)
  (n fixed)
  (f fixed))

(defglextfun ("glPointParameterxvOES" point-parameter-xv-oes 2861) :void
  (pname enum)
  (params (:pointer fixed)))

(defglextfun ("glPointSizexOES" point-size-x-oes 2862) :void
  (size fixed))

(defglextfun ("glPolygonOffsetxOES" polygon-offset-x-oes 2863) :void
  (factor fixed)
  (units fixed))

(defglextfun ("glRotatexOES" rotate-x-oes 2864) :void
  (angle fixed)
  (x fixed)
  (y fixed)
  (z fixed))

(defglextfun ("glScalexOES" scale-x-oes 2865) :void
  (x fixed)
  (y fixed)
  (z fixed))

(defglextfun ("glTexEnvxOES" tex-env-x-oes 2866) :void
  (target enum)
  (pname enum)
  (param fixed))

(defglextfun ("glTexEnvxvOES" tex-env-xv-oes 2867) :void
  (target enum)
  (pname enum)
  (params (:pointer fixed)))

(defglextfun ("glTexParameterxOES" tex-parameter-x-oes 2868) :void
  (target enum)
  (pname enum)
  (param fixed))

(defglextfun ("glTexParameterxvOES" tex-parameter-xv-oes 2869) :void
  (target enum)
  (pname enum)
  (params (:pointer fixed)))

(defglextfun ("glTranslatexOES" translate-x-oes 2870) :void
  (x fixed)
  (y fixed)
  (z fixed))

(defglextfun ("glGetLightxvOES" get-light-xv-oes 2871) :void
  (light enum)
  (pname enum)
  (params (:pointer fixed)))

(defglextfun ("glGetMaterialxvOES" get-material-xv-oes 2872) :void
  (face enum)
  (pname enum)
  (params (:pointer fixed)))

(defglextfun ("glPointParameterxOES" point-parameter-x-oes 2873) :void
  (pname enum)
  (param fixed))

(defglextfun ("glSampleCoveragexOES" sample-coverage-x-oes 2874) :void
  (value clampx)
  (invert boolean))

(defglextfun ("glAccumxOES" accum-x-oes 2875) :void
  (op enum)
  (value fixed))

(defglextfun ("glBitmapxOES" bitmap-x-oes 2876) :void
  (width sizei)
  (height sizei)
  (xorig fixed)
  (yorig fixed)
  (xmove fixed)
  (ymove fixed)
  (bitmap (:pointer ubyte)))

(defglextfun ("glBlendColorxOES" blend-color-x-oes 2877) :void
  (red fixed)
  (green fixed)
  (blue fixed)
  (alpha fixed))

(defglextfun ("glClearAccumxOES" clear-accum-x-oes 2878) :void
  (red fixed)
  (green fixed)
  (blue fixed)
  (alpha fixed))

(defglextfun ("glColor3xOES" color-3x-oes 2879) :void
  (red fixed)
  (green fixed)
  (blue fixed))

(defglextfun ("glColor3xvOES" color-3xv-oes 2880) :void
  (components (:pointer fixed)))

(defglextfun ("glColor4xvOES" color-4xv-oes 2881) :void
  (components (:pointer fixed)))

(defglextfun ("glConvolutionParameterxOES" convolution-parameter-x-oes 2882) :void
  (target enum)
  (pname enum)
  (param fixed))

(defglextfun ("glConvolutionParameterxvOES" convolution-parameter-xv-oes 2883) :void
  (target enum)
  (pname enum)
  (params (:pointer fixed)))

(defglextfun ("glEvalCoord1xOES" eval-coord-1x-oes 2884) :void
  (u fixed))

(defglextfun ("glEvalCoord1xvOES" eval-coord-1xv-oes 2885) :void
  (coords (:pointer fixed)))

(defglextfun ("glEvalCoord2xOES" eval-coord-2x-oes 2886) :void
  (u fixed)
  (v fixed))

(defglextfun ("glEvalCoord2xvOES" eval-coord-2xv-oes 2887) :void
  (coords (:pointer fixed)))

(defglextfun ("glFeedbackBufferxOES" feedback-buffer-x-oes 2888) :void
  (n sizei)
  (type enum)
  (buffer (:pointer fixed)))

(defglextfun ("glGetConvolutionParameterxvOES" get-convolution-parameter-xv-oes 2889) :void
  (target enum)
  (pname enum)
  (params (:pointer fixed)))

(defglextfun ("glGetHistogramParameterxvOES" get-histogram-parameter-xv-oes 2890) :void
  (target enum)
  (pname enum)
  (params (:pointer fixed)))

(defglextfun ("glGetLightxOES" get-light-x-oes 2891) :void
  (light enum)
  (pname enum)
  (params (:pointer fixed)))

(defglextfun ("glGetMapxvOES" get-map-xv-oes 2892) :void
  (target enum)
  (query enum)
  (v (:pointer fixed)))

(defglextfun ("glGetMaterialxOES" get-material-x-oes 2893) :void
  (face enum)
  (pname enum)
  (param fixed))

(defglextfun ("glGetPixelMapxv" get-pixel-map-xv 2894) :void
  (map enum)
  (size int)
  (values (:pointer fixed)))

(defglextfun ("glGetTexGenxvOES" get-tex-gen-xv-oes 2895) :void
  (coord enum)
  (pname enum)
  (params (:pointer fixed)))

(defglextfun ("glGetTexLevelParameterxvOES" get-tex-level-parameter-xv-oes 2896) :void
  (target enum)
  (level int)
  (pname enum)
  (params (:pointer fixed)))

(defglextfun ("glIndexxOES" index-x-oes 2897) :void
  (component fixed))

(defglextfun ("glIndexxvOES" index-xv-oes 2898) :void
  (component (:pointer fixed)))

(defglextfun ("glLoadTransposeMatrixxOES" load-transpose-matrix-x-oes 2899) :void
  (m (:pointer fixed)))

(defglextfun ("glMap1xOES" map-1x-oes 2900) :void
  (target enum)
  (u1 fixed)
  (u2 fixed)
  (stride int)
  (order int)
  (points fixed))

(defglextfun ("glMap2xOES" map-2x-oes 2901) :void
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

(defglextfun ("glMapGrid1xOES" map-grid-1x-oes 2902) :void
  (n int)
  (u1 fixed)
  (u2 fixed))

(defglextfun ("glMapGrid2xOES" map-grid-2x-oes 2903) :void
  (n int)
  (u1 fixed)
  (u2 fixed)
  (v1 fixed)
  (v2 fixed))

(defglextfun ("glMultTransposeMatrixxOES" mult-transpose-matrix-x-oes 2904) :void
  (m (:pointer fixed)))

(defglextfun ("glMultiTexCoord1xOES" multi-tex-coord-1x-oes 2905) :void
  (texture enum)
  (s fixed))

(defglextfun ("glMultiTexCoord1xvOES" multi-tex-coord-1xv-oes 2906) :void
  (texture enum)
  (coords (:pointer fixed)))

(defglextfun ("glMultiTexCoord2xOES" multi-tex-coord-2x-oes 2907) :void
  (texture enum)
  (s fixed)
  (tee fixed))

(defglextfun ("glMultiTexCoord2xvOES" multi-tex-coord-2xv-oes 2908) :void
  (texture enum)
  (coords (:pointer fixed)))

(defglextfun ("glMultiTexCoord3xOES" multi-tex-coord-3x-oes 2909) :void
  (texture enum)
  (s fixed)
  (tee fixed)
  (r fixed))

(defglextfun ("glMultiTexCoord3xvOES" multi-tex-coord-3xv-oes 2910) :void
  (texture enum)
  (coords (:pointer fixed)))

(defglextfun ("glMultiTexCoord4xvOES" multi-tex-coord-4xv-oes 2911) :void
  (texture enum)
  (coords (:pointer fixed)))

(defglextfun ("glNormal3xvOES" normal-3xv-oes 2912) :void
  (coords (:pointer fixed)))

(defglextfun ("glPassThroughxOES" pass-through-x-oes 2913) :void
  (token fixed))

(defglextfun ("glPixelMapx" pixel-map-x 2914) :void
  (map enum)
  (size int)
  (values (:pointer fixed)))

(defglextfun ("glPixelStorex" pixel-store-x 2915) :void
  (pname enum)
  (param fixed))

(defglextfun ("glPixelTransferxOES" pixel-transfer-x-oes 2916) :void
  (pname enum)
  (param fixed))

(defglextfun ("glPixelZoomxOES" pixel-zoom-x-oes 2917) :void
  (xfactor fixed)
  (yfactor fixed))

(defglextfun ("glPrioritizeTexturesxOES" prioritize-textures-x-oes 2918) :void
  (n sizei)
  (textures (:pointer uint))
  (priorities (:pointer fixed)))

(defglextfun ("glRasterPos2xOES" raster-pos-2x-oes 2919) :void
  (x fixed)
  (y fixed))

(defglextfun ("glRasterPos2xvOES" raster-pos-2xv-oes 2920) :void
  (coords (:pointer fixed)))

(defglextfun ("glRasterPos3xOES" raster-pos-3x-oes 2921) :void
  (x fixed)
  (y fixed)
  (z fixed))

(defglextfun ("glRasterPos3xvOES" raster-pos-3xv-oes 2922) :void
  (coords (:pointer fixed)))

(defglextfun ("glRasterPos4xOES" raster-pos-4x-oes 2923) :void
  (x fixed)
  (y fixed)
  (z fixed)
  (w fixed))

(defglextfun ("glRasterPos4xvOES" raster-pos-4xv-oes 2924) :void
  (coords (:pointer fixed)))

(defglextfun ("glRectxOES" rect-x-oes 2925) :void
  (x1 fixed)
  (y1 fixed)
  (x2 fixed)
  (y2 fixed))

(defglextfun ("glRectxvOES" rect-xv-oes 2926) :void
  (v1 (:pointer fixed))
  (v2 (:pointer fixed)))

(defglextfun ("glTexCoord1xOES" tex-coord-1x-oes 2927) :void
  (s fixed))

(defglextfun ("glTexCoord1xvOES" tex-coord-1xv-oes 2928) :void
  (coords (:pointer fixed)))

(defglextfun ("glTexCoord2xOES" tex-coord-2x-oes 2929) :void
  (s fixed)
  (tee fixed))

(defglextfun ("glTexCoord2xvOES" tex-coord-2xv-oes 2930) :void
  (coords (:pointer fixed)))

(defglextfun ("glTexCoord3xOES" tex-coord-3x-oes 2931) :void
  (s fixed)
  (tee fixed)
  (r fixed))

(defglextfun ("glTexCoord3xvOES" tex-coord-3xv-oes 2932) :void
  (coords (:pointer fixed)))

(defglextfun ("glTexCoord4xOES" tex-coord-4x-oes 2933) :void
  (s fixed)
  (tee fixed)
  (r fixed)
  (q fixed))

(defglextfun ("glTexCoord4xvOES" tex-coord-4xv-oes 2934) :void
  (coords (:pointer fixed)))

(defglextfun ("glTexGenxOES" tex-gen-x-oes 2935) :void
  (coord enum)
  (pname enum)
  (param fixed))

(defglextfun ("glTexGenxvOES" tex-gen-xv-oes 2936) :void
  (coord enum)
  (pname enum)
  (params (:pointer fixed)))

(defglextfun ("glVertex2xOES" vertex-2x-oes 2937) :void
  (x fixed))

(defglextfun ("glVertex2xvOES" vertex-2xv-oes 2938) :void
  (coords (:pointer fixed)))

(defglextfun ("glVertex3xOES" vertex-3x-oes 2939) :void
  (x fixed)
  (y fixed))

(defglextfun ("glVertex3xvOES" vertex-3xv-oes 2940) :void
  (coords (:pointer fixed)))

(defglextfun ("glVertex4xOES" vertex-4x-oes 2941) :void
  (x fixed)
  (y fixed)
  (z fixed))

(defglextfun ("glVertex4xvOES" vertex-4xv-oes 2942) :void
  (coords (:pointer fixed)))

(defglextfun ("glQueryMatrixxOES" query-matrix-x-oes 2943) bitfield
  (mantissa (:pointer fixed))
  (exponent (:pointer int)))

(defglextfun ("glClearDepthfOES" clear-depth-f-oes 2944) :void
  (depth clampf))

(defglextfun ("glClipPlanefOES" clip-plane-f-oes 2945) :void
  (plane enum)
  (equation (:pointer float)))

(defglextfun ("glDepthRangefOES" depth-range-f-oes 2946) :void
  (n clampf)
  (f clampf))

(defglextfun ("glFrustumfOES" frustum-f-oes 2947) :void
  (l float)
  (r float)
  (b float)
  (tee float)
  (n float)
  (f float))

(defglextfun ("glGetClipPlanefOES" get-clip-plane-f-oes 2948) :void
  (plane enum)
  (equation (:pointer float)))

(defglextfun ("glOrthofOES" ortho-f-oes 2949) :void
  (l float)
  (r float)
  (b float)
  (tee float)
  (n float)
  (f float))

