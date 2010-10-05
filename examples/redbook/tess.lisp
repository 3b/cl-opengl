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


(defmethod glut:display ((w tess-window))
  (gl:clear :color-buffer)
  (gl:color 1 1 1)
  (gl:call-list *start-list*)
  (gl:call-list (+1 *start-list*))
  (gl:flush))

(defmethod glut:reshape ((w tess-window) width height)
  (gl:viewport 0 0 width height)
  (gl:matrix-mode :projection)
  (gl:load-identity)
  (glu:ortho-2d 0 width 0 height))

(defmethod glut:keyboard ((w tess-window) key x y)
  (declare (ignore x y))
  (when (eql key #\Esc)
    (glut:destroy-current-window)))
#|  
void CALLBACK beginCallback(GLenum which)
{
   glBegin(which);
}

void CALLBACK errorCallback(GLenum errorCode)
{
   const GLubyte *estring;

   estring = gluErrorString(errorCode);
   fprintf(stderr, "Tessellation Error: %s\n", (char *) estring);
   exit(0);
}

void CALLBACK endCallback(void)
{
   glEnd();
}

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

void init (void)
{
   GLUtesselator *tobj;
   GLdouble rect[4][3] = {{50.0, 50.0, 0.0},
                          {200.0, 50.0, 0.0},
                          {200.0, 200.0, 0.0},
                          {50.0, 200.0, 0.0}};
   GLdouble tri[3][3] = {{75.0, 75.0, 0.0},
                         {125.0, 175.0, 0.0},
                         {175.0, 75.0, 0.0}};
   GLdouble star[5][6] = {{250.0, 50.0, 0.0, 1.0, 0.0, 1.0},
                          {325.0, 200.0, 0.0, 1.0, 1.0, 0.0},
                          {400.0, 50.0, 0.0, 0.0, 1.0, 1.0},
                          {250.0, 150.0, 0.0, 1.0, 0.0, 0.0},
                          {400.0, 150.0, 0.0, 0.0, 1.0, 0.0}};

   glClearColor(0.0, 0.0, 0.0, 0.0);

   startList = glGenLists(2);

   tobj = gluNewTess();
   gluTessCallback(tobj, GLU_TESS_VERTEX,
                   (GLvoid (CALLBACK*) ()) &glVertex3dv);
   gluTessCallback(tobj, GLU_TESS_BEGIN,
                   (GLvoid (CALLBACK*) ()) &beginCallback);
   gluTessCallback(tobj, GLU_TESS_END,
                   (GLvoid (CALLBACK*) ()) &endCallback);
   gluTessCallback(tobj, GLU_TESS_ERROR,
                   (GLvoid (CALLBACK*) ()) &errorCallback);

   /*  rectangle with triangular hole inside  */
   glNewList(startList, GL_COMPILE);
   glShadeModel(GL_FLAT);
   gluTessBeginPolygon(tobj, NULL);
      gluTessBeginContour(tobj);
         gluTessVertex(tobj, rect[0], rect[0]);
         gluTessVertex(tobj, rect[1], rect[1]);
         gluTessVertex(tobj, rect[2], rect[2]);
         gluTessVertex(tobj, rect[3], rect[3]);
      gluTessEndContour(tobj);
      gluTessBeginContour(tobj);
         gluTessVertex(tobj, tri[0], tri[0]);
         gluTessVertex(tobj, tri[1], tri[1]);
         gluTessVertex(tobj, tri[2], tri[2]);
      gluTessEndContour(tobj);
   gluTessEndPolygon(tobj);
   glEndList();

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
  (glut:display-window (make-instance 'tess-window))
  (init))