;;; generated file, do not edit

;;; generated from files with following copyright:
;;;
;;; License Applicability. Except to the extent portions of this file are
;;; made subject to an alternative license as permitted in the SGI Free
;;; Software License B, Version 1.1 (the "License"), the contents of this
;;; file are subject only to the provisions of the License. You may not use
;;; this file except in compliance with the License. You may obtain a copy
;;; of the License at Silicon Graphics, Inc., attn: Legal Services, 1600
;;; Amphitheatre Parkway, Mountain View, CA 94043-1351, or at:
;;; 
;;; http://oss.sgi.com/projects/FreeB
;;; 
;;; Note that, as provided in the License, the Software is distributed on an
;;; "AS IS" basis, with ALL EXPRESS AND IMPLIED WARRANTIES AND CONDITIONS
;;; DISCLAIMED, INCLUDING, WITHOUT LIMITATION, ANY IMPLIED WARRANTIES AND
;;; CONDITIONS OF MERCHANTABILITY, SATISFACTORY QUALITY, FITNESS FOR A
;;; PARTICULAR PURPOSE, AND NON-INFRINGEMENT.
;;; 
;;; Original Code. The Original Code is: OpenGL Sample Implementation,
;;; Version 1.2.1, released January 26, 2000, developed by Silicon Graphics,
;;; Inc. The Original Code is Copyright (c) 1991-2002 Silicon Graphics, Inc.
;;; Copyright in any portions created by third parties is as indicated
;;; elsewhere herein. All Rights Reserved.
;;; 
;;; Additional Notice Provisions: This software was created using the
;;; OpenGL(R) version 1.2.1 Sample Implementation published by SGI, but has
;;; not been independently verified as being compliant with the OpenGL(R)
;;; version 1.2.1 Specification.
;;;

;;; glext version 40 ( 2008/03/24 )

(in-package #:cl-opengl-bindings)

(defparameter *glext-version* 40)
(defparameter *glext-last-updated* "2008/03/24")

;;; GL version: 1.0, display-list
(defglfun ("glNewList" new-list) :void
  (list uint)
  (mode enum))

;;; GL version: 1.0, display-list
(defglfun ("glEndList" end-list) :void)

;;; GL version: 1.0, display-list
(defglfun ("glCallList" call-list) :void
  (list uint))

;;; GL version: 1.0, display-list
(defglfun ("glCallLists" call-lists) :void
  (n sizei)
  (type enum)
  (lists (:pointer void)))

;;; GL version: 1.0, display-list
(defglfun ("glDeleteLists" delete-lists) :void
  (list uint)
  (range sizei))

;;; GL version: 1.0, display-list
(defglfun ("glGenLists" gen-lists) uint
  (range sizei))

;;; GL version: 1.0, display-list
(defglfun ("glListBase" list-base) :void
  (base uint))

;;; GL version: 1.0, drawing
(defglfun ("glBegin" begin) :void
  (mode enum))

;;; GL version: 1.0, drawing
(defglfun ("glBitmap" bitmap) :void
  (width sizei)
  (height sizei)
  (xorig float)
  (yorig float)
  (xmove float)
  (ymove float)
  (bitmap (:pointer ubyte)))

;;; GL version: 1.0, drawing
(defglfun ("glColor3b" color-3b) :void
  (red byte)
  (green byte)
  (blue byte))

;;; GL version: 1.0, drawing
(defglfun ("glColor3bv" color-3bv) :void
  (v (:pointer byte)))

;;; GL version: 1.0, drawing
(defglfun ("glColor3d" color-3d) :void
  (red double)
  (green double)
  (blue double))

;;; GL version: 1.0, drawing
(defglfun ("glColor3dv" color-3dv) :void
  (v (:pointer double)))

;;; GL version: 1.0, drawing
(defglfun ("glColor3f" color-3f) :void
  (red float)
  (green float)
  (blue float))

;;; GL version: 1.0, drawing
(defglfun ("glColor3fv" color-3fv) :void
  (v (:pointer float)))

;;; GL version: 1.0, drawing
(defglfun ("glColor3i" color-3i) :void
  (red int)
  (green int)
  (blue int))

;;; GL version: 1.0, drawing
(defglfun ("glColor3iv" color-3iv) :void
  (v (:pointer int)))

;;; GL version: 1.0, drawing
(defglfun ("glColor3s" color-3s) :void
  (red short)
  (green short)
  (blue short))

;;; GL version: 1.0, drawing
(defglfun ("glColor3sv" color-3sv) :void
  (v (:pointer short)))

;;; GL version: 1.0, drawing
(defglfun ("glColor3ub" color-3ub) :void
  (red ubyte)
  (green ubyte)
  (blue ubyte))

;;; GL version: 1.0, drawing
(defglfun ("glColor3ubv" color-3ubv) :void
  (v (:pointer ubyte)))

;;; GL version: 1.0, drawing
(defglfun ("glColor3ui" color-3ui) :void
  (red uint)
  (green uint)
  (blue uint))

;;; GL version: 1.0, drawing
(defglfun ("glColor3uiv" color-3uiv) :void
  (v (:pointer uint)))

;;; GL version: 1.0, drawing
(defglfun ("glColor3us" color-3us) :void
  (red ushort)
  (green ushort)
  (blue ushort))

;;; GL version: 1.0, drawing
(defglfun ("glColor3usv" color-3usv) :void
  (v (:pointer ushort)))

;;; GL version: 1.0, drawing
(defglfun ("glColor4b" color-4b) :void
  (red byte)
  (green byte)
  (blue byte)
  (alpha byte))

;;; GL version: 1.0, drawing
(defglfun ("glColor4bv" color-4bv) :void
  (v (:pointer byte)))

;;; GL version: 1.0, drawing
(defglfun ("glColor4d" color-4d) :void
  (red double)
  (green double)
  (blue double)
  (alpha double))

;;; GL version: 1.0, drawing
(defglfun ("glColor4dv" color-4dv) :void
  (v (:pointer double)))

;;; GL version: 1.0, drawing
(defglfun ("glColor4f" color-4f) :void
  (red float)
  (green float)
  (blue float)
  (alpha float))

;;; GL version: 1.0, drawing
(defglfun ("glColor4fv" color-4fv) :void
  (v (:pointer float)))

;;; GL version: 1.0, drawing
(defglfun ("glColor4i" color-4i) :void
  (red int)
  (green int)
  (blue int)
  (alpha int))

;;; GL version: 1.0, drawing
(defglfun ("glColor4iv" color-4iv) :void
  (v (:pointer int)))

;;; GL version: 1.0, drawing
(defglfun ("glColor4s" color-4s) :void
  (red short)
  (green short)
  (blue short)
  (alpha short))

;;; GL version: 1.0, drawing
(defglfun ("glColor4sv" color-4sv) :void
  (v (:pointer short)))

;;; GL version: 1.0, drawing
(defglfun ("glColor4ub" color-4ub) :void
  (red ubyte)
  (green ubyte)
  (blue ubyte)
  (alpha ubyte))

;;; GL version: 1.0, drawing
(defglfun ("glColor4ubv" color-4ubv) :void
  (v (:pointer ubyte)))

;;; GL version: 1.0, drawing
(defglfun ("glColor4ui" color-4ui) :void
  (red uint)
  (green uint)
  (blue uint)
  (alpha uint))

;;; GL version: 1.0, drawing
(defglfun ("glColor4uiv" color-4uiv) :void
  (v (:pointer uint)))

;;; GL version: 1.0, drawing
(defglfun ("glColor4us" color-4us) :void
  (red ushort)
  (green ushort)
  (blue ushort)
  (alpha ushort))

;;; GL version: 1.0, drawing
(defglfun ("glColor4usv" color-4usv) :void
  (v (:pointer ushort)))

;;; GL version: 1.0, drawing
(defglfun ("glEdgeFlag" edge-flag) :void
  (flag boolean))

;;; GL version: 1.0, drawing
(defglfun ("glEdgeFlagv" edge-flag-v) :void
  (flag (:pointer boolean)))

;;; GL version: 1.0, drawing
(defglfun ("glEnd" end) :void)

;;; GL version: 1.0, drawing
(defglfun ("glIndexd" index-d) :void
  (c double))

;;; GL version: 1.0, drawing
(defglfun ("glIndexdv" index-dv) :void
  (c (:pointer double)))

;;; GL version: 1.0, drawing
(defglfun ("glIndexf" index-f) :void
  (c float))

;;; GL version: 1.0, drawing
(defglfun ("glIndexfv" index-fv) :void
  (c (:pointer float)))

;;; GL version: 1.0, drawing
(defglfun ("glIndexi" index-i) :void
  (c int))

;;; GL version: 1.0, drawing
(defglfun ("glIndexiv" index-iv) :void
  (c (:pointer int)))

;;; GL version: 1.0, drawing
(defglfun ("glIndexs" index-s) :void
  (c short))

;;; GL version: 1.0, drawing
(defglfun ("glIndexsv" index-sv) :void
  (c (:pointer short)))

;;; GL version: 1.0, drawing
(defglfun ("glNormal3b" normal-3b) :void
  (nx byte)
  (ny byte)
  (nz byte))

;;; GL version: 1.0, drawing
(defglfun ("glNormal3bv" normal-3bv) :void
  (v (:pointer byte)))

;;; GL version: 1.0, drawing
(defglfun ("glNormal3d" normal-3d) :void
  (nx double)
  (ny double)
  (nz double))

;;; GL version: 1.0, drawing
(defglfun ("glNormal3dv" normal-3dv) :void
  (v (:pointer double)))

;;; GL version: 1.0, drawing
(defglfun ("glNormal3f" normal-3f) :void
  (nx float)
  (ny float)
  (nz float))

;;; GL version: 1.0, drawing
(defglfun ("glNormal3fv" normal-3fv) :void
  (v (:pointer float)))

;;; GL version: 1.0, drawing
(defglfun ("glNormal3i" normal-3i) :void
  (nx int)
  (ny int)
  (nz int))

;;; GL version: 1.0, drawing
(defglfun ("glNormal3iv" normal-3iv) :void
  (v (:pointer int)))

;;; GL version: 1.0, drawing
(defglfun ("glNormal3s" normal-3s) :void
  (nx short)
  (ny short)
  (nz short))

;;; GL version: 1.0, drawing
(defglfun ("glNormal3sv" normal-3sv) :void
  (v (:pointer short)))

;;; GL version: 1.0, drawing
(defglfun ("glRasterPos2d" raster-pos-2d) :void
  (x double)
  (y double))

;;; GL version: 1.0, drawing
(defglfun ("glRasterPos2dv" raster-pos-2dv) :void
  (v (:pointer double)))

;;; GL version: 1.0, drawing
(defglfun ("glRasterPos2f" raster-pos-2f) :void
  (x float)
  (y float))

;;; GL version: 1.0, drawing
(defglfun ("glRasterPos2fv" raster-pos-2fv) :void
  (v (:pointer float)))

;;; GL version: 1.0, drawing
(defglfun ("glRasterPos2i" raster-pos-2i) :void
  (x int)
  (y int))

;;; GL version: 1.0, drawing
(defglfun ("glRasterPos2iv" raster-pos-2iv) :void
  (v (:pointer int)))

;;; GL version: 1.0, drawing
(defglfun ("glRasterPos2s" raster-pos-2s) :void
  (x short)
  (y short))

;;; GL version: 1.0, drawing
(defglfun ("glRasterPos2sv" raster-pos-2sv) :void
  (v (:pointer short)))

;;; GL version: 1.0, drawing
(defglfun ("glRasterPos3d" raster-pos-3d) :void
  (x double)
  (y double)
  (z double))

;;; GL version: 1.0, drawing
(defglfun ("glRasterPos3dv" raster-pos-3dv) :void
  (v (:pointer double)))

;;; GL version: 1.0, drawing
(defglfun ("glRasterPos3f" raster-pos-3f) :void
  (x float)
  (y float)
  (z float))

;;; GL version: 1.0, drawing
(defglfun ("glRasterPos3fv" raster-pos-3fv) :void
  (v (:pointer float)))

;;; GL version: 1.0, drawing
(defglfun ("glRasterPos3i" raster-pos-3i) :void
  (x int)
  (y int)
  (z int))

;;; GL version: 1.0, drawing
(defglfun ("glRasterPos3iv" raster-pos-3iv) :void
  (v (:pointer int)))

;;; GL version: 1.0, drawing
(defglfun ("glRasterPos3s" raster-pos-3s) :void
  (x short)
  (y short)
  (z short))

;;; GL version: 1.0, drawing
(defglfun ("glRasterPos3sv" raster-pos-3sv) :void
  (v (:pointer short)))

;;; GL version: 1.0, drawing
(defglfun ("glRasterPos4d" raster-pos-4d) :void
  (x double)
  (y double)
  (z double)
  (w double))

;;; GL version: 1.0, drawing
(defglfun ("glRasterPos4dv" raster-pos-4dv) :void
  (v (:pointer double)))

;;; GL version: 1.0, drawing
(defglfun ("glRasterPos4f" raster-pos-4f) :void
  (x float)
  (y float)
  (z float)
  (w float))

;;; GL version: 1.0, drawing
(defglfun ("glRasterPos4fv" raster-pos-4fv) :void
  (v (:pointer float)))

;;; GL version: 1.0, drawing
(defglfun ("glRasterPos4i" raster-pos-4i) :void
  (x int)
  (y int)
  (z int)
  (w int))

;;; GL version: 1.0, drawing
(defglfun ("glRasterPos4iv" raster-pos-4iv) :void
  (v (:pointer int)))

;;; GL version: 1.0, drawing
(defglfun ("glRasterPos4s" raster-pos-4s) :void
  (x short)
  (y short)
  (z short)
  (w short))

;;; GL version: 1.0, drawing
(defglfun ("glRasterPos4sv" raster-pos-4sv) :void
  (v (:pointer short)))

;;; GL version: 1.0, drawing
(defglfun ("glRectd" rect-d) :void
  (x1 double)
  (y1 double)
  (x2 double)
  (y2 double))

;;; GL version: 1.0, drawing
(defglfun ("glRectdv" rect-dv) :void
  (v1 (:pointer double))
  (v2 (:pointer double)))

;;; GL version: 1.0, drawing
(defglfun ("glRectf" rect-f) :void
  (x1 float)
  (y1 float)
  (x2 float)
  (y2 float))

;;; GL version: 1.0, drawing
(defglfun ("glRectfv" rect-fv) :void
  (v1 (:pointer float))
  (v2 (:pointer float)))

;;; GL version: 1.0, drawing
(defglfun ("glRecti" rect-i) :void
  (x1 int)
  (y1 int)
  (x2 int)
  (y2 int))

;;; GL version: 1.0, drawing
(defglfun ("glRectiv" rect-iv) :void
  (v1 (:pointer int))
  (v2 (:pointer int)))

;;; GL version: 1.0, drawing
(defglfun ("glRects" rect-s) :void
  (x1 short)
  (y1 short)
  (x2 short)
  (y2 short))

;;; GL version: 1.0, drawing
(defglfun ("glRectsv" rect-sv) :void
  (v1 (:pointer short))
  (v2 (:pointer short)))

;;; GL version: 1.0, drawing
(defglfun ("glTexCoord1d" tex-coord-1d) :void
  (s double))

;;; GL version: 1.0, drawing
(defglfun ("glTexCoord1dv" tex-coord-1dv) :void
  (v (:pointer double)))

;;; GL version: 1.0, drawing
(defglfun ("glTexCoord1f" tex-coord-1f) :void
  (s float))

;;; GL version: 1.0, drawing
(defglfun ("glTexCoord1fv" tex-coord-1fv) :void
  (v (:pointer float)))

;;; GL version: 1.0, drawing
(defglfun ("glTexCoord1i" tex-coord-1i) :void
  (s int))

;;; GL version: 1.0, drawing
(defglfun ("glTexCoord1iv" tex-coord-1iv) :void
  (v (:pointer int)))

;;; GL version: 1.0, drawing
(defglfun ("glTexCoord1s" tex-coord-1s) :void
  (s short))

;;; GL version: 1.0, drawing
(defglfun ("glTexCoord1sv" tex-coord-1sv) :void
  (v (:pointer short)))

;;; GL version: 1.0, drawing
(defglfun ("glTexCoord2d" tex-coord-2d) :void
  (s double)
  (tee double))

;;; GL version: 1.0, drawing
(defglfun ("glTexCoord2dv" tex-coord-2dv) :void
  (v (:pointer double)))

;;; GL version: 1.0, drawing
(defglfun ("glTexCoord2f" tex-coord-2f) :void
  (s float)
  (tee float))

;;; GL version: 1.0, drawing
(defglfun ("glTexCoord2fv" tex-coord-2fv) :void
  (v (:pointer float)))

;;; GL version: 1.0, drawing
(defglfun ("glTexCoord2i" tex-coord-2i) :void
  (s int)
  (tee int))

;;; GL version: 1.0, drawing
(defglfun ("glTexCoord2iv" tex-coord-2iv) :void
  (v (:pointer int)))

;;; GL version: 1.0, drawing
(defglfun ("glTexCoord2s" tex-coord-2s) :void
  (s short)
  (tee short))

;;; GL version: 1.0, drawing
(defglfun ("glTexCoord2sv" tex-coord-2sv) :void
  (v (:pointer short)))

;;; GL version: 1.0, drawing
(defglfun ("glTexCoord3d" tex-coord-3d) :void
  (s double)
  (tee double)
  (r double))

;;; GL version: 1.0, drawing
(defglfun ("glTexCoord3dv" tex-coord-3dv) :void
  (v (:pointer double)))

;;; GL version: 1.0, drawing
(defglfun ("glTexCoord3f" tex-coord-3f) :void
  (s float)
  (tee float)
  (r float))

;;; GL version: 1.0, drawing
(defglfun ("glTexCoord3fv" tex-coord-3fv) :void
  (v (:pointer float)))

;;; GL version: 1.0, drawing
(defglfun ("glTexCoord3i" tex-coord-3i) :void
  (s int)
  (tee int)
  (r int))

;;; GL version: 1.0, drawing
(defglfun ("glTexCoord3iv" tex-coord-3iv) :void
  (v (:pointer int)))

;;; GL version: 1.0, drawing
(defglfun ("glTexCoord3s" tex-coord-3s) :void
  (s short)
  (tee short)
  (r short))

;;; GL version: 1.0, drawing
(defglfun ("glTexCoord3sv" tex-coord-3sv) :void
  (v (:pointer short)))

;;; GL version: 1.0, drawing
(defglfun ("glTexCoord4d" tex-coord-4d) :void
  (s double)
  (tee double)
  (r double)
  (q double))

;;; GL version: 1.0, drawing
(defglfun ("glTexCoord4dv" tex-coord-4dv) :void
  (v (:pointer double)))

;;; GL version: 1.0, drawing
(defglfun ("glTexCoord4f" tex-coord-4f) :void
  (s float)
  (tee float)
  (r float)
  (q float))

;;; GL version: 1.0, drawing
(defglfun ("glTexCoord4fv" tex-coord-4fv) :void
  (v (:pointer float)))

;;; GL version: 1.0, drawing
(defglfun ("glTexCoord4i" tex-coord-4i) :void
  (s int)
  (tee int)
  (r int)
  (q int))

;;; GL version: 1.0, drawing
(defglfun ("glTexCoord4iv" tex-coord-4iv) :void
  (v (:pointer int)))

;;; GL version: 1.0, drawing
(defglfun ("glTexCoord4s" tex-coord-4s) :void
  (s short)
  (tee short)
  (r short)
  (q short))

;;; GL version: 1.0, drawing
(defglfun ("glTexCoord4sv" tex-coord-4sv) :void
  (v (:pointer short)))

;;; GL version: 1.0, drawing
(defglfun ("glVertex2d" vertex-2d) :void
  (x double)
  (y double))

;;; GL version: 1.0, drawing
(defglfun ("glVertex2dv" vertex-2dv) :void
  (v (:pointer double)))

;;; GL version: 1.0, drawing
(defglfun ("glVertex2f" vertex-2f) :void
  (x float)
  (y float))

;;; GL version: 1.0, drawing
(defglfun ("glVertex2fv" vertex-2fv) :void
  (v (:pointer float)))

;;; GL version: 1.0, drawing
(defglfun ("glVertex2i" vertex-2i) :void
  (x int)
  (y int))

;;; GL version: 1.0, drawing
(defglfun ("glVertex2iv" vertex-2iv) :void
  (v (:pointer int)))

;;; GL version: 1.0, drawing
(defglfun ("glVertex2s" vertex-2s) :void
  (x short)
  (y short))

;;; GL version: 1.0, drawing
(defglfun ("glVertex2sv" vertex-2sv) :void
  (v (:pointer short)))

;;; GL version: 1.0, drawing
(defglfun ("glVertex3d" vertex-3d) :void
  (x double)
  (y double)
  (z double))

;;; GL version: 1.0, drawing
(defglfun ("glVertex3dv" vertex-3dv) :void
  (v (:pointer double)))

;;; GL version: 1.0, drawing
(defglfun ("glVertex3f" vertex-3f) :void
  (x float)
  (y float)
  (z float))

;;; GL version: 1.0, drawing
(defglfun ("glVertex3fv" vertex-3fv) :void
  (v (:pointer float)))

;;; GL version: 1.0, drawing
(defglfun ("glVertex3i" vertex-3i) :void
  (x int)
  (y int)
  (z int))

;;; GL version: 1.0, drawing
(defglfun ("glVertex3iv" vertex-3iv) :void
  (v (:pointer int)))

;;; GL version: 1.0, drawing
(defglfun ("glVertex3s" vertex-3s) :void
  (x short)
  (y short)
  (z short))

;;; GL version: 1.0, drawing
(defglfun ("glVertex3sv" vertex-3sv) :void
  (v (:pointer short)))

;;; GL version: 1.0, drawing
(defglfun ("glVertex4d" vertex-4d) :void
  (x double)
  (y double)
  (z double)
  (w double))

;;; GL version: 1.0, drawing
(defglfun ("glVertex4dv" vertex-4dv) :void
  (v (:pointer double)))

;;; GL version: 1.0, drawing
(defglfun ("glVertex4f" vertex-4f) :void
  (x float)
  (y float)
  (z float)
  (w float))

;;; GL version: 1.0, drawing
(defglfun ("glVertex4fv" vertex-4fv) :void
  (v (:pointer float)))

;;; GL version: 1.0, drawing
(defglfun ("glVertex4i" vertex-4i) :void
  (x int)
  (y int)
  (z int)
  (w int))

;;; GL version: 1.0, drawing
(defglfun ("glVertex4iv" vertex-4iv) :void
  (v (:pointer int)))

;;; GL version: 1.0, drawing
(defglfun ("glVertex4s" vertex-4s) :void
  (x short)
  (y short)
  (z short)
  (w short))

;;; GL version: 1.0, drawing
(defglfun ("glVertex4sv" vertex-4sv) :void
  (v (:pointer short)))

;;; GL version: 1.0, drawing-control
(defglfun ("glClipPlane" clip-plane) :void
  (plane enum)
  (equation (:pointer double)))

;;; GL version: 1.0, drawing-control
(defglfun ("glColorMaterial" color-material) :void
  (face enum)
  (mode enum))

;;; GL version: 1.0, drawing-control
(defglfun ("glCullFace" cull-face) :void
  (mode enum))

;;; GL version: 1.0, drawing-control
(defglfun ("glFogf" fog-f) :void
  (pname enum)
  (param float))

;;; GL version: 1.0, drawing-control
(defglfun ("glFogfv" fog-fv) :void
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.0, drawing-control
(defglfun ("glFogi" fog-i) :void
  (pname enum)
  (param int))

;;; GL version: 1.0, drawing-control
(defglfun ("glFogiv" fog-iv) :void
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.0, drawing-control
(defglfun ("glFrontFace" front-face) :void
  (mode enum))

;;; GL version: 1.0, drawing-control
(defglfun ("glHint" hint) :void
  (target enum)
  (mode enum))

;;; GL version: 1.0, drawing-control
(defglfun ("glLightf" light-f) :void
  (light enum)
  (pname enum)
  (param float))

;;; GL version: 1.0, drawing-control
(defglfun ("glLightfv" light-fv) :void
  (light enum)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.0, drawing-control
(defglfun ("glLighti" light-i) :void
  (light enum)
  (pname enum)
  (param int))

;;; GL version: 1.0, drawing-control
(defglfun ("glLightiv" light-iv) :void
  (light enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.0, drawing-control
(defglfun ("glLightModelf" light-model-f) :void
  (pname enum)
  (param float))

;;; GL version: 1.0, drawing-control
(defglfun ("glLightModelfv" light-model-fv) :void
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.0, drawing-control
(defglfun ("glLightModeli" light-model-i) :void
  (pname enum)
  (param int))

;;; GL version: 1.0, drawing-control
(defglfun ("glLightModeliv" light-model-iv) :void
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.0, drawing-control
(defglfun ("glLineStipple" line-stipple) :void
  (factor int)
  (pattern ushort))

;;; GL version: 1.0, drawing-control
(defglfun ("glLineWidth" line-width) :void
  (width float))

;;; GL version: 1.0, drawing-control
(defglfun ("glMaterialf" material-f) :void
  (face enum)
  (pname enum)
  (param float))

;;; GL version: 1.0, drawing-control
(defglfun ("glMaterialfv" material-fv) :void
  (face enum)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.0, drawing-control
(defglfun ("glMateriali" material-i) :void
  (face enum)
  (pname enum)
  (param int))

;;; GL version: 1.0, drawing-control
(defglfun ("glMaterialiv" material-iv) :void
  (face enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.0, drawing-control
(defglfun ("glPointSize" point-size) :void
  (size float))

;;; GL version: 1.0, drawing-control
(defglfun ("glPolygonMode" polygon-mode) :void
  (face enum)
  (mode enum))

;;; GL version: 1.0, drawing-control
(defglfun ("glPolygonStipple" polygon-stipple) :void
  (mask (:pointer ubyte)))

;;; GL version: 1.0, drawing-control
(defglfun ("glScissor" scissor) :void
  (x int)
  (y int)
  (width sizei)
  (height sizei))

;;; GL version: 1.0, drawing-control
(defglfun ("glShadeModel" shade-model) :void
  (mode enum))

;;; GL version: 1.0, drawing-control
(defglfun ("glTexParameterf" tex-parameter-f) :void
  (target enum)
  (pname enum)
  (param float))

;;; GL version: 1.0, drawing-control
(defglfun ("glTexParameterfv" tex-parameter-fv) :void
  (target enum)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.0, drawing-control
(defglfun ("glTexParameteri" tex-parameter-i) :void
  (target enum)
  (pname enum)
  (param int))

;;; GL version: 1.0, drawing-control
(defglfun ("glTexParameteriv" tex-parameter-iv) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.0, drawing-control
(defglfun ("glTexImage1D" tex-image-1d) :void
  (target enum)
  (level int)
  (internalformat int)
  (width sizei)
  (border int)
  (format enum)
  (type enum)
  (pixels (:pointer void)))

;;; GL version: 1.0, drawing-control
(defglfun ("glTexImage2D" tex-image-2d) :void
  (target enum)
  (level int)
  (internalformat int)
  (width sizei)
  (height sizei)
  (border int)
  (format enum)
  (type enum)
  (pixels (:pointer void)))

;;; GL version: 1.0, drawing-control
(defglfun ("glTexEnvf" tex-env-f) :void
  (target enum)
  (pname enum)
  (param float))

;;; GL version: 1.0, drawing-control
(defglfun ("glTexEnvfv" tex-env-fv) :void
  (target enum)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.0, drawing-control
(defglfun ("glTexEnvi" tex-env-i) :void
  (target enum)
  (pname enum)
  (param int))

;;; GL version: 1.0, drawing-control
(defglfun ("glTexEnviv" tex-env-iv) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.0, drawing-control
(defglfun ("glTexGend" tex-gen-d) :void
  (coord enum)
  (pname enum)
  (param double))

;;; GL version: 1.0, drawing-control
(defglfun ("glTexGendv" tex-gen-dv) :void
  (coord enum)
  (pname enum)
  (params (:pointer double)))

;;; GL version: 1.0, drawing-control
(defglfun ("glTexGenf" tex-gen-f) :void
  (coord enum)
  (pname enum)
  (param float))

;;; GL version: 1.0, drawing-control
(defglfun ("glTexGenfv" tex-gen-fv) :void
  (coord enum)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.0, drawing-control
(defglfun ("glTexGeni" tex-gen-i) :void
  (coord enum)
  (pname enum)
  (param int))

;;; GL version: 1.0, drawing-control
(defglfun ("glTexGeniv" tex-gen-iv) :void
  (coord enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.0, feedback
(defglfun ("glFeedbackBuffer" feedback-buffer) :void
  (size sizei)
  (type enum)
  (buffer (:pointer float)))

;;; GL version: 1.0, feedback
(defglfun ("glSelectBuffer" select-buffer) :void
  (size sizei)
  (buffer (:pointer uint)))

;;; GL version: 1.0, feedback
(defglfun ("glRenderMode" render-mode) int
  (mode enum))

;;; GL version: 1.0, feedback
(defglfun ("glInitNames" init-names) :void)

;;; GL version: 1.0, feedback
(defglfun ("glLoadName" load-name) :void
  (name uint))

;;; GL version: 1.0, feedback
(defglfun ("glPassThrough" pass-through) :void
  (token float))

;;; GL version: 1.0, feedback
(defglfun ("glPopName" pop-name) :void)

;;; GL version: 1.0, feedback
(defglfun ("glPushName" push-name) :void
  (name uint))

;;; GL version: 1.0, framebuf
(defglfun ("glDrawBuffer" draw-buffer) :void
  (mode enum))

;;; GL version: 1.0, framebuf
(defglfun ("glClear" clear) :void
  (mask bitfield))

;;; GL version: 1.0, framebuf
(defglfun ("glClearAccum" clear-accum) :void
  (red float)
  (green float)
  (blue float)
  (alpha float))

;;; GL version: 1.0, framebuf
(defglfun ("glClearIndex" clear-index) :void
  (c float))

;;; GL version: 1.0, framebuf
(defglfun ("glClearColor" clear-color) :void
  (red clampf)
  (green clampf)
  (blue clampf)
  (alpha clampf))

;;; GL version: 1.0, framebuf
(defglfun ("glClearStencil" clear-stencil) :void
  (s int))

;;; GL version: 1.0, framebuf
(defglfun ("glClearDepth" clear-depth) :void
  (depth clampd))

;;; GL version: 1.0, framebuf
(defglfun ("glStencilMask" stencil-mask) :void
  (mask uint))

;;; GL version: 1.0, framebuf
(defglfun ("glColorMask" color-mask) :void
  (red boolean)
  (green boolean)
  (blue boolean)
  (alpha boolean))

;;; GL version: 1.0, framebuf
(defglfun ("glDepthMask" depth-mask) :void
  (flag boolean))

;;; GL version: 1.0, framebuf
(defglfun ("glIndexMask" index-mask) :void
  (mask uint))

;;; GL version: 1.0, misc
(defglfun ("glAccum" accum) :void
  (op enum)
  (value float))

;;; GL version: 1.0, misc
(defglfun ("glDisable" disable) :void
  (cap enum))

;;; GL version: 1.0, misc
(defglfun ("glEnable" enable) :void
  (cap enum))

;;; GL version: 1.0, misc
(defglfun ("glFinish" finish) :void)

;;; GL version: 1.0, misc
(defglfun ("glFlush" flush) :void)

;;; GL version: 1.0, misc
(defglfun ("glPopAttrib" pop-attrib) :void)

;;; GL version: 1.0, misc
(defglfun ("glPushAttrib" push-attrib) :void
  (mask bitfield))

;;; GL version: 1.0, modeling
(defglfun ("glMap1d" map-1d) :void
  (target enum)
  (u1 double)
  (u2 double)
  (stride int)
  (order int)
  (points (:pointer double)))

;;; GL version: 1.0, modeling
(defglfun ("glMap1f" map-1f) :void
  (target enum)
  (u1 float)
  (u2 float)
  (stride int)
  (order int)
  (points (:pointer float)))

;;; GL version: 1.0, modeling
(defglfun ("glMap2d" map-2d) :void
  (target enum)
  (u1 double)
  (u2 double)
  (ustride int)
  (uorder int)
  (v1 double)
  (v2 double)
  (vstride int)
  (vorder int)
  (points (:pointer double)))

;;; GL version: 1.0, modeling
(defglfun ("glMap2f" map-2f) :void
  (target enum)
  (u1 float)
  (u2 float)
  (ustride int)
  (uorder int)
  (v1 float)
  (v2 float)
  (vstride int)
  (vorder int)
  (points (:pointer float)))

;;; GL version: 1.0, modeling
(defglfun ("glMapGrid1d" map-grid-1d) :void
  (un int)
  (u1 double)
  (u2 double))

;;; GL version: 1.0, modeling
(defglfun ("glMapGrid1f" map-grid-1f) :void
  (un int)
  (u1 float)
  (u2 float))

;;; GL version: 1.0, modeling
(defglfun ("glMapGrid2d" map-grid-2d) :void
  (un int)
  (u1 double)
  (u2 double)
  (vn int)
  (v1 double)
  (v2 double))

;;; GL version: 1.0, modeling
(defglfun ("glMapGrid2f" map-grid-2f) :void
  (un int)
  (u1 float)
  (u2 float)
  (vn int)
  (v1 float)
  (v2 float))

;;; GL version: 1.0, modeling
(defglfun ("glEvalCoord1d" eval-coord-1d) :void
  (u double))

;;; GL version: 1.0, modeling
(defglfun ("glEvalCoord1dv" eval-coord-1dv) :void
  (u (:pointer double)))

;;; GL version: 1.0, modeling
(defglfun ("glEvalCoord1f" eval-coord-1f) :void
  (u float))

;;; GL version: 1.0, modeling
(defglfun ("glEvalCoord1fv" eval-coord-1fv) :void
  (u (:pointer float)))

;;; GL version: 1.0, modeling
(defglfun ("glEvalCoord2d" eval-coord-2d) :void
  (u double)
  (v double))

;;; GL version: 1.0, modeling
(defglfun ("glEvalCoord2dv" eval-coord-2dv) :void
  (u (:pointer double)))

;;; GL version: 1.0, modeling
(defglfun ("glEvalCoord2f" eval-coord-2f) :void
  (u float)
  (v float))

;;; GL version: 1.0, modeling
(defglfun ("glEvalCoord2fv" eval-coord-2fv) :void
  (u (:pointer float)))

;;; GL version: 1.0, modeling
(defglfun ("glEvalMesh1" eval-mesh-1) :void
  (mode enum)
  (i1 int)
  (i2 int))

;;; GL version: 1.0, modeling
(defglfun ("glEvalPoint1" eval-point-1) :void
  (i int))

;;; GL version: 1.0, modeling
(defglfun ("glEvalMesh2" eval-mesh-2) :void
  (mode enum)
  (i1 int)
  (i2 int)
  (j1 int)
  (j2 int))

;;; GL version: 1.0, modeling
(defglfun ("glEvalPoint2" eval-point-2) :void
  (i int)
  (j int))

;;; GL version: 1.0, pixel-op
(defglfun ("glAlphaFunc" alpha-func) :void
  (func enum)
  (ref clampf))

;;; GL version: 1.0, pixel-op
(defglfun ("glBlendFunc" blend-func) :void
  (sfactor enum)
  (dfactor enum))

;;; GL version: 1.0, pixel-op
(defglfun ("glLogicOp" logic-op) :void
  (opcode enum))

;;; GL version: 1.0, pixel-op
(defglfun ("glStencilFunc" stencil-func) :void
  (func enum)
  (ref int)
  (mask uint))

;;; GL version: 1.0, pixel-op
(defglfun ("glStencilOp" stencil-op) :void
  (fail enum)
  (zfail enum)
  (zpass enum))

;;; GL version: 1.0, pixel-op
(defglfun ("glDepthFunc" depth-func) :void
  (func enum))

;;; GL version: 1.0, pixel-rw
(defglfun ("glPixelZoom" pixel-zoom) :void
  (xfactor float)
  (yfactor float))

;;; GL version: 1.0, pixel-rw
(defglfun ("glPixelTransferf" pixel-transfer-f) :void
  (pname enum)
  (param float))

;;; GL version: 1.0, pixel-rw
(defglfun ("glPixelTransferi" pixel-transfer-i) :void
  (pname enum)
  (param int))

;;; GL version: 1.0, pixel-rw
(defglfun ("glPixelStoref" pixel-store-f) :void
  (pname enum)
  (param float))

;;; GL version: 1.0, pixel-rw
(defglfun ("glPixelStorei" pixel-store-i) :void
  (pname enum)
  (param int))

;;; GL version: 1.0, pixel-rw
(defglfun ("glPixelMapfv" pixel-map-fv) :void
  (map enum)
  (mapsize int)
  (values (:pointer float)))

;;; GL version: 1.0, pixel-rw
(defglfun ("glPixelMapuiv" pixel-map-uiv) :void
  (map enum)
  (mapsize int)
  (values (:pointer uint)))

;;; GL version: 1.0, pixel-rw
(defglfun ("glPixelMapusv" pixel-map-usv) :void
  (map enum)
  (mapsize int)
  (values (:pointer ushort)))

;;; GL version: 1.0, pixel-rw
(defglfun ("glReadBuffer" read-buffer) :void
  (mode enum))

;;; GL version: 1.0, pixel-rw
(defglfun ("glCopyPixels" copy-pixels) :void
  (x int)
  (y int)
  (width sizei)
  (height sizei)
  (type enum))

;;; GL version: 1.0, pixel-rw
(defglfun ("glReadPixels" read-pixels) :void
  (x int)
  (y int)
  (width sizei)
  (height sizei)
  (format enum)
  (type enum)
  (pixels (:pointer void)))

;;; GL version: 1.0, pixel-rw
(defglfun ("glDrawPixels" draw-pixels) :void
  (width sizei)
  (height sizei)
  (format enum)
  (type enum)
  (pixels (:pointer void)))

;;; GL version: 1.0, state-req
(defglfun ("glGetBooleanv" get-boolean-v) :void
  (pname enum)
  (params (:pointer boolean)))

;;; GL version: 1.0, state-req
(defglfun ("glGetClipPlane" get-clip-plane) :void
  (plane enum)
  (equation (:pointer double)))

;;; GL version: 1.0, state-req
(defglfun ("glGetDoublev" get-double-v) :void
  (pname enum)
  (params (:pointer double)))

;;; GL version: 1.0, state-req
(defglfun ("glGetError" get-error) enum)

;;; GL version: 1.0, state-req
(defglfun ("glGetFloatv" get-float-v) :void
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.0, state-req
(defglfun ("glGetIntegerv" get-integer-v) :void
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.0, state-req
(defglfun ("glGetLightfv" get-light-fv) :void
  (light enum)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.0, state-req
(defglfun ("glGetLightiv" get-light-iv) :void
  (light enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.0, state-req
(defglfun ("glGetMapdv" get-map-dv) :void
  (target enum)
  (query enum)
  (v (:pointer double)))

;;; GL version: 1.0, state-req
(defglfun ("glGetMapfv" get-map-fv) :void
  (target enum)
  (query enum)
  (v (:pointer float)))

;;; GL version: 1.0, state-req
(defglfun ("glGetMapiv" get-map-iv) :void
  (target enum)
  (query enum)
  (v (:pointer int)))

;;; GL version: 1.0, state-req
(defglfun ("glGetMaterialfv" get-material-fv) :void
  (face enum)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.0, state-req
(defglfun ("glGetMaterialiv" get-material-iv) :void
  (face enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.0, state-req
(defglfun ("glGetPixelMapfv" get-pixel-map-fv) :void
  (map enum)
  (values (:pointer float)))

;;; GL version: 1.0, state-req
(defglfun ("glGetPixelMapuiv" get-pixel-map-uiv) :void
  (map enum)
  (values (:pointer uint)))

;;; GL version: 1.0, state-req
(defglfun ("glGetPixelMapusv" get-pixel-map-usv) :void
  (map enum)
  (values (:pointer ushort)))

;;; GL version: 1.0, state-req
(defglfun ("glGetPolygonStipple" get-polygon-stipple) :void
  (mask (:pointer ubyte)))

;;; GL version: 1.0, state-req
(defglfun ("glGetString" get-string) string
  (name enum))

;;; GL version: 1.0, state-req
(defglfun ("glGetTexEnvfv" get-tex-env-fv) :void
  (target enum)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.0, state-req
(defglfun ("glGetTexEnviv" get-tex-env-iv) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.0, state-req
(defglfun ("glGetTexGendv" get-tex-gen-dv) :void
  (coord enum)
  (pname enum)
  (params (:pointer double)))

;;; GL version: 1.0, state-req
(defglfun ("glGetTexGenfv" get-tex-gen-fv) :void
  (coord enum)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.0, state-req
(defglfun ("glGetTexGeniv" get-tex-gen-iv) :void
  (coord enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.0, state-req
(defglfun ("glGetTexImage" get-tex-image) :void
  (target enum)
  (level int)
  (format enum)
  (type enum)
  (pixels (:pointer void)))

;;; GL version: 1.0, state-req
(defglfun ("glGetTexParameterfv" get-tex-parameter-fv) :void
  (target enum)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.0, state-req
(defglfun ("glGetTexParameteriv" get-tex-parameter-iv) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.0, state-req
(defglfun ("glGetTexLevelParameterfv" get-tex-level-parameter-fv) :void
  (target enum)
  (level int)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.0, state-req
(defglfun ("glGetTexLevelParameteriv" get-tex-level-parameter-iv) :void
  (target enum)
  (level int)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.0, state-req
(defglfun ("glIsEnabled" is-enabled) boolean
  (cap enum))

;;; GL version: 1.0, state-req
(defglfun ("glIsList" is-list) boolean
  (list uint))

;;; GL version: 1.0, xform
(defglfun ("glDepthRange" depth-range) :void
  (near clampd)
  (far clampd))

;;; GL version: 1.0, xform
(defglfun ("glFrustum" frustum) :void
  (left double)
  (right double)
  (bottom double)
  (top double)
  (zNear double)
  (zFar double))

;;; GL version: 1.0, xform
(defglfun ("glLoadIdentity" load-identity) :void)

;;; GL version: 1.0, xform
(defglfun ("glLoadMatrixf" load-matrix-f) :void
  (m (:pointer float)))

;;; GL version: 1.0, xform
(defglfun ("glLoadMatrixd" load-matrix-d) :void
  (m (:pointer double)))

;;; GL version: 1.0, xform
(defglfun ("glMatrixMode" matrix-mode) :void
  (mode enum))

;;; GL version: 1.0, xform
(defglfun ("glMultMatrixf" mult-matrix-f) :void
  (m (:pointer float)))

;;; GL version: 1.0, xform
(defglfun ("glMultMatrixd" mult-matrix-d) :void
  (m (:pointer double)))

;;; GL version: 1.0, xform
(defglfun ("glOrtho" ortho) :void
  (left double)
  (right double)
  (bottom double)
  (top double)
  (zNear double)
  (zFar double))

;;; GL version: 1.0, xform
(defglfun ("glPopMatrix" pop-matrix) :void)

;;; GL version: 1.0, xform
(defglfun ("glPushMatrix" push-matrix) :void)

;;; GL version: 1.0, xform
(defglfun ("glRotated" rotate-d) :void
  (angle double)
  (x double)
  (y double)
  (z double))

;;; GL version: 1.0, xform
(defglfun ("glRotatef" rotate-f) :void
  (angle float)
  (x float)
  (y float)
  (z float))

;;; GL version: 1.0, xform
(defglfun ("glScaled" scale-d) :void
  (x double)
  (y double)
  (z double))

;;; GL version: 1.0, xform
(defglfun ("glScalef" scale-f) :void
  (x float)
  (y float)
  (z float))

;;; GL version: 1.0, xform
(defglfun ("glTranslated" translate-d) :void
  (x double)
  (y double)
  (z double))

;;; GL version: 1.0, xform
(defglfun ("glTranslatef" translate-f) :void
  (x float)
  (y float)
  (z float))

;;; GL version: 1.0, xform
(defglfun ("glViewport" viewport) :void
  (x int)
  (y int)
  (width sizei)
  (height sizei))

;;; GL version: 1.1, 1_1
(defglfun ("glArrayElement" array-element) :void
  (i int))

;;; GL version: 1.1, 1_1
(defglfun ("glColorPointer" color-pointer) :void
  (size int)
  (type enum)
  (stride sizei)
  (pointer (:pointer void)))

;;; GL version: 1.1, 1_1
(defglfun ("glDisableClientState" disable-client-state) :void
  (array enum))

;;; GL version: 1.1, 1_1
(defglfun ("glDrawArrays" draw-arrays) :void
  (mode enum)
  (first int)
  (count sizei))

;;; GL version: 1.1, 1_1
(defglfun ("glDrawElements" draw-elements) :void
  (mode enum)
  (count sizei)
  (type enum)
  (indices (:pointer void)))

;;; GL version: 1.1, 1_1
(defglfun ("glEdgeFlagPointer" edge-flag-pointer) :void
  (stride sizei)
  (pointer (:pointer void)))

;;; GL version: 1.1, 1_1
(defglfun ("glEnableClientState" enable-client-state) :void
  (array enum))

;;; GL version: 1.1, 1_1
(defglfun ("glGetPointerv" get-pointer-v) :void
  (pname enum)
  (params (:pointer (:pointer void))))

;;; GL version: 1.1, 1_1
(defglfun ("glIndexPointer" index-pointer) :void
  (type enum)
  (stride sizei)
  (pointer (:pointer void)))

;;; GL version: 1.1, 1_1
(defglfun ("glInterleavedArrays" interleaved-arrays) :void
  (format enum)
  (stride sizei)
  (pointer (:pointer void)))

;;; GL version: 1.1, 1_1
(defglfun ("glNormalPointer" normal-pointer) :void
  (type enum)
  (stride sizei)
  (pointer (:pointer void)))

;;; GL version: 1.1, 1_1
(defglfun ("glTexCoordPointer" tex-coord-pointer) :void
  (size int)
  (type enum)
  (stride sizei)
  (pointer (:pointer void)))

;;; GL version: 1.1, 1_1
(defglfun ("glVertexPointer" vertex-pointer) :void
  (size int)
  (type enum)
  (stride sizei)
  (pointer (:pointer void)))

;;; GL version: 1.1, 1_1
(defglfun ("glPolygonOffset" polygon-offset) :void
  (factor float)
  (units float))

;;; GL version: 1.1, 1_1
(defglfun ("glCopyTexImage1D" copy-tex-image-1d) :void
  (target enum)
  (level int)
  (internalformat enum)
  (x int)
  (y int)
  (width sizei)
  (border int))

;;; GL version: 1.1, 1_1
(defglfun ("glCopyTexImage2D" copy-tex-image-2d) :void
  (target enum)
  (level int)
  (internalformat enum)
  (x int)
  (y int)
  (width sizei)
  (height sizei)
  (border int))

;;; GL version: 1.1, 1_1
(defglfun ("glCopyTexSubImage1D" copy-tex-sub-image-1d) :void
  (target enum)
  (level int)
  (xoffset int)
  (x int)
  (y int)
  (width sizei))

;;; GL version: 1.1, 1_1
(defglfun ("glCopyTexSubImage2D" copy-tex-sub-image-2d) :void
  (target enum)
  (level int)
  (xoffset int)
  (yoffset int)
  (x int)
  (y int)
  (width sizei)
  (height sizei))

;;; GL version: 1.1, 1_1
(defglfun ("glTexSubImage1D" tex-sub-image-1d) :void
  (target enum)
  (level int)
  (xoffset int)
  (width sizei)
  (format enum)
  (type enum)
  (pixels (:pointer void)))

;;; GL version: 1.1, 1_1
(defglfun ("glTexSubImage2D" tex-sub-image-2d) :void
  (target enum)
  (level int)
  (xoffset int)
  (yoffset int)
  (width sizei)
  (height sizei)
  (format enum)
  (type enum)
  (pixels (:pointer void)))

;;; GL version: 1.1, 1_1
(defglfun ("glAreTexturesResident" are-textures-resident) boolean
  (n sizei)
  (textures (:pointer uint))
  (residences (:pointer boolean)))

;;; GL version: 1.1, 1_1
(defglfun ("glBindTexture" bind-texture) :void
  (target enum)
  (texture uint))

;;; GL version: 1.1, 1_1
(defglfun ("glDeleteTextures" delete-textures) :void
  (n sizei)
  (textures (:pointer uint)))

;;; GL version: 1.1, 1_1
(defglfun ("glGenTextures" gen-textures) :void
  (n sizei)
  (textures (:pointer uint)))

;;; GL version: 1.1, 1_1
(defglfun ("glIsTexture" is-texture) boolean
  (texture uint))

;;; GL version: 1.1, 1_1
(defglfun ("glPrioritizeTextures" prioritize-textures) :void
  (n sizei)
  (textures (:pointer uint))
  (priorities (:pointer clampf)))

;;; GL version: 1.1, 1_1
(defglfun ("glIndexub" index-ub) :void
  (c ubyte))

;;; GL version: 1.1, 1_1
(defglfun ("glIndexubv" index-ubv) :void
  (c (:pointer ubyte)))

;;; GL version: 1.1, 1_1
(defglfun ("glPopClientAttrib" pop-client-attrib) :void)

;;; GL version: 1.1, 1_1
(defglfun ("glPushClientAttrib" push-client-attrib) :void
  (mask bitfield))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glBlendColor" blend-color) :void
  (red clampf)
  (green clampf)
  (blue clampf)
  (alpha clampf))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glBlendEquation" blend-equation) :void
  (mode enum))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glDrawRangeElements" draw-range-elements) :void
  (mode enum)
  (start uint)
  (end uint)
  (count sizei)
  (type enum)
  (indices (:pointer void)))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glColorTable" color-table) :void
  (target enum)
  (internalformat enum)
  (width sizei)
  (format enum)
  (type enum)
  (table (:pointer void)))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glColorTableParameterfv" color-table-parameter-fv) :void
  (target enum)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glColorTableParameteriv" color-table-parameter-iv) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glCopyColorTable" copy-color-table) :void
  (target enum)
  (internalformat enum)
  (x int)
  (y int)
  (width sizei))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glGetColorTable" get-color-table) :void
  (target enum)
  (format enum)
  (type enum)
  (table (:pointer void)))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glGetColorTableParameterfv" get-color-table-parameter-fv) :void
  (target enum)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glGetColorTableParameteriv" get-color-table-parameter-iv) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glColorSubTable" color-sub-table) :void
  (target enum)
  (start sizei)
  (count sizei)
  (format enum)
  (type enum)
  (data (:pointer void)))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glCopyColorSubTable" copy-color-sub-table) :void
  (target enum)
  (start sizei)
  (x int)
  (y int)
  (width sizei))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glConvolutionFilter1D" convolution-filter-1d) :void
  (target enum)
  (internalformat enum)
  (width sizei)
  (format enum)
  (type enum)
  (image (:pointer void)))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glConvolutionFilter2D" convolution-filter-2d) :void
  (target enum)
  (internalformat enum)
  (width sizei)
  (height sizei)
  (format enum)
  (type enum)
  (image (:pointer void)))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glConvolutionParameterf" convolution-parameter-f) :void
  (target enum)
  (pname enum)
  (params float))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glConvolutionParameterfv" convolution-parameter-fv) :void
  (target enum)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glConvolutionParameteri" convolution-parameter-i) :void
  (target enum)
  (pname enum)
  (params int))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glConvolutionParameteriv" convolution-parameter-iv) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glCopyConvolutionFilter1D" copy-convolution-filter-1d) :void
  (target enum)
  (internalformat enum)
  (x int)
  (y int)
  (width sizei))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glCopyConvolutionFilter2D" copy-convolution-filter-2d) :void
  (target enum)
  (internalformat enum)
  (x int)
  (y int)
  (width sizei)
  (height sizei))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glGetConvolutionFilter" get-convolution-filter) :void
  (target enum)
  (format enum)
  (type enum)
  (image (:pointer void)))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glGetConvolutionParameterfv" get-convolution-parameter-fv) :void
  (target enum)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glGetConvolutionParameteriv" get-convolution-parameter-iv) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glGetSeparableFilter" get-separable-filter) :void
  (target enum)
  (format enum)
  (type enum)
  (row (:pointer void))
  (column (:pointer void))
  (span (:pointer void)))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glSeparableFilter2D" separable-filter-2d) :void
  (target enum)
  (internalformat enum)
  (width sizei)
  (height sizei)
  (format enum)
  (type enum)
  (row (:pointer void))
  (column (:pointer void)))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glGetHistogram" get-histogram) :void
  (target enum)
  (reset boolean)
  (format enum)
  (type enum)
  (values (:pointer void)))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glGetHistogramParameterfv" get-histogram-parameter-fv) :void
  (target enum)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glGetHistogramParameteriv" get-histogram-parameter-iv) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glGetMinmax" get-minmax) :void
  (target enum)
  (reset boolean)
  (format enum)
  (type enum)
  (values (:pointer void)))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glGetMinmaxParameterfv" get-minmax-parameter-fv) :void
  (target enum)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glGetMinmaxParameteriv" get-minmax-parameter-iv) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glHistogram" histogram) :void
  (target enum)
  (width sizei)
  (internalformat enum)
  (sink boolean))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glMinmax" minmax) :void
  (target enum)
  (internalformat enum)
  (sink boolean))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glResetHistogram" reset-histogram) :void
  (target enum))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glResetMinmax" reset-minmax) :void
  (target enum))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glTexImage3D" tex-image-3d) :void
  (target enum)
  (level int)
  (internalformat int)
  (width sizei)
  (height sizei)
  (depth sizei)
  (border int)
  (format enum)
  (type enum)
  (pixels (:pointer void)))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glTexSubImage3D" tex-sub-image-3d) :void
  (target enum)
  (level int)
  (xoffset int)
  (yoffset int)
  (zoffset int)
  (width sizei)
  (height sizei)
  (depth sizei)
  (format enum)
  (type enum)
  (pixels (:pointer void)))

;;; GL version: 1.2, VERSION_1_2
(defglextfun ("glCopyTexSubImage3D" copy-tex-sub-image-3d) :void
  (target enum)
  (level int)
  (xoffset int)
  (yoffset int)
  (zoffset int)
  (x int)
  (y int)
  (width sizei)
  (height sizei))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glActiveTexture" active-texture) :void
  (texture enum))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glClientActiveTexture" client-active-texture) :void
  (texture enum))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glMultiTexCoord1d" multi-tex-coord-1d) :void
  (target enum)
  (s double))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glMultiTexCoord1dv" multi-tex-coord-1dv) :void
  (target enum)
  (v (:pointer double)))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glMultiTexCoord1f" multi-tex-coord-1f) :void
  (target enum)
  (s float))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glMultiTexCoord1fv" multi-tex-coord-1fv) :void
  (target enum)
  (v (:pointer float)))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glMultiTexCoord1i" multi-tex-coord-1i) :void
  (target enum)
  (s int))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glMultiTexCoord1iv" multi-tex-coord-1iv) :void
  (target enum)
  (v (:pointer int)))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glMultiTexCoord1s" multi-tex-coord-1s) :void
  (target enum)
  (s short))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glMultiTexCoord1sv" multi-tex-coord-1sv) :void
  (target enum)
  (v (:pointer short)))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glMultiTexCoord2d" multi-tex-coord-2d) :void
  (target enum)
  (s double)
  (tee double))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glMultiTexCoord2dv" multi-tex-coord-2dv) :void
  (target enum)
  (v (:pointer double)))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glMultiTexCoord2f" multi-tex-coord-2f) :void
  (target enum)
  (s float)
  (tee float))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glMultiTexCoord2fv" multi-tex-coord-2fv) :void
  (target enum)
  (v (:pointer float)))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glMultiTexCoord2i" multi-tex-coord-2i) :void
  (target enum)
  (s int)
  (tee int))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glMultiTexCoord2iv" multi-tex-coord-2iv) :void
  (target enum)
  (v (:pointer int)))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glMultiTexCoord2s" multi-tex-coord-2s) :void
  (target enum)
  (s short)
  (tee short))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glMultiTexCoord2sv" multi-tex-coord-2sv) :void
  (target enum)
  (v (:pointer short)))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glMultiTexCoord3d" multi-tex-coord-3d) :void
  (target enum)
  (s double)
  (tee double)
  (r double))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glMultiTexCoord3dv" multi-tex-coord-3dv) :void
  (target enum)
  (v (:pointer double)))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glMultiTexCoord3f" multi-tex-coord-3f) :void
  (target enum)
  (s float)
  (tee float)
  (r float))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glMultiTexCoord3fv" multi-tex-coord-3fv) :void
  (target enum)
  (v (:pointer float)))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glMultiTexCoord3i" multi-tex-coord-3i) :void
  (target enum)
  (s int)
  (tee int)
  (r int))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glMultiTexCoord3iv" multi-tex-coord-3iv) :void
  (target enum)
  (v (:pointer int)))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glMultiTexCoord3s" multi-tex-coord-3s) :void
  (target enum)
  (s short)
  (tee short)
  (r short))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glMultiTexCoord3sv" multi-tex-coord-3sv) :void
  (target enum)
  (v (:pointer short)))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glMultiTexCoord4d" multi-tex-coord-4d) :void
  (target enum)
  (s double)
  (tee double)
  (r double)
  (q double))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glMultiTexCoord4dv" multi-tex-coord-4dv) :void
  (target enum)
  (v (:pointer double)))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glMultiTexCoord4f" multi-tex-coord-4f) :void
  (target enum)
  (s float)
  (tee float)
  (r float)
  (q float))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glMultiTexCoord4fv" multi-tex-coord-4fv) :void
  (target enum)
  (v (:pointer float)))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glMultiTexCoord4i" multi-tex-coord-4i) :void
  (target enum)
  (s int)
  (tee int)
  (r int)
  (q int))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glMultiTexCoord4iv" multi-tex-coord-4iv) :void
  (target enum)
  (v (:pointer int)))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glMultiTexCoord4s" multi-tex-coord-4s) :void
  (target enum)
  (s short)
  (tee short)
  (r short)
  (q short))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glMultiTexCoord4sv" multi-tex-coord-4sv) :void
  (target enum)
  (v (:pointer short)))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glLoadTransposeMatrixf" load-transpose-matrix-f) :void
  (m (:pointer float)))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glLoadTransposeMatrixd" load-transpose-matrix-d) :void
  (m (:pointer double)))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glMultTransposeMatrixf" mult-transpose-matrix-f) :void
  (m (:pointer float)))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glMultTransposeMatrixd" mult-transpose-matrix-d) :void
  (m (:pointer double)))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glSampleCoverage" sample-coverage) :void
  (value clampf)
  (invert boolean))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glCompressedTexImage3D" compressed-tex-image-3d) :void
  (target enum)
  (level int)
  (internalformat enum)
  (width sizei)
  (height sizei)
  (depth sizei)
  (border int)
  (imageSize sizei)
  (data (:pointer void)))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glCompressedTexImage2D" compressed-tex-image-2d) :void
  (target enum)
  (level int)
  (internalformat enum)
  (width sizei)
  (height sizei)
  (border int)
  (imageSize sizei)
  (data (:pointer void)))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glCompressedTexImage1D" compressed-tex-image-1d) :void
  (target enum)
  (level int)
  (internalformat enum)
  (width sizei)
  (border int)
  (imageSize sizei)
  (data (:pointer void)))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glCompressedTexSubImage3D" compressed-tex-sub-image-3d) :void
  (target enum)
  (level int)
  (xoffset int)
  (yoffset int)
  (zoffset int)
  (width sizei)
  (height sizei)
  (depth sizei)
  (format enum)
  (imageSize sizei)
  (data (:pointer void)))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glCompressedTexSubImage2D" compressed-tex-sub-image-2d) :void
  (target enum)
  (level int)
  (xoffset int)
  (yoffset int)
  (width sizei)
  (height sizei)
  (format enum)
  (imageSize sizei)
  (data (:pointer void)))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glCompressedTexSubImage1D" compressed-tex-sub-image-1d) :void
  (target enum)
  (level int)
  (xoffset int)
  (width sizei)
  (format enum)
  (imageSize sizei)
  (data (:pointer void)))

;;; GL version: 1.3, VERSION_1_3
(defglextfun ("glGetCompressedTexImage" get-compressed-tex-image) :void
  (target enum)
  (level int)
  (img (:pointer void)))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glBlendFuncSeparate" blend-func-separate) :void
  (sfactorRGB enum)
  (dfactorRGB enum)
  (sfactorAlpha enum)
  (dfactorAlpha enum))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glFogCoordf" fog-coord-f) :void
  (coord float))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glFogCoordfv" fog-coord-fv) :void
  (coord (:pointer float)))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glFogCoordd" fog-coord-d) :void
  (coord double))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glFogCoorddv" fog-coord-dv) :void
  (coord (:pointer double)))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glFogCoordPointer" fog-coord-pointer) :void
  (type enum)
  (stride sizei)
  (pointer (:pointer void)))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glMultiDrawArrays" multi-draw-arrays) :void
  (mode enum)
  (first (:pointer int))
  (count (:pointer sizei))
  (primcount sizei))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glMultiDrawElements" multi-draw-elements) :void
  (mode enum)
  (count (:pointer sizei))
  (type enum)
  (indices (:pointer (:pointer void)))
  (primcount sizei))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glPointParameterf" point-parameter-f) :void
  (pname enum)
  (param float))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glPointParameterfv" point-parameter-fv) :void
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glPointParameteri" point-parameter-i) :void
  (pname enum)
  (param int))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glPointParameteriv" point-parameter-iv) :void
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glSecondaryColor3b" secondary-color-3b) :void
  (red byte)
  (green byte)
  (blue byte))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glSecondaryColor3bv" secondary-color-3bv) :void
  (v (:pointer byte)))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glSecondaryColor3d" secondary-color-3d) :void
  (red double)
  (green double)
  (blue double))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glSecondaryColor3dv" secondary-color-3dv) :void
  (v (:pointer double)))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glSecondaryColor3f" secondary-color-3f) :void
  (red float)
  (green float)
  (blue float))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glSecondaryColor3fv" secondary-color-3fv) :void
  (v (:pointer float)))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glSecondaryColor3i" secondary-color-3i) :void
  (red int)
  (green int)
  (blue int))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glSecondaryColor3iv" secondary-color-3iv) :void
  (v (:pointer int)))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glSecondaryColor3s" secondary-color-3s) :void
  (red short)
  (green short)
  (blue short))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glSecondaryColor3sv" secondary-color-3sv) :void
  (v (:pointer short)))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glSecondaryColor3ub" secondary-color-3ub) :void
  (red ubyte)
  (green ubyte)
  (blue ubyte))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glSecondaryColor3ubv" secondary-color-3ubv) :void
  (v (:pointer ubyte)))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glSecondaryColor3ui" secondary-color-3ui) :void
  (red uint)
  (green uint)
  (blue uint))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glSecondaryColor3uiv" secondary-color-3uiv) :void
  (v (:pointer uint)))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glSecondaryColor3us" secondary-color-3us) :void
  (red ushort)
  (green ushort)
  (blue ushort))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glSecondaryColor3usv" secondary-color-3usv) :void
  (v (:pointer ushort)))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glSecondaryColorPointer" secondary-color-pointer) :void
  (size int)
  (type enum)
  (stride sizei)
  (pointer (:pointer void)))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glWindowPos2d" window-pos-2d) :void
  (x double)
  (y double))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glWindowPos2dv" window-pos-2dv) :void
  (v (:pointer double)))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glWindowPos2f" window-pos-2f) :void
  (x float)
  (y float))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glWindowPos2fv" window-pos-2fv) :void
  (v (:pointer float)))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glWindowPos2i" window-pos-2i) :void
  (x int)
  (y int))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glWindowPos2iv" window-pos-2iv) :void
  (v (:pointer int)))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glWindowPos2s" window-pos-2s) :void
  (x short)
  (y short))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glWindowPos2sv" window-pos-2sv) :void
  (v (:pointer short)))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glWindowPos3d" window-pos-3d) :void
  (x double)
  (y double)
  (z double))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glWindowPos3dv" window-pos-3dv) :void
  (v (:pointer double)))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glWindowPos3f" window-pos-3f) :void
  (x float)
  (y float)
  (z float))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glWindowPos3fv" window-pos-3fv) :void
  (v (:pointer float)))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glWindowPos3i" window-pos-3i) :void
  (x int)
  (y int)
  (z int))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glWindowPos3iv" window-pos-3iv) :void
  (v (:pointer int)))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glWindowPos3s" window-pos-3s) :void
  (x short)
  (y short)
  (z short))

;;; GL version: 1.4, VERSION_1_4
(defglextfun ("glWindowPos3sv" window-pos-3sv) :void
  (v (:pointer short)))

;;; GL version: 1.5, VERSION_1_5
(defglextfun ("glGenQueries" gen-queries) :void
  (n sizei)
  (ids (:pointer uint)))

;;; GL version: 1.5, VERSION_1_5
(defglextfun ("glDeleteQueries" delete-queries) :void
  (n sizei)
  (ids (:pointer uint)))

;;; GL version: 1.5, VERSION_1_5
(defglextfun ("glIsQuery" is-query) boolean
  (id uint))

;;; GL version: 1.5, VERSION_1_5
(defglextfun ("glBeginQuery" begin-query) :void
  (target enum)
  (id uint))

;;; GL version: 1.5, VERSION_1_5
(defglextfun ("glEndQuery" end-query) :void
  (target enum))

;;; GL version: 1.5, VERSION_1_5
(defglextfun ("glGetQueryiv" get-query-iv) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.5, VERSION_1_5
(defglextfun ("glGetQueryObjectiv" get-query-object-iv) :void
  (id uint)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.5, VERSION_1_5
(defglextfun ("glGetQueryObjectuiv" get-query-object-uiv) :void
  (id uint)
  (pname enum)
  (params (:pointer uint)))

;;; GL version: 1.5, VERSION_1_5
(defglextfun ("glBindBuffer" bind-buffer) :void
  (target enum)
  (buffer uint))

;;; GL version: 1.5, VERSION_1_5
(defglextfun ("glDeleteBuffers" delete-buffers) :void
  (n sizei)
  (buffers (:pointer uint)))

;;; GL version: 1.5, VERSION_1_5
(defglextfun ("glGenBuffers" gen-buffers) :void
  (n sizei)
  (buffers (:pointer uint)))

;;; GL version: 1.5, VERSION_1_5
(defglextfun ("glIsBuffer" is-buffer) boolean
  (buffer uint))

;;; GL version: 1.5, VERSION_1_5
(defglextfun ("glBufferData" buffer-data) :void
  (target enum)
  (size sizeiptr)
  (data (:pointer void))
  (usage enum))

;;; GL version: 1.5, VERSION_1_5
(defglextfun ("glBufferSubData" buffer-sub-data) :void
  (target enum)
  (offset intptr)
  (size sizeiptr)
  (data (:pointer void)))

;;; GL version: 1.5, VERSION_1_5
(defglextfun ("glGetBufferSubData" get-buffer-sub-data) :void
  (target enum)
  (offset intptr)
  (size sizeiptr)
  (data (:pointer void)))

;;; GL version: 1.5, VERSION_1_5
(defglextfun ("glMapBuffer" map-buffer) (:pointer void)
  (target enum)
  (access enum))

;;; GL version: 1.5, VERSION_1_5
(defglextfun ("glUnmapBuffer" unmap-buffer) boolean
  (target enum))

;;; GL version: 1.5, VERSION_1_5
(defglextfun ("glGetBufferParameteriv" get-buffer-parameter-iv) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.5, VERSION_1_5
(defglextfun ("glGetBufferPointerv" get-buffer-pointer-v) :void
  (target enum)
  (pname enum)
  (params (:pointer (:pointer void))))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glBlendEquationSeparate" blend-equation-separate) :void
  (modeRGB enum)
  (modeAlpha enum))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glDrawBuffers" draw-buffers) :void
  (n sizei)
  (bufs (:pointer enum)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glStencilOpSeparate" stencil-op-separate) :void
  (face enum)
  (sfail enum)
  (dpfail enum)
  (dppass enum))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glStencilFuncSeparate" stencil-func-separate) :void
  (frontfunc enum)
  (backfunc enum)
  (ref int)
  (mask uint))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glStencilMaskSeparate" stencil-mask-separate) :void
  (face enum)
  (mask uint))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glAttachShader" attach-shader) :void
  (program uint)
  (shader uint))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glBindAttribLocation" bind-attrib-location) :void
  (program uint)
  (index uint)
  (name (:pointer char)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glCompileShader" compile-shader) :void
  (shader uint))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glCreateProgram" create-program) uint)

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glCreateShader" create-shader) uint
  (type enum))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glDeleteProgram" delete-program) :void
  (program uint))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glDeleteShader" delete-shader) :void
  (shader uint))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glDetachShader" detach-shader) :void
  (program uint)
  (shader uint))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glDisableVertexAttribArray" disable-vertex-attrib-array) :void
  (index uint))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glEnableVertexAttribArray" enable-vertex-attrib-array) :void
  (index uint))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glGetActiveAttrib" get-active-attrib) :void
  (program uint)
  (index uint)
  (bufSize sizei)
  (length (:pointer sizei))
  (size (:pointer int))
  (type (:pointer enum))
  (name (:pointer char)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glGetActiveUniform" get-active-uniform) :void
  (program uint)
  (index uint)
  (bufSize sizei)
  (length (:pointer sizei))
  (size (:pointer int))
  (type (:pointer enum))
  (name (:pointer char)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glGetAttachedShaders" get-attached-shaders) :void
  (program uint)
  (maxCount sizei)
  (count (:pointer sizei))
  (obj (:pointer uint)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glGetAttribLocation" get-attrib-location) int
  (program uint)
  (name (:pointer char)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glGetProgramiv" get-program-iv) :void
  (program uint)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glGetProgramInfoLog" get-program-info-log) :void
  (program uint)
  (bufSize sizei)
  (length (:pointer sizei))
  (infoLog (:pointer char)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glGetShaderiv" get-shader-iv) :void
  (shader uint)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glGetShaderInfoLog" get-shader-info-log) :void
  (shader uint)
  (bufSize sizei)
  (length (:pointer sizei))
  (infoLog (:pointer char)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glGetShaderSource" get-shader-source) :void
  (shader uint)
  (bufSize sizei)
  (length (:pointer sizei))
  (source (:pointer char)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glGetUniformLocation" get-uniform-location) int
  (program uint)
  (name (:pointer char)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glGetUniformfv" get-uniform-fv) :void
  (program uint)
  (location int)
  (params (:pointer float)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glGetUniformiv" get-uniform-iv) :void
  (program uint)
  (location int)
  (params (:pointer int)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glGetVertexAttribdv" get-vertex-attrib-dv) :void
  (index uint)
  (pname enum)
  (params (:pointer double)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glGetVertexAttribfv" get-vertex-attrib-fv) :void
  (index uint)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glGetVertexAttribiv" get-vertex-attrib-iv) :void
  (index uint)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glGetVertexAttribPointerv" get-vertex-attrib-pointer-v) :void
  (index uint)
  (pname enum)
  (pointer (:pointer (:pointer void))))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glIsProgram" is-program) boolean
  (program uint))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glIsShader" is-shader) boolean
  (shader uint))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glLinkProgram" link-program) :void
  (program uint))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glShaderSource" shader-source) :void
  (shader uint)
  (count sizei)
  (string (:pointer (:pointer char)))
  (length (:pointer int)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glUseProgram" use-program) :void
  (program uint))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glUniform1f" uniform-1f) :void
  (location int)
  (v0 float))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glUniform2f" uniform-2f) :void
  (location int)
  (v0 float)
  (v1 float))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glUniform3f" uniform-3f) :void
  (location int)
  (v0 float)
  (v1 float)
  (v2 float))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glUniform4f" uniform-4f) :void
  (location int)
  (v0 float)
  (v1 float)
  (v2 float)
  (v3 float))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glUniform1i" uniform-1i) :void
  (location int)
  (v0 int))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glUniform2i" uniform-2i) :void
  (location int)
  (v0 int)
  (v1 int))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glUniform3i" uniform-3i) :void
  (location int)
  (v0 int)
  (v1 int)
  (v2 int))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glUniform4i" uniform-4i) :void
  (location int)
  (v0 int)
  (v1 int)
  (v2 int)
  (v3 int))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glUniform1fv" uniform-1fv) :void
  (location int)
  (count sizei)
  (value (:pointer float)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glUniform2fv" uniform-2fv) :void
  (location int)
  (count sizei)
  (value (:pointer float)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glUniform3fv" uniform-3fv) :void
  (location int)
  (count sizei)
  (value (:pointer float)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glUniform4fv" uniform-4fv) :void
  (location int)
  (count sizei)
  (value (:pointer float)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glUniform1iv" uniform-1iv) :void
  (location int)
  (count sizei)
  (value (:pointer int)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glUniform2iv" uniform-2iv) :void
  (location int)
  (count sizei)
  (value (:pointer int)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glUniform3iv" uniform-3iv) :void
  (location int)
  (count sizei)
  (value (:pointer int)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glUniform4iv" uniform-4iv) :void
  (location int)
  (count sizei)
  (value (:pointer int)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glUniformMatrix2fv" uniform-matrix-2fv) :void
  (location int)
  (count sizei)
  (transpose boolean)
  (value (:pointer float)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glUniformMatrix3fv" uniform-matrix-3fv) :void
  (location int)
  (count sizei)
  (transpose boolean)
  (value (:pointer float)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glUniformMatrix4fv" uniform-matrix-4fv) :void
  (location int)
  (count sizei)
  (transpose boolean)
  (value (:pointer float)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glValidateProgram" validate-program) :void
  (program uint))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib1d" vertex-attrib-1d) :void
  (index uint)
  (x double))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib1dv" vertex-attrib-1dv) :void
  (index uint)
  (v (:pointer double)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib1f" vertex-attrib-1f) :void
  (index uint)
  (x float))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib1fv" vertex-attrib-1fv) :void
  (index uint)
  (v (:pointer float)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib1s" vertex-attrib-1s) :void
  (index uint)
  (x short))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib1sv" vertex-attrib-1sv) :void
  (index uint)
  (v (:pointer short)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib2d" vertex-attrib-2d) :void
  (index uint)
  (x double)
  (y double))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib2dv" vertex-attrib-2dv) :void
  (index uint)
  (v (:pointer double)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib2f" vertex-attrib-2f) :void
  (index uint)
  (x float)
  (y float))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib2fv" vertex-attrib-2fv) :void
  (index uint)
  (v (:pointer float)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib2s" vertex-attrib-2s) :void
  (index uint)
  (x short)
  (y short))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib2sv" vertex-attrib-2sv) :void
  (index uint)
  (v (:pointer short)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib3d" vertex-attrib-3d) :void
  (index uint)
  (x double)
  (y double)
  (z double))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib3dv" vertex-attrib-3dv) :void
  (index uint)
  (v (:pointer double)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib3f" vertex-attrib-3f) :void
  (index uint)
  (x float)
  (y float)
  (z float))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib3fv" vertex-attrib-3fv) :void
  (index uint)
  (v (:pointer float)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib3s" vertex-attrib-3s) :void
  (index uint)
  (x short)
  (y short)
  (z short))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib3sv" vertex-attrib-3sv) :void
  (index uint)
  (v (:pointer short)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib4Nbv" vertex-attrib-4nbv) :void
  (index uint)
  (v (:pointer byte)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib4Niv" vertex-attrib-4niv) :void
  (index uint)
  (v (:pointer int)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib4Nsv" vertex-attrib-4nsv) :void
  (index uint)
  (v (:pointer short)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib4Nub" vertex-attrib-4nub) :void
  (index uint)
  (x ubyte)
  (y ubyte)
  (z ubyte)
  (w ubyte))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib4Nubv" vertex-attrib-4nubv) :void
  (index uint)
  (v (:pointer ubyte)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib4Nuiv" vertex-attrib-4nuiv) :void
  (index uint)
  (v (:pointer uint)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib4Nusv" vertex-attrib-4nusv) :void
  (index uint)
  (v (:pointer ushort)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib4bv" vertex-attrib-4bv) :void
  (index uint)
  (v (:pointer byte)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib4d" vertex-attrib-4d) :void
  (index uint)
  (x double)
  (y double)
  (z double)
  (w double))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib4dv" vertex-attrib-4dv) :void
  (index uint)
  (v (:pointer double)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib4f" vertex-attrib-4f) :void
  (index uint)
  (x float)
  (y float)
  (z float)
  (w float))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib4fv" vertex-attrib-4fv) :void
  (index uint)
  (v (:pointer float)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib4iv" vertex-attrib-4iv) :void
  (index uint)
  (v (:pointer int)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib4s" vertex-attrib-4s) :void
  (index uint)
  (x short)
  (y short)
  (z short)
  (w short))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib4sv" vertex-attrib-4sv) :void
  (index uint)
  (v (:pointer short)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib4ubv" vertex-attrib-4ubv) :void
  (index uint)
  (v (:pointer ubyte)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib4uiv" vertex-attrib-4uiv) :void
  (index uint)
  (v (:pointer uint)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttrib4usv" vertex-attrib-4usv) :void
  (index uint)
  (v (:pointer ushort)))

;;; GL version: 2.0, VERSION_2_0
(defglextfun ("glVertexAttribPointer" vertex-attrib-pointer) :void
  (index uint)
  (size int)
  (type enum)
  (normalized boolean)
  (stride sizei)
  (pointer (:pointer void)))

;;; GL version: 2.1, VERSION_2_1
(defglextfun ("glUniformMatrix2x3fv" uniform-matrix-2x3-fv) :void
  (location int)
  (count sizei)
  (transpose boolean)
  (value (:pointer float)))

;;; GL version: 2.1, VERSION_2_1
(defglextfun ("glUniformMatrix3x2fv" uniform-matrix-3x2-fv) :void
  (location int)
  (count sizei)
  (transpose boolean)
  (value (:pointer float)))

;;; GL version: 2.1, VERSION_2_1
(defglextfun ("glUniformMatrix2x4fv" uniform-matrix-2x4-fv) :void
  (location int)
  (count sizei)
  (transpose boolean)
  (value (:pointer float)))

;;; GL version: 2.1, VERSION_2_1
(defglextfun ("glUniformMatrix4x2fv" uniform-matrix-4x2-fv) :void
  (location int)
  (count sizei)
  (transpose boolean)
  (value (:pointer float)))

;;; GL version: 2.1, VERSION_2_1
(defglextfun ("glUniformMatrix3x4fv" uniform-matrix-3x4-fv) :void
  (location int)
  (count sizei)
  (transpose boolean)
  (value (:pointer float)))

;;; GL version: 2.1, VERSION_2_1
(defglextfun ("glUniformMatrix4x3fv" uniform-matrix-4x3-fv) :void
  (location int)
  (count sizei)
  (transpose boolean)
  (value (:pointer float)))

;;; GL version: 1.2, ARB_multitexture
(defglextfun ("glActiveTextureARB" active-texture-arb) :void
  (texture enum))

;;; GL version: 1.2, ARB_multitexture
(defglextfun ("glClientActiveTextureARB" client-active-texture-arb) :void
  (texture enum))

;;; GL version: 1.2, ARB_multitexture
(defglextfun ("glMultiTexCoord1dARB" multi-tex-coord-1d-arb) :void
  (target enum)
  (s double))

;;; GL version: 1.2, ARB_multitexture
(defglextfun ("glMultiTexCoord1dvARB" multi-tex-coord-1dv-arb) :void
  (target enum)
  (v (:pointer double)))

;;; GL version: 1.2, ARB_multitexture
(defglextfun ("glMultiTexCoord1fARB" multi-tex-coord-1f-arb) :void
  (target enum)
  (s float))

;;; GL version: 1.2, ARB_multitexture
(defglextfun ("glMultiTexCoord1fvARB" multi-tex-coord-1fv-arb) :void
  (target enum)
  (v (:pointer float)))

;;; GL version: 1.2, ARB_multitexture
(defglextfun ("glMultiTexCoord1iARB" multi-tex-coord-1i-arb) :void
  (target enum)
  (s int))

;;; GL version: 1.2, ARB_multitexture
(defglextfun ("glMultiTexCoord1ivARB" multi-tex-coord-1iv-arb) :void
  (target enum)
  (v (:pointer int)))

;;; GL version: 1.2, ARB_multitexture
(defglextfun ("glMultiTexCoord1sARB" multi-tex-coord-1s-arb) :void
  (target enum)
  (s short))

;;; GL version: 1.2, ARB_multitexture
(defglextfun ("glMultiTexCoord1svARB" multi-tex-coord-1sv-arb) :void
  (target enum)
  (v (:pointer short)))

;;; GL version: 1.2, ARB_multitexture
(defglextfun ("glMultiTexCoord2dARB" multi-tex-coord-2d-arb) :void
  (target enum)
  (s double)
  (tee double))

;;; GL version: 1.2, ARB_multitexture
(defglextfun ("glMultiTexCoord2dvARB" multi-tex-coord-2dv-arb) :void
  (target enum)
  (v (:pointer double)))

;;; GL version: 1.2, ARB_multitexture
(defglextfun ("glMultiTexCoord2fARB" multi-tex-coord-2f-arb) :void
  (target enum)
  (s float)
  (tee float))

;;; GL version: 1.2, ARB_multitexture
(defglextfun ("glMultiTexCoord2fvARB" multi-tex-coord-2fv-arb) :void
  (target enum)
  (v (:pointer float)))

;;; GL version: 1.2, ARB_multitexture
(defglextfun ("glMultiTexCoord2iARB" multi-tex-coord-2i-arb) :void
  (target enum)
  (s int)
  (tee int))

;;; GL version: 1.2, ARB_multitexture
(defglextfun ("glMultiTexCoord2ivARB" multi-tex-coord-2iv-arb) :void
  (target enum)
  (v (:pointer int)))

;;; GL version: 1.2, ARB_multitexture
(defglextfun ("glMultiTexCoord2sARB" multi-tex-coord-2s-arb) :void
  (target enum)
  (s short)
  (tee short))

;;; GL version: 1.2, ARB_multitexture
(defglextfun ("glMultiTexCoord2svARB" multi-tex-coord-2sv-arb) :void
  (target enum)
  (v (:pointer short)))

;;; GL version: 1.2, ARB_multitexture
(defglextfun ("glMultiTexCoord3dARB" multi-tex-coord-3d-arb) :void
  (target enum)
  (s double)
  (tee double)
  (r double))

;;; GL version: 1.2, ARB_multitexture
(defglextfun ("glMultiTexCoord3dvARB" multi-tex-coord-3dv-arb) :void
  (target enum)
  (v (:pointer double)))

;;; GL version: 1.2, ARB_multitexture
(defglextfun ("glMultiTexCoord3fARB" multi-tex-coord-3f-arb) :void
  (target enum)
  (s float)
  (tee float)
  (r float))

;;; GL version: 1.2, ARB_multitexture
(defglextfun ("glMultiTexCoord3fvARB" multi-tex-coord-3fv-arb) :void
  (target enum)
  (v (:pointer float)))

;;; GL version: 1.2, ARB_multitexture
(defglextfun ("glMultiTexCoord3iARB" multi-tex-coord-3i-arb) :void
  (target enum)
  (s int)
  (tee int)
  (r int))

;;; GL version: 1.2, ARB_multitexture
(defglextfun ("glMultiTexCoord3ivARB" multi-tex-coord-3iv-arb) :void
  (target enum)
  (v (:pointer int)))

;;; GL version: 1.2, ARB_multitexture
(defglextfun ("glMultiTexCoord3sARB" multi-tex-coord-3s-arb) :void
  (target enum)
  (s short)
  (tee short)
  (r short))

;;; GL version: 1.2, ARB_multitexture
(defglextfun ("glMultiTexCoord3svARB" multi-tex-coord-3sv-arb) :void
  (target enum)
  (v (:pointer short)))

;;; GL version: 1.2, ARB_multitexture
(defglextfun ("glMultiTexCoord4dARB" multi-tex-coord-4d-arb) :void
  (target enum)
  (s double)
  (tee double)
  (r double)
  (q double))

;;; GL version: 1.2, ARB_multitexture
(defglextfun ("glMultiTexCoord4dvARB" multi-tex-coord-4dv-arb) :void
  (target enum)
  (v (:pointer double)))

;;; GL version: 1.2, ARB_multitexture
(defglextfun ("glMultiTexCoord4fARB" multi-tex-coord-4f-arb) :void
  (target enum)
  (s float)
  (tee float)
  (r float)
  (q float))

;;; GL version: 1.2, ARB_multitexture
(defglextfun ("glMultiTexCoord4fvARB" multi-tex-coord-4fv-arb) :void
  (target enum)
  (v (:pointer float)))

;;; GL version: 1.2, ARB_multitexture
(defglextfun ("glMultiTexCoord4iARB" multi-tex-coord-4i-arb) :void
  (target enum)
  (s int)
  (tee int)
  (r int)
  (q int))

;;; GL version: 1.2, ARB_multitexture
(defglextfun ("glMultiTexCoord4ivARB" multi-tex-coord-4iv-arb) :void
  (target enum)
  (v (:pointer int)))

;;; GL version: 1.2, ARB_multitexture
(defglextfun ("glMultiTexCoord4sARB" multi-tex-coord-4s-arb) :void
  (target enum)
  (s short)
  (tee short)
  (r short)
  (q short))

;;; GL version: 1.2, ARB_multitexture
(defglextfun ("glMultiTexCoord4svARB" multi-tex-coord-4sv-arb) :void
  (target enum)
  (v (:pointer short)))

;;; GL version: 1.2, ARB_transpose_matrix
(defglextfun ("glLoadTransposeMatrixfARB" load-transpose-matrix-f-arb) :void
  (m (:pointer float)))

;;; GL version: 1.2, ARB_transpose_matrix
(defglextfun ("glLoadTransposeMatrixdARB" load-transpose-matrix-d-arb) :void
  (m (:pointer double)))

;;; GL version: 1.2, ARB_transpose_matrix
(defglextfun ("glMultTransposeMatrixfARB" mult-transpose-matrix-f-arb) :void
  (m (:pointer float)))

;;; GL version: 1.2, ARB_transpose_matrix
(defglextfun ("glMultTransposeMatrixdARB" mult-transpose-matrix-d-arb) :void
  (m (:pointer double)))

;;; GL version: 1.2, ARB_multisample
(defglextfun ("glSampleCoverageARB" sample-coverage-arb) :void
  (value clampf)
  (invert boolean))

;;; GL version: 1.2, ARB_texture_compression
(defglextfun ("glCompressedTexImage3DARB" compressed-tex-image-3d-arb) :void
  (target enum)
  (level int)
  (internalformat enum)
  (width sizei)
  (height sizei)
  (depth sizei)
  (border int)
  (imageSize sizei)
  (data (:pointer void)))

;;; GL version: 1.2, ARB_texture_compression
(defglextfun ("glCompressedTexImage2DARB" compressed-tex-image-2d-arb) :void
  (target enum)
  (level int)
  (internalformat enum)
  (width sizei)
  (height sizei)
  (border int)
  (imageSize sizei)
  (data (:pointer void)))

;;; GL version: 1.2, ARB_texture_compression
(defglextfun ("glCompressedTexImage1DARB" compressed-tex-image-1d-arb) :void
  (target enum)
  (level int)
  (internalformat enum)
  (width sizei)
  (border int)
  (imageSize sizei)
  (data (:pointer void)))

;;; GL version: 1.2, ARB_texture_compression
(defglextfun ("glCompressedTexSubImage3DARB" compressed-tex-sub-image-3d-arb) :void
  (target enum)
  (level int)
  (xoffset int)
  (yoffset int)
  (zoffset int)
  (width sizei)
  (height sizei)
  (depth sizei)
  (format enum)
  (imageSize sizei)
  (data (:pointer void)))

;;; GL version: 1.2, ARB_texture_compression
(defglextfun ("glCompressedTexSubImage2DARB" compressed-tex-sub-image-2d-arb) :void
  (target enum)
  (level int)
  (xoffset int)
  (yoffset int)
  (width sizei)
  (height sizei)
  (format enum)
  (imageSize sizei)
  (data (:pointer void)))

;;; GL version: 1.2, ARB_texture_compression
(defglextfun ("glCompressedTexSubImage1DARB" compressed-tex-sub-image-1d-arb) :void
  (target enum)
  (level int)
  (xoffset int)
  (width sizei)
  (format enum)
  (imageSize sizei)
  (data (:pointer void)))

;;; GL version: 1.2, ARB_texture_compression
(defglextfun ("glGetCompressedTexImageARB" get-compressed-tex-image-arb) :void
  (target enum)
  (level int)
  (img (:pointer void)))

;;; GL version: 1.0, ARB_point_parameters
(defglextfun ("glPointParameterfARB" point-parameter-f-arb) :void
  (pname enum)
  (param float))

;;; GL version: 1.0, ARB_point_parameters
(defglextfun ("glPointParameterfvARB" point-parameter-fv-arb) :void
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.1, ARB_vertex_blend
(defglextfun ("glWeightbvARB" weight-bv-arb) :void
  (size int)
  (weights (:pointer byte)))

;;; GL version: 1.1, ARB_vertex_blend
(defglextfun ("glWeightsvARB" weight-sv-arb) :void
  (size int)
  (weights (:pointer short)))

;;; GL version: 1.1, ARB_vertex_blend
(defglextfun ("glWeightivARB" weight-iv-arb) :void
  (size int)
  (weights (:pointer int)))

;;; GL version: 1.1, ARB_vertex_blend
(defglextfun ("glWeightfvARB" weight-fv-arb) :void
  (size int)
  (weights (:pointer float)))

;;; GL version: 1.1, ARB_vertex_blend
(defglextfun ("glWeightdvARB" weight-dv-arb) :void
  (size int)
  (weights (:pointer double)))

;;; GL version: 1.1, ARB_vertex_blend
(defglextfun ("glWeightubvARB" weight-ubv-arb) :void
  (size int)
  (weights (:pointer ubyte)))

;;; GL version: 1.1, ARB_vertex_blend
(defglextfun ("glWeightusvARB" weight-usv-arb) :void
  (size int)
  (weights (:pointer ushort)))

;;; GL version: 1.1, ARB_vertex_blend
(defglextfun ("glWeightuivARB" weight-uiv-arb) :void
  (size int)
  (weights (:pointer uint)))

;;; GL version: 1.1, ARB_vertex_blend
(defglextfun ("glWeightPointerARB" weight-pointer-arb) :void
  (size int)
  (type enum)
  (stride sizei)
  (pointer (:pointer void)))

;;; GL version: 1.1, ARB_vertex_blend
(defglextfun ("glVertexBlendARB" vertex-blend-arb) :void
  (count int))

;;; GL version: 1.1, ARB_matrix_palette
(defglextfun ("glCurrentPaletteMatrixARB" current-palette-matrix-arb) :void
  (index int))

;;; GL version: 1.1, ARB_matrix_palette
(defglextfun ("glMatrixIndexubvARB" matrix-index-ubv-arb) :void
  (size int)
  (indices (:pointer ubyte)))

;;; GL version: 1.1, ARB_matrix_palette
(defglextfun ("glMatrixIndexusvARB" matrix-index-usv-arb) :void
  (size int)
  (indices (:pointer ushort)))

;;; GL version: 1.1, ARB_matrix_palette
(defglextfun ("glMatrixIndexuivARB" matrix-index-uiv-arb) :void
  (size int)
  (indices (:pointer uint)))

;;; GL version: 1.1, ARB_matrix_palette
(defglextfun ("glMatrixIndexPointerARB" matrix-index-pointer-arb) :void
  (size int)
  (type enum)
  (stride sizei)
  (pointer (:pointer void)))

;;; GL version: 1.0, ARB_window_pos
(defglextfun ("glWindowPos2dARB" window-pos-2d-arb) :void
  (x double)
  (y double))

;;; GL version: 1.0, ARB_window_pos
(defglextfun ("glWindowPos2dvARB" window-pos-2dv-arb) :void
  (v (:pointer double)))

;;; GL version: 1.0, ARB_window_pos
(defglextfun ("glWindowPos2fARB" window-pos-2f-arb) :void
  (x float)
  (y float))

;;; GL version: 1.0, ARB_window_pos
(defglextfun ("glWindowPos2fvARB" window-pos-2fv-arb) :void
  (v (:pointer float)))

;;; GL version: 1.0, ARB_window_pos
(defglextfun ("glWindowPos2iARB" window-pos-2i-arb) :void
  (x int)
  (y int))

;;; GL version: 1.0, ARB_window_pos
(defglextfun ("glWindowPos2ivARB" window-pos-2iv-arb) :void
  (v (:pointer int)))

;;; GL version: 1.0, ARB_window_pos
(defglextfun ("glWindowPos2sARB" window-pos-2s-arb) :void
  (x short)
  (y short))

;;; GL version: 1.0, ARB_window_pos
(defglextfun ("glWindowPos2svARB" window-pos-2sv-arb) :void
  (v (:pointer short)))

;;; GL version: 1.0, ARB_window_pos
(defglextfun ("glWindowPos3dARB" window-pos-3d-arb) :void
  (x double)
  (y double)
  (z double))

;;; GL version: 1.0, ARB_window_pos
(defglextfun ("glWindowPos3dvARB" window-pos-3dv-arb) :void
  (v (:pointer double)))

;;; GL version: 1.0, ARB_window_pos
(defglextfun ("glWindowPos3fARB" window-pos-3f-arb) :void
  (x float)
  (y float)
  (z float))

;;; GL version: 1.0, ARB_window_pos
(defglextfun ("glWindowPos3fvARB" window-pos-3fv-arb) :void
  (v (:pointer float)))

;;; GL version: 1.0, ARB_window_pos
(defglextfun ("glWindowPos3iARB" window-pos-3i-arb) :void
  (x int)
  (y int)
  (z int))

;;; GL version: 1.0, ARB_window_pos
(defglextfun ("glWindowPos3ivARB" window-pos-3iv-arb) :void
  (v (:pointer int)))

;;; GL version: 1.0, ARB_window_pos
(defglextfun ("glWindowPos3sARB" window-pos-3s-arb) :void
  (x short)
  (y short)
  (z short))

;;; GL version: 1.0, ARB_window_pos
(defglextfun ("glWindowPos3svARB" window-pos-3sv-arb) :void
  (v (:pointer short)))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glVertexAttrib1dARB" vertex-attrib-1d-arb) :void
  (index uint)
  (x double))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glVertexAttrib1dvARB" vertex-attrib-1dv-arb) :void
  (index uint)
  (v (:pointer double)))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glVertexAttrib1fARB" vertex-attrib-1f-arb) :void
  (index uint)
  (x float))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glVertexAttrib1fvARB" vertex-attrib-1fv-arb) :void
  (index uint)
  (v (:pointer float)))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glVertexAttrib1sARB" vertex-attrib-1s-arb) :void
  (index uint)
  (x short))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glVertexAttrib1svARB" vertex-attrib-1sv-arb) :void
  (index uint)
  (v (:pointer short)))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glVertexAttrib2dARB" vertex-attrib-2d-arb) :void
  (index uint)
  (x double)
  (y double))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glVertexAttrib2dvARB" vertex-attrib-2dv-arb) :void
  (index uint)
  (v (:pointer double)))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glVertexAttrib2fARB" vertex-attrib-2f-arb) :void
  (index uint)
  (x float)
  (y float))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glVertexAttrib2fvARB" vertex-attrib-2fv-arb) :void
  (index uint)
  (v (:pointer float)))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glVertexAttrib2sARB" vertex-attrib-2s-arb) :void
  (index uint)
  (x short)
  (y short))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glVertexAttrib2svARB" vertex-attrib-2sv-arb) :void
  (index uint)
  (v (:pointer short)))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glVertexAttrib3dARB" vertex-attrib-3d-arb) :void
  (index uint)
  (x double)
  (y double)
  (z double))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glVertexAttrib3dvARB" vertex-attrib-3dv-arb) :void
  (index uint)
  (v (:pointer double)))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glVertexAttrib3fARB" vertex-attrib-3f-arb) :void
  (index uint)
  (x float)
  (y float)
  (z float))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glVertexAttrib3fvARB" vertex-attrib-3fv-arb) :void
  (index uint)
  (v (:pointer float)))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glVertexAttrib3sARB" vertex-attrib-3s-arb) :void
  (index uint)
  (x short)
  (y short)
  (z short))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glVertexAttrib3svARB" vertex-attrib-3sv-arb) :void
  (index uint)
  (v (:pointer short)))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glVertexAttrib4NbvARB" vertex-attrib-4nbv-arb) :void
  (index uint)
  (v (:pointer byte)))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glVertexAttrib4NivARB" vertex-attrib-4niv-arb) :void
  (index uint)
  (v (:pointer int)))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glVertexAttrib4NsvARB" vertex-attrib-4nsv-arb) :void
  (index uint)
  (v (:pointer short)))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glVertexAttrib4NubARB" vertex-attrib-4nub-arb) :void
  (index uint)
  (x ubyte)
  (y ubyte)
  (z ubyte)
  (w ubyte))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glVertexAttrib4NubvARB" vertex-attrib-4nubv-arb) :void
  (index uint)
  (v (:pointer ubyte)))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glVertexAttrib4NuivARB" vertex-attrib-4nuiv-arb) :void
  (index uint)
  (v (:pointer uint)))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glVertexAttrib4NusvARB" vertex-attrib-4nusv-arb) :void
  (index uint)
  (v (:pointer ushort)))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glVertexAttrib4bvARB" vertex-attrib-4bv-arb) :void
  (index uint)
  (v (:pointer byte)))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glVertexAttrib4dARB" vertex-attrib-4d-arb) :void
  (index uint)
  (x double)
  (y double)
  (z double)
  (w double))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glVertexAttrib4dvARB" vertex-attrib-4dv-arb) :void
  (index uint)
  (v (:pointer double)))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glVertexAttrib4fARB" vertex-attrib-4f-arb) :void
  (index uint)
  (x float)
  (y float)
  (z float)
  (w float))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glVertexAttrib4fvARB" vertex-attrib-4fv-arb) :void
  (index uint)
  (v (:pointer float)))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glVertexAttrib4ivARB" vertex-attrib-4iv-arb) :void
  (index uint)
  (v (:pointer int)))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glVertexAttrib4sARB" vertex-attrib-4s-arb) :void
  (index uint)
  (x short)
  (y short)
  (z short)
  (w short))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glVertexAttrib4svARB" vertex-attrib-4sv-arb) :void
  (index uint)
  (v (:pointer short)))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glVertexAttrib4ubvARB" vertex-attrib-4ubv-arb) :void
  (index uint)
  (v (:pointer ubyte)))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glVertexAttrib4uivARB" vertex-attrib-4uiv-arb) :void
  (index uint)
  (v (:pointer uint)))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glVertexAttrib4usvARB" vertex-attrib-4usv-arb) :void
  (index uint)
  (v (:pointer ushort)))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glVertexAttribPointerARB" vertex-attrib-pointer-arb) :void
  (index uint)
  (size int)
  (type enum)
  (normalized boolean)
  (stride sizei)
  (pointer (:pointer void)))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glEnableVertexAttribArrayARB" enable-vertex-attrib-array-arb) :void
  (index uint))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glDisableVertexAttribArrayARB" disable-vertex-attrib-array-arb) :void
  (index uint))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glProgramStringARB" program-string-arb) :void
  (target enum)
  (format enum)
  (len sizei)
  (string (:pointer void)))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glBindProgramARB" bind-program-arb) :void
  (target enum)
  (program uint))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glDeleteProgramsARB" delete-programs-arb) :void
  (n sizei)
  (programs (:pointer uint)))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glGenProgramsARB" gen-programs-arb) :void
  (n sizei)
  (programs (:pointer uint)))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glProgramEnvParameter4dARB" program-env-parameter-4d-arb) :void
  (target enum)
  (index uint)
  (x double)
  (y double)
  (z double)
  (w double))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glProgramEnvParameter4dvARB" program-env-parameter-4dv-arb) :void
  (target enum)
  (index uint)
  (params (:pointer double)))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glProgramEnvParameter4fARB" program-env-parameter-4f-arb) :void
  (target enum)
  (index uint)
  (x float)
  (y float)
  (z float)
  (w float))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glProgramEnvParameter4fvARB" program-env-parameter-4fv-arb) :void
  (target enum)
  (index uint)
  (params (:pointer float)))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glProgramLocalParameter4dARB" program-local-parameter-4d-arb) :void
  (target enum)
  (index uint)
  (x double)
  (y double)
  (z double)
  (w double))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glProgramLocalParameter4dvARB" program-local-parameter-4dv-arb) :void
  (target enum)
  (index uint)
  (params (:pointer double)))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glProgramLocalParameter4fARB" program-local-parameter-4f-arb) :void
  (target enum)
  (index uint)
  (x float)
  (y float)
  (z float)
  (w float))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glProgramLocalParameter4fvARB" program-local-parameter-4fv-arb) :void
  (target enum)
  (index uint)
  (params (:pointer float)))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glGetProgramEnvParameterdvARB" get-program-env-parameter-dv-arb) :void
  (target enum)
  (index uint)
  (params (:pointer double)))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glGetProgramEnvParameterfvARB" get-program-env-parameter-fv-arb) :void
  (target enum)
  (index uint)
  (params (:pointer float)))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glGetProgramLocalParameterdvARB" get-program-local-parameter-dv-arb) :void
  (target enum)
  (index uint)
  (params (:pointer double)))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glGetProgramLocalParameterfvARB" get-program-local-parameter-fv-arb) :void
  (target enum)
  (index uint)
  (params (:pointer float)))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glGetProgramivARB" get-program-iv-arb) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glGetProgramStringARB" get-program-string-arb) :void
  (target enum)
  (pname enum)
  (string (:pointer void)))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glGetVertexAttribdvARB" get-vertex-attrib-dv-arb) :void
  (index uint)
  (pname enum)
  (params (:pointer double)))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glGetVertexAttribfvARB" get-vertex-attrib-fv-arb) :void
  (index uint)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glGetVertexAttribivARB" get-vertex-attrib-iv-arb) :void
  (index uint)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glGetVertexAttribPointervARB" get-vertex-attrib-pointer-v-arb) :void
  (index uint)
  (pname enum)
  (pointer (:pointer (:pointer void))))

;;; GL version: 1.3, ARB_vertex_program
(defglextfun ("glIsProgramARB" is-program-arb) boolean
  (program uint))

;;; GL version: 1.2, ARB_vertex_buffer_object
(defglextfun ("glBindBufferARB" bind-buffer-arb) :void
  (target enum)
  (buffer uint))

;;; GL version: 1.2, ARB_vertex_buffer_object
(defglextfun ("glDeleteBuffersARB" delete-buffers-arb) :void
  (n sizei)
  (buffers (:pointer uint)))

;;; GL version: 1.2, ARB_vertex_buffer_object
(defglextfun ("glGenBuffersARB" gen-buffers-arb) :void
  (n sizei)
  (buffers (:pointer uint)))

;;; GL version: 1.2, ARB_vertex_buffer_object
(defglextfun ("glIsBufferARB" is-buffer-arb) boolean
  (buffer uint))

;;; GL version: 1.2, ARB_vertex_buffer_object
(defglextfun ("glBufferDataARB" buffer-data-arb) :void
  (target enum)
  (size sizeiptr-arb)
  (data (:pointer void))
  (usage enum))

;;; GL version: 1.2, ARB_vertex_buffer_object
(defglextfun ("glBufferSubDataARB" buffer-sub-data-arb) :void
  (target enum)
  (offset intptr-arb)
  (size sizeiptr-arb)
  (data (:pointer void)))

;;; GL version: 1.2, ARB_vertex_buffer_object
(defglextfun ("glGetBufferSubDataARB" get-buffer-sub-data-arb) :void
  (target enum)
  (offset intptr-arb)
  (size sizeiptr-arb)
  (data (:pointer void)))

;;; GL version: 1.2, ARB_vertex_buffer_object
(defglextfun ("glMapBufferARB" map-buffer-arb) (:pointer void)
  (target enum)
  (access enum))

;;; GL version: 1.2, ARB_vertex_buffer_object
(defglextfun ("glUnmapBufferARB" unmap-buffer-arb) boolean
  (target enum))

;;; GL version: 1.2, ARB_vertex_buffer_object
(defglextfun ("glGetBufferParameterivARB" get-buffer-parameter-iv-arb) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.2, ARB_vertex_buffer_object
(defglextfun ("glGetBufferPointervARB" get-buffer-pointer-v-arb) :void
  (target enum)
  (pname enum)
  (params (:pointer (:pointer void))))

;;; GL version: 1.5, ARB_occlusion_query
(defglextfun ("glGenQueriesARB" gen-queries-arb) :void
  (n sizei)
  (ids (:pointer uint)))

;;; GL version: 1.5, ARB_occlusion_query
(defglextfun ("glDeleteQueriesARB" delete-queries-arb) :void
  (n sizei)
  (ids (:pointer uint)))

;;; GL version: 1.5, ARB_occlusion_query
(defglextfun ("glIsQueryARB" is-query-arb) boolean
  (id uint))

;;; GL version: 1.5, ARB_occlusion_query
(defglextfun ("glBeginQueryARB" begin-query-arb) :void
  (target enum)
  (id uint))

;;; GL version: 1.5, ARB_occlusion_query
(defglextfun ("glEndQueryARB" end-query-arb) :void
  (target enum))

;;; GL version: 1.5, ARB_occlusion_query
(defglextfun ("glGetQueryivARB" get-query-iv-arb) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.5, ARB_occlusion_query
(defglextfun ("glGetQueryObjectivARB" get-query-object-iv-arb) :void
  (id uint)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.5, ARB_occlusion_query
(defglextfun ("glGetQueryObjectuivARB" get-query-object-uiv-arb) :void
  (id uint)
  (pname enum)
  (params (:pointer uint)))

;;; GL version: 1.2, ARB_shader_objects
(defglextfun ("glDeleteObjectARB" delete-object-arb) :void
  (obj handle-arb))

;;; GL version: 1.2, ARB_shader_objects
(defglextfun ("glGetHandleARB" get-handle-arb) handle-arb
  (pname enum))

;;; GL version: 1.2, ARB_shader_objects
(defglextfun ("glDetachObjectARB" detach-object-arb) :void
  (containerObj handle-arb)
  (attachedObj handle-arb))

;;; GL version: 1.2, ARB_shader_objects
(defglextfun ("glCreateShaderObjectARB" create-shader-object-arb) handle-arb
  (shaderType enum))

;;; GL version: 1.2, ARB_shader_objects
(defglextfun ("glShaderSourceARB" shader-source-arb) :void
  (shaderObj handle-arb)
  (count sizei)
  (string (:pointer (:pointer char-arb)))
  (length (:pointer int)))

;;; GL version: 1.2, ARB_shader_objects
(defglextfun ("glCompileShaderARB" compile-shader-arb) :void
  (shaderObj handle-arb))

;;; GL version: 1.2, ARB_shader_objects
(defglextfun ("glCreateProgramObjectARB" create-program-object-arb) handle-arb)

;;; GL version: 1.2, ARB_shader_objects
(defglextfun ("glAttachObjectARB" attach-object-arb) :void
  (containerObj handle-arb)
  (obj handle-arb))

;;; GL version: 1.2, ARB_shader_objects
(defglextfun ("glLinkProgramARB" link-program-arb) :void
  (programObj handle-arb))

;;; GL version: 1.2, ARB_shader_objects
(defglextfun ("glUseProgramObjectARB" use-program-object-arb) :void
  (programObj handle-arb))

;;; GL version: 1.2, ARB_shader_objects
(defglextfun ("glValidateProgramARB" validate-program-arb) :void
  (programObj handle-arb))

;;; GL version: 1.2, ARB_shader_objects
(defglextfun ("glUniform1fARB" uniform-1f-arb) :void
  (location int)
  (v0 float))

;;; GL version: 1.2, ARB_shader_objects
(defglextfun ("glUniform2fARB" uniform-2f-arb) :void
  (location int)
  (v0 float)
  (v1 float))

;;; GL version: 1.2, ARB_shader_objects
(defglextfun ("glUniform3fARB" uniform-3f-arb) :void
  (location int)
  (v0 float)
  (v1 float)
  (v2 float))

;;; GL version: 1.2, ARB_shader_objects
(defglextfun ("glUniform4fARB" uniform-4f-arb) :void
  (location int)
  (v0 float)
  (v1 float)
  (v2 float)
  (v3 float))

;;; GL version: 1.2, ARB_shader_objects
(defglextfun ("glUniform1iARB" uniform-1i-arb) :void
  (location int)
  (v0 int))

;;; GL version: 1.2, ARB_shader_objects
(defglextfun ("glUniform2iARB" uniform-2i-arb) :void
  (location int)
  (v0 int)
  (v1 int))

;;; GL version: 1.2, ARB_shader_objects
(defglextfun ("glUniform3iARB" uniform-3i-arb) :void
  (location int)
  (v0 int)
  (v1 int)
  (v2 int))

;;; GL version: 1.2, ARB_shader_objects
(defglextfun ("glUniform4iARB" uniform-4i-arb) :void
  (location int)
  (v0 int)
  (v1 int)
  (v2 int)
  (v3 int))

;;; GL version: 1.2, ARB_shader_objects
(defglextfun ("glUniform1fvARB" uniform-1fv-arb) :void
  (location int)
  (count sizei)
  (value (:pointer float)))

;;; GL version: 1.2, ARB_shader_objects
(defglextfun ("glUniform2fvARB" uniform-2fv-arb) :void
  (location int)
  (count sizei)
  (value (:pointer float)))

;;; GL version: 1.2, ARB_shader_objects
(defglextfun ("glUniform3fvARB" uniform-3fv-arb) :void
  (location int)
  (count sizei)
  (value (:pointer float)))

;;; GL version: 1.2, ARB_shader_objects
(defglextfun ("glUniform4fvARB" uniform-4fv-arb) :void
  (location int)
  (count sizei)
  (value (:pointer float)))

;;; GL version: 1.2, ARB_shader_objects
(defglextfun ("glUniform1ivARB" uniform-1iv-arb) :void
  (location int)
  (count sizei)
  (value (:pointer int)))

;;; GL version: 1.2, ARB_shader_objects
(defglextfun ("glUniform2ivARB" uniform-2iv-arb) :void
  (location int)
  (count sizei)
  (value (:pointer int)))

;;; GL version: 1.2, ARB_shader_objects
(defglextfun ("glUniform3ivARB" uniform-3iv-arb) :void
  (location int)
  (count sizei)
  (value (:pointer int)))

;;; GL version: 1.2, ARB_shader_objects
(defglextfun ("glUniform4ivARB" uniform-4iv-arb) :void
  (location int)
  (count sizei)
  (value (:pointer int)))

;;; GL version: 1.2, ARB_shader_objects
(defglextfun ("glUniformMatrix2fvARB" uniform-matrix-2fv-arb) :void
  (location int)
  (count sizei)
  (transpose boolean)
  (value (:pointer float)))

;;; GL version: 1.2, ARB_shader_objects
(defglextfun ("glUniformMatrix3fvARB" uniform-matrix-3fv-arb) :void
  (location int)
  (count sizei)
  (transpose boolean)
  (value (:pointer float)))

;;; GL version: 1.2, ARB_shader_objects
(defglextfun ("glUniformMatrix4fvARB" uniform-matrix-4fv-arb) :void
  (location int)
  (count sizei)
  (transpose boolean)
  (value (:pointer float)))

;;; GL version: 1.2, ARB_shader_objects
(defglextfun ("glGetObjectParameterfvARB" get-object-parameter-fv-arb) :void
  (obj handle-arb)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.2, ARB_shader_objects
(defglextfun ("glGetObjectParameterivARB" get-object-parameter-iv-arb) :void
  (obj handle-arb)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.2, ARB_shader_objects
(defglextfun ("glGetInfoLogARB" get-info-log-arb) :void
  (obj handle-arb)
  (maxLength sizei)
  (length (:pointer sizei))
  (infoLog (:pointer char-arb)))

;;; GL version: 1.2, ARB_shader_objects
(defglextfun ("glGetAttachedObjectsARB" get-attached-objects-arb) :void
  (containerObj handle-arb)
  (maxCount sizei)
  (count (:pointer sizei))
  (obj (:pointer handle-arb)))

;;; GL version: 1.2, ARB_shader_objects
(defglextfun ("glGetUniformLocationARB" get-uniform-location-arb) int
  (programObj handle-arb)
  (name (:pointer char-arb)))

;;; GL version: 1.2, ARB_shader_objects
(defglextfun ("glGetActiveUniformARB" get-active-uniform-arb) :void
  (programObj handle-arb)
  (index uint)
  (maxLength sizei)
  (length (:pointer sizei))
  (size (:pointer int))
  (type (:pointer enum))
  (name (:pointer char-arb)))

;;; GL version: 1.2, ARB_shader_objects
(defglextfun ("glGetUniformfvARB" get-uniform-fv-arb) :void
  (programObj handle-arb)
  (location int)
  (params (:pointer float)))

;;; GL version: 1.2, ARB_shader_objects
(defglextfun ("glGetUniformivARB" get-uniform-iv-arb) :void
  (programObj handle-arb)
  (location int)
  (params (:pointer int)))

;;; GL version: 1.2, ARB_shader_objects
(defglextfun ("glGetShaderSourceARB" get-shader-source-arb) :void
  (obj handle-arb)
  (maxLength sizei)
  (length (:pointer sizei))
  (source (:pointer char-arb)))

;;; GL version: 1.2, ARB_vertex_shader
(defglextfun ("glBindAttribLocationARB" bind-attrib-location-arb) :void
  (programObj handle-arb)
  (index uint)
  (name (:pointer char-arb)))

;;; GL version: 1.2, ARB_vertex_shader
(defglextfun ("glGetActiveAttribARB" get-active-attrib-arb) :void
  (programObj handle-arb)
  (index uint)
  (maxLength sizei)
  (length (:pointer sizei))
  (size (:pointer int))
  (type (:pointer enum))
  (name (:pointer char-arb)))

;;; GL version: 1.2, ARB_vertex_shader
(defglextfun ("glGetAttribLocationARB" get-attrib-location-arb) int
  (programObj handle-arb)
  (name (:pointer char-arb)))

;;; GL version: 1.5, ARB_draw_buffers
(defglextfun ("glDrawBuffersARB" draw-buffers-arb) :void
  (n sizei)
  (bufs (:pointer enum)))

;;; GL version: 1.5, ARB_color_buffer_float
(defglextfun ("glClampColorARB" clamp-color-arb) :void
  (target enum)
  (clamp enum))

;;; GL version: 1.0, EXT_blend_color
(defglextfun ("glBlendColorEXT" blend-color-ext) :void
  (red clampf)
  (green clampf)
  (blue clampf)
  (alpha clampf))

;;; GL version: 1.0, EXT_polygon_offset
(defglextfun ("glPolygonOffsetEXT" polygon-offset-ext) :void
  (factor float)
  (bias float))

;;; GL version: 1.0, EXT_texture3D
(defglextfun ("glTexImage3DEXT" tex-image-3d-ext) :void
  (target enum)
  (level int)
  (internalformat enum)
  (width sizei)
  (height sizei)
  (depth sizei)
  (border int)
  (format enum)
  (type enum)
  (pixels (:pointer void)))

;;; GL version: 1.0, EXT_texture3D
(defglextfun ("glTexSubImage3DEXT" tex-sub-image-3d-ext) :void
  (target enum)
  (level int)
  (xoffset int)
  (yoffset int)
  (zoffset int)
  (width sizei)
  (height sizei)
  (depth sizei)
  (format enum)
  (type enum)
  (pixels (:pointer void)))

;;; GL version: 1.0, SGIS_texture_filter4
(defglextfun ("glGetTexFilterFuncSGIS" get-tex-filter-func-sgis) :void
  (target enum)
  (filter enum)
  (weights (:pointer float)))

;;; GL version: 1.0, SGIS_texture_filter4
(defglextfun ("glTexFilterFuncSGIS" tex-filter-func-sgis) :void
  (target enum)
  (filter enum)
  (n sizei)
  (weights (:pointer float)))

;;; GL version: 1.0, EXT_subtexture
(defglextfun ("glTexSubImage1DEXT" tex-sub-image-1d-ext) :void
  (target enum)
  (level int)
  (xoffset int)
  (width sizei)
  (format enum)
  (type enum)
  (pixels (:pointer void)))

;;; GL version: 1.0, EXT_subtexture
(defglextfun ("glTexSubImage2DEXT" tex-sub-image-2d-ext) :void
  (target enum)
  (level int)
  (xoffset int)
  (yoffset int)
  (width sizei)
  (height sizei)
  (format enum)
  (type enum)
  (pixels (:pointer void)))

;;; GL version: 1.0, EXT_copy_texture
(defglextfun ("glCopyTexImage1DEXT" copy-tex-image-1d-ext) :void
  (target enum)
  (level int)
  (internalformat enum)
  (x int)
  (y int)
  (width sizei)
  (border int))

;;; GL version: 1.0, EXT_copy_texture
(defglextfun ("glCopyTexImage2DEXT" copy-tex-image-2d-ext) :void
  (target enum)
  (level int)
  (internalformat enum)
  (x int)
  (y int)
  (width sizei)
  (height sizei)
  (border int))

;;; GL version: 1.0, EXT_copy_texture
(defglextfun ("glCopyTexSubImage1DEXT" copy-tex-sub-image-1d-ext) :void
  (target enum)
  (level int)
  (xoffset int)
  (x int)
  (y int)
  (width sizei))

;;; GL version: 1.0, EXT_copy_texture
(defglextfun ("glCopyTexSubImage2DEXT" copy-tex-sub-image-2d-ext) :void
  (target enum)
  (level int)
  (xoffset int)
  (yoffset int)
  (x int)
  (y int)
  (width sizei)
  (height sizei))

;;; GL version: 1.0, EXT_copy_texture
(defglextfun ("glCopyTexSubImage3DEXT" copy-tex-sub-image-3d-ext) :void
  (target enum)
  (level int)
  (xoffset int)
  (yoffset int)
  (zoffset int)
  (x int)
  (y int)
  (width sizei)
  (height sizei))

;;; GL version: 1.0, EXT_histogram
(defglextfun ("glGetHistogramEXT" get-histogram-ext) :void
  (target enum)
  (reset boolean)
  (format enum)
  (type enum)
  (values (:pointer void)))

;;; GL version: 1.0, EXT_histogram
(defglextfun ("glGetHistogramParameterfvEXT" get-histogram-parameter-fv-ext) :void
  (target enum)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.0, EXT_histogram
(defglextfun ("glGetHistogramParameterivEXT" get-histogram-parameter-iv-ext) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.0, EXT_histogram
(defglextfun ("glGetMinmaxEXT" get-minmax-ext) :void
  (target enum)
  (reset boolean)
  (format enum)
  (type enum)
  (values (:pointer void)))

;;; GL version: 1.0, EXT_histogram
(defglextfun ("glGetMinmaxParameterfvEXT" get-minmax-parameter-fv-ext) :void
  (target enum)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.0, EXT_histogram
(defglextfun ("glGetMinmaxParameterivEXT" get-minmax-parameter-iv-ext) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.0, EXT_histogram
(defglextfun ("glHistogramEXT" histogram-ext) :void
  (target enum)
  (width sizei)
  (internalformat enum)
  (sink boolean))

;;; GL version: 1.0, EXT_histogram
(defglextfun ("glMinmaxEXT" minmax-ext) :void
  (target enum)
  (internalformat enum)
  (sink boolean))

;;; GL version: 1.0, EXT_histogram
(defglextfun ("glResetHistogramEXT" reset-histogram-ext) :void
  (target enum))

;;; GL version: 1.0, EXT_histogram
(defglextfun ("glResetMinmaxEXT" reset-minmax-ext) :void
  (target enum))

;;; GL version: 1.0, EXT_convolution
(defglextfun ("glConvolutionFilter1DEXT" convolution-filter-1d-ext) :void
  (target enum)
  (internalformat enum)
  (width sizei)
  (format enum)
  (type enum)
  (image (:pointer void)))

;;; GL version: 1.0, EXT_convolution
(defglextfun ("glConvolutionFilter2DEXT" convolution-filter-2d-ext) :void
  (target enum)
  (internalformat enum)
  (width sizei)
  (height sizei)
  (format enum)
  (type enum)
  (image (:pointer void)))

;;; GL version: 1.0, EXT_convolution
(defglextfun ("glConvolutionParameterfEXT" convolution-parameter-f-ext) :void
  (target enum)
  (pname enum)
  (params float))

;;; GL version: 1.0, EXT_convolution
(defglextfun ("glConvolutionParameterfvEXT" convolution-parameter-fv-ext) :void
  (target enum)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.0, EXT_convolution
(defglextfun ("glConvolutionParameteriEXT" convolution-parameter-i-ext) :void
  (target enum)
  (pname enum)
  (params int))

;;; GL version: 1.0, EXT_convolution
(defglextfun ("glConvolutionParameterivEXT" convolution-parameter-iv-ext) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.0, EXT_convolution
(defglextfun ("glCopyConvolutionFilter1DEXT" copy-convolution-filter-1d-ext) :void
  (target enum)
  (internalformat enum)
  (x int)
  (y int)
  (width sizei))

;;; GL version: 1.0, EXT_convolution
(defglextfun ("glCopyConvolutionFilter2DEXT" copy-convolution-filter-2d-ext) :void
  (target enum)
  (internalformat enum)
  (x int)
  (y int)
  (width sizei)
  (height sizei))

;;; GL version: 1.0, EXT_convolution
(defglextfun ("glGetConvolutionFilterEXT" get-convolution-filter-ext) :void
  (target enum)
  (format enum)
  (type enum)
  (image (:pointer void)))

;;; GL version: 1.0, EXT_convolution
(defglextfun ("glGetConvolutionParameterfvEXT" get-convolution-parameter-fv-ext) :void
  (target enum)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.0, EXT_convolution
(defglextfun ("glGetConvolutionParameterivEXT" get-convolution-parameter-iv-ext) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.0, EXT_convolution
(defglextfun ("glGetSeparableFilterEXT" get-separable-filter-ext) :void
  (target enum)
  (format enum)
  (type enum)
  (row (:pointer void))
  (column (:pointer void))
  (span (:pointer void)))

;;; GL version: 1.0, EXT_convolution
(defglextfun ("glSeparableFilter2DEXT" separable-filter-2d-ext) :void
  (target enum)
  (internalformat enum)
  (width sizei)
  (height sizei)
  (format enum)
  (type enum)
  (row (:pointer void))
  (column (:pointer void)))

;;; GL version: 1.0, SGI_color_table
(defglextfun ("glColorTableSGI" color-table-sgi) :void
  (target enum)
  (internalformat enum)
  (width sizei)
  (format enum)
  (type enum)
  (table (:pointer void)))

;;; GL version: 1.0, SGI_color_table
(defglextfun ("glColorTableParameterfvSGI" color-table-parameter-fv-sgi) :void
  (target enum)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.0, SGI_color_table
(defglextfun ("glColorTableParameterivSGI" color-table-parameter-iv-sgi) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.0, SGI_color_table
(defglextfun ("glCopyColorTableSGI" copy-color-table-sgi) :void
  (target enum)
  (internalformat enum)
  (x int)
  (y int)
  (width sizei))

;;; GL version: 1.0, SGI_color_table
(defglextfun ("glGetColorTableSGI" get-color-table-sgi) :void
  (target enum)
  (format enum)
  (type enum)
  (table (:pointer void)))

;;; GL version: 1.0, SGI_color_table
(defglextfun ("glGetColorTableParameterfvSGI" get-color-table-parameter-fv-sgi) :void
  (target enum)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.0, SGI_color_table
(defglextfun ("glGetColorTableParameterivSGI" get-color-table-parameter-iv-sgi) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.0, SGIX_pixel_texture
(defglextfun ("glPixelTexGenSGIX" pixel-tex-gen-sgix) :void
  (mode enum))

;;; GL version: 1.0, SGIS_pixel_texture
(defglextfun ("glPixelTexGenParameteriSGIS" pixel-tex-gen-parameter-i-sgis) :void
  (pname enum)
  (param int))

;;; GL version: 1.0, SGIS_pixel_texture
(defglextfun ("glPixelTexGenParameterivSGIS" pixel-tex-gen-parameter-iv-sgis) :void
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.0, SGIS_pixel_texture
(defglextfun ("glPixelTexGenParameterfSGIS" pixel-tex-gen-parameter-f-sgis) :void
  (pname enum)
  (param float))

;;; GL version: 1.0, SGIS_pixel_texture
(defglextfun ("glPixelTexGenParameterfvSGIS" pixel-tex-gen-parameter-fv-sgis) :void
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.0, SGIS_pixel_texture
(defglextfun ("glGetPixelTexGenParameterivSGIS" get-pixel-tex-gen-parameter-iv-sgis) :void
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.0, SGIS_pixel_texture
(defglextfun ("glGetPixelTexGenParameterfvSGIS" get-pixel-tex-gen-parameter-fv-sgis) :void
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.0, SGIS_texture4D
(defglextfun ("glTexImage4DSGIS" tex-image-4d-sgis) :void
  (target enum)
  (level int)
  (internalformat enum)
  (width sizei)
  (height sizei)
  (depth sizei)
  (size4d sizei)
  (border int)
  (format enum)
  (type enum)
  (pixels (:pointer void)))

;;; GL version: 1.0, SGIS_texture4D
(defglextfun ("glTexSubImage4DSGIS" tex-sub-image-4d-sgis) :void
  (target enum)
  (level int)
  (xoffset int)
  (yoffset int)
  (zoffset int)
  (woffset int)
  (width sizei)
  (height sizei)
  (depth sizei)
  (size4d sizei)
  (format enum)
  (type enum)
  (pixels (:pointer void)))

;;; GL version: 1.0, EXT_texture_object
(defglextfun ("glAreTexturesResidentEXT" are-textures-resident-ext) boolean
  (n sizei)
  (textures (:pointer uint))
  (residences (:pointer boolean)))

;;; GL version: 1.0, EXT_texture_object
(defglextfun ("glBindTextureEXT" bind-texture-ext) :void
  (target enum)
  (texture uint))

;;; GL version: 1.0, EXT_texture_object
(defglextfun ("glDeleteTexturesEXT" delete-textures-ext) :void
  (n sizei)
  (textures (:pointer uint)))

;;; GL version: 1.0, EXT_texture_object
(defglextfun ("glGenTexturesEXT" gen-textures-ext) :void
  (n sizei)
  (textures (:pointer uint)))

;;; GL version: 1.0, EXT_texture_object
(defglextfun ("glIsTextureEXT" is-texture-ext) boolean
  (texture uint))

;;; GL version: 1.0, EXT_texture_object
(defglextfun ("glPrioritizeTexturesEXT" prioritize-textures-ext) :void
  (n sizei)
  (textures (:pointer uint))
  (priorities (:pointer clampf)))

;;; GL version: 1.0, SGIS_detail_texture
(defglextfun ("glDetailTexFuncSGIS" detail-tex-func-sgis) :void
  (target enum)
  (n sizei)
  (points (:pointer float)))

;;; GL version: 1.0, SGIS_detail_texture
(defglextfun ("glGetDetailTexFuncSGIS" get-detail-tex-func-sgis) :void
  (target enum)
  (points (:pointer float)))

;;; GL version: 1.0, SGIS_sharpen_texture
(defglextfun ("glSharpenTexFuncSGIS" sharpen-tex-func-sgis) :void
  (target enum)
  (n sizei)
  (points (:pointer float)))

;;; GL version: 1.0, SGIS_sharpen_texture
(defglextfun ("glGetSharpenTexFuncSGIS" get-sharpen-tex-func-sgis) :void
  (target enum)
  (points (:pointer float)))

;;; GL version: 1.1, SGIS_multisample
(defglextfun ("glSampleMaskSGIS" sample-mask-sgis) :void
  (value clampf)
  (invert boolean))

;;; GL version: 1.0, SGIS_multisample
(defglextfun ("glSamplePatternSGIS" sample-pattern-sgis) :void
  (pattern enum))

;;; GL version: 1.0, EXT_vertex_array
(defglextfun ("glArrayElementEXT" array-element-ext) :void
  (i int))

;;; GL version: 1.0, EXT_vertex_array
(defglextfun ("glColorPointerEXT" color-pointer-ext) :void
  (size int)
  (type enum)
  (stride sizei)
  (count sizei)
  (pointer (:pointer void)))

;;; GL version: 1.0, EXT_vertex_array
(defglextfun ("glDrawArraysEXT" draw-arrays-ext) :void
  (mode enum)
  (first int)
  (count sizei))

;;; GL version: 1.0, EXT_vertex_array
(defglextfun ("glEdgeFlagPointerEXT" edge-flag-pointer-ext) :void
  (stride sizei)
  (count sizei)
  (pointer (:pointer boolean)))

;;; GL version: 1.0, EXT_vertex_array
(defglextfun ("glGetPointervEXT" get-pointer-v-ext) :void
  (pname enum)
  (params (:pointer (:pointer void))))

;;; GL version: 1.0, EXT_vertex_array
(defglextfun ("glIndexPointerEXT" index-pointer-ext) :void
  (type enum)
  (stride sizei)
  (count sizei)
  (pointer (:pointer void)))

;;; GL version: 1.0, EXT_vertex_array
(defglextfun ("glNormalPointerEXT" normal-pointer-ext) :void
  (type enum)
  (stride sizei)
  (count sizei)
  (pointer (:pointer void)))

;;; GL version: 1.0, EXT_vertex_array
(defglextfun ("glTexCoordPointerEXT" tex-coord-pointer-ext) :void
  (size int)
  (type enum)
  (stride sizei)
  (count sizei)
  (pointer (:pointer void)))

;;; GL version: 1.0, EXT_vertex_array
(defglextfun ("glVertexPointerEXT" vertex-pointer-ext) :void
  (size int)
  (type enum)
  (stride sizei)
  (count sizei)
  (pointer (:pointer void)))

;;; GL version: 1.0, EXT_blend_minmax
(defglextfun ("glBlendEquationEXT" blend-equation-ext) :void
  (mode enum))

;;; GL version: 1.0, SGIX_sprite
(defglextfun ("glSpriteParameterfSGIX" sprite-parameter-f-sgix) :void
  (pname enum)
  (param float))

;;; GL version: 1.0, SGIX_sprite
(defglextfun ("glSpriteParameterfvSGIX" sprite-parameter-fv-sgix) :void
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.0, SGIX_sprite
(defglextfun ("glSpriteParameteriSGIX" sprite-parameter-i-sgix) :void
  (pname enum)
  (param int))

;;; GL version: 1.0, SGIX_sprite
(defglextfun ("glSpriteParameterivSGIX" sprite-parameter-iv-sgix) :void
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.0, EXT_point_parameters
(defglextfun ("glPointParameterfEXT" point-parameter-f-ext) :void
  (pname enum)
  (param float))

;;; GL version: 1.0, EXT_point_parameters
(defglextfun ("glPointParameterfvEXT" point-parameter-fv-ext) :void
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.0, SGIS_point_parameters
(defglextfun ("glPointParameterfSGIS" point-parameter-f-sgis) :void
  (pname enum)
  (param float))

;;; GL version: 1.0, SGIS_point_parameters
(defglextfun ("glPointParameterfvSGIS" point-parameter-fv-sgis) :void
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.0, SGIX_instruments
(defglextfun ("glGetInstrumentsSGIX" get-instruments-sgix) int)

;;; GL version: 1.0, SGIX_instruments
(defglextfun ("glInstrumentsBufferSGIX" instruments-buffer-sgix) :void
  (size sizei)
  (buffer (:pointer int)))

;;; GL version: 1.0, SGIX_instruments
(defglextfun ("glPollInstrumentsSGIX" poll-instruments-sgix) int
  (marker_p (:pointer int)))

;;; GL version: 1.0, SGIX_instruments
(defglextfun ("glReadInstrumentsSGIX" read-instruments-sgix) :void
  (marker int))

;;; GL version: 1.0, SGIX_instruments
(defglextfun ("glStartInstrumentsSGIX" start-instruments-sgix) :void)

;;; GL version: 1.0, SGIX_instruments
(defglextfun ("glStopInstrumentsSGIX" stop-instruments-sgix) :void
  (marker int))

;;; GL version: 1.0, SGIX_framezoom
(defglextfun ("glFrameZoomSGIX" frame-zoom-sgix) :void
  (factor int))

;;; GL version: 1.0, SGIX_tag_sample_buffer
(defglextfun ("glTagSampleBufferSGIX" tag-sample-buffer-sgix) :void)

;;; GL version: 1.0, SGIX_polynomial_ffd
(defglextfun ("glDeformationMap3dSGIX" deformation-map-3d-sgix) :void
  (target enum)
  (u1 double)
  (u2 double)
  (ustride int)
  (uorder int)
  (v1 double)
  (v2 double)
  (vstride int)
  (vorder int)
  (w1 double)
  (w2 double)
  (wstride int)
  (worder int)
  (points (:pointer double)))

;;; GL version: 1.0, SGIX_polynomial_ffd
(defglextfun ("glDeformationMap3fSGIX" deformation-map-3f-sgix) :void
  (target enum)
  (u1 float)
  (u2 float)
  (ustride int)
  (uorder int)
  (v1 float)
  (v2 float)
  (vstride int)
  (vorder int)
  (w1 float)
  (w2 float)
  (wstride int)
  (worder int)
  (points (:pointer float)))

;;; GL version: 1.0, SGIX_polynomial_ffd
(defglextfun ("glDeformSGIX" deform-sgix) :void
  (mask bitfield))

;;; GL version: 1.0, SGIX_polynomial_ffd
(defglextfun ("glLoadIdentityDeformationMapSGIX" load-identity-deformation-map-sgix) :void
  (mask bitfield))

;;; GL version: 1.0, SGIX_reference_plane
(defglextfun ("glReferencePlaneSGIX" reference-plane-sgix) :void
  (equation (:pointer double)))

;;; GL version: 1.0, SGIX_flush_raster
(defglextfun ("glFlushRasterSGIX" flush-raster-sgix) :void)

;;; GL version: 1.1, SGIS_fog_function
(defglextfun ("glFogFuncSGIS" fog-func-sgis) :void
  (n sizei)
  (points (:pointer float)))

;;; GL version: 1.1, SGIS_fog_function
(defglextfun ("glGetFogFuncSGIS" get-fog-func-sgis) :void
  (points (:pointer float)))

;;; GL version: 1.1, HP_image_transform
(defglextfun ("glImageTransformParameteriHP" image-transform-parameter-i-hp) :void
  (target enum)
  (pname enum)
  (param int))

;;; GL version: 1.1, HP_image_transform
(defglextfun ("glImageTransformParameterfHP" image-transform-parameter-f-hp) :void
  (target enum)
  (pname enum)
  (param float))

;;; GL version: 1.1, HP_image_transform
(defglextfun ("glImageTransformParameterivHP" image-transform-parameter-iv-hp) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.1, HP_image_transform
(defglextfun ("glImageTransformParameterfvHP" image-transform-parameter-fv-hp) :void
  (target enum)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.1, HP_image_transform
(defglextfun ("glGetImageTransformParameterivHP" get-image-transform-parameter-iv-hp) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.1, HP_image_transform
(defglextfun ("glGetImageTransformParameterfvHP" get-image-transform-parameter-fv-hp) :void
  (target enum)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.2, EXT_color_subtable
(defglextfun ("glColorSubTableEXT" color-sub-table-ext) :void
  (target enum)
  (start sizei)
  (count sizei)
  (format enum)
  (type enum)
  (data (:pointer void)))

;;; GL version: 1.2, EXT_color_subtable
(defglextfun ("glCopyColorSubTableEXT" copy-color-sub-table-ext) :void
  (target enum)
  (start sizei)
  (x int)
  (y int)
  (width sizei))

;;; GL version: 1.1, PGI_misc_hints
(defglextfun ("glHintPGI" hint-pgi) :void
  (target enum)
  (mode int))

;;; GL version: 1.1, EXT_paletted_texture
(defglextfun ("glColorTableEXT" color-table-ext) :void
  (target enum)
  (internalFormat enum)
  (width sizei)
  (format enum)
  (type enum)
  (table (:pointer void)))

;;; GL version: 1.1, EXT_paletted_texture
(defglextfun ("glGetColorTableEXT" get-color-table-ext) :void
  (target enum)
  (format enum)
  (type enum)
  (data (:pointer void)))

;;; GL version: 1.1, EXT_paletted_texture
(defglextfun ("glGetColorTableParameterivEXT" get-color-table-parameter-iv-ext) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.1, EXT_paletted_texture
(defglextfun ("glGetColorTableParameterfvEXT" get-color-table-parameter-fv-ext) :void
  (target enum)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.0, SGIX_list_priority
(defglextfun ("glGetListParameterfvSGIX" get-list-parameter-fv-sgix) :void
  (list uint)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.0, SGIX_list_priority
(defglextfun ("glGetListParameterivSGIX" get-list-parameter-iv-sgix) :void
  (list uint)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.0, SGIX_list_priority
(defglextfun ("glListParameterfSGIX" list-parameter-f-sgix) :void
  (list uint)
  (pname enum)
  (param float))

;;; GL version: 1.0, SGIX_list_priority
(defglextfun ("glListParameterfvSGIX" list-parameter-fv-sgix) :void
  (list uint)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.0, SGIX_list_priority
(defglextfun ("glListParameteriSGIX" list-parameter-i-sgix) :void
  (list uint)
  (pname enum)
  (param int))

;;; GL version: 1.0, SGIX_list_priority
(defglextfun ("glListParameterivSGIX" list-parameter-iv-sgix) :void
  (list uint)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.1, EXT_index_material
(defglextfun ("glIndexMaterialEXT" index-material-ext) :void
  (face enum)
  (mode enum))

;;; GL version: 1.1, EXT_index_func
(defglextfun ("glIndexFuncEXT" index-func-ext) :void
  (func enum)
  (ref clampf))

;;; GL version: 1.1, EXT_compiled_vertex_array
(defglextfun ("glLockArraysEXT" lock-arrays-ext) :void
  (first int)
  (count sizei))

;;; GL version: 1.1, EXT_compiled_vertex_array
(defglextfun ("glUnlockArraysEXT" unlock-arrays-ext) :void)

;;; GL version: 1.1, EXT_cull_vertex
(defglextfun ("glCullParameterdvEXT" cull-parameter-dv-ext) :void
  (pname enum)
  (params (:pointer double)))

;;; GL version: 1.1, EXT_cull_vertex
(defglextfun ("glCullParameterfvEXT" cull-parameter-fv-ext) :void
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.0, SGIX_fragment_lighting
(defglextfun ("glFragmentColorMaterialSGIX" fragment-color-material-sgix) :void
  (face enum)
  (mode enum))

;;; GL version: 1.0, SGIX_fragment_lighting
(defglextfun ("glFragmentLightfSGIX" fragment-light-f-sgix) :void
  (light enum)
  (pname enum)
  (param float))

;;; GL version: 1.0, SGIX_fragment_lighting
(defglextfun ("glFragmentLightfvSGIX" fragment-light-fv-sgix) :void
  (light enum)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.0, SGIX_fragment_lighting
(defglextfun ("glFragmentLightiSGIX" fragment-light-i-sgix) :void
  (light enum)
  (pname enum)
  (param int))

;;; GL version: 1.0, SGIX_fragment_lighting
(defglextfun ("glFragmentLightivSGIX" fragment-light-iv-sgix) :void
  (light enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.0, SGIX_fragment_lighting
(defglextfun ("glFragmentLightModelfSGIX" fragment-light-model-f-sgix) :void
  (pname enum)
  (param float))

;;; GL version: 1.0, SGIX_fragment_lighting
(defglextfun ("glFragmentLightModelfvSGIX" fragment-light-model-fv-sgix) :void
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.0, SGIX_fragment_lighting
(defglextfun ("glFragmentLightModeliSGIX" fragment-light-model-i-sgix) :void
  (pname enum)
  (param int))

;;; GL version: 1.0, SGIX_fragment_lighting
(defglextfun ("glFragmentLightModelivSGIX" fragment-light-model-iv-sgix) :void
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.0, SGIX_fragment_lighting
(defglextfun ("glFragmentMaterialfSGIX" fragment-material-f-sgix) :void
  (face enum)
  (pname enum)
  (param float))

;;; GL version: 1.0, SGIX_fragment_lighting
(defglextfun ("glFragmentMaterialfvSGIX" fragment-material-fv-sgix) :void
  (face enum)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.0, SGIX_fragment_lighting
(defglextfun ("glFragmentMaterialiSGIX" fragment-material-i-sgix) :void
  (face enum)
  (pname enum)
  (param int))

;;; GL version: 1.0, SGIX_fragment_lighting
(defglextfun ("glFragmentMaterialivSGIX" fragment-material-iv-sgix) :void
  (face enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.0, SGIX_fragment_lighting
(defglextfun ("glGetFragmentLightfvSGIX" get-fragment-light-fv-sgix) :void
  (light enum)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.0, SGIX_fragment_lighting
(defglextfun ("glGetFragmentLightivSGIX" get-fragment-light-iv-sgix) :void
  (light enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.0, SGIX_fragment_lighting
(defglextfun ("glGetFragmentMaterialfvSGIX" get-fragment-material-fv-sgix) :void
  (face enum)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.0, SGIX_fragment_lighting
(defglextfun ("glGetFragmentMaterialivSGIX" get-fragment-material-iv-sgix) :void
  (face enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.0, SGIX_fragment_lighting
(defglextfun ("glLightEnviSGIX" light-env-i-sgix) :void
  (pname enum)
  (param int))

;;; GL version: 1.1, EXT_draw_range_elements
(defglextfun ("glDrawRangeElementsEXT" draw-range-elements-ext) :void
  (mode enum)
  (start uint)
  (end uint)
  (count sizei)
  (type enum)
  (indices (:pointer void)))

;;; GL version: 1.1, EXT_light_texture
(defglextfun ("glApplyTextureEXT" apply-texture-ext) :void
  (mode enum))

;;; GL version: 1.1, EXT_light_texture
(defglextfun ("glTextureLightEXT" texture-light-ext) :void
  (pname enum))

;;; GL version: 1.1, EXT_light_texture
(defglextfun ("glTextureMaterialEXT" texture-material-ext) :void
  (face enum)
  (mode enum))

;;; GL version: 1.0, SGIX_async
(defglextfun ("glAsyncMarkerSGIX" async-marker-sgix) :void
  (marker uint))

;;; GL version: 1.0, SGIX_async
(defglextfun ("glFinishAsyncSGIX" finish-async-sgix) int
  (markerp (:pointer uint)))

;;; GL version: 1.0, SGIX_async
(defglextfun ("glPollAsyncSGIX" poll-async-sgix) int
  (markerp (:pointer uint)))

;;; GL version: 1.0, SGIX_async
(defglextfun ("glGenAsyncMarkersSGIX" gen-async-markers-sgix) uint
  (range sizei))

;;; GL version: 1.0, SGIX_async
(defglextfun ("glDeleteAsyncMarkersSGIX" delete-async-markers-sgix) :void
  (marker uint)
  (range sizei))

;;; GL version: 1.0, SGIX_async
(defglextfun ("glIsAsyncMarkerSGIX" is-async-marker-sgix) boolean
  (marker uint))

;;; GL version: 1.1, INTEL_parallel_arrays
(defglextfun ("glVertexPointervINTEL" vertex-pointer-v-intel) :void
  (size int)
  (type enum)
  (pointer (:pointer (:pointer void))))

;;; GL version: 1.1, INTEL_parallel_arrays
(defglextfun ("glNormalPointervINTEL" normal-pointer-v-intel) :void
  (type enum)
  (pointer (:pointer (:pointer void))))

;;; GL version: 1.1, INTEL_parallel_arrays
(defglextfun ("glColorPointervINTEL" color-pointer-v-intel) :void
  (size int)
  (type enum)
  (pointer (:pointer (:pointer void))))

;;; GL version: 1.1, INTEL_parallel_arrays
(defglextfun ("glTexCoordPointervINTEL" tex-coord-pointer-v-intel) :void
  (size int)
  (type enum)
  (pointer (:pointer (:pointer void))))

;;; GL version: 1.1, EXT_pixel_transform
(defglextfun ("glPixelTransformParameteriEXT" pixel-transform-parameter-i-ext) :void
  (target enum)
  (pname enum)
  (param int))

;;; GL version: 1.1, EXT_pixel_transform
(defglextfun ("glPixelTransformParameterfEXT" pixel-transform-parameter-f-ext) :void
  (target enum)
  (pname enum)
  (param float))

;;; GL version: 1.1, EXT_pixel_transform
(defglextfun ("glPixelTransformParameterivEXT" pixel-transform-parameter-iv-ext) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.1, EXT_pixel_transform
(defglextfun ("glPixelTransformParameterfvEXT" pixel-transform-parameter-fv-ext) :void
  (target enum)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.1, EXT_secondary_color
(defglextfun ("glSecondaryColor3bEXT" secondary-color-3b-ext) :void
  (red byte)
  (green byte)
  (blue byte))

;;; GL version: 1.1, EXT_secondary_color
(defglextfun ("glSecondaryColor3bvEXT" secondary-color-3bv-ext) :void
  (v (:pointer byte)))

;;; GL version: 1.1, EXT_secondary_color
(defglextfun ("glSecondaryColor3dEXT" secondary-color-3d-ext) :void
  (red double)
  (green double)
  (blue double))

;;; GL version: 1.1, EXT_secondary_color
(defglextfun ("glSecondaryColor3dvEXT" secondary-color-3dv-ext) :void
  (v (:pointer double)))

;;; GL version: 1.1, EXT_secondary_color
(defglextfun ("glSecondaryColor3fEXT" secondary-color-3f-ext) :void
  (red float)
  (green float)
  (blue float))

;;; GL version: 1.1, EXT_secondary_color
(defglextfun ("glSecondaryColor3fvEXT" secondary-color-3fv-ext) :void
  (v (:pointer float)))

;;; GL version: 1.1, EXT_secondary_color
(defglextfun ("glSecondaryColor3iEXT" secondary-color-3i-ext) :void
  (red int)
  (green int)
  (blue int))

;;; GL version: 1.1, EXT_secondary_color
(defglextfun ("glSecondaryColor3ivEXT" secondary-color-3iv-ext) :void
  (v (:pointer int)))

;;; GL version: 1.1, EXT_secondary_color
(defglextfun ("glSecondaryColor3sEXT" secondary-color-3s-ext) :void
  (red short)
  (green short)
  (blue short))

;;; GL version: 1.1, EXT_secondary_color
(defglextfun ("glSecondaryColor3svEXT" secondary-color-3sv-ext) :void
  (v (:pointer short)))

;;; GL version: 1.1, EXT_secondary_color
(defglextfun ("glSecondaryColor3ubEXT" secondary-color-3ub-ext) :void
  (red ubyte)
  (green ubyte)
  (blue ubyte))

;;; GL version: 1.1, EXT_secondary_color
(defglextfun ("glSecondaryColor3ubvEXT" secondary-color-3ubv-ext) :void
  (v (:pointer ubyte)))

;;; GL version: 1.1, EXT_secondary_color
(defglextfun ("glSecondaryColor3uiEXT" secondary-color-3ui-ext) :void
  (red uint)
  (green uint)
  (blue uint))

;;; GL version: 1.1, EXT_secondary_color
(defglextfun ("glSecondaryColor3uivEXT" secondary-color-3uiv-ext) :void
  (v (:pointer uint)))

;;; GL version: 1.1, EXT_secondary_color
(defglextfun ("glSecondaryColor3usEXT" secondary-color-3us-ext) :void
  (red ushort)
  (green ushort)
  (blue ushort))

;;; GL version: 1.1, EXT_secondary_color
(defglextfun ("glSecondaryColor3usvEXT" secondary-color-3usv-ext) :void
  (v (:pointer ushort)))

;;; GL version: 1.1, EXT_secondary_color
(defglextfun ("glSecondaryColorPointerEXT" secondary-color-pointer-ext) :void
  (size int)
  (type enum)
  (stride sizei)
  (pointer (:pointer void)))

;;; GL version: 1.1, EXT_texture_perturb_normal
(defglextfun ("glTextureNormalEXT" texture-normal-ext) :void
  (mode enum))

;;; GL version: 1.1, EXT_multi_draw_arrays
(defglextfun ("glMultiDrawArraysEXT" multi-draw-arrays-ext) :void
  (mode enum)
  (first (:pointer int))
  (count (:pointer sizei))
  (primcount sizei))

;;; GL version: 1.1, EXT_multi_draw_arrays
(defglextfun ("glMultiDrawElementsEXT" multi-draw-elements-ext) :void
  (mode enum)
  (count (:pointer sizei))
  (type enum)
  (indices (:pointer (:pointer void)))
  (primcount sizei))

;;; GL version: 1.1, EXT_fog_coord
(defglextfun ("glFogCoordfEXT" fog-coord-f-ext) :void
  (coord float))

;;; GL version: 1.1, EXT_fog_coord
(defglextfun ("glFogCoordfvEXT" fog-coord-fv-ext) :void
  (coord (:pointer float)))

;;; GL version: 1.1, EXT_fog_coord
(defglextfun ("glFogCoorddEXT" fog-coord-d-ext) :void
  (coord double))

;;; GL version: 1.1, EXT_fog_coord
(defglextfun ("glFogCoorddvEXT" fog-coord-dv-ext) :void
  (coord (:pointer double)))

;;; GL version: 1.1, EXT_fog_coord
(defglextfun ("glFogCoordPointerEXT" fog-coord-pointer-ext) :void
  (type enum)
  (stride sizei)
  (pointer (:pointer void)))

;;; GL version: 1.1, EXT_coordinate_frame
(defglextfun ("glTangent3bEXT" tangent-3b-ext) :void
  (tx byte)
  (ty byte)
  (tz byte))

;;; GL version: 1.1, EXT_coordinate_frame
(defglextfun ("glTangent3bvEXT" tangent-3bv-ext) :void
  (v (:pointer byte)))

;;; GL version: 1.1, EXT_coordinate_frame
(defglextfun ("glTangent3dEXT" tangent-3d-ext) :void
  (tx double)
  (ty double)
  (tz double))

;;; GL version: 1.1, EXT_coordinate_frame
(defglextfun ("glTangent3dvEXT" tangent-3dv-ext) :void
  (v (:pointer double)))

;;; GL version: 1.1, EXT_coordinate_frame
(defglextfun ("glTangent3fEXT" tangent-3f-ext) :void
  (tx float)
  (ty float)
  (tz float))

;;; GL version: 1.1, EXT_coordinate_frame
(defglextfun ("glTangent3fvEXT" tangent-3fv-ext) :void
  (v (:pointer float)))

;;; GL version: 1.1, EXT_coordinate_frame
(defglextfun ("glTangent3iEXT" tangent-3i-ext) :void
  (tx int)
  (ty int)
  (tz int))

;;; GL version: 1.1, EXT_coordinate_frame
(defglextfun ("glTangent3ivEXT" tangent-3iv-ext) :void
  (v (:pointer int)))

;;; GL version: 1.1, EXT_coordinate_frame
(defglextfun ("glTangent3sEXT" tangent-3s-ext) :void
  (tx short)
  (ty short)
  (tz short))

;;; GL version: 1.1, EXT_coordinate_frame
(defglextfun ("glTangent3svEXT" tangent-3sv-ext) :void
  (v (:pointer short)))

;;; GL version: 1.1, EXT_coordinate_frame
(defglextfun ("glBinormal3bEXT" binormal-3b-ext) :void
  (bx byte)
  (by byte)
  (bz byte))

;;; GL version: 1.1, EXT_coordinate_frame
(defglextfun ("glBinormal3bvEXT" binormal-3bv-ext) :void
  (v (:pointer byte)))

;;; GL version: 1.1, EXT_coordinate_frame
(defglextfun ("glBinormal3dEXT" binormal-3d-ext) :void
  (bx double)
  (by double)
  (bz double))

;;; GL version: 1.1, EXT_coordinate_frame
(defglextfun ("glBinormal3dvEXT" binormal-3dv-ext) :void
  (v (:pointer double)))

;;; GL version: 1.1, EXT_coordinate_frame
(defglextfun ("glBinormal3fEXT" binormal-3f-ext) :void
  (bx float)
  (by float)
  (bz float))

;;; GL version: 1.1, EXT_coordinate_frame
(defglextfun ("glBinormal3fvEXT" binormal-3fv-ext) :void
  (v (:pointer float)))

;;; GL version: 1.1, EXT_coordinate_frame
(defglextfun ("glBinormal3iEXT" binormal-3i-ext) :void
  (bx int)
  (by int)
  (bz int))

;;; GL version: 1.1, EXT_coordinate_frame
(defglextfun ("glBinormal3ivEXT" binormal-3iv-ext) :void
  (v (:pointer int)))

;;; GL version: 1.1, EXT_coordinate_frame
(defglextfun ("glBinormal3sEXT" binormal-3s-ext) :void
  (bx short)
  (by short)
  (bz short))

;;; GL version: 1.1, EXT_coordinate_frame
(defglextfun ("glBinormal3svEXT" binormal-3sv-ext) :void
  (v (:pointer short)))

;;; GL version: 1.1, EXT_coordinate_frame
(defglextfun ("glTangentPointerEXT" tangent-pointer-ext) :void
  (type enum)
  (stride sizei)
  (pointer (:pointer void)))

;;; GL version: 1.1, EXT_coordinate_frame
(defglextfun ("glBinormalPointerEXT" binormal-pointer-ext) :void
  (type enum)
  (stride sizei)
  (pointer (:pointer void)))

;;; GL version: 1.1, SUNX_constant_data
(defglextfun ("glFinishTextureSUNX" finish-texture-sunx) :void)

;;; GL version: 1.1, SUN_global_alpha
(defglextfun ("glGlobalAlphaFactorbSUN" global-alpha-factor-b-sun) :void
  (factor byte))

;;; GL version: 1.1, SUN_global_alpha
(defglextfun ("glGlobalAlphaFactorsSUN" global-alpha-factor-s-sun) :void
  (factor short))

;;; GL version: 1.1, SUN_global_alpha
(defglextfun ("glGlobalAlphaFactoriSUN" global-alpha-factor-i-sun) :void
  (factor int))

;;; GL version: 1.1, SUN_global_alpha
(defglextfun ("glGlobalAlphaFactorfSUN" global-alpha-factor-f-sun) :void
  (factor float))

;;; GL version: 1.1, SUN_global_alpha
(defglextfun ("glGlobalAlphaFactordSUN" global-alpha-factor-d-sun) :void
  (factor double))

;;; GL version: 1.1, SUN_global_alpha
(defglextfun ("glGlobalAlphaFactorubSUN" global-alpha-factor-ub-sun) :void
  (factor ubyte))

;;; GL version: 1.1, SUN_global_alpha
(defglextfun ("glGlobalAlphaFactorusSUN" global-alpha-factor-us-sun) :void
  (factor ushort))

;;; GL version: 1.1, SUN_global_alpha
(defglextfun ("glGlobalAlphaFactoruiSUN" global-alpha-factor-ui-sun) :void
  (factor uint))

;;; GL version: 1.1, SUN_triangle_list
(defglextfun ("glReplacementCodeuiSUN" replacement-code-ui-sun) :void
  (code uint))

;;; GL version: 1.1, SUN_triangle_list
(defglextfun ("glReplacementCodeusSUN" replacement-code-us-sun) :void
  (code ushort))

;;; GL version: 1.1, SUN_triangle_list
(defglextfun ("glReplacementCodeubSUN" replacement-code-ub-sun) :void
  (code ubyte))

;;; GL version: 1.1, SUN_triangle_list
(defglextfun ("glReplacementCodeuivSUN" replacement-code-uiv-sun) :void
  (code (:pointer uint)))

;;; GL version: 1.1, SUN_triangle_list
(defglextfun ("glReplacementCodeusvSUN" replacement-code-usv-sun) :void
  (code (:pointer ushort)))

;;; GL version: 1.1, SUN_triangle_list
(defglextfun ("glReplacementCodeubvSUN" replacement-code-ubv-sun) :void
  (code (:pointer ubyte)))

;;; GL version: 1.1, SUN_triangle_list
(defglextfun ("glReplacementCodePointerSUN" replacement-code-pointer-sun) :void
  (type enum)
  (stride sizei)
  (pointer (:pointer (:pointer void))))

;;; GL version: 1.1, SUN_vertex
(defglextfun ("glColor4ubVertex2fSUN" color-4ub-vertex-2f-sun) :void
  (r ubyte)
  (g ubyte)
  (b ubyte)
  (a ubyte)
  (x float)
  (y float))

;;; GL version: 1.1, SUN_vertex
(defglextfun ("glColor4ubVertex2fvSUN" color-4ub-vertex-2fv-sun) :void
  (c (:pointer ubyte))
  (v (:pointer float)))

;;; GL version: 1.1, SUN_vertex
(defglextfun ("glColor4ubVertex3fSUN" color-4ub-vertex-3f-sun) :void
  (r ubyte)
  (g ubyte)
  (b ubyte)
  (a ubyte)
  (x float)
  (y float)
  (z float))

;;; GL version: 1.1, SUN_vertex
(defglextfun ("glColor4ubVertex3fvSUN" color-4ub-vertex-3fv-sun) :void
  (c (:pointer ubyte))
  (v (:pointer float)))

;;; GL version: 1.1, SUN_vertex
(defglextfun ("glColor3fVertex3fSUN" color-3f-vertex-3f-sun) :void
  (r float)
  (g float)
  (b float)
  (x float)
  (y float)
  (z float))

;;; GL version: 1.1, SUN_vertex
(defglextfun ("glColor3fVertex3fvSUN" color-3f-vertex-3fv-sun) :void
  (c (:pointer float))
  (v (:pointer float)))

;;; GL version: 1.1, SUN_vertex
(defglextfun ("glNormal3fVertex3fSUN" normal-3f-vertex-3f-sun) :void
  (nx float)
  (ny float)
  (nz float)
  (x float)
  (y float)
  (z float))

;;; GL version: 1.1, SUN_vertex
(defglextfun ("glNormal3fVertex3fvSUN" normal-3f-vertex-3fv-sun) :void
  (n (:pointer float))
  (v (:pointer float)))

;;; GL version: 1.1, SUN_vertex
(defglextfun ("glColor4fNormal3fVertex3fSUN" color-4f-normal-3f-vertex-3f-sun) :void
  (r float)
  (g float)
  (b float)
  (a float)
  (nx float)
  (ny float)
  (nz float)
  (x float)
  (y float)
  (z float))

;;; GL version: 1.1, SUN_vertex
(defglextfun ("glColor4fNormal3fVertex3fvSUN" color-4f-normal-3f-vertex-3fv-sun) :void
  (c (:pointer float))
  (n (:pointer float))
  (v (:pointer float)))

;;; GL version: 1.1, SUN_vertex
(defglextfun ("glTexCoord2fVertex3fSUN" tex-coord-2f-vertex-3f-sun) :void
  (s float)
  (tee float)
  (x float)
  (y float)
  (z float))

;;; GL version: 1.1, SUN_vertex
(defglextfun ("glTexCoord2fVertex3fvSUN" tex-coord-2f-vertex-3fv-sun) :void
  (tc (:pointer float))
  (v (:pointer float)))

;;; GL version: 1.1, SUN_vertex
(defglextfun ("glTexCoord4fVertex4fSUN" tex-coord-4f-vertex-4f-sun) :void
  (s float)
  (tee float)
  (p float)
  (q float)
  (x float)
  (y float)
  (z float)
  (w float))

;;; GL version: 1.1, SUN_vertex
(defglextfun ("glTexCoord4fVertex4fvSUN" tex-coord-4f-vertex-4fv-sun) :void
  (tc (:pointer float))
  (v (:pointer float)))

;;; GL version: 1.1, SUN_vertex
(defglextfun ("glTexCoord2fColor4ubVertex3fSUN" tex-coord-2f-color-4ub-vertex-3f-sun) :void
  (s float)
  (tee float)
  (r ubyte)
  (g ubyte)
  (b ubyte)
  (a ubyte)
  (x float)
  (y float)
  (z float))

;;; GL version: 1.1, SUN_vertex
(defglextfun ("glTexCoord2fColor4ubVertex3fvSUN" tex-coord-2f-color-4ub-vertex-3fv-sun) :void
  (tc (:pointer float))
  (c (:pointer ubyte))
  (v (:pointer float)))

;;; GL version: 1.1, SUN_vertex
(defglextfun ("glTexCoord2fColor3fVertex3fSUN" tex-coord-2f-color-3f-vertex-3f-sun) :void
  (s float)
  (tee float)
  (r float)
  (g float)
  (b float)
  (x float)
  (y float)
  (z float))

;;; GL version: 1.1, SUN_vertex
(defglextfun ("glTexCoord2fColor3fVertex3fvSUN" tex-coord-2f-color-3f-vertex-3fv-sun) :void
  (tc (:pointer float))
  (c (:pointer float))
  (v (:pointer float)))

;;; GL version: 1.1, SUN_vertex
(defglextfun ("glTexCoord2fNormal3fVertex3fSUN" tex-coord-2f-normal-3f-vertex-3f-sun) :void
  (s float)
  (tee float)
  (nx float)
  (ny float)
  (nz float)
  (x float)
  (y float)
  (z float))

;;; GL version: 1.1, SUN_vertex
(defglextfun ("glTexCoord2fNormal3fVertex3fvSUN" tex-coord-2f-normal-3f-vertex-3fv-sun) :void
  (tc (:pointer float))
  (n (:pointer float))
  (v (:pointer float)))

;;; GL version: 1.1, SUN_vertex
(defglextfun ("glTexCoord2fColor4fNormal3fVertex3fSUN" tex-coord-2f-color-4f-normal-3f-vertex-3f-sun) :void
  (s float)
  (tee float)
  (r float)
  (g float)
  (b float)
  (a float)
  (nx float)
  (ny float)
  (nz float)
  (x float)
  (y float)
  (z float))

;;; GL version: 1.1, SUN_vertex
(defglextfun ("glTexCoord2fColor4fNormal3fVertex3fvSUN" tex-coord-2f-color-4f-normal-3f-vertex-3fv-sun) :void
  (tc (:pointer float))
  (c (:pointer float))
  (n (:pointer float))
  (v (:pointer float)))

;;; GL version: 1.1, SUN_vertex
(defglextfun ("glTexCoord4fColor4fNormal3fVertex4fSUN" tex-coord-4f-color-4f-normal-3f-vertex-4f-sun) :void
  (s float)
  (tee float)
  (p float)
  (q float)
  (r float)
  (g float)
  (b float)
  (a float)
  (nx float)
  (ny float)
  (nz float)
  (x float)
  (y float)
  (z float)
  (w float))

;;; GL version: 1.1, SUN_vertex
(defglextfun ("glTexCoord4fColor4fNormal3fVertex4fvSUN" tex-coord-4f-color-4f-normal-3f-vertex-4fv-sun) :void
  (tc (:pointer float))
  (c (:pointer float))
  (n (:pointer float))
  (v (:pointer float)))

;;; GL version: 1.1, SUN_vertex
(defglextfun ("glReplacementCodeuiVertex3fSUN" replacement-code-ui-vertex-3f-sun) :void
  (rc uint)
  (x float)
  (y float)
  (z float))

;;; GL version: 1.1, SUN_vertex
(defglextfun ("glReplacementCodeuiVertex3fvSUN" replacement-code-ui-vertex-3fv-sun) :void
  (rc (:pointer uint))
  (v (:pointer float)))

;;; GL version: 1.1, SUN_vertex
(defglextfun ("glReplacementCodeuiColor4ubVertex3fSUN" replacement-code-ui-color-4ub-vertex-3f-sun) :void
  (rc uint)
  (r ubyte)
  (g ubyte)
  (b ubyte)
  (a ubyte)
  (x float)
  (y float)
  (z float))

;;; GL version: 1.1, SUN_vertex
(defglextfun ("glReplacementCodeuiColor4ubVertex3fvSUN" replacement-code-ui-color-4ub-vertex-3fv-sun) :void
  (rc (:pointer uint))
  (c (:pointer ubyte))
  (v (:pointer float)))

;;; GL version: 1.1, SUN_vertex
(defglextfun ("glReplacementCodeuiColor3fVertex3fSUN" replacement-code-ui-color-3f-vertex-3f-sun) :void
  (rc uint)
  (r float)
  (g float)
  (b float)
  (x float)
  (y float)
  (z float))

;;; GL version: 1.1, SUN_vertex
(defglextfun ("glReplacementCodeuiColor3fVertex3fvSUN" replacement-code-ui-color-3f-vertex-3fv-sun) :void
  (rc (:pointer uint))
  (c (:pointer float))
  (v (:pointer float)))

;;; GL version: 1.1, SUN_vertex
(defglextfun ("glReplacementCodeuiNormal3fVertex3fSUN" replacement-code-ui-normal-3f-vertex-3f-sun) :void
  (rc uint)
  (nx float)
  (ny float)
  (nz float)
  (x float)
  (y float)
  (z float))

;;; GL version: 1.1, SUN_vertex
(defglextfun ("glReplacementCodeuiNormal3fVertex3fvSUN" replacement-code-ui-normal-3f-vertex-3fv-sun) :void
  (rc (:pointer uint))
  (n (:pointer float))
  (v (:pointer float)))

;;; GL version: 1.1, SUN_vertex
(defglextfun ("glReplacementCodeuiColor4fNormal3fVertex3fSUN" replacement-code-ui-color-4f-normal-3f-vertex-3f-sun) :void
  (rc uint)
  (r float)
  (g float)
  (b float)
  (a float)
  (nx float)
  (ny float)
  (nz float)
  (x float)
  (y float)
  (z float))

;;; GL version: 1.1, SUN_vertex
(defglextfun ("glReplacementCodeuiColor4fNormal3fVertex3fvSUN" replacement-code-ui-color-4f-normal-3f-vertex-3fv-sun) :void
  (rc (:pointer uint))
  (c (:pointer float))
  (n (:pointer float))
  (v (:pointer float)))

;;; GL version: 1.1, SUN_vertex
(defglextfun ("glReplacementCodeuiTexCoord2fVertex3fSUN" replacement-code-ui-tex-coord-2f-vertex-3f-sun) :void
  (rc uint)
  (s float)
  (tee float)
  (x float)
  (y float)
  (z float))

;;; GL version: 1.1, SUN_vertex
(defglextfun ("glReplacementCodeuiTexCoord2fVertex3fvSUN" replacement-code-ui-tex-coord-2f-vertex-3fv-sun) :void
  (rc (:pointer uint))
  (tc (:pointer float))
  (v (:pointer float)))

;;; GL version: 1.1, SUN_vertex
(defglextfun ("glReplacementCodeuiTexCoord2fNormal3fVertex3fSUN" replacement-code-ui-tex-coord-2f-normal-3f-vertex-3f-sun) :void
  (rc uint)
  (s float)
  (tee float)
  (nx float)
  (ny float)
  (nz float)
  (x float)
  (y float)
  (z float))

;;; GL version: 1.1, SUN_vertex
(defglextfun ("glReplacementCodeuiTexCoord2fNormal3fVertex3fvSUN" replacement-code-ui-tex-coord-2f-normal-3f-vertex-3fv-sun) :void
  (rc (:pointer uint))
  (tc (:pointer float))
  (n (:pointer float))
  (v (:pointer float)))

;;; GL version: 1.1, SUN_vertex
(defglextfun ("glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fSUN" replacement-code-ui-tex-coord-2f-color-4f-normal-3f-vertex-3f-sun) :void
  (rc uint)
  (s float)
  (tee float)
  (r float)
  (g float)
  (b float)
  (a float)
  (nx float)
  (ny float)
  (nz float)
  (x float)
  (y float)
  (z float))

;;; GL version: 1.1, SUN_vertex
(defglextfun ("glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fvSUN" replacement-code-ui-tex-coord-2f-color-4f-normal-3f-vertex-3fv-sun) :void
  (rc (:pointer uint))
  (tc (:pointer float))
  (c (:pointer float))
  (n (:pointer float))
  (v (:pointer float)))

;;; GL version: 1.0, EXT_blend_func_separate
(defglextfun ("glBlendFuncSeparateEXT" blend-func-separate-ext) :void
  (sfactorRGB enum)
  (dfactorRGB enum)
  (sfactorAlpha enum)
  (dfactorAlpha enum))

;;; GL version: 1.0, INGR_blend_func_separate
(defglextfun ("glBlendFuncSeparateINGR" blend-func-separate-ingr) :void
  (sfactorRGB enum)
  (dfactorRGB enum)
  (sfactorAlpha enum)
  (dfactorAlpha enum))

;;; GL version: 1.1, EXT_vertex_weighting
(defglextfun ("glVertexWeightfEXT" vertex-weight-f-ext) :void
  (weight float))

;;; GL version: 1.1, EXT_vertex_weighting
(defglextfun ("glVertexWeightfvEXT" vertex-weight-fv-ext) :void
  (weight (:pointer float)))

;;; GL version: 1.1, EXT_vertex_weighting
(defglextfun ("glVertexWeightPointerEXT" vertex-weight-pointer-ext) :void
  (size sizei)
  (type enum)
  (stride sizei)
  (pointer (:pointer void)))

;;; GL version: 1.1, NV_vertex_array_range
(defglextfun ("glFlushVertexArrayRangeNV" flush-vertex-array-range-nv) :void)

;;; GL version: 1.1, NV_vertex_array_range
(defglextfun ("glVertexArrayRangeNV" vertex-array-range-nv) :void
  (length sizei)
  (pointer (:pointer void)))

;;; GL version: 1.1, NV_register_combiners
(defglextfun ("glCombinerParameterfvNV" combiner-parameter-fv-nv) :void
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.1, NV_register_combiners
(defglextfun ("glCombinerParameterfNV" combiner-parameter-f-nv) :void
  (pname enum)
  (param float))

;;; GL version: 1.1, NV_register_combiners
(defglextfun ("glCombinerParameterivNV" combiner-parameter-iv-nv) :void
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.1, NV_register_combiners
(defglextfun ("glCombinerParameteriNV" combiner-parameter-i-nv) :void
  (pname enum)
  (param int))

;;; GL version: 1.1, NV_register_combiners
(defglextfun ("glCombinerInputNV" combiner-input-nv) :void
  (stage enum)
  (portion enum)
  (variable enum)
  (input enum)
  (mapping enum)
  (componentUsage enum))

;;; GL version: 1.1, NV_register_combiners
(defglextfun ("glCombinerOutputNV" combiner-output-nv) :void
  (stage enum)
  (portion enum)
  (abOutput enum)
  (cdOutput enum)
  (sumOutput enum)
  (scale enum)
  (bias enum)
  (abDotProduct boolean)
  (cdDotProduct boolean)
  (muxSum boolean))

;;; GL version: 1.1, NV_register_combiners
(defglextfun ("glFinalCombinerInputNV" final-combiner-input-nv) :void
  (variable enum)
  (input enum)
  (mapping enum)
  (componentUsage enum))

;;; GL version: 1.1, NV_register_combiners
(defglextfun ("glGetCombinerInputParameterfvNV" get-combiner-input-parameter-fv-nv) :void
  (stage enum)
  (portion enum)
  (variable enum)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.1, NV_register_combiners
(defglextfun ("glGetCombinerInputParameterivNV" get-combiner-input-parameter-iv-nv) :void
  (stage enum)
  (portion enum)
  (variable enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.1, NV_register_combiners
(defglextfun ("glGetCombinerOutputParameterfvNV" get-combiner-output-parameter-fv-nv) :void
  (stage enum)
  (portion enum)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.1, NV_register_combiners
(defglextfun ("glGetCombinerOutputParameterivNV" get-combiner-output-parameter-iv-nv) :void
  (stage enum)
  (portion enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.1, NV_register_combiners
(defglextfun ("glGetFinalCombinerInputParameterfvNV" get-final-combiner-input-parameter-fv-nv) :void
  (variable enum)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.1, NV_register_combiners
(defglextfun ("glGetFinalCombinerInputParameterivNV" get-final-combiner-input-parameter-iv-nv) :void
  (variable enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.0, MESA_resize_buffers
(defglextfun ("glResizeBuffersMESA" resize-buffers-mesa) :void)

;;; GL version: 1.0, MESA_window_pos
(defglextfun ("glWindowPos2dMESA" window-pos-2d-mesa) :void
  (x double)
  (y double))

;;; GL version: 1.0, MESA_window_pos
(defglextfun ("glWindowPos2dvMESA" window-pos-2dv-mesa) :void
  (v (:pointer double)))

;;; GL version: 1.0, MESA_window_pos
(defglextfun ("glWindowPos2fMESA" window-pos-2f-mesa) :void
  (x float)
  (y float))

;;; GL version: 1.0, MESA_window_pos
(defglextfun ("glWindowPos2fvMESA" window-pos-2fv-mesa) :void
  (v (:pointer float)))

;;; GL version: 1.0, MESA_window_pos
(defglextfun ("glWindowPos2iMESA" window-pos-2i-mesa) :void
  (x int)
  (y int))

;;; GL version: 1.0, MESA_window_pos
(defglextfun ("glWindowPos2ivMESA" window-pos-2iv-mesa) :void
  (v (:pointer int)))

;;; GL version: 1.0, MESA_window_pos
(defglextfun ("glWindowPos2sMESA" window-pos-2s-mesa) :void
  (x short)
  (y short))

;;; GL version: 1.0, MESA_window_pos
(defglextfun ("glWindowPos2svMESA" window-pos-2sv-mesa) :void
  (v (:pointer short)))

;;; GL version: 1.0, MESA_window_pos
(defglextfun ("glWindowPos3dMESA" window-pos-3d-mesa) :void
  (x double)
  (y double)
  (z double))

;;; GL version: 1.0, MESA_window_pos
(defglextfun ("glWindowPos3dvMESA" window-pos-3dv-mesa) :void
  (v (:pointer double)))

;;; GL version: 1.0, MESA_window_pos
(defglextfun ("glWindowPos3fMESA" window-pos-3f-mesa) :void
  (x float)
  (y float)
  (z float))

;;; GL version: 1.0, MESA_window_pos
(defglextfun ("glWindowPos3fvMESA" window-pos-3fv-mesa) :void
  (v (:pointer float)))

;;; GL version: 1.0, MESA_window_pos
(defglextfun ("glWindowPos3iMESA" window-pos-3i-mesa) :void
  (x int)
  (y int)
  (z int))

;;; GL version: 1.0, MESA_window_pos
(defglextfun ("glWindowPos3ivMESA" window-pos-3iv-mesa) :void
  (v (:pointer int)))

;;; GL version: 1.0, MESA_window_pos
(defglextfun ("glWindowPos3sMESA" window-pos-3s-mesa) :void
  (x short)
  (y short)
  (z short))

;;; GL version: 1.0, MESA_window_pos
(defglextfun ("glWindowPos3svMESA" window-pos-3sv-mesa) :void
  (v (:pointer short)))

;;; GL version: 1.0, MESA_window_pos
(defglextfun ("glWindowPos4dMESA" window-pos-4d-mesa) :void
  (x double)
  (y double)
  (z double)
  (w double))

;;; GL version: 1.0, MESA_window_pos
(defglextfun ("glWindowPos4dvMESA" window-pos-4dv-mesa) :void
  (v (:pointer double)))

;;; GL version: 1.0, MESA_window_pos
(defglextfun ("glWindowPos4fMESA" window-pos-4f-mesa) :void
  (x float)
  (y float)
  (z float)
  (w float))

;;; GL version: 1.0, MESA_window_pos
(defglextfun ("glWindowPos4fvMESA" window-pos-4fv-mesa) :void
  (v (:pointer float)))

;;; GL version: 1.0, MESA_window_pos
(defglextfun ("glWindowPos4iMESA" window-pos-4i-mesa) :void
  (x int)
  (y int)
  (z int)
  (w int))

;;; GL version: 1.0, MESA_window_pos
(defglextfun ("glWindowPos4ivMESA" window-pos-4iv-mesa) :void
  (v (:pointer int)))

;;; GL version: 1.0, MESA_window_pos
(defglextfun ("glWindowPos4sMESA" window-pos-4s-mesa) :void
  (x short)
  (y short)
  (z short)
  (w short))

;;; GL version: 1.0, MESA_window_pos
(defglextfun ("glWindowPos4svMESA" window-pos-4sv-mesa) :void
  (v (:pointer short)))

;;; GL version: 1.1, IBM_multimode_draw_arrays
(defglextfun ("glMultiModeDrawArraysIBM" multi-mode-draw-arrays-ibm) :void
  (mode (:pointer enum))
  (first (:pointer int))
  (count (:pointer sizei))
  (primcount sizei)
  (modestride int))

;;; GL version: 1.1, IBM_multimode_draw_arrays
(defglextfun ("glMultiModeDrawElementsIBM" multi-mode-draw-elements-ibm) :void
  (mode (:pointer enum))
  (count (:pointer sizei))
  (type enum)
  (indices (:pointer (:pointer void)))
  (primcount sizei)
  (modestride int))

;;; GL version: 1.1, IBM_vertex_array_lists
(defglextfun ("glColorPointerListIBM" color-pointer-list-ibm) :void
  (size int)
  (type enum)
  (stride int)
  (pointer (:pointer (:pointer void)))
  (ptrstride int))

;;; GL version: 1.1, IBM_vertex_array_lists
(defglextfun ("glSecondaryColorPointerListIBM" secondary-color-pointer-list-ibm) :void
  (size int)
  (type enum)
  (stride int)
  (pointer (:pointer (:pointer void)))
  (ptrstride int))

;;; GL version: 1.1, IBM_vertex_array_lists
(defglextfun ("glEdgeFlagPointerListIBM" edge-flag-pointer-list-ibm) :void
  (stride int)
  (pointer (:pointer (:pointer boolean)))
  (ptrstride int))

;;; GL version: 1.1, IBM_vertex_array_lists
(defglextfun ("glFogCoordPointerListIBM" fog-coord-pointer-list-ibm) :void
  (type enum)
  (stride int)
  (pointer (:pointer (:pointer void)))
  (ptrstride int))

;;; GL version: 1.1, IBM_vertex_array_lists
(defglextfun ("glIndexPointerListIBM" index-pointer-list-ibm) :void
  (type enum)
  (stride int)
  (pointer (:pointer (:pointer void)))
  (ptrstride int))

;;; GL version: 1.1, IBM_vertex_array_lists
(defglextfun ("glNormalPointerListIBM" normal-pointer-list-ibm) :void
  (type enum)
  (stride int)
  (pointer (:pointer (:pointer void)))
  (ptrstride int))

;;; GL version: 1.1, IBM_vertex_array_lists
(defglextfun ("glTexCoordPointerListIBM" tex-coord-pointer-list-ibm) :void
  (size int)
  (type enum)
  (stride int)
  (pointer (:pointer (:pointer void)))
  (ptrstride int))

;;; GL version: 1.1, IBM_vertex_array_lists
(defglextfun ("glVertexPointerListIBM" vertex-pointer-list-ibm) :void
  (size int)
  (type enum)
  (stride int)
  (pointer (:pointer (:pointer void)))
  (ptrstride int))

;;; GL version: 1.2, 3DFX_tbuffer
(defglextfun ("glTbufferMask3DFX" tbuffer-mask-3dfx) :void
  (mask uint))

;;; GL version: 1.0, EXT_multisample
(defglextfun ("glSampleMaskEXT" sample-mask-ext) :void
  (value clampf)
  (invert boolean))

;;; GL version: 1.0, EXT_multisample
(defglextfun ("glSamplePatternEXT" sample-pattern-ext) :void
  (pattern enum))

;;; GL version: 1.1, SGIS_texture_color_mask
(defglextfun ("glTextureColorMaskSGIS" texture-color-mask-sgis) :void
  (red boolean)
  (green boolean)
  (blue boolean)
  (alpha boolean))

;;; GL version: 1.0, SGIX_igloo_interface
(defglextfun ("glIglooInterfaceSGIX" igloo-interface-sgix) :void
  (pname enum)
  (params (:pointer void)))

;;; GL version: 1.2, NV_fence
(defglextfun ("glDeleteFencesNV" delete-fences-nv) :void
  (n sizei)
  (fences (:pointer uint)))

;;; GL version: 1.2, NV_fence
(defglextfun ("glGenFencesNV" gen-fences-nv) :void
  (n sizei)
  (fences (:pointer uint)))

;;; GL version: 1.2, NV_fence
(defglextfun ("glIsFenceNV" is-fence-nv) boolean
  (fence uint))

;;; GL version: 1.2, NV_fence
(defglextfun ("glTestFenceNV" test-fence-nv) boolean
  (fence uint))

;;; GL version: 1.2, NV_fence
(defglextfun ("glGetFenceivNV" get-fence-iv-nv) :void
  (fence uint)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.2, NV_fence
(defglextfun ("glFinishFenceNV" finish-fence-nv) :void
  (fence uint))

;;; GL version: 1.2, NV_fence
(defglextfun ("glSetFenceNV" set-fence-nv) :void
  (fence uint)
  (condition enum))

;;; GL version: 1.1, NV_evaluators
(defglextfun ("glMapControlPointsNV" map-control-points-nv) :void
  (target enum)
  (index uint)
  (type enum)
  (ustride sizei)
  (vstride sizei)
  (uorder int)
  (vorder int)
  (packed boolean)
  (points (:pointer void)))

;;; GL version: 1.1, NV_evaluators
(defglextfun ("glMapParameterivNV" map-parameter-iv-nv) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.1, NV_evaluators
(defglextfun ("glMapParameterfvNV" map-parameter-fv-nv) :void
  (target enum)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.1, NV_evaluators
(defglextfun ("glGetMapControlPointsNV" get-map-control-points-nv) :void
  (target enum)
  (index uint)
  (type enum)
  (ustride sizei)
  (vstride sizei)
  (packed boolean)
  (points (:pointer void)))

;;; GL version: 1.1, NV_evaluators
(defglextfun ("glGetMapParameterivNV" get-map-parameter-iv-nv) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.1, NV_evaluators
(defglextfun ("glGetMapParameterfvNV" get-map-parameter-fv-nv) :void
  (target enum)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.1, NV_evaluators
(defglextfun ("glGetMapAttribParameterivNV" get-map-attrib-parameter-iv-nv) :void
  (target enum)
  (index uint)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.1, NV_evaluators
(defglextfun ("glGetMapAttribParameterfvNV" get-map-attrib-parameter-fv-nv) :void
  (target enum)
  (index uint)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.1, NV_evaluators
(defglextfun ("glEvalMapsNV" eval-maps-nv) :void
  (target enum)
  (mode enum))

;;; GL version: 1.1, NV_register_combiners2
(defglextfun ("glCombinerStageParameterfvNV" combiner-stage-parameter-fv-nv) :void
  (stage enum)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.1, NV_register_combiners2
(defglextfun ("glGetCombinerStageParameterfvNV" get-combiner-stage-parameter-fv-nv) :void
  (stage enum)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glAreProgramsResidentNV" are-programs-resident-nv) boolean
  (n sizei)
  (programs (:pointer uint))
  (residences (:pointer boolean)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glBindProgramNV" bind-program-nv) :void
  (target enum)
  (id uint))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glDeleteProgramsNV" delete-programs-nv) :void
  (n sizei)
  (programs (:pointer uint)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glExecuteProgramNV" execute-program-nv) :void
  (target enum)
  (id uint)
  (params (:pointer float)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glGenProgramsNV" gen-programs-nv) :void
  (n sizei)
  (programs (:pointer uint)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glGetProgramParameterdvNV" get-program-parameter-dv-nv) :void
  (target enum)
  (index uint)
  (pname enum)
  (params (:pointer double)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glGetProgramParameterfvNV" get-program-parameter-fv-nv) :void
  (target enum)
  (index uint)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glGetProgramivNV" get-program-iv-nv) :void
  (id uint)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glGetProgramStringNV" get-program-string-nv) :void
  (id uint)
  (pname enum)
  (program (:pointer ubyte)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glGetTrackMatrixivNV" get-track-matrix-iv-nv) :void
  (target enum)
  (address uint)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glGetVertexAttribdvNV" get-vertex-attrib-dv-nv) :void
  (index uint)
  (pname enum)
  (params (:pointer double)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glGetVertexAttribfvNV" get-vertex-attrib-fv-nv) :void
  (index uint)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glGetVertexAttribivNV" get-vertex-attrib-iv-nv) :void
  (index uint)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glGetVertexAttribPointervNV" get-vertex-attrib-pointer-v-nv) :void
  (index uint)
  (pname enum)
  (pointer (:pointer (:pointer void))))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glIsProgramNV" is-program-nv) boolean
  (id uint))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glLoadProgramNV" load-program-nv) :void
  (target enum)
  (id uint)
  (len sizei)
  (program (:pointer ubyte)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glProgramParameter4dNV" program-parameter-4d-nv) :void
  (target enum)
  (index uint)
  (x double)
  (y double)
  (z double)
  (w double))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glProgramParameter4dvNV" program-parameter-4dv-nv) :void
  (target enum)
  (index uint)
  (v (:pointer double)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glProgramParameter4fNV" program-parameter-4f-nv) :void
  (target enum)
  (index uint)
  (x float)
  (y float)
  (z float)
  (w float))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glProgramParameter4fvNV" program-parameter-4fv-nv) :void
  (target enum)
  (index uint)
  (v (:pointer float)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glProgramParameters4dvNV" program-parameters-4dv-nv) :void
  (target enum)
  (index uint)
  (count uint)
  (v (:pointer double)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glProgramParameters4fvNV" program-parameters-4fv-nv) :void
  (target enum)
  (index uint)
  (count uint)
  (v (:pointer float)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glRequestResidentProgramsNV" request-resident-programs-nv) :void
  (n sizei)
  (programs (:pointer uint)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glTrackMatrixNV" track-matrix-nv) :void
  (target enum)
  (address uint)
  (matrix enum)
  (transform enum))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glVertexAttribPointerNV" vertex-attrib-pointer-nv) :void
  (index uint)
  (fsize int)
  (type enum)
  (stride sizei)
  (pointer (:pointer void)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glVertexAttrib1dNV" vertex-attrib-1d-nv) :void
  (index uint)
  (x double))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glVertexAttrib1dvNV" vertex-attrib-1dv-nv) :void
  (index uint)
  (v (:pointer double)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glVertexAttrib1fNV" vertex-attrib-1f-nv) :void
  (index uint)
  (x float))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glVertexAttrib1fvNV" vertex-attrib-1fv-nv) :void
  (index uint)
  (v (:pointer float)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glVertexAttrib1sNV" vertex-attrib-1s-nv) :void
  (index uint)
  (x short))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glVertexAttrib1svNV" vertex-attrib-1sv-nv) :void
  (index uint)
  (v (:pointer short)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glVertexAttrib2dNV" vertex-attrib-2d-nv) :void
  (index uint)
  (x double)
  (y double))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glVertexAttrib2dvNV" vertex-attrib-2dv-nv) :void
  (index uint)
  (v (:pointer double)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glVertexAttrib2fNV" vertex-attrib-2f-nv) :void
  (index uint)
  (x float)
  (y float))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glVertexAttrib2fvNV" vertex-attrib-2fv-nv) :void
  (index uint)
  (v (:pointer float)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glVertexAttrib2sNV" vertex-attrib-2s-nv) :void
  (index uint)
  (x short)
  (y short))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glVertexAttrib2svNV" vertex-attrib-2sv-nv) :void
  (index uint)
  (v (:pointer short)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glVertexAttrib3dNV" vertex-attrib-3d-nv) :void
  (index uint)
  (x double)
  (y double)
  (z double))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glVertexAttrib3dvNV" vertex-attrib-3dv-nv) :void
  (index uint)
  (v (:pointer double)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glVertexAttrib3fNV" vertex-attrib-3f-nv) :void
  (index uint)
  (x float)
  (y float)
  (z float))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glVertexAttrib3fvNV" vertex-attrib-3fv-nv) :void
  (index uint)
  (v (:pointer float)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glVertexAttrib3sNV" vertex-attrib-3s-nv) :void
  (index uint)
  (x short)
  (y short)
  (z short))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glVertexAttrib3svNV" vertex-attrib-3sv-nv) :void
  (index uint)
  (v (:pointer short)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glVertexAttrib4dNV" vertex-attrib-4d-nv) :void
  (index uint)
  (x double)
  (y double)
  (z double)
  (w double))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glVertexAttrib4dvNV" vertex-attrib-4dv-nv) :void
  (index uint)
  (v (:pointer double)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glVertexAttrib4fNV" vertex-attrib-4f-nv) :void
  (index uint)
  (x float)
  (y float)
  (z float)
  (w float))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glVertexAttrib4fvNV" vertex-attrib-4fv-nv) :void
  (index uint)
  (v (:pointer float)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glVertexAttrib4sNV" vertex-attrib-4s-nv) :void
  (index uint)
  (x short)
  (y short)
  (z short)
  (w short))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glVertexAttrib4svNV" vertex-attrib-4sv-nv) :void
  (index uint)
  (v (:pointer short)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glVertexAttrib4ubNV" vertex-attrib-4ub-nv) :void
  (index uint)
  (x ubyte)
  (y ubyte)
  (z ubyte)
  (w ubyte))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glVertexAttrib4ubvNV" vertex-attrib-4ubv-nv) :void
  (index uint)
  (v (:pointer ubyte)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glVertexAttribs1dvNV" vertex-attribs-1dv-nv) :void
  (index uint)
  (count sizei)
  (v (:pointer double)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glVertexAttribs1fvNV" vertex-attribs-1fv-nv) :void
  (index uint)
  (count sizei)
  (v (:pointer float)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glVertexAttribs1svNV" vertex-attribs-1sv-nv) :void
  (index uint)
  (count sizei)
  (v (:pointer short)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glVertexAttribs2dvNV" vertex-attribs-2dv-nv) :void
  (index uint)
  (count sizei)
  (v (:pointer double)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glVertexAttribs2fvNV" vertex-attribs-2fv-nv) :void
  (index uint)
  (count sizei)
  (v (:pointer float)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glVertexAttribs2svNV" vertex-attribs-2sv-nv) :void
  (index uint)
  (count sizei)
  (v (:pointer short)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glVertexAttribs3dvNV" vertex-attribs-3dv-nv) :void
  (index uint)
  (count sizei)
  (v (:pointer double)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glVertexAttribs3fvNV" vertex-attribs-3fv-nv) :void
  (index uint)
  (count sizei)
  (v (:pointer float)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glVertexAttribs3svNV" vertex-attribs-3sv-nv) :void
  (index uint)
  (count sizei)
  (v (:pointer short)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glVertexAttribs4dvNV" vertex-attribs-4dv-nv) :void
  (index uint)
  (count sizei)
  (v (:pointer double)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glVertexAttribs4fvNV" vertex-attribs-4fv-nv) :void
  (index uint)
  (count sizei)
  (v (:pointer float)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glVertexAttribs4svNV" vertex-attribs-4sv-nv) :void
  (index uint)
  (count sizei)
  (v (:pointer short)))

;;; GL version: 1.2, NV_vertex_program
(defglextfun ("glVertexAttribs4ubvNV" vertex-attribs-4ubv-nv) :void
  (index uint)
  (count sizei)
  (v (:pointer ubyte)))

;;; GL version: 1.2, ATI_envmap_bumpmap
(defglextfun ("glTexBumpParameterivATI" tex-bump-parameter-iv-ati) :void
  (pname enum)
  (param (:pointer int)))

;;; GL version: 1.2, ATI_envmap_bumpmap
(defglextfun ("glTexBumpParameterfvATI" tex-bump-parameter-fv-ati) :void
  (pname enum)
  (param (:pointer float)))

;;; GL version: 1.2, ATI_envmap_bumpmap
(defglextfun ("glGetTexBumpParameterivATI" get-tex-bump-parameter-iv-ati) :void
  (pname enum)
  (param (:pointer int)))

;;; GL version: 1.2, ATI_envmap_bumpmap
(defglextfun ("glGetTexBumpParameterfvATI" get-tex-bump-parameter-fv-ati) :void
  (pname enum)
  (param (:pointer float)))

;;; GL version: 1.2, ATI_fragment_shader
(defglextfun ("glGenFragmentShadersATI" gen-fragment-shaders-ati) uint
  (range uint))

;;; GL version: 1.2, ATI_fragment_shader
(defglextfun ("glBindFragmentShaderATI" bind-fragment-shader-ati) :void
  (id uint))

;;; GL version: 1.2, ATI_fragment_shader
(defglextfun ("glDeleteFragmentShaderATI" delete-fragment-shader-ati) :void
  (id uint))

;;; GL version: 1.2, ATI_fragment_shader
(defglextfun ("glBeginFragmentShaderATI" begin-fragment-shader-ati) :void)

;;; GL version: 1.2, ATI_fragment_shader
(defglextfun ("glEndFragmentShaderATI" end-fragment-shader-ati) :void)

;;; GL version: 1.2, ATI_fragment_shader
(defglextfun ("glPassTexCoordATI" pass-tex-coord-ati) :void
  (dst uint)
  (coord uint)
  (swizzle enum))

;;; GL version: 1.2, ATI_fragment_shader
(defglextfun ("glSampleMapATI" sample-map-ati) :void
  (dst uint)
  (interp uint)
  (swizzle enum))

;;; GL version: 1.2, ATI_fragment_shader
(defglextfun ("glColorFragmentOp1ATI" color-fragment-op-1-ati) :void
  (op enum)
  (dst uint)
  (dstMask uint)
  (dstMod uint)
  (arg1 uint)
  (arg1Rep uint)
  (arg1Mod uint))

;;; GL version: 1.2, ATI_fragment_shader
(defglextfun ("glColorFragmentOp2ATI" color-fragment-op-2-ati) :void
  (op enum)
  (dst uint)
  (dstMask uint)
  (dstMod uint)
  (arg1 uint)
  (arg1Rep uint)
  (arg1Mod uint)
  (arg2 uint)
  (arg2Rep uint)
  (arg2Mod uint))

;;; GL version: 1.2, ATI_fragment_shader
(defglextfun ("glColorFragmentOp3ATI" color-fragment-op-3-ati) :void
  (op enum)
  (dst uint)
  (dstMask uint)
  (dstMod uint)
  (arg1 uint)
  (arg1Rep uint)
  (arg1Mod uint)
  (arg2 uint)
  (arg2Rep uint)
  (arg2Mod uint)
  (arg3 uint)
  (arg3Rep uint)
  (arg3Mod uint))

;;; GL version: 1.2, ATI_fragment_shader
(defglextfun ("glAlphaFragmentOp1ATI" alpha-fragment-op-1-ati) :void
  (op enum)
  (dst uint)
  (dstMod uint)
  (arg1 uint)
  (arg1Rep uint)
  (arg1Mod uint))

;;; GL version: 1.2, ATI_fragment_shader
(defglextfun ("glAlphaFragmentOp2ATI" alpha-fragment-op-2-ati) :void
  (op enum)
  (dst uint)
  (dstMod uint)
  (arg1 uint)
  (arg1Rep uint)
  (arg1Mod uint)
  (arg2 uint)
  (arg2Rep uint)
  (arg2Mod uint))

;;; GL version: 1.2, ATI_fragment_shader
(defglextfun ("glAlphaFragmentOp3ATI" alpha-fragment-op-3-ati) :void
  (op enum)
  (dst uint)
  (dstMod uint)
  (arg1 uint)
  (arg1Rep uint)
  (arg1Mod uint)
  (arg2 uint)
  (arg2Rep uint)
  (arg2Mod uint)
  (arg3 uint)
  (arg3Rep uint)
  (arg3Mod uint))

;;; GL version: 1.2, ATI_fragment_shader
(defglextfun ("glSetFragmentShaderConstantATI" set-fragment-shader-constant-ati) :void
  (dst uint)
  (value (:pointer float)))

;;; GL version: 1.2, ATI_pn_triangles
(defglextfun ("glPNTrianglesiATI" pntriangles-i-ati) :void
  (pname enum)
  (param int))

;;; GL version: 1.2, ATI_pn_triangles
(defglextfun ("glPNTrianglesfATI" pntriangles-f-ati) :void
  (pname enum)
  (param float))

;;; GL version: 1.2, ATI_vertex_array_object
(defglextfun ("glNewObjectBufferATI" new-object-buffer-ati) uint
  (size sizei)
  (pointer (:pointer void))
  (usage enum))

;;; GL version: 1.2, ATI_vertex_array_object
(defglextfun ("glIsObjectBufferATI" is-object-buffer-ati) boolean
  (buffer uint))

;;; GL version: 1.2, ATI_vertex_array_object
(defglextfun ("glUpdateObjectBufferATI" update-object-buffer-ati) :void
  (buffer uint)
  (offset uint)
  (size sizei)
  (pointer (:pointer void))
  (preserve enum))

;;; GL version: 1.2, ATI_vertex_array_object
(defglextfun ("glGetObjectBufferfvATI" get-object-buffer-fv-ati) :void
  (buffer uint)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.2, ATI_vertex_array_object
(defglextfun ("glGetObjectBufferivATI" get-object-buffer-iv-ati) :void
  (buffer uint)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.2, ATI_vertex_array_object
(defglextfun ("glFreeObjectBufferATI" free-object-buffer-ati) :void
  (buffer uint))

;;; GL version: 1.2, ATI_vertex_array_object
(defglextfun ("glArrayObjectATI" array-object-ati) :void
  (array enum)
  (size int)
  (type enum)
  (stride sizei)
  (buffer uint)
  (offset uint))

;;; GL version: 1.2, ATI_vertex_array_object
(defglextfun ("glGetArrayObjectfvATI" get-array-object-fv-ati) :void
  (array enum)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.2, ATI_vertex_array_object
(defglextfun ("glGetArrayObjectivATI" get-array-object-iv-ati) :void
  (array enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.2, ATI_vertex_array_object
(defglextfun ("glVariantArrayObjectATI" variant-array-object-ati) :void
  (id uint)
  (type enum)
  (stride sizei)
  (buffer uint)
  (offset uint))

;;; GL version: 1.2, ATI_vertex_array_object
(defglextfun ("glGetVariantArrayObjectfvATI" get-variant-array-object-fv-ati) :void
  (id uint)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.2, ATI_vertex_array_object
(defglextfun ("glGetVariantArrayObjectivATI" get-variant-array-object-iv-ati) :void
  (id uint)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.2, EXT_vertex_shader
(defglextfun ("glBeginVertexShaderEXT" begin-vertex-shader-ext) :void)

;;; GL version: 1.2, EXT_vertex_shader
(defglextfun ("glEndVertexShaderEXT" end-vertex-shader-ext) :void)

;;; GL version: 1.2, EXT_vertex_shader
(defglextfun ("glBindVertexShaderEXT" bind-vertex-shader-ext) :void
  (id uint))

;;; GL version: 1.2, EXT_vertex_shader
(defglextfun ("glGenVertexShadersEXT" gen-vertex-shaders-ext) uint
  (range uint))

;;; GL version: 1.2, EXT_vertex_shader
(defglextfun ("glDeleteVertexShaderEXT" delete-vertex-shader-ext) :void
  (id uint))

;;; GL version: 1.2, EXT_vertex_shader
(defglextfun ("glShaderOp1EXT" shader-op-1-ext) :void
  (op enum)
  (res uint)
  (arg1 uint))

;;; GL version: 1.2, EXT_vertex_shader
(defglextfun ("glShaderOp2EXT" shader-op-2-ext) :void
  (op enum)
  (res uint)
  (arg1 uint)
  (arg2 uint))

;;; GL version: 1.2, EXT_vertex_shader
(defglextfun ("glShaderOp3EXT" shader-op-3-ext) :void
  (op enum)
  (res uint)
  (arg1 uint)
  (arg2 uint)
  (arg3 uint))

;;; GL version: 1.2, EXT_vertex_shader
(defglextfun ("glSwizzleEXT" swizzle-ext) :void
  (res uint)
  (in uint)
  (outX enum)
  (outY enum)
  (outZ enum)
  (outW enum))

;;; GL version: 1.2, EXT_vertex_shader
(defglextfun ("glWriteMaskEXT" write-mask-ext) :void
  (res uint)
  (in uint)
  (outX enum)
  (outY enum)
  (outZ enum)
  (outW enum))

;;; GL version: 1.2, EXT_vertex_shader
(defglextfun ("glInsertComponentEXT" insert-component-ext) :void
  (res uint)
  (src uint)
  (num uint))

;;; GL version: 1.2, EXT_vertex_shader
(defglextfun ("glExtractComponentEXT" extract-component-ext) :void
  (res uint)
  (src uint)
  (num uint))

;;; GL version: 1.2, EXT_vertex_shader
(defglextfun ("glGenSymbolsEXT" gen-symbols-ext) uint
  (datatype enum)
  (storagetype enum)
  (range enum)
  (components uint))

;;; GL version: 1.2, EXT_vertex_shader
(defglextfun ("glSetInvariantEXT" set-invariant-ext) :void
  (id uint)
  (type enum)
  (addr (:pointer void)))

;;; GL version: 1.2, EXT_vertex_shader
(defglextfun ("glSetLocalConstantEXT" set-local-constant-ext) :void
  (id uint)
  (type enum)
  (addr (:pointer void)))

;;; GL version: 1.2, EXT_vertex_shader
(defglextfun ("glVariantbvEXT" variant-bv-ext) :void
  (id uint)
  (addr (:pointer byte)))

;;; GL version: 1.2, EXT_vertex_shader
(defglextfun ("glVariantsvEXT" variant-sv-ext) :void
  (id uint)
  (addr (:pointer short)))

;;; GL version: 1.2, EXT_vertex_shader
(defglextfun ("glVariantivEXT" variant-iv-ext) :void
  (id uint)
  (addr (:pointer int)))

;;; GL version: 1.2, EXT_vertex_shader
(defglextfun ("glVariantfvEXT" variant-fv-ext) :void
  (id uint)
  (addr (:pointer float)))

;;; GL version: 1.2, EXT_vertex_shader
(defglextfun ("glVariantdvEXT" variant-dv-ext) :void
  (id uint)
  (addr (:pointer double)))

;;; GL version: 1.2, EXT_vertex_shader
(defglextfun ("glVariantubvEXT" variant-ubv-ext) :void
  (id uint)
  (addr (:pointer ubyte)))

;;; GL version: 1.2, EXT_vertex_shader
(defglextfun ("glVariantusvEXT" variant-usv-ext) :void
  (id uint)
  (addr (:pointer ushort)))

;;; GL version: 1.2, EXT_vertex_shader
(defglextfun ("glVariantuivEXT" variant-uiv-ext) :void
  (id uint)
  (addr (:pointer uint)))

;;; GL version: 1.2, EXT_vertex_shader
(defglextfun ("glVariantPointerEXT" variant-pointer-ext) :void
  (id uint)
  (type enum)
  (stride uint)
  (addr (:pointer void)))

;;; GL version: 1.2, EXT_vertex_shader
(defglextfun ("glEnableVariantClientStateEXT" enable-variant-client-state-ext) :void
  (id uint))

;;; GL version: 1.2, EXT_vertex_shader
(defglextfun ("glDisableVariantClientStateEXT" disable-variant-client-state-ext) :void
  (id uint))

;;; GL version: 1.2, EXT_vertex_shader
(defglextfun ("glBindLightParameterEXT" bind-light-parameter-ext) uint
  (light enum)
  (value enum))

;;; GL version: 1.2, EXT_vertex_shader
(defglextfun ("glBindMaterialParameterEXT" bind-material-parameter-ext) uint
  (face enum)
  (value enum))

;;; GL version: 1.2, EXT_vertex_shader
(defglextfun ("glBindTexGenParameterEXT" bind-tex-gen-parameter-ext) uint
  (unit enum)
  (coord enum)
  (value enum))

;;; GL version: 1.2, EXT_vertex_shader
(defglextfun ("glBindTextureUnitParameterEXT" bind-texture-unit-parameter-ext) uint
  (unit enum)
  (value enum))

;;; GL version: 1.2, EXT_vertex_shader
(defglextfun ("glBindParameterEXT" bind-parameter-ext) uint
  (value enum))

;;; GL version: 1.2, EXT_vertex_shader
(defglextfun ("glIsVariantEnabledEXT" is-variant-enabled-ext) boolean
  (id uint)
  (cap enum))

;;; GL version: 1.2, EXT_vertex_shader
(defglextfun ("glGetVariantBooleanvEXT" get-variant-boolean-v-ext) :void
  (id uint)
  (value enum)
  (data (:pointer boolean)))

;;; GL version: 1.2, EXT_vertex_shader
(defglextfun ("glGetVariantIntegervEXT" get-variant-integer-v-ext) :void
  (id uint)
  (value enum)
  (data (:pointer int)))

;;; GL version: 1.2, EXT_vertex_shader
(defglextfun ("glGetVariantFloatvEXT" get-variant-float-v-ext) :void
  (id uint)
  (value enum)
  (data (:pointer float)))

;;; GL version: 1.2, EXT_vertex_shader
(defglextfun ("glGetVariantPointervEXT" get-variant-pointer-v-ext) :void
  (id uint)
  (value enum)
  (data (:pointer (:pointer void))))

;;; GL version: 1.2, EXT_vertex_shader
(defglextfun ("glGetInvariantBooleanvEXT" get-invariant-boolean-v-ext) :void
  (id uint)
  (value enum)
  (data (:pointer boolean)))

;;; GL version: 1.2, EXT_vertex_shader
(defglextfun ("glGetInvariantIntegervEXT" get-invariant-integer-v-ext) :void
  (id uint)
  (value enum)
  (data (:pointer int)))

;;; GL version: 1.2, EXT_vertex_shader
(defglextfun ("glGetInvariantFloatvEXT" get-invariant-float-v-ext) :void
  (id uint)
  (value enum)
  (data (:pointer float)))

;;; GL version: 1.2, EXT_vertex_shader
(defglextfun ("glGetLocalConstantBooleanvEXT" get-local-constant-boolean-v-ext) :void
  (id uint)
  (value enum)
  (data (:pointer boolean)))

;;; GL version: 1.2, EXT_vertex_shader
(defglextfun ("glGetLocalConstantIntegervEXT" get-local-constant-integer-v-ext) :void
  (id uint)
  (value enum)
  (data (:pointer int)))

;;; GL version: 1.2, EXT_vertex_shader
(defglextfun ("glGetLocalConstantFloatvEXT" get-local-constant-float-v-ext) :void
  (id uint)
  (value enum)
  (data (:pointer float)))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glVertexStream1sATI" vertex-stream-1s-ati) :void
  (stream enum)
  (x short))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glVertexStream1svATI" vertex-stream-1sv-ati) :void
  (stream enum)
  (coords (:pointer short)))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glVertexStream1iATI" vertex-stream-1i-ati) :void
  (stream enum)
  (x int))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glVertexStream1ivATI" vertex-stream-1iv-ati) :void
  (stream enum)
  (coords (:pointer int)))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glVertexStream1fATI" vertex-stream-1f-ati) :void
  (stream enum)
  (x float))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glVertexStream1fvATI" vertex-stream-1fv-ati) :void
  (stream enum)
  (coords (:pointer float)))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glVertexStream1dATI" vertex-stream-1d-ati) :void
  (stream enum)
  (x double))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glVertexStream1dvATI" vertex-stream-1dv-ati) :void
  (stream enum)
  (coords (:pointer double)))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glVertexStream2sATI" vertex-stream-2s-ati) :void
  (stream enum)
  (x short)
  (y short))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glVertexStream2svATI" vertex-stream-2sv-ati) :void
  (stream enum)
  (coords (:pointer short)))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glVertexStream2iATI" vertex-stream-2i-ati) :void
  (stream enum)
  (x int)
  (y int))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glVertexStream2ivATI" vertex-stream-2iv-ati) :void
  (stream enum)
  (coords (:pointer int)))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glVertexStream2fATI" vertex-stream-2f-ati) :void
  (stream enum)
  (x float)
  (y float))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glVertexStream2fvATI" vertex-stream-2fv-ati) :void
  (stream enum)
  (coords (:pointer float)))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glVertexStream2dATI" vertex-stream-2d-ati) :void
  (stream enum)
  (x double)
  (y double))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glVertexStream2dvATI" vertex-stream-2dv-ati) :void
  (stream enum)
  (coords (:pointer double)))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glVertexStream3sATI" vertex-stream-3s-ati) :void
  (stream enum)
  (x short)
  (y short)
  (z short))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glVertexStream3svATI" vertex-stream-3sv-ati) :void
  (stream enum)
  (coords (:pointer short)))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glVertexStream3iATI" vertex-stream-3i-ati) :void
  (stream enum)
  (x int)
  (y int)
  (z int))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glVertexStream3ivATI" vertex-stream-3iv-ati) :void
  (stream enum)
  (coords (:pointer int)))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glVertexStream3fATI" vertex-stream-3f-ati) :void
  (stream enum)
  (x float)
  (y float)
  (z float))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glVertexStream3fvATI" vertex-stream-3fv-ati) :void
  (stream enum)
  (coords (:pointer float)))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glVertexStream3dATI" vertex-stream-3d-ati) :void
  (stream enum)
  (x double)
  (y double)
  (z double))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glVertexStream3dvATI" vertex-stream-3dv-ati) :void
  (stream enum)
  (coords (:pointer double)))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glVertexStream4sATI" vertex-stream-4s-ati) :void
  (stream enum)
  (x short)
  (y short)
  (z short)
  (w short))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glVertexStream4svATI" vertex-stream-4sv-ati) :void
  (stream enum)
  (coords (:pointer short)))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glVertexStream4iATI" vertex-stream-4i-ati) :void
  (stream enum)
  (x int)
  (y int)
  (z int)
  (w int))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glVertexStream4ivATI" vertex-stream-4iv-ati) :void
  (stream enum)
  (coords (:pointer int)))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glVertexStream4fATI" vertex-stream-4f-ati) :void
  (stream enum)
  (x float)
  (y float)
  (z float)
  (w float))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glVertexStream4fvATI" vertex-stream-4fv-ati) :void
  (stream enum)
  (coords (:pointer float)))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glVertexStream4dATI" vertex-stream-4d-ati) :void
  (stream enum)
  (x double)
  (y double)
  (z double)
  (w double))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glVertexStream4dvATI" vertex-stream-4dv-ati) :void
  (stream enum)
  (coords (:pointer double)))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glNormalStream3bATI" normal-stream-3b-ati) :void
  (stream enum)
  (nx byte)
  (ny byte)
  (nz byte))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glNormalStream3bvATI" normal-stream-3bv-ati) :void
  (stream enum)
  (coords (:pointer byte)))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glNormalStream3sATI" normal-stream-3s-ati) :void
  (stream enum)
  (nx short)
  (ny short)
  (nz short))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glNormalStream3svATI" normal-stream-3sv-ati) :void
  (stream enum)
  (coords (:pointer short)))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glNormalStream3iATI" normal-stream-3i-ati) :void
  (stream enum)
  (nx int)
  (ny int)
  (nz int))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glNormalStream3ivATI" normal-stream-3iv-ati) :void
  (stream enum)
  (coords (:pointer int)))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glNormalStream3fATI" normal-stream-3f-ati) :void
  (stream enum)
  (nx float)
  (ny float)
  (nz float))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glNormalStream3fvATI" normal-stream-3fv-ati) :void
  (stream enum)
  (coords (:pointer float)))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glNormalStream3dATI" normal-stream-3d-ati) :void
  (stream enum)
  (nx double)
  (ny double)
  (nz double))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glNormalStream3dvATI" normal-stream-3dv-ati) :void
  (stream enum)
  (coords (:pointer double)))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glClientActiveVertexStreamATI" client-active-vertex-stream-ati) :void
  (stream enum))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glVertexBlendEnviATI" vertex-blend-env-i-ati) :void
  (pname enum)
  (param int))

;;; GL version: 1.2, ATI_vertex_streams
(defglextfun ("glVertexBlendEnvfATI" vertex-blend-env-f-ati) :void
  (pname enum)
  (param float))

;;; GL version: 1.2, ATI_element_array
(defglextfun ("glElementPointerATI" element-pointer-ati) :void
  (type enum)
  (pointer (:pointer void)))

;;; GL version: 1.2, ATI_element_array
(defglextfun ("glDrawElementArrayATI" draw-element-array-ati) :void
  (mode enum)
  (count sizei))

;;; GL version: 1.2, ATI_element_array
(defglextfun ("glDrawRangeElementArrayATI" draw-range-element-array-ati) :void
  (mode enum)
  (start uint)
  (end uint)
  (count sizei))

;;; GL version: 1.1, SUN_mesh_array
(defglextfun ("glDrawMeshArraysSUN" draw-mesh-arrays-sun) :void
  (mode enum)
  (first int)
  (count sizei)
  (width sizei))

;;; GL version: 1.2, NV_occlusion_query
(defglextfun ("glGenOcclusionQueriesNV" gen-occlusion-queries-nv) :void
  (n sizei)
  (ids (:pointer uint)))

;;; GL version: 1.2, NV_occlusion_query
(defglextfun ("glDeleteOcclusionQueriesNV" delete-occlusion-queries-nv) :void
  (n sizei)
  (ids (:pointer uint)))

;;; GL version: 1.2, NV_occlusion_query
(defglextfun ("glIsOcclusionQueryNV" is-occlusion-query-nv) boolean
  (id uint))

;;; GL version: 1.2, NV_occlusion_query
(defglextfun ("glBeginOcclusionQueryNV" begin-occlusion-query-nv) :void
  (id uint))

;;; GL version: 1.2, NV_occlusion_query
(defglextfun ("glEndOcclusionQueryNV" end-occlusion-query-nv) :void)

;;; GL version: 1.2, NV_occlusion_query
(defglextfun ("glGetOcclusionQueryivNV" get-occlusion-query-iv-nv) :void
  (id uint)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.2, NV_occlusion_query
(defglextfun ("glGetOcclusionQueryuivNV" get-occlusion-query-uiv-nv) :void
  (id uint)
  (pname enum)
  (params (:pointer uint)))

;;; GL version: 1.2, NV_point_sprite
(defglextfun ("glPointParameteriNV" point-parameter-i-nv) :void
  (pname enum)
  (param int))

;;; GL version: 1.2, NV_point_sprite
(defglextfun ("glPointParameterivNV" point-parameter-iv-nv) :void
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.3, EXT_stencil_two_side
(defglextfun ("glActiveStencilFaceEXT" active-stencil-face-ext) :void
  (face enum))

;;; GL version: 1.2, APPLE_element_array
(defglextfun ("glElementPointerAPPLE" element-pointer-apple) :void
  (type enum)
  (pointer (:pointer void)))

;;; GL version: 1.2, APPLE_element_array
(defglextfun ("glDrawElementArrayAPPLE" draw-element-array-apple) :void
  (mode enum)
  (first int)
  (count sizei))

;;; GL version: 1.2, APPLE_element_array
(defglextfun ("glDrawRangeElementArrayAPPLE" draw-range-element-array-apple) :void
  (mode enum)
  (start uint)
  (end uint)
  (first int)
  (count sizei))

;;; GL version: 1.2, APPLE_element_array
(defglextfun ("glMultiDrawElementArrayAPPLE" multi-draw-element-array-apple) :void
  (mode enum)
  (first (:pointer int))
  (count (:pointer sizei))
  (primcount sizei))

;;; GL version: 1.2, APPLE_element_array
(defglextfun ("glMultiDrawRangeElementArrayAPPLE" multi-draw-range-element-array-apple) :void
  (mode enum)
  (start uint)
  (end uint)
  (first (:pointer int))
  (count (:pointer sizei))
  (primcount sizei))

;;; GL version: 1.2, APPLE_fence
(defglextfun ("glGenFencesAPPLE" gen-fences-apple) :void
  (n sizei)
  (fences (:pointer uint)))

;;; GL version: 1.2, APPLE_fence
(defglextfun ("glDeleteFencesAPPLE" delete-fences-apple) :void
  (n sizei)
  (fences (:pointer uint)))

;;; GL version: 1.2, APPLE_fence
(defglextfun ("glSetFenceAPPLE" set-fence-apple) :void
  (fence uint))

;;; GL version: 1.2, APPLE_fence
(defglextfun ("glIsFenceAPPLE" is-fence-apple) boolean
  (fence uint))

;;; GL version: 1.2, APPLE_fence
(defglextfun ("glTestFenceAPPLE" test-fence-apple) boolean
  (fence uint))

;;; GL version: 1.2, APPLE_fence
(defglextfun ("glFinishFenceAPPLE" finish-fence-apple) :void
  (fence uint))

;;; GL version: 1.2, APPLE_fence
(defglextfun ("glTestObjectAPPLE" test-object-apple) boolean
  (object enum)
  (name uint))

;;; GL version: 1.2, APPLE_fence
(defglextfun ("glFinishObjectAPPLE" finish-object-apple) :void
  (object enum)
  (name int))

;;; GL version: 1.2, APPLE_vertex_array_object
(defglextfun ("glBindVertexArrayAPPLE" bind-vertex-array-apple) :void
  (array uint))

;;; GL version: 1.2, APPLE_vertex_array_object
(defglextfun ("glDeleteVertexArraysAPPLE" delete-vertex-arrays-apple) :void
  (n sizei)
  (arrays (:pointer uint)))

;;; GL version: 1.2, APPLE_vertex_array_object
(defglextfun ("glGenVertexArraysAPPLE" gen-vertex-arrays-apple) :void
  (n sizei)
  (arrays (:pointer uint)))

;;; GL version: 1.2, APPLE_vertex_array_object
(defglextfun ("glIsVertexArrayAPPLE" is-vertex-array-apple) boolean
  (array uint))

;;; GL version: 1.2, APPLE_vertex_array_range
(defglextfun ("glVertexArrayRangeAPPLE" vertex-array-range-apple) :void
  (length sizei)
  (pointer (:pointer void)))

;;; GL version: 1.2, APPLE_vertex_array_range
(defglextfun ("glFlushVertexArrayRangeAPPLE" flush-vertex-array-range-apple) :void
  (length sizei)
  (pointer (:pointer void)))

;;; GL version: 1.2, APPLE_vertex_array_range
(defglextfun ("glVertexArrayParameteriAPPLE" vertex-array-parameter-i-apple) :void
  (pname enum)
  (param int))

;;; GL version: 1.2, ATI_draw_buffers
(defglextfun ("glDrawBuffersATI" draw-buffers-ati) :void
  (n sizei)
  (bufs (:pointer enum)))

;;; GL version: 1.2, NV_fragment_program
(defglextfun ("glProgramNamedParameter4fNV" program-named-parameter-4f-nv) :void
  (id uint)
  (len sizei)
  (name (:pointer ubyte))
  (x float)
  (y float)
  (z float)
  (w float))

;;; GL version: 1.2, NV_fragment_program
(defglextfun ("glProgramNamedParameter4dNV" program-named-parameter-4d-nv) :void
  (id uint)
  (len sizei)
  (name (:pointer ubyte))
  (x double)
  (y double)
  (z double)
  (w double))

;;; GL version: 1.2, NV_fragment_program
(defglextfun ("glProgramNamedParameter4fvNV" program-named-parameter-4fv-nv) :void
  (id uint)
  (len sizei)
  (name (:pointer ubyte))
  (v (:pointer float)))

;;; GL version: 1.2, NV_fragment_program
(defglextfun ("glProgramNamedParameter4dvNV" program-named-parameter-4dv-nv) :void
  (id uint)
  (len sizei)
  (name (:pointer ubyte))
  (v (:pointer double)))

;;; GL version: 1.2, NV_fragment_program
(defglextfun ("glGetProgramNamedParameterfvNV" get-program-named-parameter-fv-nv) :void
  (id uint)
  (len sizei)
  (name (:pointer ubyte))
  (params (:pointer float)))

;;; GL version: 1.2, NV_fragment_program
(defglextfun ("glGetProgramNamedParameterdvNV" get-program-named-parameter-dv-nv) :void
  (id uint)
  (len sizei)
  (name (:pointer ubyte))
  (params (:pointer double)))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glVertex2hNV" vertex-2h-nv) :void
  (x half-nv)
  (y half-nv))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glVertex2hvNV" vertex-2hv-nv) :void
  (v (:pointer half-nv)))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glVertex3hNV" vertex-3h-nv) :void
  (x half-nv)
  (y half-nv)
  (z half-nv))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glVertex3hvNV" vertex-3hv-nv) :void
  (v (:pointer half-nv)))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glVertex4hNV" vertex-4h-nv) :void
  (x half-nv)
  (y half-nv)
  (z half-nv)
  (w half-nv))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glVertex4hvNV" vertex-4hv-nv) :void
  (v (:pointer half-nv)))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glNormal3hNV" normal-3h-nv) :void
  (nx half-nv)
  (ny half-nv)
  (nz half-nv))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glNormal3hvNV" normal-3hv-nv) :void
  (v (:pointer half-nv)))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glColor3hNV" color-3h-nv) :void
  (red half-nv)
  (green half-nv)
  (blue half-nv))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glColor3hvNV" color-3hv-nv) :void
  (v (:pointer half-nv)))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glColor4hNV" color-4h-nv) :void
  (red half-nv)
  (green half-nv)
  (blue half-nv)
  (alpha half-nv))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glColor4hvNV" color-4hv-nv) :void
  (v (:pointer half-nv)))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glTexCoord1hNV" tex-coord-1h-nv) :void
  (s half-nv))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glTexCoord1hvNV" tex-coord-1hv-nv) :void
  (v (:pointer half-nv)))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glTexCoord2hNV" tex-coord-2h-nv) :void
  (s half-nv)
  (tee half-nv))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glTexCoord2hvNV" tex-coord-2hv-nv) :void
  (v (:pointer half-nv)))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glTexCoord3hNV" tex-coord-3h-nv) :void
  (s half-nv)
  (tee half-nv)
  (r half-nv))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glTexCoord3hvNV" tex-coord-3hv-nv) :void
  (v (:pointer half-nv)))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glTexCoord4hNV" tex-coord-4h-nv) :void
  (s half-nv)
  (tee half-nv)
  (r half-nv)
  (q half-nv))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glTexCoord4hvNV" tex-coord-4hv-nv) :void
  (v (:pointer half-nv)))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glMultiTexCoord1hNV" multi-tex-coord-1h-nv) :void
  (target enum)
  (s half-nv))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glMultiTexCoord1hvNV" multi-tex-coord-1hv-nv) :void
  (target enum)
  (v (:pointer half-nv)))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glMultiTexCoord2hNV" multi-tex-coord-2h-nv) :void
  (target enum)
  (s half-nv)
  (tee half-nv))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glMultiTexCoord2hvNV" multi-tex-coord-2hv-nv) :void
  (target enum)
  (v (:pointer half-nv)))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glMultiTexCoord3hNV" multi-tex-coord-3h-nv) :void
  (target enum)
  (s half-nv)
  (tee half-nv)
  (r half-nv))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glMultiTexCoord3hvNV" multi-tex-coord-3hv-nv) :void
  (target enum)
  (v (:pointer half-nv)))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glMultiTexCoord4hNV" multi-tex-coord-4h-nv) :void
  (target enum)
  (s half-nv)
  (tee half-nv)
  (r half-nv)
  (q half-nv))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glMultiTexCoord4hvNV" multi-tex-coord-4hv-nv) :void
  (target enum)
  (v (:pointer half-nv)))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glFogCoordhNV" fog-coord-h-nv) :void
  (fog half-nv))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glFogCoordhvNV" fog-coord-hv-nv) :void
  (fog (:pointer half-nv)))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glSecondaryColor3hNV" secondary-color-3h-nv) :void
  (red half-nv)
  (green half-nv)
  (blue half-nv))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glSecondaryColor3hvNV" secondary-color-3hv-nv) :void
  (v (:pointer half-nv)))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glVertexWeighthNV" vertex-weight-h-nv) :void
  (weight half-nv))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glVertexWeighthvNV" vertex-weight-hv-nv) :void
  (weight (:pointer half-nv)))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glVertexAttrib1hNV" vertex-attrib-1h-nv) :void
  (index uint)
  (x half-nv))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glVertexAttrib1hvNV" vertex-attrib-1hv-nv) :void
  (index uint)
  (v (:pointer half-nv)))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glVertexAttrib2hNV" vertex-attrib-2h-nv) :void
  (index uint)
  (x half-nv)
  (y half-nv))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glVertexAttrib2hvNV" vertex-attrib-2hv-nv) :void
  (index uint)
  (v (:pointer half-nv)))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glVertexAttrib3hNV" vertex-attrib-3h-nv) :void
  (index uint)
  (x half-nv)
  (y half-nv)
  (z half-nv))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glVertexAttrib3hvNV" vertex-attrib-3hv-nv) :void
  (index uint)
  (v (:pointer half-nv)))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glVertexAttrib4hNV" vertex-attrib-4h-nv) :void
  (index uint)
  (x half-nv)
  (y half-nv)
  (z half-nv)
  (w half-nv))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glVertexAttrib4hvNV" vertex-attrib-4hv-nv) :void
  (index uint)
  (v (:pointer half-nv)))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glVertexAttribs1hvNV" vertex-attribs-1hv-nv) :void
  (index uint)
  (n sizei)
  (v (:pointer half-nv)))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glVertexAttribs2hvNV" vertex-attribs-2hv-nv) :void
  (index uint)
  (n sizei)
  (v (:pointer half-nv)))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glVertexAttribs3hvNV" vertex-attribs-3hv-nv) :void
  (index uint)
  (n sizei)
  (v (:pointer half-nv)))

;;; GL version: 1.2, NV_half_float
(defglextfun ("glVertexAttribs4hvNV" vertex-attribs-4hv-nv) :void
  (index uint)
  (n sizei)
  (v (:pointer half-nv)))

;;; GL version: 1.2, NV_pixel_data_range
(defglextfun ("glPixelDataRangeNV" pixel-data-range-nv) :void
  (target enum)
  (length sizei)
  (pointer (:pointer void)))

;;; GL version: 1.2, NV_pixel_data_range
(defglextfun ("glFlushPixelDataRangeNV" flush-pixel-data-range-nv) :void
  (target enum))

;;; GL version: 1.2, NV_primitive_restart
(defglextfun ("glPrimitiveRestartNV" primitive-restart-nv) :void)

;;; GL version: 1.2, NV_primitive_restart
(defglextfun ("glPrimitiveRestartIndexNV" primitive-restart-index-nv) :void
  (index uint))

;;; GL version: 1.2, ATI_map_object_buffer
(defglextfun ("glMapObjectBufferATI" map-object-buffer-ati) (:pointer void)
  (buffer uint))

;;; GL version: 1.2, ATI_map_object_buffer
(defglextfun ("glUnmapObjectBufferATI" unmap-object-buffer-ati) :void
  (buffer uint))

;;; GL version: 1.2, ATI_separate_stencil
(defglextfun ("glStencilOpSeparateATI" stencil-op-separate-ati) :void
  (face enum)
  (sfail enum)
  (dpfail enum)
  (dppass enum))

;;; GL version: 1.2, ATI_separate_stencil
(defglextfun ("glStencilFuncSeparateATI" stencil-func-separate-ati) :void
  (frontfunc enum)
  (backfunc enum)
  (ref int)
  (mask uint))

;;; GL version: 1.2, ATI_vertex_attrib_array_object
(defglextfun ("glVertexAttribArrayObjectATI" vertex-attrib-array-object-ati) :void
  (index uint)
  (size int)
  (type enum)
  (normalized boolean)
  (stride sizei)
  (buffer uint)
  (offset uint))

;;; GL version: 1.2, ATI_vertex_attrib_array_object
(defglextfun ("glGetVertexAttribArrayObjectfvATI" get-vertex-attrib-array-object-fv-ati) :void
  (index uint)
  (pname enum)
  (params (:pointer float)))

;;; GL version: 1.2, ATI_vertex_attrib_array_object
(defglextfun ("glGetVertexAttribArrayObjectivATI" get-vertex-attrib-array-object-iv-ati) :void
  (index uint)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.2, EXT_depth_bounds_test
(defglextfun ("glDepthBoundsEXT" depth-bounds-ext) :void
  (zmin clampd)
  (zmax clampd))

;;; GL version: 1.2, EXT_blend_equation_separate
(defglextfun ("glBlendEquationSeparateEXT" blend-equation-separate-ext) :void
  (modeRGB enum)
  (modeAlpha enum))

;;; GL version: 1.2, EXT_framebuffer_object
(defglextfun ("glIsRenderbufferEXT" is-renderbuffer-ext) boolean
  (renderbuffer uint))

;;; GL version: 1.2, EXT_framebuffer_object
(defglextfun ("glBindRenderbufferEXT" bind-renderbuffer-ext) :void
  (target enum)
  (renderbuffer uint))

;;; GL version: 1.2, EXT_framebuffer_object
(defglextfun ("glDeleteRenderbuffersEXT" delete-renderbuffers-ext) :void
  (n sizei)
  (renderbuffers (:pointer uint)))

;;; GL version: 1.2, EXT_framebuffer_object
(defglextfun ("glGenRenderbuffersEXT" gen-renderbuffers-ext) :void
  (n sizei)
  (renderbuffers (:pointer uint)))

;;; GL version: 1.2, EXT_framebuffer_object
(defglextfun ("glRenderbufferStorageEXT" renderbuffer-storage-ext) :void
  (target enum)
  (internalformat enum)
  (width sizei)
  (height sizei))

;;; GL version: 1.2, EXT_framebuffer_object
(defglextfun ("glGetRenderbufferParameterivEXT" get-renderbuffer-parameter-iv-ext) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.2, EXT_framebuffer_object
(defglextfun ("glIsFramebufferEXT" is-framebuffer-ext) boolean
  (framebuffer uint))

;;; GL version: 1.2, EXT_framebuffer_object
(defglextfun ("glBindFramebufferEXT" bind-framebuffer-ext) :void
  (target enum)
  (framebuffer uint))

;;; GL version: 1.2, EXT_framebuffer_object
(defglextfun ("glDeleteFramebuffersEXT" delete-framebuffers-ext) :void
  (n sizei)
  (framebuffers (:pointer uint)))

;;; GL version: 1.2, EXT_framebuffer_object
(defglextfun ("glGenFramebuffersEXT" gen-framebuffers-ext) :void
  (n sizei)
  (framebuffers (:pointer uint)))

;;; GL version: 1.2, EXT_framebuffer_object
(defglextfun ("glCheckFramebufferStatusEXT" check-framebuffer-status-ext) enum
  (target enum))

;;; GL version: 1.2, EXT_framebuffer_object
(defglextfun ("glFramebufferTexture1DEXT" framebuffer-texture-1d-ext) :void
  (target enum)
  (attachment enum)
  (textarget enum)
  (texture uint)
  (level int))

;;; GL version: 1.2, EXT_framebuffer_object
(defglextfun ("glFramebufferTexture2DEXT" framebuffer-texture-2d-ext) :void
  (target enum)
  (attachment enum)
  (textarget enum)
  (texture uint)
  (level int))

;;; GL version: 1.2, EXT_framebuffer_object
(defglextfun ("glFramebufferTexture3DEXT" framebuffer-texture-3d-ext) :void
  (target enum)
  (attachment enum)
  (textarget enum)
  (texture uint)
  (level int)
  (zoffset int))

;;; GL version: 1.2, EXT_framebuffer_object
(defglextfun ("glFramebufferRenderbufferEXT" framebuffer-renderbuffer-ext) :void
  (target enum)
  (attachment enum)
  (renderbuffertarget enum)
  (renderbuffer uint))

;;; GL version: 1.2, EXT_framebuffer_object
(defglextfun ("glGetFramebufferAttachmentParameterivEXT" get-framebuffer-attachment-parameter-iv-ext) :void
  (target enum)
  (attachment enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.2, EXT_framebuffer_object
(defglextfun ("glGenerateMipmapEXT" generate-mipmap-ext) :void
  (target enum))

;;; GL version: 1.0, GREMEDY_string_marker
(defglextfun ("glStringMarkerGREMEDY" string-marker-gremedy) :void
  (len sizei)
  (string (:pointer void)))

;;; GL version: 1.5, EXT_stencil_clear_tag
(defglextfun ("glStencilClearTagEXT" stencil-clear-tag-ext) :void
  (stencilTagBits sizei)
  (stencilClearTag uint))

;;; GL version: 1.5, EXT_framebuffer_blit
(defglextfun ("glBlitFramebufferEXT" blit-framebuffer-ext) :void
  (srcX0 int)
  (srcY0 int)
  (srcX1 int)
  (srcY1 int)
  (dstX0 int)
  (dstY0 int)
  (dstX1 int)
  (dstY1 int)
  (mask bitfield)
  (filter enum))

;;; GL version: 1.5, EXT_framebuffer_multisample
(defglextfun ("glRenderbufferStorageMultisampleEXT" renderbuffer-storage-multisample-ext) :void
  (target enum)
  (samples sizei)
  (internalformat enum)
  (width sizei)
  (height sizei))

;;; GL version: 1.5, EXT_timer_query
(defglextfun ("glGetQueryObjecti64vEXT" get-query-object-i64v-ext) :void
  (id uint)
  (pname enum)
  (params (:pointer int64-ext)))

;;; GL version: 1.5, EXT_timer_query
(defglextfun ("glGetQueryObjectui64vEXT" get-query-object-ui64v-ext) :void
  (id uint)
  (pname enum)
  (params (:pointer uint64-ext)))

;;; GL version: 1.2, EXT_gpu_program_parameters
(defglextfun ("glProgramEnvParameters4fvEXT" program-env-parameters-4fv-ext) :void
  (target enum)
  (index uint)
  (count sizei)
  (params (:pointer float)))

;;; GL version: 1.2, EXT_gpu_program_parameters
(defglextfun ("glProgramLocalParameters4fvEXT" program-local-parameters-4fv-ext) :void
  (target enum)
  (index uint)
  (count sizei)
  (params (:pointer float)))

;;; GL version: 1.5, APPLE_flush_buffer_range
(defglextfun ("glBufferParameteriAPPLE" buffer-parameter-i-apple) :void
  (target enum)
  (pname enum)
  (param int))

;;; GL version: 1.5, APPLE_flush_buffer_range
(defglextfun ("glFlushMappedBufferRangeAPPLE" flush-mapped-buffer-range-apple) :void
  (target enum)
  (offset intptr)
  (size sizeiptr))

;;; GL version: 1.3, NV_gpu_program4
(defglextfun ("glProgramLocalParameterI4iNV" program-local-parameter-i4i-nv) :void
  (target enum)
  (index uint)
  (x int)
  (y int)
  (z int)
  (w int))

;;; GL version: 1.3, NV_gpu_program4
(defglextfun ("glProgramLocalParameterI4ivNV" program-local-parameter-i4iv-nv) :void
  (target enum)
  (index uint)
  (params (:pointer int)))

;;; GL version: 1.3, NV_gpu_program4
(defglextfun ("glProgramLocalParametersI4ivNV" program-local-parameters-i4iv-nv) :void
  (target enum)
  (index uint)
  (count sizei)
  (params (:pointer int)))

;;; GL version: 1.3, NV_gpu_program4
(defglextfun ("glProgramLocalParameterI4uiNV" program-local-parameter-i4ui-nv) :void
  (target enum)
  (index uint)
  (x uint)
  (y uint)
  (z uint)
  (w uint))

;;; GL version: 1.3, NV_gpu_program4
(defglextfun ("glProgramLocalParameterI4uivNV" program-local-parameter-i4uiv-nv) :void
  (target enum)
  (index uint)
  (params (:pointer uint)))

;;; GL version: 1.3, NV_gpu_program4
(defglextfun ("glProgramLocalParametersI4uivNV" program-local-parameters-i4uiv-nv) :void
  (target enum)
  (index uint)
  (count sizei)
  (params (:pointer uint)))

;;; GL version: 1.3, NV_gpu_program4
(defglextfun ("glProgramEnvParameterI4iNV" program-env-parameter-i4i-nv) :void
  (target enum)
  (index uint)
  (x int)
  (y int)
  (z int)
  (w int))

;;; GL version: 1.3, NV_gpu_program4
(defglextfun ("glProgramEnvParameterI4ivNV" program-env-parameter-i4iv-nv) :void
  (target enum)
  (index uint)
  (params (:pointer int)))

;;; GL version: 1.3, NV_gpu_program4
(defglextfun ("glProgramEnvParametersI4ivNV" program-env-parameters-i4iv-nv) :void
  (target enum)
  (index uint)
  (count sizei)
  (params (:pointer int)))

;;; GL version: 1.3, NV_gpu_program4
(defglextfun ("glProgramEnvParameterI4uiNV" program-env-parameter-i4ui-nv) :void
  (target enum)
  (index uint)
  (x uint)
  (y uint)
  (z uint)
  (w uint))

;;; GL version: 1.3, NV_gpu_program4
(defglextfun ("glProgramEnvParameterI4uivNV" program-env-parameter-i4uiv-nv) :void
  (target enum)
  (index uint)
  (params (:pointer uint)))

;;; GL version: 1.3, NV_gpu_program4
(defglextfun ("glProgramEnvParametersI4uivNV" program-env-parameters-i4uiv-nv) :void
  (target enum)
  (index uint)
  (count sizei)
  (params (:pointer uint)))

;;; GL version: 1.3, NV_gpu_program4
(defglextfun ("glGetProgramLocalParameterIivNV" get-program-local-parameter-iiv-nv) :void
  (target enum)
  (index uint)
  (params (:pointer int)))

;;; GL version: 1.3, NV_gpu_program4
(defglextfun ("glGetProgramLocalParameterIuivNV" get-program-local-parameter-iuiv-nv) :void
  (target enum)
  (index uint)
  (params (:pointer uint)))

;;; GL version: 1.3, NV_gpu_program4
(defglextfun ("glGetProgramEnvParameterIivNV" get-program-env-parameter-iiv-nv) :void
  (target enum)
  (index uint)
  (params (:pointer int)))

;;; GL version: 1.3, NV_gpu_program4
(defglextfun ("glGetProgramEnvParameterIuivNV" get-program-env-parameter-iuiv-nv) :void
  (target enum)
  (index uint)
  (params (:pointer uint)))

;;; GL version: 2.0, NV_geometry_program4
(defglextfun ("glProgramVertexLimitNV" program-vertex-limit-nv) :void
  (target enum)
  (limit int))

;;; GL version: 2.0, NV_geometry_program4
(defglextfun ("glFramebufferTextureEXT" framebuffer-texture-ext) :void
  (target enum)
  (attachment enum)
  (texture uint)
  (level int))

;;; GL version: 2.0, NV_geometry_program4
(defglextfun ("glFramebufferTextureLayerEXT" framebuffer-texture-layer-ext) :void
  (target enum)
  (attachment enum)
  (texture uint)
  (level int)
  (layer int))

;;; GL version: 2.0, NV_geometry_program4
(defglextfun ("glFramebufferTextureFaceEXT" framebuffer-texture-face-ext) :void
  (target enum)
  (attachment enum)
  (texture uint)
  (level int)
  (face enum))

;;; GL version: 2.0, EXT_geometry_shader4
(defglextfun ("glProgramParameteriEXT" program-parameter-i-ext) :void
  (program uint)
  (pname enum)
  (value int))

;;; GL version: 1.0, NV_vertex_program4
(defglextfun ("glVertexAttribI1iEXT" vertex-attrib-i1i-ext) :void
  (index uint)
  (x int))

;;; GL version: 1.0, NV_vertex_program4
(defglextfun ("glVertexAttribI2iEXT" vertex-attrib-i2i-ext) :void
  (index uint)
  (x int)
  (y int))

;;; GL version: 1.0, NV_vertex_program4
(defglextfun ("glVertexAttribI3iEXT" vertex-attrib-i3i-ext) :void
  (index uint)
  (x int)
  (y int)
  (z int))

;;; GL version: 1.0, NV_vertex_program4
(defglextfun ("glVertexAttribI4iEXT" vertex-attrib-i4i-ext) :void
  (index uint)
  (x int)
  (y int)
  (z int)
  (w int))

;;; GL version: 1.0, NV_vertex_program4
(defglextfun ("glVertexAttribI1uiEXT" vertex-attrib-i1ui-ext) :void
  (index uint)
  (x uint))

;;; GL version: 1.0, NV_vertex_program4
(defglextfun ("glVertexAttribI2uiEXT" vertex-attrib-i2ui-ext) :void
  (index uint)
  (x uint)
  (y uint))

;;; GL version: 1.0, NV_vertex_program4
(defglextfun ("glVertexAttribI3uiEXT" vertex-attrib-i3ui-ext) :void
  (index uint)
  (x uint)
  (y uint)
  (z uint))

;;; GL version: 1.0, NV_vertex_program4
(defglextfun ("glVertexAttribI4uiEXT" vertex-attrib-i4ui-ext) :void
  (index uint)
  (x uint)
  (y uint)
  (z uint)
  (w uint))

;;; GL version: 1.0, NV_vertex_program4
(defglextfun ("glVertexAttribI1ivEXT" vertex-attrib-i1iv-ext) :void
  (index uint)
  (v (:pointer int)))

;;; GL version: 1.0, NV_vertex_program4
(defglextfun ("glVertexAttribI2ivEXT" vertex-attrib-i2iv-ext) :void
  (index uint)
  (v (:pointer int)))

;;; GL version: 1.0, NV_vertex_program4
(defglextfun ("glVertexAttribI3ivEXT" vertex-attrib-i3iv-ext) :void
  (index uint)
  (v (:pointer int)))

;;; GL version: 1.0, NV_vertex_program4
(defglextfun ("glVertexAttribI4ivEXT" vertex-attrib-i4iv-ext) :void
  (index uint)
  (v (:pointer int)))

;;; GL version: 1.0, NV_vertex_program4
(defglextfun ("glVertexAttribI1uivEXT" vertex-attrib-i1uiv-ext) :void
  (index uint)
  (v (:pointer uint)))

;;; GL version: 1.0, NV_vertex_program4
(defglextfun ("glVertexAttribI2uivEXT" vertex-attrib-i2uiv-ext) :void
  (index uint)
  (v (:pointer uint)))

;;; GL version: 1.0, NV_vertex_program4
(defglextfun ("glVertexAttribI3uivEXT" vertex-attrib-i3uiv-ext) :void
  (index uint)
  (v (:pointer uint)))

;;; GL version: 1.0, NV_vertex_program4
(defglextfun ("glVertexAttribI4uivEXT" vertex-attrib-i4uiv-ext) :void
  (index uint)
  (v (:pointer uint)))

;;; GL version: 1.0, NV_vertex_program4
(defglextfun ("glVertexAttribI4bvEXT" vertex-attrib-i4bv-ext) :void
  (index uint)
  (v (:pointer byte)))

;;; GL version: 1.0, NV_vertex_program4
(defglextfun ("glVertexAttribI4svEXT" vertex-attrib-i4sv-ext) :void
  (index uint)
  (v (:pointer short)))

;;; GL version: 1.0, NV_vertex_program4
(defglextfun ("glVertexAttribI4ubvEXT" vertex-attrib-i4ubv-ext) :void
  (index uint)
  (v (:pointer ubyte)))

;;; GL version: 1.0, NV_vertex_program4
(defglextfun ("glVertexAttribI4usvEXT" vertex-attrib-i4usv-ext) :void
  (index uint)
  (v (:pointer ushort)))

;;; GL version: 1.0, NV_vertex_program4
(defglextfun ("glVertexAttribIPointerEXT" vertex-attrib-ipointer-ext) :void
  (index uint)
  (size int)
  (type enum)
  (stride sizei)
  (pointer (:pointer void)))

;;; GL version: 1.0, NV_vertex_program4
(defglextfun ("glGetVertexAttribIivEXT" get-vertex-attrib-iiv-ext) :void
  (index uint)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 1.0, NV_vertex_program4
(defglextfun ("glGetVertexAttribIuivEXT" get-vertex-attrib-iuiv-ext) :void
  (index uint)
  (pname enum)
  (params (:pointer uint)))

;;; GL version: 2.0, EXT_gpu_shader4
(defglextfun ("glGetUniformuivEXT" get-uniform-uiv-ext) :void
  (program uint)
  (location int)
  (params (:pointer uint)))

;;; GL version: 2.0, EXT_gpu_shader4
(defglextfun ("glBindFragDataLocationEXT" bind-frag-data-location-ext) :void
  (program uint)
  (color uint)
  (name (:pointer char)))

;;; GL version: 2.0, EXT_gpu_shader4
(defglextfun ("glGetFragDataLocationEXT" get-frag-data-location-ext) int
  (program uint)
  (name (:pointer char)))

;;; GL version: 2.0, EXT_gpu_shader4
(defglextfun ("glUniform1uiEXT" uniform-1ui-ext) :void
  (location int)
  (v0 uint))

;;; GL version: 2.0, EXT_gpu_shader4
(defglextfun ("glUniform2uiEXT" uniform-2ui-ext) :void
  (location int)
  (v0 uint)
  (v1 uint))

;;; GL version: 2.0, EXT_gpu_shader4
(defglextfun ("glUniform3uiEXT" uniform-3ui-ext) :void
  (location int)
  (v0 uint)
  (v1 uint)
  (v2 uint))

;;; GL version: 2.0, EXT_gpu_shader4
(defglextfun ("glUniform4uiEXT" uniform-4ui-ext) :void
  (location int)
  (v0 uint)
  (v1 uint)
  (v2 uint)
  (v3 uint))

;;; GL version: 2.0, EXT_gpu_shader4
(defglextfun ("glUniform1uivEXT" uniform-1uiv-ext) :void
  (location int)
  (count sizei)
  (value (:pointer uint)))

;;; GL version: 2.0, EXT_gpu_shader4
(defglextfun ("glUniform2uivEXT" uniform-2uiv-ext) :void
  (location int)
  (count sizei)
  (value (:pointer uint)))

;;; GL version: 2.0, EXT_gpu_shader4
(defglextfun ("glUniform3uivEXT" uniform-3uiv-ext) :void
  (location int)
  (count sizei)
  (value (:pointer uint)))

;;; GL version: 2.0, EXT_gpu_shader4
(defglextfun ("glUniform4uivEXT" uniform-4uiv-ext) :void
  (location int)
  (count sizei)
  (value (:pointer uint)))

;;; GL version: 2.0, EXT_draw_instanced
(defglextfun ("glDrawArraysInstancedEXT" draw-arrays-instanced-ext) :void
  (mode enum)
  (start int)
  (count sizei)
  (primcount sizei))

;;; GL version: 2.0, EXT_draw_instanced
(defglextfun ("glDrawElementsInstancedEXT" draw-elements-instanced-ext) :void
  (mode enum)
  (count sizei)
  (type enum)
  (indices (:pointer void))
  (primcount sizei))

;;; GL version: 2.0, EXT_texture_buffer_object
(defglextfun ("glTexBufferEXT" tex-buffer-ext) :void
  (target enum)
  (internalformat enum)
  (buffer uint))

;;; GL version: 2.0, NV_depth_buffer_float
(defglextfun ("glDepthRangedNV" depth-range-d-nv) :void
  (zNear double)
  (zFar double))

;;; GL version: 2.0, NV_depth_buffer_float
(defglextfun ("glClearDepthdNV" clear-depth-d-nv) :void
  (depth double))

;;; GL version: 2.0, NV_depth_buffer_float
(defglextfun ("glDepthBoundsdNV" depth-bounds-d-nv) :void
  (zmin double)
  (zmax double))

;;; GL version: 1.5, NV_framebuffer_multisample_coverage
(defglextfun ("glRenderbufferStorageMultisampleCoverageNV" renderbuffer-storage-multisample-coverage-nv) :void
  (target enum)
  (coverageSamples sizei)
  (colorSamples sizei)
  (internalformat enum)
  (width sizei)
  (height sizei))

;;; GL version: 1.2, NV_parameter_buffer_object
(defglextfun ("glProgramBufferParametersfvNV" program-buffer-parameters-fv-nv) :void
  (target enum)
  (buffer uint)
  (index uint)
  (count sizei)
  (params (:pointer float)))

;;; GL version: 1.2, NV_parameter_buffer_object
(defglextfun ("glProgramBufferParametersIivNV" program-buffer-parameters-iiv-nv) :void
  (target enum)
  (buffer uint)
  (index uint)
  (count sizei)
  (params (:pointer int)))

;;; GL version: 1.2, NV_parameter_buffer_object
(defglextfun ("glProgramBufferParametersIuivNV" program-buffer-parameters-iuiv-nv) :void
  (target enum)
  (buffer uint)
  (index uint)
  (count sizei)
  (params (:pointer uint)))

;;; GL version: 2.0, EXT_draw_buffers2
(defglextfun ("glColorMaskIndexedEXT" color-mask-indexed-ext) :void
  (index uint)
  (r boolean)
  (g boolean)
  (b boolean)
  (a boolean))

;;; GL version: 2.0, EXT_draw_buffers2
(defglextfun ("glGetBooleanIndexedvEXT" get-boolean-indexed-v-ext) :void
  (target enum)
  (index uint)
  (data (:pointer boolean)))

;;; GL version: 2.0, EXT_draw_buffers2
(defglextfun ("glGetIntegerIndexedvEXT" get-integer-indexed-v-ext) :void
  (target enum)
  (index uint)
  (data (:pointer int)))

;;; GL version: 2.0, EXT_draw_buffers2
(defglextfun ("glEnableIndexedEXT" enable-indexed-ext) :void
  (target enum)
  (index uint))

;;; GL version: 2.0, EXT_draw_buffers2
(defglextfun ("glDisableIndexedEXT" disable-indexed-ext) :void
  (target enum)
  (index uint))

;;; GL version: 2.0, EXT_draw_buffers2
(defglextfun ("glIsEnabledIndexedEXT" is-enabled-indexed-ext) boolean
  (target enum)
  (index uint))

;;; GL version: 1.5, NV_transform_feedback
(defglextfun ("glBeginTransformFeedbackNV" begin-transform-feedback-nv) :void
  (primitiveMode enum))

;;; GL version: 1.5, NV_transform_feedback
(defglextfun ("glEndTransformFeedbackNV" end-transform-feedback-nv) :void)

;;; GL version: 1.5, NV_transform_feedback
(defglextfun ("glTransformFeedbackAttribsNV" transform-feedback-attribs-nv) :void
  (count uint)
  (attribs (:pointer int))
  (bufferMode enum))

;;; GL version: 1.5, NV_transform_feedback
(defglextfun ("glBindBufferRangeNV" bind-buffer-range-nv) :void
  (target enum)
  (index uint)
  (buffer uint)
  (offset intptr)
  (size sizeiptr))

;;; GL version: 1.5, NV_transform_feedback
(defglextfun ("glBindBufferOffsetNV" bind-buffer-offset-nv) :void
  (target enum)
  (index uint)
  (buffer uint)
  (offset intptr))

;;; GL version: 1.5, NV_transform_feedback
(defglextfun ("glBindBufferBaseNV" bind-buffer-base-nv) :void
  (target enum)
  (index uint)
  (buffer uint))

;;; GL version: 1.5, NV_transform_feedback
(defglextfun ("glTransformFeedbackVaryingsNV" transform-feedback-varyings-nv) :void
  (program uint)
  (count sizei)
  (locations (:pointer int))
  (bufferMode enum))

;;; GL version: 1.5, NV_transform_feedback
(defglextfun ("glActiveVaryingNV" active-varying-nv) :void
  (program uint)
  (name (:pointer char)))

;;; GL version: 1.5, NV_transform_feedback
(defglextfun ("glGetVaryingLocationNV" get-varying-location-nv) int
  (program uint)
  (name (:pointer char)))

;;; GL version: 1.5, NV_transform_feedback
(defglextfun ("glGetActiveVaryingNV" get-active-varying-nv) :void
  (program uint)
  (index uint)
  (bufSize sizei)
  (length (:pointer sizei))
  (size (:pointer sizei))
  (type (:pointer enum))
  (name (:pointer char)))

;;; GL version: 1.5, NV_transform_feedback
(defglextfun ("glGetTransformFeedbackVaryingNV" get-transform-feedback-varying-nv) :void
  (program uint)
  (index uint)
  (location (:pointer int)))

;;; GL version: 2.0, EXT_bindable_uniform
(defglextfun ("glUniformBufferEXT" uniform-buffer-ext) :void
  (program uint)
  (location int)
  (buffer uint))

;;; GL version: 2.0, EXT_bindable_uniform
(defglextfun ("glGetUniformBufferSizeEXT" get-uniform-buffer-size-ext) int
  (program uint)
  (location int))

;;; GL version: 2.0, EXT_bindable_uniform
(defglextfun ("glGetUniformOffsetEXT" get-uniform-offset-ext) intptr
  (program uint)
  (location int))

;;; GL version: 2.0, EXT_texture_integer
(defglextfun ("glTexParameterIivEXT" tex-parameter-iiv-ext) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 2.0, EXT_texture_integer
(defglextfun ("glTexParameterIuivEXT" tex-parameter-iuiv-ext) :void
  (target enum)
  (pname enum)
  (params (:pointer uint)))

;;; GL version: 2.0, EXT_texture_integer
(defglextfun ("glGetTexParameterIivEXT" get-tex-parameter-iiv-ext) :void
  (target enum)
  (pname enum)
  (params (:pointer int)))

;;; GL version: 2.0, EXT_texture_integer
(defglextfun ("glGetTexParameterIuivEXT" get-tex-parameter-iuiv-ext) :void
  (target enum)
  (pname enum)
  (params (:pointer uint)))

;;; GL version: 2.0, EXT_texture_integer
(defglextfun ("glClearColorIiEXT" clear-color-ii-ext) :void
  (red int)
  (green int)
  (blue int)
  (alpha int))

;;; GL version: 2.0, EXT_texture_integer
(defglextfun ("glClearColorIuiEXT" clear-color-iui-ext) :void
  (red uint)
  (green uint)
  (blue uint)
  (alpha uint))

;;; GL version: 1.0, GREMEDY_frame_terminator
(defglextfun ("glFrameTerminatorGREMEDY" frame-terminator-gremedy) :void)
