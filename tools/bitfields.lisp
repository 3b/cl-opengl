(
 (:enum-type
  "AttribMask"
  :deprecated t
  :type :bitfield
  :used-by
  (("AttribMask" "PushAttrib" "mask" 0))
  :enums
  ("ACCUM_BUFFER_BIT"
   "COLOR_BUFFER_BIT"
   "CURRENT_BIT"
   "DEPTH_BUFFER_BIT"
   "ENABLE_BIT"
   "EVAL_BIT"
   "FOG_BIT"
   "HINT_BIT"
   "LIGHTING_BIT"
   "LINE_BIT"
   "LIST_BIT"
   ;; "MISC_BIT_EXT" ;; not in enum*.spec?
   "PIXEL_MODE_BIT"
   "POINT_BIT"
   "POLYGON_BIT"
   "POLYGON_STIPPLE_BIT"
   "SCISSOR_BIT"
   "STENCIL_BUFFER_BIT"
   "TEXTURE_BIT"
   "TRANSFORM_BIT"
   "VIEWPORT_BIT"
   "MULTISAMPLE_BIT"
   "MULTISAMPLE_BIT_ARB" "MULTISAMPLE_BIT_EXT" "MULTISAMPLE_BIT_3DFX"
   ;; "MULTISAMPLE_BIT_SGIS" ;; not in enum*.spec?
   "ALL_ATTRIB_BITS"))

 (:enum-type
  "ClearBufferMask"
  :deprecated nil
  :type :bitfield
  :used-by
  (("ClearBufferMask" "Clear" "mask" 0)
   ("ClearBufferMask" "BlitFramebuffer" "mask" 8)
   ("ClearBufferMask" "BlitFramebufferEXT" "mask" 8))
  :enums
  ("COLOR_BUFFER_BIT"
   "ACCUM_BUFFER_BIT"
   "DEPTH_BUFFER_BIT"
   "STENCIL_BUFFER_BIT"))

 (:enum-type "ClientAttribMask"
  :deprecated t
  :type :bitfield
  :used-by
  (("ClientAttribMask" "PushClientAttrib" "mask" 0)
   ("ClientAttribMask" "ClientAttribDefaultEXT" "mask" 0)
   ("ClientAttribMask" "PushClientAttribDefaultEXT" "mask" 0))
  :enums
  ("CLIENT_ALL_ATTRIB_BITS"
   "CLIENT_VERTEX_ARRAY_BIT"
   "CLIENT_PIXEL_STORE_BIT"))



 (:enum-type "BufferAccessMask"
  :deprecated nil
  :type :bitfield
  :used-by
  (("BufferAccessMask" "MapBufferRange" "access" 3))
  :enums
  ("MAP_UNSYNCHRONIZED_BIT"
   "MAP_FLUSH_EXPLICIT_BIT"
   "MAP_INVALIDATE_BUFFER_BIT"
   "MAP_INVALIDATE_RANGE_BIT"
   "MAP_WRITE_BIT"
   "MAP_READ_BIT"))
)



;;;FfdMaskSGIX,*,*,		    GLbitfield,*,*

;; ColorFragmentOp[1..3]ATI ,    AlphaFragmentOp[1..3]ATI:
;;;(:ENUM-NAME "BIAS_BIT_ATI" :VALUE "0x00000008" :ENUMEXT.SPEC T)
;;;    (:ENUM-NAME "NEGATE_BIT_ATI" :VALUE "0x00000004" :ENUMEXT.SPEC T)
;;;    (:ENUM-NAME "COMP_BIT_ATI" :VALUE "0x00000002" :ENUMEXT.SPEC T)
;;;    (:ENUM-NAME "2X_BIT_ATI" :VALUE "0x00000001" :ENUMEXT.SPEC T)
;;;    (:ENUM-NAME "SATURATE_BIT_ATI" :VALUE "0x00000040" :ENUMEXT.SPEC T)
;;;    (:ENUM-NAME "EIGHTH_BIT_ATI" :VALUE "0x00000020" :ENUMEXT.SPEC T)
;;;    (:ENUM-NAME "QUARTER_BIT_ATI" :VALUE "0x00000010" :ENUMEXT.SPEC T)
;;;    (:ENUM-NAME "HALF_BIT_ATI" :VALUE "0x00000008" :ENUMEXT.SPEC T)
;;;    (:ENUM-NAME "8X_BIT_ATI" :VALUE "0x00000004" :ENUMEXT.SPEC T)
;;;    (:ENUM-NAME "4X_BIT_ATI" :VALUE "0x00000002" :ENUMEXT.SPEC T)
;;;    (:ENUM-NAME "2X_BIT_ATI" :VALUE "0x00000001" :ENUMEXT.SPEC T)
;;;    (:ENUM-NAME "BLUE_BIT_ATI" :VALUE "0x00000004" :ENUMEXT.SPEC T)
;;;    (:ENUM-NAME "GREEN_BIT_ATI" :VALUE "0x00000002" :ENUMEXT.SPEC T)
;;;    (:ENUM-NAME "RED_BIT_ATI" :VALUE "0x00000001" :ENUMEXT.SPEC T)
;;;
;;;
;;;;;"PGI_vertex_hints"
;;;(:USE "MAP_UNSYNCHRONIZED_BIT" :FROM-TYPE "ARB_map_buffer_range")
;;;    (:USE "MAP_FLUSH_EXPLICIT_BIT" :FROM-TYPE "ARB_map_buffer_range")
;;;    (:USE "MAP_INVALIDATE_BUFFER_BIT" :FROM-TYPE "ARB_map_buffer_range")
;;;    (:USE "MAP_INVALIDATE_RANGE_BIT" :FROM-TYPE "ARB_map_buffer_range")
;;;    (:USE "MAP_WRITE_BIT" :FROM-TYPE "ARB_map_buffer_range")
;;;    (:USE "MAP_READ_BIT" :FROM-TYPE "ARB_map_buffer_range")
;;;
