;;; this file is automatically generated, do not edit
;;; generated from files with the following copyright:
;;;
;;; Copyright 2013-2020 The Khronos Group Inc.
;;; SPDX-License-Identifier: Apache-2.0

(in-package #:cl-opengl-bindings)

;;; generated 2024-08-16T20:46:56Z
;;; from gl.xml @ git sha 4f845dc97972c72cad684cc22c7bf96e6d5319a6, 2024-08-15T14:04:09Z

(defglfun ("glGetPointerv" get-pointer-v 1417) :void
  (pname enum)
  (params (:pointer (:pointer :void))))

(defglextfun ("glDebugMessageControl" debug-message-control 1418) :void
  (source enum)
  (type enum)
  (severity enum)
  (count sizei)
  (ids (:pointer uint))
  (enabled boolean))

(defglextfun ("glDebugMessageInsert" debug-message-insert 1419) :void
  (source enum)
  (type enum)
  (id uint)
  (severity enum)
  (length sizei)
  (buf (:pointer char)))

(defglextfun ("glDebugMessageCallback" debug-message-callback 1420) :void
  (callback debugproc)
  (userParam (:pointer :void)))

(defglextfun ("glGetDebugMessageLog" get-debug-message-log 1421) uint
  (count uint)
  (bufSize sizei)
  (sources (:pointer enum))
  (types (:pointer enum))
  (ids (:pointer uint))
  (severities (:pointer enum))
  (lengths (:pointer sizei))
  (messageLog (:pointer char)))

(defglextfun ("glPushDebugGroup" push-debug-group 1422) :void
  (source enum)
  (id uint)
  (length sizei)
  (message (:pointer char)))

(defglextfun ("glPopDebugGroup" pop-debug-group 1423) :void)

(defglextfun ("glObjectLabel" object-label 1424) :void
  (identifier enum)
  (name uint)
  (length sizei)
  (label (:pointer char)))

(defglextfun ("glGetObjectLabel" get-object-label 1425) :void
  (identifier enum)
  (name uint)
  (bufSize sizei)
  (length (:pointer sizei))
  (label (:pointer char)))

(defglextfun ("glObjectPtrLabel" object-ptr-label 1426) :void
  (ptr (:pointer :void))
  (length sizei)
  (label (:pointer char)))

(defglextfun ("glGetObjectPtrLabel" get-object-ptr-label 1427) :void
  (ptr (:pointer :void))
  (bufSize sizei)
  (length (:pointer sizei))
  (label (:pointer char)))

(defglextfun ("glInsertEventMarkerEXT" insert-event-marker-ext 1428) :void
  (length sizei)
  (marker (:pointer char)))

(defglextfun ("glPushGroupMarkerEXT" push-group-marker-ext 1429) :void
  (length sizei)
  (marker (:pointer char)))

(defglextfun ("glPopGroupMarkerEXT" pop-group-marker-ext 1430) :void)

(defglextfun ("glTextureStorage1DEXT" texture-storage-1d-ext 1431) :void
  (texture uint)
  (target enum)
  (levels sizei)
  (internalformat enum)
  (width sizei))

(defglextfun ("glTextureStorage2DEXT" texture-storage-2d-ext 1432) :void
  (texture uint)
  (target enum)
  (levels sizei)
  (internalformat enum)
  (width sizei)
  (height sizei))

(defglextfun ("glTextureStorage3DEXT" texture-storage-3d-ext 1433) :void
  (texture uint)
  (target enum)
  (levels sizei)
  (internalformat enum)
  (width sizei)
  (height sizei)
  (depth sizei))

(defglextfun ("glTexStorage1DEXT" tex-storage-1d-ext 1434) :void
  (target enum)
  (levels sizei)
  (internalformat enum)
  (width sizei))

(defglextfun ("glTexStorage2DEXT" tex-storage-2d-ext 1435) :void
  (target enum)
  (levels sizei)
  (internalformat enum)
  (width sizei)
  (height sizei))

(defglextfun ("glTexStorage3DEXT" tex-storage-3d-ext 1436) :void
  (target enum)
  (levels sizei)
  (internalformat enum)
  (width sizei)
  (height sizei)
  (depth sizei))

(defglextfun ("glDebugMessageControlKHR" debug-message-control-khr 1437) :void
  (source enum)
  (type enum)
  (severity enum)
  (count sizei)
  (ids (:pointer uint))
  (enabled boolean))

(defglextfun ("glDebugMessageInsertKHR" debug-message-insert-khr 1438) :void
  (source enum)
  (type enum)
  (id uint)
  (severity enum)
  (length sizei)
  (buf (:pointer char)))

(defglextfun ("glDebugMessageCallbackKHR" debug-message-callback-khr 1439) :void
  (callback debugprockhr)
  (userParam (:pointer :void)))

(defglextfun ("glGetDebugMessageLogKHR" get-debug-message-log-khr 1440) uint
  (count uint)
  (bufSize sizei)
  (sources (:pointer enum))
  (types (:pointer enum))
  (ids (:pointer uint))
  (severities (:pointer enum))
  (lengths (:pointer sizei))
  (messageLog (:pointer char)))

(defglextfun ("glPushDebugGroupKHR" push-debug-group-khr 1441) :void
  (source enum)
  (id uint)
  (length sizei)
  (message (:pointer char)))

(defglextfun ("glPopDebugGroupKHR" pop-debug-group-khr 1442) :void)

(defglextfun ("glObjectLabelKHR" object-label-khr 1443) :void
  (identifier enum)
  (name uint)
  (length sizei)
  (label (:pointer char)))

(defglextfun ("glGetObjectLabelKHR" get-object-label-khr 1444) :void
  (identifier enum)
  (name uint)
  (bufSize sizei)
  (length (:pointer sizei))
  (label (:pointer char)))

(defglextfun ("glObjectPtrLabelKHR" object-ptr-label-khr 1445) :void
  (ptr (:pointer :void))
  (length sizei)
  (label (:pointer char)))

(defglextfun ("glGetObjectPtrLabelKHR" get-object-ptr-label-khr 1446) :void
  (ptr (:pointer :void))
  (bufSize sizei)
  (length (:pointer sizei))
  (label (:pointer char)))

(defglextfun ("glGetPointervKHR" get-pointer-v-khr 1447) :void
  (pname enum)
  (params (:pointer (:pointer :void))))

