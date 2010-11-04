;;;; -*- Mode: lisp; indent-tabs-mode: nil -*-
;;; tess.lisp --- Lisp version of tess.c (Red Book examples)
;;;
;;; Original C version contains the following copyright notice:
;;;   Copyright (c) 1993-1997, Silicon Graphics, Inc.
;;;   ALL RIGHTS RESERVED

;;; 
;;; This program demonstrates polygon tessellation.
;;; Two tesselated objects are drawn.  The first is a
;;; rectangle with a triangular hole.  The second is a
;;; smooth shaded, self-intersecting star.
;;;
;;; Note the exterior rectangle is drawn with its vertices
;;; in counter-clockwise order, but its interior clockwise.
;;; Note the combineCallback is needed for the self-intersecting
;;; star.  Also note that removing the TessProperty for the
;;; star will make the interior unshaded (WINDING_ODD).

(in-package #:cl-glut-examples)

;;;GLuint startList;
(defparameter *start-list* nil)

(defclass tess-window (glut:window)
  ()
  (:default-initargs :width 500 :height 500 :title "tess.lisp"
                     :mode '(:single :rgb)))

(defclass example-tessellator (glu:tessellator)
  ())

(defmethod glut:display ((w tess-window))
  (gl:clear :color-buffer)
  (gl:color 1 0.28 1)
  (gl:call-list *start-list*)
  (gl:call-list (1+ *start-list*)))

(defmethod glut:reshape ((w tess-window) width height)
  (gl:viewport 0 0 width height)
  (gl:matrix-mode :projection)
  (gl:load-identity)
  (glu:ortho-2d 0 width 0 height))

(defmethod glut:keyboard ((w tess-window) key x y)
  (declare (ignore x y))
  (when (eql key #\Esc)
    (glut:destroy-current-window)))

(defmethod glu:tess-vertex-data-cb ((tess example-tessellator) vertex-data polygon-data)
 ; (break polygon-data))
;  (gl:color 0.2 0.3 0.4)
  (break "~a" (gl::make-gl-array-from-pointer vertex-data :double 3)))
;  (gl:vertex ))

(defmethod glu:tess-combine-data-cb ((tess example-tessellator) coords vertex-data weight data-out polygon-data)
  (break coords))

#|
void CALLBACK vertexCallback(GLvoid *vertex)
{
   const GLdouble *pointer;

   pointer = (GLdouble *) vertex;
   glColor3dv(pointer+3);
   glVertex3dv(pointer);
}


/*  combineCallback is used to create a new vertex when edges
 *  intersect.  coordinate location is trivial to calculate,
 *  but weight[4] may be used to average color, normal, or texture
 *  coordinate data.  In this program, color is weighted.
 */
void CALLBACK combineCallback(GLdouble coords[3],
                     GLdouble *vertex_data[4],
                     GLfloat weight[4], GLdouble **dataOut )
{
   GLdouble *vertex;
   int i;

   vertex = (GLdouble *) malloc(6 * sizeof(GLdouble));

   vertex[0] = coords[0];
   vertex[1] = coords[1];
   vertex[2] = coords[2];
   for (i = 3; i < 6; i++)
      vertex[i] = weight[0] * vertex_data[0][i]
                  + weight[1] * vertex_data[1][i]
                  + weight[2] * vertex_data[2][i]
                  + weight[3] * vertex_data[3][i];
   *dataOut = vertex;
}
|#

(defun init ()
  (let ((tobj (make-instance 'example-tessellator))
        (rect '((5.0 5.0 0.0)
                (20.0 5.0 0.0)
                (20.0 20.0 0.0)
                (5.0 20.0 0.0)))
        (tri '((75.0 75.0 0.0)
               (125.0 175.0 0.0)
               (175.0 75.0 0.0))))
        ;;  (star '((250.0 50.0 0.0 1.0 0.0 1.0)
;;                  (325.0 200.0 0.0 1.0 1.0 0.0)
;;                  (400.0 50.0 0.0 0.0 1.0 1.0)
;;                  (250.0 150.0 0.0 1.0 0.0 0.0)
;;                  (400.0 150.0 0.0 0.0 1.0 0.0))))

    (gl:clear-color 0 0 0 0)
    (setf *start-list* (gl:gen-lists 2))
    
    ;;rectangle with triangular hole inside
    (gl:new-list *start-list* :compile)
    (gl:shade-model :flat)
    (glu:tess-begin-polygon tobj nil)
    (glu:tess-begin-contour tobj)
    (loop for coords in rect
       do (glu:tess-vertex tobj coords))
    (glu:tess-end-contour tobj)
    
;;     (glu:tess-begin-contour tobj)
;;     (loop for coords in tri
;;        do (glu:tess-vertex tobj coords))
;;     (glu:tess-end-contour tobj)
    (glu:tess-end-polygon tobj)
    (gl:end-list)
    ))
#|
   gluTessCallback(tobj, GLU_TESS_VERTEX,
                   (GLvoid (CALLBACK*) ()) &vertexCallback);
   gluTessCallback(tobj, GLU_TESS_BEGIN,
                   (GLvoid (CALLBACK*) ()) &beginCallback);
   gluTessCallback(tobj, GLU_TESS_END,
                   (GLvoid (CALLBACK*) ()) &endCallback);
   gluTessCallback(tobj, GLU_TESS_ERROR,
                   (GLvoid (CALLBACK*) ()) &errorCallback);
   gluTessCallback(tobj, GLU_TESS_COMBINE,
                   (GLvoid (CALLBACK*) ()) &combineCallback);

   /*  smooth shaded, self-intersecting star  */
   glNewList(startList + 1, GL_COMPILE);
   glShadeModel(GL_SMOOTH);
   gluTessProperty(tobj, GLU_TESS_WINDING_RULE,
                   GLU_TESS_WINDING_POSITIVE);
   gluTessBeginPolygon(tobj, NULL);
      gluTessBeginContour(tobj);
         gluTessVertex(tobj, star[0], star[0]);
         gluTessVertex(tobj, star[1], star[1]);
         gluTessVertex(tobj, star[2], star[2]);
         gluTessVertex(tobj, star[3], star[3]);
         gluTessVertex(tobj, star[4], star[4]);
      gluTessEndContour(tobj);
   gluTessEndPolygon(tobj);
   glEndList();
   gluDeleteTess(tobj);
}
|#

(defun rb-tess ()
  (setf glut:*run-main-loop-after-display* nil)
  (glut:display-window (make-instance 'tess-window))
  (init)
  (glut:main-loop))
