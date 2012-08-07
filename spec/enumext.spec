# enumext.spec - list of GL enumerants for glext.h header
#
# $Revision: 18836 $ on $Date: 2012-08-06 08:39:04 -0700 (Mon, 06 Aug 2012) $

# This is derived from the master GL enumerant registry (enum.spec).
#
# Unlike enum.spec, enumext.spec is
#   (1) Grouped by GL core version or extension number
#   (2) While it includes all extension and core enumerants, the
#	generator scripts for glext.h leave out VERSION_1_1
#	tokens since it's assumed all <gl.h> today support at least
#	OpenGL 1.1
#   (3) Has no 'Extensions' section, since enums are always
#	conditionally protected against multiple definition
#	by glextenum.pl.
#   (4) Is processed by glextenum.pl, which has evolved
#	from enum.pl - should merge back into one script.

# The release number encoded into glext.h is now defined in
# glextrelease.txt.

###############################################################################
#
# OpenGL 1.0/1.1 enums (there is no VERSION_1_0 token)
#
###############################################################################

VERSION_1_1 enum:
passthru: /* AttribMask */
	DEPTH_BUFFER_BIT				= 0x00000100	# AttribMask
	STENCIL_BUFFER_BIT				= 0x00000400	# AttribMask
	COLOR_BUFFER_BIT				= 0x00004000	# AttribMask
passthru: /* Boolean */
	FALSE						= 0		# Boolean
	TRUE						= 1		# Boolean
passthru: /* BeginMode */
	POINTS						= 0x0000	# BeginMode
	LINES						= 0x0001	# BeginMode
	LINE_LOOP					= 0x0002	# BeginMode
	LINE_STRIP					= 0x0003	# BeginMode
	TRIANGLES					= 0x0004	# BeginMode
	TRIANGLE_STRIP					= 0x0005	# BeginMode
	TRIANGLE_FAN					= 0x0006	# BeginMode
passthru: /* AlphaFunction */
	NEVER						= 0x0200	# AlphaFunction
	LESS						= 0x0201	# AlphaFunction
	EQUAL						= 0x0202	# AlphaFunction
	LEQUAL						= 0x0203	# AlphaFunction
	GREATER						= 0x0204	# AlphaFunction
	NOTEQUAL					= 0x0205	# AlphaFunction
	GEQUAL						= 0x0206	# AlphaFunction
	ALWAYS						= 0x0207	# AlphaFunction
passthru: /* BlendingFactorDest */
	ZERO						= 0		# BlendingFactorDest
	ONE						= 1		# BlendingFactorDest
	SRC_COLOR					= 0x0300	# BlendingFactorDest
	ONE_MINUS_SRC_COLOR				= 0x0301	# BlendingFactorDest
	SRC_ALPHA					= 0x0302	# BlendingFactorDest
	ONE_MINUS_SRC_ALPHA				= 0x0303	# BlendingFactorDest
	DST_ALPHA					= 0x0304	# BlendingFactorDest
	ONE_MINUS_DST_ALPHA				= 0x0305	# BlendingFactorDest
passthru: /* BlendingFactorSrc */
	DST_COLOR					= 0x0306	# BlendingFactorSrc
	ONE_MINUS_DST_COLOR				= 0x0307	# BlendingFactorSrc
	SRC_ALPHA_SATURATE				= 0x0308	# BlendingFactorSrc
passthru: /* DrawBufferMode */
	NONE						= 0		# DrawBufferMode
	FRONT_LEFT					= 0x0400	# DrawBufferMode
	FRONT_RIGHT					= 0x0401	# DrawBufferMode
	BACK_LEFT					= 0x0402	# DrawBufferMode
	BACK_RIGHT					= 0x0403	# DrawBufferMode
	FRONT						= 0x0404	# DrawBufferMode
	BACK						= 0x0405	# DrawBufferMode
	LEFT						= 0x0406	# DrawBufferMode
	RIGHT						= 0x0407	# DrawBufferMode
	FRONT_AND_BACK					= 0x0408	# DrawBufferMode
passthru: /* ErrorCode */
	NO_ERROR					= 0		# ErrorCode
	INVALID_ENUM					= 0x0500	# ErrorCode
	INVALID_VALUE					= 0x0501	# ErrorCode
	INVALID_OPERATION				= 0x0502	# ErrorCode
	OUT_OF_MEMORY					= 0x0505	# ErrorCode
passthru: /* FrontFaceDirection */
	CW						= 0x0900	# FrontFaceDirection
	CCW						= 0x0901	# FrontFaceDirection
passthru: /* GetPName */
	POINT_SIZE					= 0x0B11 # 1 F	# GetPName
	POINT_SIZE_RANGE				= 0x0B12 # 2 F	# GetPName
	POINT_SIZE_GRANULARITY				= 0x0B13 # 1 F	# GetPName
	LINE_SMOOTH					= 0x0B20 # 1 I	# GetPName
	LINE_WIDTH					= 0x0B21 # 1 F	# GetPName
	LINE_WIDTH_RANGE				= 0x0B22 # 2 F	# GetPName
	LINE_WIDTH_GRANULARITY				= 0x0B23 # 1 F	# GetPName
	POLYGON_SMOOTH					= 0x0B41 # 1 I	# GetPName
	CULL_FACE					= 0x0B44 # 1 I	# GetPName
	CULL_FACE_MODE					= 0x0B45 # 1 I	# GetPName
	FRONT_FACE					= 0x0B46 # 1 I	# GetPName
	DEPTH_RANGE					= 0x0B70 # 2 F	# GetPName
	DEPTH_TEST					= 0x0B71 # 1 I	# GetPName
	DEPTH_WRITEMASK					= 0x0B72 # 1 I	# GetPName
	DEPTH_CLEAR_VALUE				= 0x0B73 # 1 F	# GetPName
	DEPTH_FUNC					= 0x0B74 # 1 I	# GetPName
	STENCIL_TEST					= 0x0B90 # 1 I	# GetPName
	STENCIL_CLEAR_VALUE				= 0x0B91 # 1 I	# GetPName
	STENCIL_FUNC					= 0x0B92 # 1 I	# GetPName
	STENCIL_VALUE_MASK				= 0x0B93 # 1 I	# GetPName
	STENCIL_FAIL					= 0x0B94 # 1 I	# GetPName
	STENCIL_PASS_DEPTH_FAIL				= 0x0B95 # 1 I	# GetPName
	STENCIL_PASS_DEPTH_PASS				= 0x0B96 # 1 I	# GetPName
	STENCIL_REF					= 0x0B97 # 1 I	# GetPName
	STENCIL_WRITEMASK				= 0x0B98 # 1 I	# GetPName
	VIEWPORT					= 0x0BA2 # 4 I	# GetPName
	DITHER						= 0x0BD0 # 1 I	# GetPName
	BLEND_DST					= 0x0BE0 # 1 I	# GetPName
	BLEND_SRC					= 0x0BE1 # 1 I	# GetPName
	BLEND						= 0x0BE2 # 1 I	# GetPName
	LOGIC_OP_MODE					= 0x0BF0 # 1 I	# GetPName
	COLOR_LOGIC_OP					= 0x0BF2 # 1 I	# GetPName
	DRAW_BUFFER					= 0x0C01 # 1 I	# GetPName
	READ_BUFFER					= 0x0C02 # 1 I	# GetPName
	SCISSOR_BOX					= 0x0C10 # 4 I	# GetPName
	SCISSOR_TEST					= 0x0C11 # 1 I	# GetPName
	COLOR_CLEAR_VALUE				= 0x0C22 # 4 F	# GetPName
	COLOR_WRITEMASK					= 0x0C23 # 4 I	# GetPName
	DOUBLEBUFFER					= 0x0C32 # 1 I	# GetPName
	STEREO						= 0x0C33 # 1 I	# GetPName
	LINE_SMOOTH_HINT				= 0x0C52 # 1 I	# GetPName
	POLYGON_SMOOTH_HINT				= 0x0C53 # 1 I	# GetPName
	UNPACK_SWAP_BYTES				= 0x0CF0 # 1 I	# GetPName
	UNPACK_LSB_FIRST				= 0x0CF1 # 1 I	# GetPName
	UNPACK_ROW_LENGTH				= 0x0CF2 # 1 I	# GetPName
	UNPACK_SKIP_ROWS				= 0x0CF3 # 1 I	# GetPName
	UNPACK_SKIP_PIXELS				= 0x0CF4 # 1 I	# GetPName
	UNPACK_ALIGNMENT				= 0x0CF5 # 1 I	# GetPName
	PACK_SWAP_BYTES					= 0x0D00 # 1 I	# GetPName
	PACK_LSB_FIRST					= 0x0D01 # 1 I	# GetPName
	PACK_ROW_LENGTH					= 0x0D02 # 1 I	# GetPName
	PACK_SKIP_ROWS					= 0x0D03 # 1 I	# GetPName
	PACK_SKIP_PIXELS				= 0x0D04 # 1 I	# GetPName
	PACK_ALIGNMENT					= 0x0D05 # 1 I	# GetPName
	MAX_TEXTURE_SIZE				= 0x0D33 # 1 I	# GetPName
	MAX_VIEWPORT_DIMS				= 0x0D3A # 2 F	# GetPName
	SUBPIXEL_BITS					= 0x0D50 # 1 I	# GetPName
	TEXTURE_1D					= 0x0DE0 # 1 I	# GetPName
	TEXTURE_2D					= 0x0DE1 # 1 I	# GetPName
	POLYGON_OFFSET_UNITS				= 0x2A00 # 1 F	# GetPName
	POLYGON_OFFSET_POINT				= 0x2A01 # 1 I	# GetPName
	POLYGON_OFFSET_LINE				= 0x2A02 # 1 I	# GetPName
	POLYGON_OFFSET_FILL				= 0x8037 # 1 I	# GetPName
	POLYGON_OFFSET_FACTOR				= 0x8038 # 1 F	# GetPName
	TEXTURE_BINDING_1D				= 0x8068 # 1 I	# GetPName
	TEXTURE_BINDING_2D				= 0x8069 # 1 I	# GetPName
passthru: /* GetTextureParameter */
	TEXTURE_WIDTH					= 0x1000	# GetTextureParameter
	TEXTURE_HEIGHT					= 0x1001	# GetTextureParameter
	TEXTURE_INTERNAL_FORMAT				= 0x1003	# GetTextureParameter
	TEXTURE_BORDER_COLOR				= 0x1004	# GetTextureParameter
	TEXTURE_RED_SIZE				= 0x805C	# GetTextureParameter
	TEXTURE_GREEN_SIZE				= 0x805D	# GetTextureParameter
	TEXTURE_BLUE_SIZE				= 0x805E	# GetTextureParameter
	TEXTURE_ALPHA_SIZE				= 0x805F	# GetTextureParameter
passthru: /* HintMode */
	DONT_CARE					= 0x1100	# HintMode
	FASTEST						= 0x1101	# HintMode
	NICEST						= 0x1102	# HintMode
passthru: /* DataType */
	BYTE						= 0x1400	# DataType
	UNSIGNED_BYTE					= 0x1401	# DataType
	SHORT						= 0x1402	# DataType
	UNSIGNED_SHORT					= 0x1403	# DataType
	INT						= 0x1404	# DataType
	UNSIGNED_INT					= 0x1405	# DataType
	FLOAT						= 0x1406	# DataType
	DOUBLE						= 0x140A	# DataType
# Deprecated in GL 3.0; undeprecated in GL 4.3 / KHR_debug
passthru: /* ErrorCode */
	STACK_OVERFLOW					= 0x0503	# ErrorCode
	STACK_UNDERFLOW					= 0x0504	# ErrorCode
passthru: /* LogicOp */
	CLEAR						= 0x1500	# LogicOp
	AND						= 0x1501	# LogicOp
	AND_REVERSE					= 0x1502	# LogicOp
	COPY						= 0x1503	# LogicOp
	AND_INVERTED					= 0x1504	# LogicOp
	NOOP						= 0x1505	# LogicOp
	XOR						= 0x1506	# LogicOp
	OR						= 0x1507	# LogicOp
	NOR						= 0x1508	# LogicOp
	EQUIV						= 0x1509	# LogicOp
	INVERT						= 0x150A	# LogicOp
	OR_REVERSE					= 0x150B	# LogicOp
	COPY_INVERTED					= 0x150C	# LogicOp
	OR_INVERTED					= 0x150D	# LogicOp
	NAND						= 0x150E	# LogicOp
	SET						= 0x150F	# LogicOp
passthru: /* MatrixMode (for gl3.h, FBO attachment type) */
	TEXTURE						= 0x1702	# MatrixMode
passthru: /* PixelCopyType */
	COLOR						= 0x1800	# PixelCopyType
	DEPTH						= 0x1801	# PixelCopyType
	STENCIL						= 0x1802	# PixelCopyType
passthru: /* PixelFormat */
	STENCIL_INDEX					= 0x1901	# PixelFormat
	DEPTH_COMPONENT					= 0x1902	# PixelFormat
	RED						= 0x1903	# PixelFormat
	GREEN						= 0x1904	# PixelFormat
	BLUE						= 0x1905	# PixelFormat
	ALPHA						= 0x1906	# PixelFormat
	RGB						= 0x1907	# PixelFormat
	RGBA						= 0x1908	# PixelFormat
passthru: /* PolygonMode */
	POINT						= 0x1B00	# PolygonMode
	LINE						= 0x1B01	# PolygonMode
	FILL						= 0x1B02	# PolygonMode
passthru: /* StencilOp */
	KEEP						= 0x1E00	# StencilOp
	REPLACE						= 0x1E01	# StencilOp
	INCR						= 0x1E02	# StencilOp
	DECR						= 0x1E03	# StencilOp
passthru: /* StringName */
	VENDOR						= 0x1F00	# StringName
	RENDERER					= 0x1F01	# StringName
	VERSION						= 0x1F02	# StringName
	EXTENSIONS					= 0x1F03	# StringName
passthru: /* TextureMagFilter */
	NEAREST						= 0x2600	# TextureMagFilter
	LINEAR						= 0x2601	# TextureMagFilter
passthru: /* TextureMinFilter */
	NEAREST_MIPMAP_NEAREST				= 0x2700	# TextureMinFilter
	LINEAR_MIPMAP_NEAREST				= 0x2701	# TextureMinFilter
	NEAREST_MIPMAP_LINEAR				= 0x2702	# TextureMinFilter
	LINEAR_MIPMAP_LINEAR				= 0x2703	# TextureMinFilter
passthru: /* TextureParameterName */
	TEXTURE_MAG_FILTER				= 0x2800	# TextureParameterName
	TEXTURE_MIN_FILTER				= 0x2801	# TextureParameterName
	TEXTURE_WRAP_S					= 0x2802	# TextureParameterName
	TEXTURE_WRAP_T					= 0x2803	# TextureParameterName
passthru: /* TextureTarget */
	PROXY_TEXTURE_1D				= 0x8063	# TextureTarget
	PROXY_TEXTURE_2D				= 0x8064	# TextureTarget
passthru: /* TextureWrapMode */
	REPEAT						= 0x2901	# TextureWrapMode
passthru: /* PixelInternalFormat */
	R3_G3_B2					= 0x2A10	# PixelInternalFormat
	RGB4						= 0x804F	# PixelInternalFormat
	RGB5						= 0x8050	# PixelInternalFormat
	RGB8						= 0x8051	# PixelInternalFormat
	RGB10						= 0x8052	# PixelInternalFormat
	RGB12						= 0x8053	# PixelInternalFormat
	RGB16						= 0x8054	# PixelInternalFormat
	RGBA2						= 0x8055	# PixelInternalFormat
	RGBA4						= 0x8056	# PixelInternalFormat
	RGB5_A1						= 0x8057	# PixelInternalFormat
	RGBA8						= 0x8058	# PixelInternalFormat
	RGB10_A2					= 0x8059	# PixelInternalFormat
	RGBA12						= 0x805A	# PixelInternalFormat
	RGBA16						= 0x805B	# PixelInternalFormat

VERSION_1_1_DEPRECATED enum:
passthru: /* AttribMask */
	CURRENT_BIT					= 0x00000001	# AttribMask
	POINT_BIT					= 0x00000002	# AttribMask
	LINE_BIT					= 0x00000004	# AttribMask
	POLYGON_BIT					= 0x00000008	# AttribMask
	POLYGON_STIPPLE_BIT				= 0x00000010	# AttribMask
	PIXEL_MODE_BIT					= 0x00000020	# AttribMask
	LIGHTING_BIT					= 0x00000040	# AttribMask
	FOG_BIT						= 0x00000080	# AttribMask
	ACCUM_BUFFER_BIT				= 0x00000200	# AttribMask
	VIEWPORT_BIT					= 0x00000800	# AttribMask
	TRANSFORM_BIT					= 0x00001000	# AttribMask
	ENABLE_BIT					= 0x00002000	# AttribMask
	HINT_BIT					= 0x00008000	# AttribMask
	EVAL_BIT					= 0x00010000	# AttribMask
	LIST_BIT					= 0x00020000	# AttribMask
	TEXTURE_BIT					= 0x00040000	# AttribMask
	SCISSOR_BIT					= 0x00080000	# AttribMask
	ALL_ATTRIB_BITS					= 0xFFFFFFFF	# AttribMask
passthru: /* ClientAttribMask */
	CLIENT_PIXEL_STORE_BIT				= 0x00000001	# ClientAttribMask
	CLIENT_VERTEX_ARRAY_BIT				= 0x00000002	# ClientAttribMask
	CLIENT_ALL_ATTRIB_BITS				= 0xFFFFFFFF	# ClientAttribMask
passthru: /* BeginMode */
	QUADS						= 0x0007	# BeginMode
	QUAD_STRIP					= 0x0008	# BeginMode
	POLYGON						= 0x0009	# BeginMode
passthru: /* AccumOp */
	ACCUM						= 0x0100	# AccumOp
	LOAD						= 0x0101	# AccumOp
	RETURN						= 0x0102	# AccumOp
	MULT						= 0x0103	# AccumOp
	ADD						= 0x0104	# AccumOp
passthru: /* DrawBufferMode */
	AUX0						= 0x0409	# DrawBufferMode
	AUX1						= 0x040A	# DrawBufferMode
	AUX2						= 0x040B	# DrawBufferMode
	AUX3						= 0x040C	# DrawBufferMode
passthru: /* FeedbackType */
	2D						= 0x0600	# FeedbackType
	3D						= 0x0601	# FeedbackType
	3D_COLOR					= 0x0602	# FeedbackType
	3D_COLOR_TEXTURE				= 0x0603	# FeedbackType
	4D_COLOR_TEXTURE				= 0x0604	# FeedbackType
passthru: /* FeedBackToken */
	PASS_THROUGH_TOKEN				= 0x0700	# FeedBackToken
	POINT_TOKEN					= 0x0701	# FeedBackToken
	LINE_TOKEN					= 0x0702	# FeedBackToken
	POLYGON_TOKEN					= 0x0703	# FeedBackToken
	BITMAP_TOKEN					= 0x0704	# FeedBackToken
	DRAW_PIXEL_TOKEN				= 0x0705	# FeedBackToken
	COPY_PIXEL_TOKEN				= 0x0706	# FeedBackToken
	LINE_RESET_TOKEN				= 0x0707	# FeedBackToken
passthru: /* FogMode */
	EXP						= 0x0800	# FogMode
	EXP2						= 0x0801	# FogMode
passthru: /* GetMapQuery */
	COEFF						= 0x0A00	# GetMapQuery
	ORDER						= 0x0A01	# GetMapQuery
	DOMAIN						= 0x0A02	# GetMapQuery
passthru: /* GetPixelMap */
	PIXEL_MAP_I_TO_I				= 0x0C70	# GetPixelMap
	PIXEL_MAP_S_TO_S				= 0x0C71	# GetPixelMap
	PIXEL_MAP_I_TO_R				= 0x0C72	# GetPixelMap
	PIXEL_MAP_I_TO_G				= 0x0C73	# GetPixelMap
	PIXEL_MAP_I_TO_B				= 0x0C74	# GetPixelMap
	PIXEL_MAP_I_TO_A				= 0x0C75	# GetPixelMap
	PIXEL_MAP_R_TO_R				= 0x0C76	# GetPixelMap
	PIXEL_MAP_G_TO_G				= 0x0C77	# GetPixelMap
	PIXEL_MAP_B_TO_B				= 0x0C78	# GetPixelMap
	PIXEL_MAP_A_TO_A				= 0x0C79	# GetPixelMap
passthru: /* GetPointervPName */
	VERTEX_ARRAY_POINTER				= 0x808E	# GetPointervPName
	NORMAL_ARRAY_POINTER				= 0x808F	# GetPointervPName
	COLOR_ARRAY_POINTER				= 0x8090	# GetPointervPName
	INDEX_ARRAY_POINTER				= 0x8091	# GetPointervPName
	TEXTURE_COORD_ARRAY_POINTER			= 0x8092	# GetPointervPName
	EDGE_FLAG_ARRAY_POINTER				= 0x8093	# GetPointervPName
	FEEDBACK_BUFFER_POINTER				= 0x0DF0	# GetPointervPName
	SELECTION_BUFFER_POINTER			= 0x0DF3	# GetPointervPName
passthru: /* GetPName */
	CURRENT_COLOR					= 0x0B00 # 4 F	# GetPName
	CURRENT_INDEX					= 0x0B01 # 1 F	# GetPName
	CURRENT_NORMAL					= 0x0B02 # 3 F	# GetPName
	CURRENT_TEXTURE_COORDS				= 0x0B03 # 4 F	# GetPName
	CURRENT_RASTER_COLOR				= 0x0B04 # 4 F	# GetPName
	CURRENT_RASTER_INDEX				= 0x0B05 # 1 F	# GetPName
	CURRENT_RASTER_TEXTURE_COORDS			= 0x0B06 # 4 F	# GetPName
	CURRENT_RASTER_POSITION				= 0x0B07 # 4 F	# GetPName
	CURRENT_RASTER_POSITION_VALID			= 0x0B08 # 1 I	# GetPName
	CURRENT_RASTER_DISTANCE				= 0x0B09 # 1 F	# GetPName
	POINT_SMOOTH					= 0x0B10 # 1 I	# GetPName
	LINE_STIPPLE					= 0x0B24 # 1 I	# GetPName
	LINE_STIPPLE_PATTERN				= 0x0B25 # 1 I	# GetPName
	LINE_STIPPLE_REPEAT				= 0x0B26 # 1 I	# GetPName
	LIST_MODE					= 0x0B30 # 1 I	# GetPName
	MAX_LIST_NESTING				= 0x0B31 # 1 I	# GetPName
	LIST_BASE					= 0x0B32 # 1 I	# GetPName
	LIST_INDEX					= 0x0B33 # 1 I	# GetPName
	POLYGON_MODE					= 0x0B40 # 2 I	# GetPName
	POLYGON_STIPPLE					= 0x0B42 # 1 I	# GetPName
	EDGE_FLAG					= 0x0B43 # 1 I	# GetPName
	LIGHTING					= 0x0B50 # 1 I	# GetPName
	LIGHT_MODEL_LOCAL_VIEWER			= 0x0B51 # 1 I	# GetPName
	LIGHT_MODEL_TWO_SIDE				= 0x0B52 # 1 I	# GetPName
	LIGHT_MODEL_AMBIENT				= 0x0B53 # 4 F	# GetPName
	SHADE_MODEL					= 0x0B54 # 1 I	# GetPName
	COLOR_MATERIAL_FACE				= 0x0B55 # 1 I	# GetPName
	COLOR_MATERIAL_PARAMETER			= 0x0B56 # 1 I	# GetPName
	COLOR_MATERIAL					= 0x0B57 # 1 I	# GetPName
	FOG						= 0x0B60 # 1 I	# GetPName
	FOG_INDEX					= 0x0B61 # 1 I	# GetPName
	FOG_DENSITY					= 0x0B62 # 1 F	# GetPName
	FOG_START					= 0x0B63 # 1 F	# GetPName
	FOG_END						= 0x0B64 # 1 F	# GetPName
	FOG_MODE					= 0x0B65 # 1 I	# GetPName
	FOG_COLOR					= 0x0B66 # 4 F	# GetPName
	ACCUM_CLEAR_VALUE				= 0x0B80 # 4 F	# GetPName
	MATRIX_MODE					= 0x0BA0 # 1 I	# GetPName
	NORMALIZE					= 0x0BA1 # 1 I	# GetPName
	MODELVIEW_STACK_DEPTH				= 0x0BA3 # 1 I	# GetPName
	PROJECTION_STACK_DEPTH				= 0x0BA4 # 1 I	# GetPName
	TEXTURE_STACK_DEPTH				= 0x0BA5 # 1 I	# GetPName
	MODELVIEW_MATRIX				= 0x0BA6 # 16 F # GetPName
	PROJECTION_MATRIX				= 0x0BA7 # 16 F # GetPName
	TEXTURE_MATRIX					= 0x0BA8 # 16 F # GetPName
	ATTRIB_STACK_DEPTH				= 0x0BB0 # 1 I	# GetPName
	CLIENT_ATTRIB_STACK_DEPTH			= 0x0BB1 # 1 I	# GetPName
	ALPHA_TEST					= 0x0BC0 # 1 I	# GetPName
	ALPHA_TEST_FUNC					= 0x0BC1 # 1 I	# GetPName
	ALPHA_TEST_REF					= 0x0BC2 # 1 F	# GetPName
	INDEX_LOGIC_OP					= 0x0BF1 # 1 I	# GetPName
	LOGIC_OP					= 0x0BF1 # 1 I	# GetPName
	AUX_BUFFERS					= 0x0C00 # 1 I	# GetPName
	INDEX_CLEAR_VALUE				= 0x0C20 # 1 I	# GetPName
	INDEX_WRITEMASK					= 0x0C21 # 1 I	# GetPName
	INDEX_MODE					= 0x0C30 # 1 I	# GetPName
	RGBA_MODE					= 0x0C31 # 1 I	# GetPName
	RENDER_MODE					= 0x0C40 # 1 I	# GetPName
	PERSPECTIVE_CORRECTION_HINT			= 0x0C50 # 1 I	# GetPName
	POINT_SMOOTH_HINT				= 0x0C51 # 1 I	# GetPName
	FOG_HINT					= 0x0C54 # 1 I	# GetPName
	TEXTURE_GEN_S					= 0x0C60 # 1 I	# GetPName
	TEXTURE_GEN_T					= 0x0C61 # 1 I	# GetPName
	TEXTURE_GEN_R					= 0x0C62 # 1 I	# GetPName
	TEXTURE_GEN_Q					= 0x0C63 # 1 I	# GetPName
	PIXEL_MAP_I_TO_I_SIZE				= 0x0CB0 # 1 I	# GetPName
	PIXEL_MAP_S_TO_S_SIZE				= 0x0CB1 # 1 I	# GetPName
	PIXEL_MAP_I_TO_R_SIZE				= 0x0CB2 # 1 I	# GetPName
	PIXEL_MAP_I_TO_G_SIZE				= 0x0CB3 # 1 I	# GetPName
	PIXEL_MAP_I_TO_B_SIZE				= 0x0CB4 # 1 I	# GetPName
	PIXEL_MAP_I_TO_A_SIZE				= 0x0CB5 # 1 I	# GetPName
	PIXEL_MAP_R_TO_R_SIZE				= 0x0CB6 # 1 I	# GetPName
	PIXEL_MAP_G_TO_G_SIZE				= 0x0CB7 # 1 I	# GetPName
	PIXEL_MAP_B_TO_B_SIZE				= 0x0CB8 # 1 I	# GetPName
	PIXEL_MAP_A_TO_A_SIZE				= 0x0CB9 # 1 I	# GetPName
	MAP_COLOR					= 0x0D10 # 1 I	# GetPName
	MAP_STENCIL					= 0x0D11 # 1 I	# GetPName
	INDEX_SHIFT					= 0x0D12 # 1 I	# GetPName
	INDEX_OFFSET					= 0x0D13 # 1 I	# GetPName
	RED_SCALE					= 0x0D14 # 1 F	# GetPName
	RED_BIAS					= 0x0D15 # 1 F	# GetPName
	ZOOM_X						= 0x0D16 # 1 F	# GetPName
	ZOOM_Y						= 0x0D17 # 1 F	# GetPName
	GREEN_SCALE					= 0x0D18 # 1 F	# GetPName
	GREEN_BIAS					= 0x0D19 # 1 F	# GetPName
	BLUE_SCALE					= 0x0D1A # 1 F	# GetPName
	BLUE_BIAS					= 0x0D1B # 1 F	# GetPName
	ALPHA_SCALE					= 0x0D1C # 1 F	# GetPName
	ALPHA_BIAS					= 0x0D1D # 1 F	# GetPName
	DEPTH_SCALE					= 0x0D1E # 1 F	# GetPName
	DEPTH_BIAS					= 0x0D1F # 1 F	# GetPName
	MAX_EVAL_ORDER					= 0x0D30 # 1 I	# GetPName
	MAX_LIGHTS					= 0x0D31 # 1 I	# GetPName
	MAX_CLIP_PLANES					= 0x0D32 # 1 I	# GetPName
	MAX_PIXEL_MAP_TABLE				= 0x0D34 # 1 I	# GetPName
	MAX_ATTRIB_STACK_DEPTH				= 0x0D35 # 1 I	# GetPName
	MAX_MODELVIEW_STACK_DEPTH			= 0x0D36 # 1 I	# GetPName
	MAX_NAME_STACK_DEPTH				= 0x0D37 # 1 I	# GetPName
	MAX_PROJECTION_STACK_DEPTH			= 0x0D38 # 1 I	# GetPName
	MAX_TEXTURE_STACK_DEPTH				= 0x0D39 # 1 I	# GetPName
	MAX_CLIENT_ATTRIB_STACK_DEPTH			= 0x0D3B # 1 I	# GetPName
	INDEX_BITS					= 0x0D51 # 1 I	# GetPName
	RED_BITS					= 0x0D52 # 1 I	# GetPName
	GREEN_BITS					= 0x0D53 # 1 I	# GetPName
	BLUE_BITS					= 0x0D54 # 1 I	# GetPName
	ALPHA_BITS					= 0x0D55 # 1 I	# GetPName
	DEPTH_BITS					= 0x0D56 # 1 I	# GetPName
	STENCIL_BITS					= 0x0D57 # 1 I	# GetPName
	ACCUM_RED_BITS					= 0x0D58 # 1 I	# GetPName
	ACCUM_GREEN_BITS				= 0x0D59 # 1 I	# GetPName
	ACCUM_BLUE_BITS					= 0x0D5A # 1 I	# GetPName
	ACCUM_ALPHA_BITS				= 0x0D5B # 1 I	# GetPName
	NAME_STACK_DEPTH				= 0x0D70 # 1 I	# GetPName
	AUTO_NORMAL					= 0x0D80 # 1 I	# GetPName
	MAP1_COLOR_4					= 0x0D90 # 1 I	# GetPName
	MAP1_INDEX					= 0x0D91 # 1 I	# GetPName
	MAP1_NORMAL					= 0x0D92 # 1 I	# GetPName
	MAP1_TEXTURE_COORD_1				= 0x0D93 # 1 I	# GetPName
	MAP1_TEXTURE_COORD_2				= 0x0D94 # 1 I	# GetPName
	MAP1_TEXTURE_COORD_3				= 0x0D95 # 1 I	# GetPName
	MAP1_TEXTURE_COORD_4				= 0x0D96 # 1 I	# GetPName
	MAP1_VERTEX_3					= 0x0D97 # 1 I	# GetPName
	MAP1_VERTEX_4					= 0x0D98 # 1 I	# GetPName
	MAP2_COLOR_4					= 0x0DB0 # 1 I	# GetPName
	MAP2_INDEX					= 0x0DB1 # 1 I	# GetPName
	MAP2_NORMAL					= 0x0DB2 # 1 I	# GetPName
	MAP2_TEXTURE_COORD_1				= 0x0DB3 # 1 I	# GetPName
	MAP2_TEXTURE_COORD_2				= 0x0DB4 # 1 I	# GetPName
	MAP2_TEXTURE_COORD_3				= 0x0DB5 # 1 I	# GetPName
	MAP2_TEXTURE_COORD_4				= 0x0DB6 # 1 I	# GetPName
	MAP2_VERTEX_3					= 0x0DB7 # 1 I	# GetPName
	MAP2_VERTEX_4					= 0x0DB8 # 1 I	# GetPName
	MAP1_GRID_DOMAIN				= 0x0DD0 # 2 F	# GetPName
	MAP1_GRID_SEGMENTS				= 0x0DD1 # 1 I	# GetPName
	MAP2_GRID_DOMAIN				= 0x0DD2 # 4 F	# GetPName
	MAP2_GRID_SEGMENTS				= 0x0DD3 # 2 I	# GetPName
	FEEDBACK_BUFFER_SIZE				= 0x0DF1 # 1 I	# GetPName
	FEEDBACK_BUFFER_TYPE				= 0x0DF2 # 1 I	# GetPName
	SELECTION_BUFFER_SIZE				= 0x0DF4 # 1 I	# GetPName
	VERTEX_ARRAY					= 0x8074 # 1 I	# GetPName
	NORMAL_ARRAY					= 0x8075 # 1 I	# GetPName
	COLOR_ARRAY					= 0x8076 # 1 I	# GetPName
	INDEX_ARRAY					= 0x8077 # 1 I	# GetPName
	TEXTURE_COORD_ARRAY				= 0x8078 # 1 I	# GetPName
	EDGE_FLAG_ARRAY					= 0x8079 # 1 I	# GetPName
	VERTEX_ARRAY_SIZE				= 0x807A # 1 I	# GetPName
	VERTEX_ARRAY_TYPE				= 0x807B # 1 I	# GetPName
	VERTEX_ARRAY_STRIDE				= 0x807C # 1 I	# GetPName
	NORMAL_ARRAY_TYPE				= 0x807E # 1 I	# GetPName
	NORMAL_ARRAY_STRIDE				= 0x807F # 1 I	# GetPName
	COLOR_ARRAY_SIZE				= 0x8081 # 1 I	# GetPName
	COLOR_ARRAY_TYPE				= 0x8082 # 1 I	# GetPName
	COLOR_ARRAY_STRIDE				= 0x8083 # 1 I	# GetPName
	INDEX_ARRAY_TYPE				= 0x8085 # 1 I	# GetPName
	INDEX_ARRAY_STRIDE				= 0x8086 # 1 I	# GetPName
	TEXTURE_COORD_ARRAY_SIZE			= 0x8088 # 1 I	# GetPName
	TEXTURE_COORD_ARRAY_TYPE			= 0x8089 # 1 I	# GetPName
	TEXTURE_COORD_ARRAY_STRIDE			= 0x808A # 1 I	# GetPName
	EDGE_FLAG_ARRAY_STRIDE				= 0x808C # 1 I	# GetPName
passthru: /* GetTextureParameter */
	TEXTURE_COMPONENTS				= 0x1003	# GetTextureParameter
	TEXTURE_BORDER					= 0x1005	# GetTextureParameter
	TEXTURE_LUMINANCE_SIZE				= 0x8060	# GetTextureParameter
	TEXTURE_INTENSITY_SIZE				= 0x8061	# GetTextureParameter
	TEXTURE_PRIORITY				= 0x8066	# GetTextureParameter
	TEXTURE_RESIDENT				= 0x8067	# GetTextureParameter
passthru: /* LightParameter */
	AMBIENT						= 0x1200	# LightParameter
	DIFFUSE						= 0x1201	# LightParameter
	SPECULAR					= 0x1202	# LightParameter
	POSITION					= 0x1203	# LightParameter
	SPOT_DIRECTION					= 0x1204	# LightParameter
	SPOT_EXPONENT					= 0x1205	# LightParameter
	SPOT_CUTOFF					= 0x1206	# LightParameter
	CONSTANT_ATTENUATION				= 0x1207	# LightParameter
	LINEAR_ATTENUATION				= 0x1208	# LightParameter
	QUADRATIC_ATTENUATION				= 0x1209	# LightParameter
passthru: /* ListMode */
	COMPILE						= 0x1300	# ListMode
	COMPILE_AND_EXECUTE				= 0x1301	# ListMode
passthru: /* DataType */
	2_BYTES						= 0x1407	# DataType
	3_BYTES						= 0x1408	# DataType
	4_BYTES						= 0x1409	# DataType
passthru: /* MaterialParameter */
	EMISSION					= 0x1600	# MaterialParameter
	SHININESS					= 0x1601	# MaterialParameter
	AMBIENT_AND_DIFFUSE				= 0x1602	# MaterialParameter
	COLOR_INDEXES					= 0x1603	# MaterialParameter
passthru: /* MatrixMode */
	MODELVIEW					= 0x1700	# MatrixMode
	PROJECTION					= 0x1701	# MatrixMode
passthru: /* PixelFormat */
	COLOR_INDEX					= 0x1900	# PixelFormat
	LUMINANCE					= 0x1909	# PixelFormat
	LUMINANCE_ALPHA					= 0x190A	# PixelFormat
passthru: /* PixelType */
	BITMAP						= 0x1A00	# PixelType
passthru: /* RenderingMode */
	RENDER						= 0x1C00	# RenderingMode
	FEEDBACK					= 0x1C01	# RenderingMode
	SELECT						= 0x1C02	# RenderingMode
passthru: /* ShadingModel */
	FLAT						= 0x1D00	# ShadingModel
	SMOOTH						= 0x1D01	# ShadingModel
passthru: /* TextureCoordName */
	S						= 0x2000	# TextureCoordName
	T						= 0x2001	# TextureCoordName
	R						= 0x2002	# TextureCoordName
	Q						= 0x2003	# TextureCoordName
passthru: /* TextureEnvMode */
	MODULATE					= 0x2100	# TextureEnvMode
	DECAL						= 0x2101	# TextureEnvMode
passthru: /* TextureEnvParameter */
	TEXTURE_ENV_MODE				= 0x2200	# TextureEnvParameter
	TEXTURE_ENV_COLOR				= 0x2201	# TextureEnvParameter
passthru: /* TextureEnvTarget */
	TEXTURE_ENV					= 0x2300	# TextureEnvTarget
passthru: /* TextureGenMode */
	EYE_LINEAR					= 0x2400	# TextureGenMode
	OBJECT_LINEAR					= 0x2401	# TextureGenMode
	SPHERE_MAP					= 0x2402	# TextureGenMode
passthru: /* TextureGenParameter */
	TEXTURE_GEN_MODE				= 0x2500	# TextureGenParameter
	OBJECT_PLANE					= 0x2501	# TextureGenParameter
	EYE_PLANE					= 0x2502	# TextureGenParameter
passthru: /* TextureWrapMode */
	CLAMP						= 0x2900	# TextureWrapMode
passthru: /* PixelInternalFormat */
	ALPHA4						= 0x803B	# PixelInternalFormat
	ALPHA8						= 0x803C	# PixelInternalFormat
	ALPHA12						= 0x803D	# PixelInternalFormat
	ALPHA16						= 0x803E	# PixelInternalFormat
	LUMINANCE4					= 0x803F	# PixelInternalFormat
	LUMINANCE8					= 0x8040	# PixelInternalFormat
	LUMINANCE12					= 0x8041	# PixelInternalFormat
	LUMINANCE16					= 0x8042	# PixelInternalFormat
	LUMINANCE4_ALPHA4				= 0x8043	# PixelInternalFormat
	LUMINANCE6_ALPHA2				= 0x8044	# PixelInternalFormat
	LUMINANCE8_ALPHA8				= 0x8045	# PixelInternalFormat
	LUMINANCE12_ALPHA4				= 0x8046	# PixelInternalFormat
	LUMINANCE12_ALPHA12				= 0x8047	# PixelInternalFormat
	LUMINANCE16_ALPHA16				= 0x8048	# PixelInternalFormat
	INTENSITY					= 0x8049	# PixelInternalFormat
	INTENSITY4					= 0x804A	# PixelInternalFormat
	INTENSITY8					= 0x804B	# PixelInternalFormat
	INTENSITY12					= 0x804C	# PixelInternalFormat
	INTENSITY16					= 0x804D	# PixelInternalFormat
passthru: /* InterleavedArrayFormat */
	V2F						= 0x2A20	# InterleavedArrayFormat
	V3F						= 0x2A21	# InterleavedArrayFormat
	C4UB_V2F					= 0x2A22	# InterleavedArrayFormat
	C4UB_V3F					= 0x2A23	# InterleavedArrayFormat
	C3F_V3F						= 0x2A24	# InterleavedArrayFormat
	N3F_V3F						= 0x2A25	# InterleavedArrayFormat
	C4F_N3F_V3F					= 0x2A26	# InterleavedArrayFormat
	T2F_V3F						= 0x2A27	# InterleavedArrayFormat
	T4F_V4F						= 0x2A28	# InterleavedArrayFormat
	T2F_C4UB_V3F					= 0x2A29	# InterleavedArrayFormat
	T2F_C3F_V3F					= 0x2A2A	# InterleavedArrayFormat
	T2F_N3F_V3F					= 0x2A2B	# InterleavedArrayFormat
	T2F_C4F_N3F_V3F					= 0x2A2C	# InterleavedArrayFormat
	T4F_C4F_N3F_V4F					= 0x2A2D	# InterleavedArrayFormat
passthru: /* ClipPlaneName */
	CLIP_PLANE0					= 0x3000 # 1 I	# ClipPlaneName
	CLIP_PLANE1					= 0x3001 # 1 I	# ClipPlaneName
	CLIP_PLANE2					= 0x3002 # 1 I	# ClipPlaneName
	CLIP_PLANE3					= 0x3003 # 1 I	# ClipPlaneName
	CLIP_PLANE4					= 0x3004 # 1 I	# ClipPlaneName
	CLIP_PLANE5					= 0x3005 # 1 I	# ClipPlaneName
passthru: /* LightName */
	LIGHT0						= 0x4000 # 1 I	# LightName
	LIGHT1						= 0x4001 # 1 I	# LightName
	LIGHT2						= 0x4002 # 1 I	# LightName
	LIGHT3						= 0x4003 # 1 I	# LightName
	LIGHT4						= 0x4004 # 1 I	# LightName
	LIGHT5						= 0x4005 # 1 I	# LightName
	LIGHT6						= 0x4006 # 1 I	# LightName
	LIGHT7						= 0x4007 # 1 I	# LightName


###############################################################################
#
# OpenGL 1.2 enums
#
###############################################################################

VERSION_1_2 enum:
	UNSIGNED_BYTE_3_3_2				= 0x8032 # Equivalent to EXT_packed_pixels
	UNSIGNED_SHORT_4_4_4_4				= 0x8033
	UNSIGNED_SHORT_5_5_5_1				= 0x8034
	UNSIGNED_INT_8_8_8_8				= 0x8035
	UNSIGNED_INT_10_10_10_2				= 0x8036
	TEXTURE_BINDING_3D				= 0x806A # 1 I
	PACK_SKIP_IMAGES				= 0x806B # 1 I
	PACK_IMAGE_HEIGHT				= 0x806C # 1 F
	UNPACK_SKIP_IMAGES				= 0x806D # 1 I
	UNPACK_IMAGE_HEIGHT				= 0x806E # 1 F
	TEXTURE_3D					= 0x806F # 1 I
	PROXY_TEXTURE_3D				= 0x8070
	TEXTURE_DEPTH					= 0x8071
	TEXTURE_WRAP_R					= 0x8072
	MAX_3D_TEXTURE_SIZE				= 0x8073 # 1 I
	UNSIGNED_BYTE_2_3_3_REV				= 0x8362 # New for OpenGL 1.2
	UNSIGNED_SHORT_5_6_5				= 0x8363
	UNSIGNED_SHORT_5_6_5_REV			= 0x8364
	UNSIGNED_SHORT_4_4_4_4_REV			= 0x8365
	UNSIGNED_SHORT_1_5_5_5_REV			= 0x8366
	UNSIGNED_INT_8_8_8_8_REV			= 0x8367
	UNSIGNED_INT_2_10_10_10_REV			= 0x8368
	BGR						= 0x80E0
	BGRA						= 0x80E1
	MAX_ELEMENTS_VERTICES				= 0x80E8
	MAX_ELEMENTS_INDICES				= 0x80E9
	CLAMP_TO_EDGE					= 0x812F # Equivalent to SGIS_texture_edge_clamp
	TEXTURE_MIN_LOD					= 0x813A # Equivalent to SGIS_texture_lod
	TEXTURE_MAX_LOD					= 0x813B
	TEXTURE_BASE_LEVEL				= 0x813C
	TEXTURE_MAX_LEVEL				= 0x813D
	SMOOTH_POINT_SIZE_RANGE				= 0x0B12 # 2 F
	SMOOTH_POINT_SIZE_GRANULARITY			= 0x0B13 # 1 F
	SMOOTH_LINE_WIDTH_RANGE				= 0x0B22 # 2 F
	SMOOTH_LINE_WIDTH_GRANULARITY			= 0x0B23 # 1 F
	ALIASED_LINE_WIDTH_RANGE			= 0x846E # 2 F

VERSION_1_2_DEPRECATED enum:
	RESCALE_NORMAL					= 0x803A # 1 I # Equivalent to EXT_rescale_normal
	LIGHT_MODEL_COLOR_CONTROL			= 0x81F8 # 1 I
	SINGLE_COLOR					= 0x81F9
	SEPARATE_SPECULAR_COLOR				= 0x81FA
	ALIASED_POINT_SIZE_RANGE			= 0x846D # 2 F

ARB_imaging enum:
	CONSTANT_COLOR					= 0x8001 # Equivalent to EXT_blend_color
	ONE_MINUS_CONSTANT_COLOR			= 0x8002
	CONSTANT_ALPHA					= 0x8003
	ONE_MINUS_CONSTANT_ALPHA			= 0x8004
	BLEND_COLOR					= 0x8005 # 4 F
	FUNC_ADD					= 0x8006 # Equivalent to EXT_blend_minmax
	MIN						= 0x8007
	MAX						= 0x8008
	BLEND_EQUATION					= 0x8009 # 1 I
	FUNC_SUBTRACT					= 0x800A # Equivalent to EXT_blend_subtract
	FUNC_REVERSE_SUBTRACT				= 0x800B

ARB_imaging_DEPRECATED enum:
	CONVOLUTION_1D					= 0x8010 # 1 I # Equivalent to EXT_convolution
	CONVOLUTION_2D					= 0x8011 # 1 I
	SEPARABLE_2D					= 0x8012 # 1 I
	CONVOLUTION_BORDER_MODE				= 0x8013
	CONVOLUTION_FILTER_SCALE			= 0x8014
	CONVOLUTION_FILTER_BIAS				= 0x8015
	REDUCE						= 0x8016
	CONVOLUTION_FORMAT				= 0x8017
	CONVOLUTION_WIDTH				= 0x8018
	CONVOLUTION_HEIGHT				= 0x8019
	MAX_CONVOLUTION_WIDTH				= 0x801A
	MAX_CONVOLUTION_HEIGHT				= 0x801B
	POST_CONVOLUTION_RED_SCALE			= 0x801C # 1 F
	POST_CONVOLUTION_GREEN_SCALE			= 0x801D # 1 F
	POST_CONVOLUTION_BLUE_SCALE			= 0x801E # 1 F
	POST_CONVOLUTION_ALPHA_SCALE			= 0x801F # 1 F
	POST_CONVOLUTION_RED_BIAS			= 0x8020 # 1 F
	POST_CONVOLUTION_GREEN_BIAS			= 0x8021 # 1 F
	POST_CONVOLUTION_BLUE_BIAS			= 0x8022 # 1 F
	POST_CONVOLUTION_ALPHA_BIAS			= 0x8023 # 1 F
	HISTOGRAM					= 0x8024 # 1 I # Equivalent to EXT_histogram
	PROXY_HISTOGRAM					= 0x8025
	HISTOGRAM_WIDTH					= 0x8026
	HISTOGRAM_FORMAT				= 0x8027
	HISTOGRAM_RED_SIZE				= 0x8028
	HISTOGRAM_GREEN_SIZE				= 0x8029
	HISTOGRAM_BLUE_SIZE				= 0x802A
	HISTOGRAM_ALPHA_SIZE				= 0x802B
	HISTOGRAM_LUMINANCE_SIZE			= 0x802C
	HISTOGRAM_SINK					= 0x802D
	MINMAX						= 0x802E # 1 I
	MINMAX_FORMAT					= 0x802F
	MINMAX_SINK					= 0x8030
	TABLE_TOO_LARGE					= 0x8031
	COLOR_MATRIX					= 0x80B1 # 16 F # Equivalent to SGI_color_matrix
	COLOR_MATRIX_STACK_DEPTH			= 0x80B2 # 1 I
	MAX_COLOR_MATRIX_STACK_DEPTH			= 0x80B3 # 1 I
	POST_COLOR_MATRIX_RED_SCALE			= 0x80B4 # 1 F
	POST_COLOR_MATRIX_GREEN_SCALE			= 0x80B5 # 1 F
	POST_COLOR_MATRIX_BLUE_SCALE			= 0x80B6 # 1 F
	POST_COLOR_MATRIX_ALPHA_SCALE			= 0x80B7 # 1 F
	POST_COLOR_MATRIX_RED_BIAS			= 0x80B8 # 1 F
	POST_COLOR_MATRIX_GREEN_BIAS			= 0x80B9 # 1 F
	POST_COLOR_MATRIX_BLUE_BIAS			= 0x80BA # 1 F
	POST_COLOR_MATRIX_ALPHA_BIAS			= 0x80BB # 1 F
	COLOR_TABLE					= 0x80D0 # 1 I # Equivalent to SGI_color_table
	POST_CONVOLUTION_COLOR_TABLE			= 0x80D1 # 1 I
	POST_COLOR_MATRIX_COLOR_TABLE			= 0x80D2 # 1 I
	PROXY_COLOR_TABLE				= 0x80D3
	PROXY_POST_CONVOLUTION_COLOR_TABLE		= 0x80D4
	PROXY_POST_COLOR_MATRIX_COLOR_TABLE		= 0x80D5
	COLOR_TABLE_SCALE				= 0x80D6
	COLOR_TABLE_BIAS				= 0x80D7
	COLOR_TABLE_FORMAT				= 0x80D8
	COLOR_TABLE_WIDTH				= 0x80D9
	COLOR_TABLE_RED_SIZE				= 0x80DA
	COLOR_TABLE_GREEN_SIZE				= 0x80DB
	COLOR_TABLE_BLUE_SIZE				= 0x80DC
	COLOR_TABLE_ALPHA_SIZE				= 0x80DD
	COLOR_TABLE_LUMINANCE_SIZE			= 0x80DE
	COLOR_TABLE_INTENSITY_SIZE			= 0x80DF
	CONSTANT_BORDER					= 0x8151
	REPLICATE_BORDER				= 0x8153
	CONVOLUTION_BORDER_COLOR			= 0x8154


###############################################################################
#
# OpenGL 1.3 enums
#
###############################################################################

VERSION_1_3 enum:
	TEXTURE0					= 0x84C0	# Promoted from ARB_multitexture
	TEXTURE1					= 0x84C1
	TEXTURE2					= 0x84C2
	TEXTURE3					= 0x84C3
	TEXTURE4					= 0x84C4
	TEXTURE5					= 0x84C5
	TEXTURE6					= 0x84C6
	TEXTURE7					= 0x84C7
	TEXTURE8					= 0x84C8
	TEXTURE9					= 0x84C9
	TEXTURE10					= 0x84CA
	TEXTURE11					= 0x84CB
	TEXTURE12					= 0x84CC
	TEXTURE13					= 0x84CD
	TEXTURE14					= 0x84CE
	TEXTURE15					= 0x84CF
	TEXTURE16					= 0x84D0
	TEXTURE17					= 0x84D1
	TEXTURE18					= 0x84D2
	TEXTURE19					= 0x84D3
	TEXTURE20					= 0x84D4
	TEXTURE21					= 0x84D5
	TEXTURE22					= 0x84D6
	TEXTURE23					= 0x84D7
	TEXTURE24					= 0x84D8
	TEXTURE25					= 0x84D9
	TEXTURE26					= 0x84DA
	TEXTURE27					= 0x84DB
	TEXTURE28					= 0x84DC
	TEXTURE29					= 0x84DD
	TEXTURE30					= 0x84DE
	TEXTURE31					= 0x84DF
	ACTIVE_TEXTURE					= 0x84E0 # 1 I
	MULTISAMPLE					= 0x809D	# Promoted from ARB_multisample
	SAMPLE_ALPHA_TO_COVERAGE			= 0x809E
	SAMPLE_ALPHA_TO_ONE				= 0x809F
	SAMPLE_COVERAGE					= 0x80A0
	SAMPLE_BUFFERS					= 0x80A8
	SAMPLES						= 0x80A9
	SAMPLE_COVERAGE_VALUE				= 0x80AA
	SAMPLE_COVERAGE_INVERT				= 0x80AB
	TEXTURE_CUBE_MAP				= 0x8513
	TEXTURE_BINDING_CUBE_MAP			= 0x8514
	TEXTURE_CUBE_MAP_POSITIVE_X			= 0x8515
	TEXTURE_CUBE_MAP_NEGATIVE_X			= 0x8516
	TEXTURE_CUBE_MAP_POSITIVE_Y			= 0x8517
	TEXTURE_CUBE_MAP_NEGATIVE_Y			= 0x8518
	TEXTURE_CUBE_MAP_POSITIVE_Z			= 0x8519
	TEXTURE_CUBE_MAP_NEGATIVE_Z			= 0x851A
	PROXY_TEXTURE_CUBE_MAP				= 0x851B
	MAX_CUBE_MAP_TEXTURE_SIZE			= 0x851C
	COMPRESSED_RGB					= 0x84ED
	COMPRESSED_RGBA					= 0x84EE
	TEXTURE_COMPRESSION_HINT			= 0x84EF
	TEXTURE_COMPRESSED_IMAGE_SIZE			= 0x86A0
	TEXTURE_COMPRESSED				= 0x86A1
	NUM_COMPRESSED_TEXTURE_FORMATS			= 0x86A2
	COMPRESSED_TEXTURE_FORMATS			= 0x86A3
	CLAMP_TO_BORDER					= 0x812D	# Promoted from ARB_texture_border_clamp

VERSION_1_3_DEPRECATED enum:
	CLIENT_ACTIVE_TEXTURE				= 0x84E1 # 1 I
	MAX_TEXTURE_UNITS				= 0x84E2 # 1 I
	TRANSPOSE_MODELVIEW_MATRIX			= 0x84E3 # 16 F # Promoted from ARB_transpose_matrix
	TRANSPOSE_PROJECTION_MATRIX			= 0x84E4 # 16 F
	TRANSPOSE_TEXTURE_MATRIX			= 0x84E5 # 16 F
	TRANSPOSE_COLOR_MATRIX				= 0x84E6 # 16 F
	MULTISAMPLE_BIT					= 0x20000000
	NORMAL_MAP					= 0x8511	# Promoted from ARB_texture_cube_map
	REFLECTION_MAP					= 0x8512
	COMPRESSED_ALPHA				= 0x84E9	# Promoted from ARB_texture_compression
	COMPRESSED_LUMINANCE				= 0x84EA
	COMPRESSED_LUMINANCE_ALPHA			= 0x84EB
	COMPRESSED_INTENSITY				= 0x84EC
	COMBINE						= 0x8570	# Promoted from ARB_texture_env_combine
	COMBINE_RGB					= 0x8571
	COMBINE_ALPHA					= 0x8572
	SOURCE0_RGB					= 0x8580
	SOURCE1_RGB					= 0x8581
	SOURCE2_RGB					= 0x8582
	SOURCE0_ALPHA					= 0x8588
	SOURCE1_ALPHA					= 0x8589
	SOURCE2_ALPHA					= 0x858A
	OPERAND0_RGB					= 0x8590
	OPERAND1_RGB					= 0x8591
	OPERAND2_RGB					= 0x8592
	OPERAND0_ALPHA					= 0x8598
	OPERAND1_ALPHA					= 0x8599
	OPERAND2_ALPHA					= 0x859A
	RGB_SCALE					= 0x8573
	ADD_SIGNED					= 0x8574
	INTERPOLATE					= 0x8575
	SUBTRACT					= 0x84E7
	CONSTANT					= 0x8576
	PRIMARY_COLOR					= 0x8577
	PREVIOUS					= 0x8578
	DOT3_RGB					= 0x86AE	# Promoted from ARB_texture_env_dot3
	DOT3_RGBA					= 0x86AF


###############################################################################
#
# OpenGL 1.4 enums
#
###############################################################################

VERSION_1_4 enum:
	BLEND_DST_RGB					= 0x80C8
	BLEND_SRC_RGB					= 0x80C9
	BLEND_DST_ALPHA					= 0x80CA
	BLEND_SRC_ALPHA					= 0x80CB
	POINT_FADE_THRESHOLD_SIZE			= 0x8128 # 1 F
	DEPTH_COMPONENT16				= 0x81A5
	DEPTH_COMPONENT24				= 0x81A6
	DEPTH_COMPONENT32				= 0x81A7
	MIRRORED_REPEAT					= 0x8370
	MAX_TEXTURE_LOD_BIAS				= 0x84FD
	TEXTURE_LOD_BIAS				= 0x8501
	INCR_WRAP					= 0x8507
	DECR_WRAP					= 0x8508
	TEXTURE_DEPTH_SIZE				= 0x884A
	TEXTURE_COMPARE_MODE				= 0x884C
	TEXTURE_COMPARE_FUNC				= 0x884D

VERSION_1_4_DEPRECATED enum:
	POINT_SIZE_MIN					= 0x8126 # 1 F
	POINT_SIZE_MAX					= 0x8127 # 1 F
	POINT_DISTANCE_ATTENUATION			= 0x8129 # 3 F
	GENERATE_MIPMAP					= 0x8191
	GENERATE_MIPMAP_HINT				= 0x8192 # 1 I
	FOG_COORDINATE_SOURCE				= 0x8450 # 1 I
	FOG_COORDINATE					= 0x8451
	FRAGMENT_DEPTH					= 0x8452
	CURRENT_FOG_COORDINATE				= 0x8453 # 1 F
	FOG_COORDINATE_ARRAY_TYPE			= 0x8454 # 1 I
	FOG_COORDINATE_ARRAY_STRIDE			= 0x8455 # 1 I
	FOG_COORDINATE_ARRAY_POINTER			= 0x8456
	FOG_COORDINATE_ARRAY				= 0x8457 # 1 I
	COLOR_SUM					= 0x8458 # 1 I
	CURRENT_SECONDARY_COLOR				= 0x8459 # 3 F
	SECONDARY_COLOR_ARRAY_SIZE			= 0x845A # 1 I
	SECONDARY_COLOR_ARRAY_TYPE			= 0x845B # 1 I
	SECONDARY_COLOR_ARRAY_STRIDE			= 0x845C # 1 I
	SECONDARY_COLOR_ARRAY_POINTER			= 0x845D
	SECONDARY_COLOR_ARRAY				= 0x845E # 1 I
	TEXTURE_FILTER_CONTROL				= 0x8500
	DEPTH_TEXTURE_MODE				= 0x884B
	COMPARE_R_TO_TEXTURE				= 0x884E


###############################################################################
#
# OpenGL 1.5 enums
#
###############################################################################

VERSION_1_5 enum:
	BUFFER_SIZE					= 0x8764 # ARB_vertex_buffer_object
	BUFFER_USAGE					= 0x8765 # ARB_vertex_buffer_object
	QUERY_COUNTER_BITS				= 0x8864 # ARB_occlusion_query
	CURRENT_QUERY					= 0x8865 # ARB_occlusion_query
	QUERY_RESULT					= 0x8866 # ARB_occlusion_query
	QUERY_RESULT_AVAILABLE				= 0x8867 # ARB_occlusion_query
	ARRAY_BUFFER					= 0x8892 # ARB_vertex_buffer_object
	ELEMENT_ARRAY_BUFFER				= 0x8893 # ARB_vertex_buffer_object
	ARRAY_BUFFER_BINDING				= 0x8894 # ARB_vertex_buffer_object
	ELEMENT_ARRAY_BUFFER_BINDING			= 0x8895 # ARB_vertex_buffer_object
	VERTEX_ATTRIB_ARRAY_BUFFER_BINDING		= 0x889F # ARB_vertex_buffer_object
	READ_ONLY					= 0x88B8 # ARB_vertex_buffer_object
	WRITE_ONLY					= 0x88B9 # ARB_vertex_buffer_object
	READ_WRITE					= 0x88BA # ARB_vertex_buffer_object
	BUFFER_ACCESS					= 0x88BB # ARB_vertex_buffer_object
	BUFFER_MAPPED					= 0x88BC # ARB_vertex_buffer_object
	BUFFER_MAP_POINTER				= 0x88BD # ARB_vertex_buffer_object
	STREAM_DRAW					= 0x88E0 # ARB_vertex_buffer_object
	STREAM_READ					= 0x88E1 # ARB_vertex_buffer_object
	STREAM_COPY					= 0x88E2 # ARB_vertex_buffer_object
	STATIC_DRAW					= 0x88E4 # ARB_vertex_buffer_object
	STATIC_READ					= 0x88E5 # ARB_vertex_buffer_object
	STATIC_COPY					= 0x88E6 # ARB_vertex_buffer_object
	DYNAMIC_DRAW					= 0x88E8 # ARB_vertex_buffer_object
	DYNAMIC_READ					= 0x88E9 # ARB_vertex_buffer_object
	DYNAMIC_COPY					= 0x88EA # ARB_vertex_buffer_object
	SAMPLES_PASSED					= 0x8914 # ARB_occlusion_query

VERSION_1_5_DEPRECATED enum:
	VERTEX_ARRAY_BUFFER_BINDING			= 0x8896 # ARB_vertex_buffer_object
	NORMAL_ARRAY_BUFFER_BINDING			= 0x8897 # ARB_vertex_buffer_object
	COLOR_ARRAY_BUFFER_BINDING			= 0x8898 # ARB_vertex_buffer_object
	INDEX_ARRAY_BUFFER_BINDING			= 0x8899 # ARB_vertex_buffer_object
	TEXTURE_COORD_ARRAY_BUFFER_BINDING		= 0x889A # ARB_vertex_buffer_object
	EDGE_FLAG_ARRAY_BUFFER_BINDING			= 0x889B # ARB_vertex_buffer_object
	SECONDARY_COLOR_ARRAY_BUFFER_BINDING		= 0x889C # ARB_vertex_buffer_object
	FOG_COORDINATE_ARRAY_BUFFER_BINDING		= 0x889D # ARB_vertex_buffer_object
	WEIGHT_ARRAY_BUFFER_BINDING			= 0x889E # ARB_vertex_buffer_object
	FOG_COORD_SRC					= 0x8450    # alias GL_FOG_COORDINATE_SOURCE
	FOG_COORD					= 0x8451    # alias GL_FOG_COORDINATE
	CURRENT_FOG_COORD				= 0x8453    # alias GL_CURRENT_FOG_COORDINATE
	FOG_COORD_ARRAY_TYPE				= 0x8454    # alias GL_FOG_COORDINATE_ARRAY_TYPE
	FOG_COORD_ARRAY_STRIDE				= 0x8455    # alias GL_FOG_COORDINATE_ARRAY_STRIDE
	FOG_COORD_ARRAY_POINTER				= 0x8456    # alias GL_FOG_COORDINATE_ARRAY_POINTER
	FOG_COORD_ARRAY					= 0x8457    # alias GL_FOG_COORDINATE_ARRAY
	FOG_COORD_ARRAY_BUFFER_BINDING			= 0x889D    # alias GL_FOG_COORDINATE_ARRAY_BUFFER_BINDING
# New naming scheme
	SRC0_RGB					= 0x8580    # alias GL_SOURCE0_RGB
	SRC1_RGB					= 0x8581    # alias GL_SOURCE1_RGB
	SRC2_RGB					= 0x8582    # alias GL_SOURCE2_RGB
	SRC0_ALPHA					= 0x8588    # alias GL_SOURCE0_ALPHA
	SRC1_ALPHA					= 0x8589    # alias GL_SOURCE1_ALPHA
	SRC2_ALPHA					= 0x858A    # alias GL_SOURCE2_ALPHA

###############################################################################
#
# OpenGL 2.0 enums
#
###############################################################################

VERSION_2_0 enum:
	BLEND_EQUATION_RGB				= 0x8009    # EXT_blend_equation_separate   # alias GL_BLEND_EQUATION
	VERTEX_ATTRIB_ARRAY_ENABLED			= 0x8622    # ARB_vertex_shader
	VERTEX_ATTRIB_ARRAY_SIZE			= 0x8623    # ARB_vertex_shader
	VERTEX_ATTRIB_ARRAY_STRIDE			= 0x8624    # ARB_vertex_shader
	VERTEX_ATTRIB_ARRAY_TYPE			= 0x8625    # ARB_vertex_shader
	CURRENT_VERTEX_ATTRIB				= 0x8626    # ARB_vertex_shader
	VERTEX_PROGRAM_POINT_SIZE			= 0x8642    # ARB_vertex_shader
	VERTEX_ATTRIB_ARRAY_POINTER			= 0x8645    # ARB_vertex_shader
	STENCIL_BACK_FUNC				= 0x8800    # ARB_stencil_two_side
	STENCIL_BACK_FAIL				= 0x8801    # ARB_stencil_two_side
	STENCIL_BACK_PASS_DEPTH_FAIL			= 0x8802    # ARB_stencil_two_side
	STENCIL_BACK_PASS_DEPTH_PASS			= 0x8803    # ARB_stencil_two_side
	MAX_DRAW_BUFFERS				= 0x8824    # ARB_draw_buffers
	DRAW_BUFFER0					= 0x8825    # ARB_draw_buffers
	DRAW_BUFFER1					= 0x8826    # ARB_draw_buffers
	DRAW_BUFFER2					= 0x8827    # ARB_draw_buffers
	DRAW_BUFFER3					= 0x8828    # ARB_draw_buffers
	DRAW_BUFFER4					= 0x8829    # ARB_draw_buffers
	DRAW_BUFFER5					= 0x882A    # ARB_draw_buffers
	DRAW_BUFFER6					= 0x882B    # ARB_draw_buffers
	DRAW_BUFFER7					= 0x882C    # ARB_draw_buffers
	DRAW_BUFFER8					= 0x882D    # ARB_draw_buffers
	DRAW_BUFFER9					= 0x882E    # ARB_draw_buffers
	DRAW_BUFFER10					= 0x882F    # ARB_draw_buffers
	DRAW_BUFFER11					= 0x8830    # ARB_draw_buffers
	DRAW_BUFFER12					= 0x8831    # ARB_draw_buffers
	DRAW_BUFFER13					= 0x8832    # ARB_draw_buffers
	DRAW_BUFFER14					= 0x8833    # ARB_draw_buffers
	DRAW_BUFFER15					= 0x8834    # ARB_draw_buffers
	BLEND_EQUATION_ALPHA				= 0x883D    # EXT_blend_equation_separate
	MAX_VERTEX_ATTRIBS				= 0x8869    # ARB_vertex_shader
	VERTEX_ATTRIB_ARRAY_NORMALIZED			= 0x886A    # ARB_vertex_shader
	MAX_TEXTURE_IMAGE_UNITS				= 0x8872    # ARB_vertex_shader, ARB_fragment_shader
	FRAGMENT_SHADER					= 0x8B30    # ARB_fragment_shader
	VERTEX_SHADER					= 0x8B31    # ARB_vertex_shader
	MAX_FRAGMENT_UNIFORM_COMPONENTS			= 0x8B49    # ARB_fragment_shader
	MAX_VERTEX_UNIFORM_COMPONENTS			= 0x8B4A    # ARB_vertex_shader
	MAX_VARYING_FLOATS				= 0x8B4B    # ARB_vertex_shader
	MAX_VERTEX_TEXTURE_IMAGE_UNITS			= 0x8B4C    # ARB_vertex_shader
	MAX_COMBINED_TEXTURE_IMAGE_UNITS		= 0x8B4D    # ARB_vertex_shader
	SHADER_TYPE					= 0x8B4F    # ARB_shader_objects
	FLOAT_VEC2					= 0x8B50    # ARB_shader_objects
	FLOAT_VEC3					= 0x8B51    # ARB_shader_objects
	FLOAT_VEC4					= 0x8B52    # ARB_shader_objects
	INT_VEC2					= 0x8B53    # ARB_shader_objects
	INT_VEC3					= 0x8B54    # ARB_shader_objects
	INT_VEC4					= 0x8B55    # ARB_shader_objects
	BOOL						= 0x8B56    # ARB_shader_objects
	BOOL_VEC2					= 0x8B57    # ARB_shader_objects
	BOOL_VEC3					= 0x8B58    # ARB_shader_objects
	BOOL_VEC4					= 0x8B59    # ARB_shader_objects
	FLOAT_MAT2					= 0x8B5A    # ARB_shader_objects
	FLOAT_MAT3					= 0x8B5B    # ARB_shader_objects
	FLOAT_MAT4					= 0x8B5C    # ARB_shader_objects
	SAMPLER_1D					= 0x8B5D    # ARB_shader_objects
	SAMPLER_2D					= 0x8B5E    # ARB_shader_objects
	SAMPLER_3D					= 0x8B5F    # ARB_shader_objects
	SAMPLER_CUBE					= 0x8B60    # ARB_shader_objects
	SAMPLER_1D_SHADOW				= 0x8B61    # ARB_shader_objects
	SAMPLER_2D_SHADOW				= 0x8B62    # ARB_shader_objects
	DELETE_STATUS					= 0x8B80    # ARB_shader_objects
	COMPILE_STATUS					= 0x8B81    # ARB_shader_objects
	LINK_STATUS					= 0x8B82    # ARB_shader_objects
	VALIDATE_STATUS					= 0x8B83    # ARB_shader_objects
	INFO_LOG_LENGTH					= 0x8B84    # ARB_shader_objects
	ATTACHED_SHADERS				= 0x8B85    # ARB_shader_objects
	ACTIVE_UNIFORMS					= 0x8B86    # ARB_shader_objects
	ACTIVE_UNIFORM_MAX_LENGTH			= 0x8B87    # ARB_shader_objects
	SHADER_SOURCE_LENGTH				= 0x8B88    # ARB_shader_objects
	ACTIVE_ATTRIBUTES				= 0x8B89    # ARB_vertex_shader
	ACTIVE_ATTRIBUTE_MAX_LENGTH			= 0x8B8A    # ARB_vertex_shader
	FRAGMENT_SHADER_DERIVATIVE_HINT			= 0x8B8B    # ARB_fragment_shader
	SHADING_LANGUAGE_VERSION			= 0x8B8C    # ARB_shading_language_100
	CURRENT_PROGRAM					= 0x8B8D    # ARB_shader_objects (added for 2.0)
	POINT_SPRITE_COORD_ORIGIN			= 0x8CA0    # ARB_point_sprite (added for 2.0)
	LOWER_LEFT					= 0x8CA1    # ARB_point_sprite (added for 2.0)
	UPPER_LEFT					= 0x8CA2    # ARB_point_sprite (added for 2.0)
	STENCIL_BACK_REF				= 0x8CA3    # ARB_stencil_two_side
	STENCIL_BACK_VALUE_MASK				= 0x8CA4    # ARB_stencil_two_side
	STENCIL_BACK_WRITEMASK				= 0x8CA5    # ARB_stencil_two_side

VERSION_2_0_DEPRECATED enum:
	VERTEX_PROGRAM_TWO_SIDE				= 0x8643    # ARB_vertex_shader
	POINT_SPRITE					= 0x8861    # ARB_point_sprite
	COORD_REPLACE					= 0x8862    # ARB_point_sprite
	MAX_TEXTURE_COORDS				= 0x8871    # ARB_vertex_shader, ARB_fragment_shader


###############################################################################
#
# OpenGL 2.1 enums
#
###############################################################################

VERSION_2_1 enum:
	PIXEL_PACK_BUFFER				= 0x88EB    # ARB_pixel_buffer_object
	PIXEL_UNPACK_BUFFER				= 0x88EC    # ARB_pixel_buffer_object
	PIXEL_PACK_BUFFER_BINDING			= 0x88ED    # ARB_pixel_buffer_object
	PIXEL_UNPACK_BUFFER_BINDING			= 0x88EF    # ARB_pixel_buffer_object
	FLOAT_MAT2x3					= 0x8B65    # New for 2.1
	FLOAT_MAT2x4					= 0x8B66    # New for 2.1
	FLOAT_MAT3x2					= 0x8B67    # New for 2.1
	FLOAT_MAT3x4					= 0x8B68    # New for 2.1
	FLOAT_MAT4x2					= 0x8B69    # New for 2.1
	FLOAT_MAT4x3					= 0x8B6A    # New for 2.1
	SRGB						= 0x8C40    # EXT_texture_sRGB
	SRGB8						= 0x8C41    # EXT_texture_sRGB
	SRGB_ALPHA					= 0x8C42    # EXT_texture_sRGB
	SRGB8_ALPHA8					= 0x8C43    # EXT_texture_sRGB
	COMPRESSED_SRGB					= 0x8C48    # EXT_texture_sRGB
	COMPRESSED_SRGB_ALPHA				= 0x8C49    # EXT_texture_sRGB

VERSION_2_1_DEPRECATED enum:
	CURRENT_RASTER_SECONDARY_COLOR			= 0x845F    # New for 2.1
	SLUMINANCE_ALPHA				= 0x8C44    # EXT_texture_sRGB
	SLUMINANCE8_ALPHA8				= 0x8C45    # EXT_texture_sRGB
	SLUMINANCE					= 0x8C46    # EXT_texture_sRGB
	SLUMINANCE8					= 0x8C47    # EXT_texture_sRGB
	COMPRESSED_SLUMINANCE				= 0x8C4A    # EXT_texture_sRGB
	COMPRESSED_SLUMINANCE_ALPHA			= 0x8C4B    # EXT_texture_sRGB


###############################################################################
#
# OpenGL 3.0 enums
#
###############################################################################

VERSION_3_0 enum:
	COMPARE_REF_TO_TEXTURE				= 0x884E    # alias GL_COMPARE_R_TO_TEXTURE_ARB
	CLIP_DISTANCE0					= 0x3000    # alias GL_CLIP_PLANE0
	CLIP_DISTANCE1					= 0x3001    # alias GL_CLIP_PLANE1
	CLIP_DISTANCE2					= 0x3002    # alias GL_CLIP_PLANE2
	CLIP_DISTANCE3					= 0x3003    # alias GL_CLIP_PLANE3
	CLIP_DISTANCE4					= 0x3004    # alias GL_CLIP_PLANE4
	CLIP_DISTANCE5					= 0x3005    # alias GL_CLIP_PLANE5
	CLIP_DISTANCE6					= 0x3006
	CLIP_DISTANCE7					= 0x3007
	MAX_CLIP_DISTANCES				= 0x0D32    # alias GL_MAX_CLIP_PLANES
	MAJOR_VERSION					= 0x821B
	MINOR_VERSION					= 0x821C
	NUM_EXTENSIONS					= 0x821D
	CONTEXT_FLAGS					= 0x821E
	COMPRESSED_RED					= 0x8225
	COMPRESSED_RG					= 0x8226
	CONTEXT_FLAG_FORWARD_COMPATIBLE_BIT		= 0x0001
	RGBA32F						= 0x8814
	RGB32F						= 0x8815
	RGBA16F						= 0x881A
	RGB16F						= 0x881B
	VERTEX_ATTRIB_ARRAY_INTEGER			= 0x88FD
	MAX_ARRAY_TEXTURE_LAYERS			= 0x88FF
	MIN_PROGRAM_TEXEL_OFFSET			= 0x8904
	MAX_PROGRAM_TEXEL_OFFSET			= 0x8905
	CLAMP_READ_COLOR				= 0x891C
	FIXED_ONLY					= 0x891D
	MAX_VARYING_COMPONENTS				= 0x8B4B    # alias GL_MAX_VARYING_FLOATS
	TEXTURE_1D_ARRAY				= 0x8C18
	PROXY_TEXTURE_1D_ARRAY				= 0x8C19
	TEXTURE_2D_ARRAY				= 0x8C1A
	PROXY_TEXTURE_2D_ARRAY				= 0x8C1B
	TEXTURE_BINDING_1D_ARRAY			= 0x8C1C
	TEXTURE_BINDING_2D_ARRAY			= 0x8C1D
	R11F_G11F_B10F					= 0x8C3A
	UNSIGNED_INT_10F_11F_11F_REV			= 0x8C3B
	RGB9_E5						= 0x8C3D
	UNSIGNED_INT_5_9_9_9_REV			= 0x8C3E
	TEXTURE_SHARED_SIZE				= 0x8C3F
	TRANSFORM_FEEDBACK_VARYING_MAX_LENGTH		= 0x8C76
	TRANSFORM_FEEDBACK_BUFFER_MODE			= 0x8C7F
	MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS	= 0x8C80
	TRANSFORM_FEEDBACK_VARYINGS			= 0x8C83
	TRANSFORM_FEEDBACK_BUFFER_START			= 0x8C84
	TRANSFORM_FEEDBACK_BUFFER_SIZE			= 0x8C85
	PRIMITIVES_GENERATED				= 0x8C87
	TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN		= 0x8C88
	RASTERIZER_DISCARD				= 0x8C89
	MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS	= 0x8C8A
	MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS		= 0x8C8B
	INTERLEAVED_ATTRIBS				= 0x8C8C
	SEPARATE_ATTRIBS				= 0x8C8D
	TRANSFORM_FEEDBACK_BUFFER			= 0x8C8E
	TRANSFORM_FEEDBACK_BUFFER_BINDING		= 0x8C8F
	RGBA32UI					= 0x8D70
	RGB32UI						= 0x8D71
	RGBA16UI					= 0x8D76
	RGB16UI						= 0x8D77
	RGBA8UI						= 0x8D7C
	RGB8UI						= 0x8D7D
	RGBA32I						= 0x8D82
	RGB32I						= 0x8D83
	RGBA16I						= 0x8D88
	RGB16I						= 0x8D89
	RGBA8I						= 0x8D8E
	RGB8I						= 0x8D8F
	RED_INTEGER					= 0x8D94
	GREEN_INTEGER					= 0x8D95
	BLUE_INTEGER					= 0x8D96
	RGB_INTEGER					= 0x8D98
	RGBA_INTEGER					= 0x8D99
	BGR_INTEGER					= 0x8D9A
	BGRA_INTEGER					= 0x8D9B
	SAMPLER_1D_ARRAY				= 0x8DC0
	SAMPLER_2D_ARRAY				= 0x8DC1
	SAMPLER_1D_ARRAY_SHADOW				= 0x8DC3
	SAMPLER_2D_ARRAY_SHADOW				= 0x8DC4
	SAMPLER_CUBE_SHADOW				= 0x8DC5
	UNSIGNED_INT_VEC2				= 0x8DC6
	UNSIGNED_INT_VEC3				= 0x8DC7
	UNSIGNED_INT_VEC4				= 0x8DC8
	INT_SAMPLER_1D					= 0x8DC9
	INT_SAMPLER_2D					= 0x8DCA
	INT_SAMPLER_3D					= 0x8DCB
	INT_SAMPLER_CUBE				= 0x8DCC
	INT_SAMPLER_1D_ARRAY				= 0x8DCE
	INT_SAMPLER_2D_ARRAY				= 0x8DCF
	UNSIGNED_INT_SAMPLER_1D				= 0x8DD1
	UNSIGNED_INT_SAMPLER_2D				= 0x8DD2
	UNSIGNED_INT_SAMPLER_3D				= 0x8DD3
	UNSIGNED_INT_SAMPLER_CUBE			= 0x8DD4
	UNSIGNED_INT_SAMPLER_1D_ARRAY			= 0x8DD6
	UNSIGNED_INT_SAMPLER_2D_ARRAY			= 0x8DD7
	QUERY_WAIT					= 0x8E13
	QUERY_NO_WAIT					= 0x8E14
	QUERY_BY_REGION_WAIT				= 0x8E15
	QUERY_BY_REGION_NO_WAIT				= 0x8E16
	BUFFER_ACCESS_FLAGS				= 0x911F
	BUFFER_MAP_LENGTH				= 0x9120
	BUFFER_MAP_OFFSET				= 0x9121
passthru: /* Reuse tokens from ARB_depth_buffer_float */
	use ARB_depth_buffer_float	    DEPTH_COMPONENT32F
	use ARB_depth_buffer_float	    DEPTH32F_STENCIL8
	use ARB_depth_buffer_float	    FLOAT_32_UNSIGNED_INT_24_8_REV
passthru: /* Reuse tokens from ARB_framebuffer_object */
	use ARB_framebuffer_object	    INVALID_FRAMEBUFFER_OPERATION
	use ARB_framebuffer_object	    FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING
	use ARB_framebuffer_object	    FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE
	use ARB_framebuffer_object	    FRAMEBUFFER_ATTACHMENT_RED_SIZE
	use ARB_framebuffer_object	    FRAMEBUFFER_ATTACHMENT_GREEN_SIZE
	use ARB_framebuffer_object	    FRAMEBUFFER_ATTACHMENT_BLUE_SIZE
	use ARB_framebuffer_object	    FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE
	use ARB_framebuffer_object	    FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE
	use ARB_framebuffer_object	    FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE
	use ARB_framebuffer_object	    FRAMEBUFFER_DEFAULT
	use ARB_framebuffer_object	    FRAMEBUFFER_UNDEFINED
	use ARB_framebuffer_object	    DEPTH_STENCIL_ATTACHMENT
	use ARB_framebuffer_object	    INDEX
	use ARB_framebuffer_object	    MAX_RENDERBUFFER_SIZE
	use ARB_framebuffer_object	    DEPTH_STENCIL
	use ARB_framebuffer_object	    UNSIGNED_INT_24_8
	use ARB_framebuffer_object	    DEPTH24_STENCIL8
	use ARB_framebuffer_object	    TEXTURE_STENCIL_SIZE
	use ARB_framebuffer_object	    TEXTURE_RED_TYPE
	use ARB_framebuffer_object	    TEXTURE_GREEN_TYPE
	use ARB_framebuffer_object	    TEXTURE_BLUE_TYPE
	use ARB_framebuffer_object	    TEXTURE_ALPHA_TYPE
	use ARB_framebuffer_object	    TEXTURE_DEPTH_TYPE
	use ARB_framebuffer_object	    UNSIGNED_NORMALIZED
	use ARB_framebuffer_object	    FRAMEBUFFER_BINDING
	use ARB_framebuffer_object	    DRAW_FRAMEBUFFER_BINDING
	use ARB_framebuffer_object	    RENDERBUFFER_BINDING
	use ARB_framebuffer_object	    READ_FRAMEBUFFER
	use ARB_framebuffer_object	    DRAW_FRAMEBUFFER
	use ARB_framebuffer_object	    READ_FRAMEBUFFER_BINDING
	use ARB_framebuffer_object	    RENDERBUFFER_SAMPLES
	use ARB_framebuffer_object	    FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE
	use ARB_framebuffer_object	    FRAMEBUFFER_ATTACHMENT_OBJECT_NAME
	use ARB_framebuffer_object	    FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL
	use ARB_framebuffer_object	    FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE
	use ARB_framebuffer_object	    FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER
	use ARB_framebuffer_object	    FRAMEBUFFER_COMPLETE
	use ARB_framebuffer_object	    FRAMEBUFFER_INCOMPLETE_ATTACHMENT
	use ARB_framebuffer_object	    FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT
	use ARB_framebuffer_object	    FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER
	use ARB_framebuffer_object	    FRAMEBUFFER_INCOMPLETE_READ_BUFFER
	use ARB_framebuffer_object	    FRAMEBUFFER_UNSUPPORTED
	use ARB_framebuffer_object	    MAX_COLOR_ATTACHMENTS
	use ARB_framebuffer_object	    COLOR_ATTACHMENT0
	use ARB_framebuffer_object	    COLOR_ATTACHMENT1
	use ARB_framebuffer_object	    COLOR_ATTACHMENT2
	use ARB_framebuffer_object	    COLOR_ATTACHMENT3
	use ARB_framebuffer_object	    COLOR_ATTACHMENT4
	use ARB_framebuffer_object	    COLOR_ATTACHMENT5
	use ARB_framebuffer_object	    COLOR_ATTACHMENT6
	use ARB_framebuffer_object	    COLOR_ATTACHMENT7
	use ARB_framebuffer_object	    COLOR_ATTACHMENT8
	use ARB_framebuffer_object	    COLOR_ATTACHMENT9
	use ARB_framebuffer_object	    COLOR_ATTACHMENT10
	use ARB_framebuffer_object	    COLOR_ATTACHMENT11
	use ARB_framebuffer_object	    COLOR_ATTACHMENT12
	use ARB_framebuffer_object	    COLOR_ATTACHMENT13
	use ARB_framebuffer_object	    COLOR_ATTACHMENT14
	use ARB_framebuffer_object	    COLOR_ATTACHMENT15
	use ARB_framebuffer_object	    DEPTH_ATTACHMENT
	use ARB_framebuffer_object	    STENCIL_ATTACHMENT
	use ARB_framebuffer_object	    FRAMEBUFFER
	use ARB_framebuffer_object	    RENDERBUFFER
	use ARB_framebuffer_object	    RENDERBUFFER_WIDTH
	use ARB_framebuffer_object	    RENDERBUFFER_HEIGHT
	use ARB_framebuffer_object	    RENDERBUFFER_INTERNAL_FORMAT
	use ARB_framebuffer_object	    STENCIL_INDEX1
	use ARB_framebuffer_object	    STENCIL_INDEX4
	use ARB_framebuffer_object	    STENCIL_INDEX8
	use ARB_framebuffer_object	    STENCIL_INDEX16
	use ARB_framebuffer_object	    RENDERBUFFER_RED_SIZE
	use ARB_framebuffer_object	    RENDERBUFFER_GREEN_SIZE
	use ARB_framebuffer_object	    RENDERBUFFER_BLUE_SIZE
	use ARB_framebuffer_object	    RENDERBUFFER_ALPHA_SIZE
	use ARB_framebuffer_object	    RENDERBUFFER_DEPTH_SIZE
	use ARB_framebuffer_object	    RENDERBUFFER_STENCIL_SIZE
	use ARB_framebuffer_object	    FRAMEBUFFER_INCOMPLETE_MULTISAMPLE
	use ARB_framebuffer_object	    MAX_SAMPLES
passthru: /* Reuse tokens from ARB_framebuffer_sRGB */
	use ARB_framebuffer_sRGB	    FRAMEBUFFER_SRGB
passthru: /* Reuse tokens from ARB_half_float_vertex */
	use ARB_half_float_vertex	    HALF_FLOAT
passthru: /* Reuse tokens from ARB_map_buffer_range */
	use ARB_map_buffer_range	    MAP_READ_BIT
	use ARB_map_buffer_range	    MAP_WRITE_BIT
	use ARB_map_buffer_range	    MAP_INVALIDATE_RANGE_BIT
	use ARB_map_buffer_range	    MAP_INVALIDATE_BUFFER_BIT
	use ARB_map_buffer_range	    MAP_FLUSH_EXPLICIT_BIT
	use ARB_map_buffer_range	    MAP_UNSYNCHRONIZED_BIT
passthru: /* Reuse tokens from ARB_texture_compression_rgtc */
	use ARB_texture_compression_rgtc    COMPRESSED_RED_RGTC1
	use ARB_texture_compression_rgtc    COMPRESSED_SIGNED_RED_RGTC1
	use ARB_texture_compression_rgtc    COMPRESSED_RG_RGTC2
	use ARB_texture_compression_rgtc    COMPRESSED_SIGNED_RG_RGTC2
passthru: /* Reuse tokens from ARB_texture_rg */
	use ARB_texture_rg		    RG
	use ARB_texture_rg		    RG_INTEGER
	use ARB_texture_rg		    R8
	use ARB_texture_rg		    R16
	use ARB_texture_rg		    RG8
	use ARB_texture_rg		    RG16
	use ARB_texture_rg		    R16F
	use ARB_texture_rg		    R32F
	use ARB_texture_rg		    RG16F
	use ARB_texture_rg		    RG32F
	use ARB_texture_rg		    R8I
	use ARB_texture_rg		    R8UI
	use ARB_texture_rg		    R16I
	use ARB_texture_rg		    R16UI
	use ARB_texture_rg		    R32I
	use ARB_texture_rg		    R32UI
	use ARB_texture_rg		    RG8I
	use ARB_texture_rg		    RG8UI
	use ARB_texture_rg		    RG16I
	use ARB_texture_rg		    RG16UI
	use ARB_texture_rg		    RG32I
	use ARB_texture_rg		    RG32UI
passthru: /* Reuse tokens from ARB_vertex_array_object */
	use ARB_vertex_array_object	    VERTEX_ARRAY_BINDING

VERSION_3_0_DEPRECATED enum:
	CLAMP_VERTEX_COLOR				= 0x891A
	CLAMP_FRAGMENT_COLOR				= 0x891B
	ALPHA_INTEGER					= 0x8D97
passthru: /* Reuse tokens from ARB_framebuffer_object */
	use ARB_framebuffer_object	    TEXTURE_LUMINANCE_TYPE
	use ARB_framebuffer_object	    TEXTURE_INTENSITY_TYPE


###############################################################################
#
# OpenGL 3.1 enums
#
###############################################################################

VERSION_3_1 enum:
	SAMPLER_2D_RECT					= 0x8B63    # ARB_shader_objects + ARB_texture_rectangle
	SAMPLER_2D_RECT_SHADOW				= 0x8B64    # ARB_shader_objects + ARB_texture_rectangle
	SAMPLER_BUFFER					= 0x8DC2    # EXT_gpu_shader4 + ARB_texture_buffer_object
	INT_SAMPLER_2D_RECT				= 0x8DCD    # EXT_gpu_shader4 + ARB_texture_rectangle
	INT_SAMPLER_BUFFER				= 0x8DD0    # EXT_gpu_shader4 + ARB_texture_buffer_object
	UNSIGNED_INT_SAMPLER_2D_RECT			= 0x8DD5    # EXT_gpu_shader4 + ARB_texture_rectangle
	UNSIGNED_INT_SAMPLER_BUFFER			= 0x8DD8    # EXT_gpu_shader4 + ARB_texture_buffer_object
	TEXTURE_BUFFER					= 0x8C2A    # ARB_texture_buffer_object
	MAX_TEXTURE_BUFFER_SIZE				= 0x8C2B    # ARB_texture_buffer_object
	TEXTURE_BINDING_BUFFER				= 0x8C2C    # ARB_texture_buffer_object
	TEXTURE_BUFFER_DATA_STORE_BINDING		= 0x8C2D    # ARB_texture_buffer_object
	TEXTURE_BUFFER_FORMAT				= 0x8C2E    # ARB_texture_buffer_object
	TEXTURE_RECTANGLE				= 0x84F5    # ARB_texture_rectangle
	TEXTURE_BINDING_RECTANGLE			= 0x84F6    # ARB_texture_rectangle
	PROXY_TEXTURE_RECTANGLE				= 0x84F7    # ARB_texture_rectangle
	MAX_RECTANGLE_TEXTURE_SIZE			= 0x84F8    # ARB_texture_rectangle
	RED_SNORM					= 0x8F90    # 3.1
	RG_SNORM					= 0x8F91    # 3.1
	RGB_SNORM					= 0x8F92    # 3.1
	RGBA_SNORM					= 0x8F93    # 3.1
	R8_SNORM					= 0x8F94    # 3.1
	RG8_SNORM					= 0x8F95    # 3.1
	RGB8_SNORM					= 0x8F96    # 3.1
	RGBA8_SNORM					= 0x8F97    # 3.1
	R16_SNORM					= 0x8F98    # 3.1
	RG16_SNORM					= 0x8F99    # 3.1
	RGB16_SNORM					= 0x8F9A    # 3.1
	RGBA16_SNORM					= 0x8F9B    # 3.1
	SIGNED_NORMALIZED				= 0x8F9C    # 3.1
	PRIMITIVE_RESTART				= 0x8F9D    # 3.1 (different from NV_primitive_restart)
	PRIMITIVE_RESTART_INDEX				= 0x8F9E    # 3.1 (different from NV_primitive_restart)
passthru: /* Reuse tokens from ARB_copy_buffer */
	use ARB_copy_buffer		    COPY_READ_BUFFER
	use ARB_copy_buffer		    COPY_WRITE_BUFFER
passthru: /* Reuse tokens from ARB_draw_instanced (none) */
passthru: /* Reuse tokens from ARB_uniform_buffer_object */
	use ARB_uniform_buffer_object	    UNIFORM_BUFFER
	use ARB_uniform_buffer_object	    UNIFORM_BUFFER_BINDING
	use ARB_uniform_buffer_object	    UNIFORM_BUFFER_START
	use ARB_uniform_buffer_object	    UNIFORM_BUFFER_SIZE
	use ARB_uniform_buffer_object	    MAX_VERTEX_UNIFORM_BLOCKS
	use ARB_uniform_buffer_object	    MAX_FRAGMENT_UNIFORM_BLOCKS
	use ARB_uniform_buffer_object	    MAX_COMBINED_UNIFORM_BLOCKS
	use ARB_uniform_buffer_object	    MAX_UNIFORM_BUFFER_BINDINGS
	use ARB_uniform_buffer_object	    MAX_UNIFORM_BLOCK_SIZE
	use ARB_uniform_buffer_object	    MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS
	use ARB_uniform_buffer_object	    MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS
	use ARB_uniform_buffer_object	    UNIFORM_BUFFER_OFFSET_ALIGNMENT
	use ARB_uniform_buffer_object	    ACTIVE_UNIFORM_BLOCK_MAX_NAME_LENGTH
	use ARB_uniform_buffer_object	    ACTIVE_UNIFORM_BLOCKS
	use ARB_uniform_buffer_object	    UNIFORM_TYPE
	use ARB_uniform_buffer_object	    UNIFORM_SIZE
	use ARB_uniform_buffer_object	    UNIFORM_NAME_LENGTH
	use ARB_uniform_buffer_object	    UNIFORM_BLOCK_INDEX
	use ARB_uniform_buffer_object	    UNIFORM_OFFSET
	use ARB_uniform_buffer_object	    UNIFORM_ARRAY_STRIDE
	use ARB_uniform_buffer_object	    UNIFORM_MATRIX_STRIDE
	use ARB_uniform_buffer_object	    UNIFORM_IS_ROW_MAJOR
	use ARB_uniform_buffer_object	    UNIFORM_BLOCK_BINDING
	use ARB_uniform_buffer_object	    UNIFORM_BLOCK_DATA_SIZE
	use ARB_uniform_buffer_object	    UNIFORM_BLOCK_NAME_LENGTH
	use ARB_uniform_buffer_object	    UNIFORM_BLOCK_ACTIVE_UNIFORMS
	use ARB_uniform_buffer_object	    UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES
	use ARB_uniform_buffer_object	    UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER
	use ARB_uniform_buffer_object	    UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER
	use ARB_uniform_buffer_object	    INVALID_INDEX


###############################################################################
#
# OpenGL 3.2 enums
#
###############################################################################

VERSION_3_2 enum:
	CONTEXT_CORE_PROFILE_BIT			= 0x00000001
	CONTEXT_COMPATIBILITY_PROFILE_BIT		= 0x00000002
	LINES_ADJACENCY					= 0x000A
	LINE_STRIP_ADJACENCY				= 0x000B
	TRIANGLES_ADJACENCY				= 0x000C
	TRIANGLE_STRIP_ADJACENCY			= 0x000D
	PROGRAM_POINT_SIZE				= 0x8642
	MAX_GEOMETRY_TEXTURE_IMAGE_UNITS		= 0x8C29
	FRAMEBUFFER_ATTACHMENT_LAYERED			= 0x8DA7
	FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS		= 0x8DA8
	GEOMETRY_SHADER					= 0x8DD9
	GEOMETRY_VERTICES_OUT				= 0x8916
	GEOMETRY_INPUT_TYPE				= 0x8917
	GEOMETRY_OUTPUT_TYPE				= 0x8918
	MAX_GEOMETRY_UNIFORM_COMPONENTS			= 0x8DDF
	MAX_GEOMETRY_OUTPUT_VERTICES			= 0x8DE0
	MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS		= 0x8DE1
	MAX_VERTEX_OUTPUT_COMPONENTS			= 0x9122
	MAX_GEOMETRY_INPUT_COMPONENTS			= 0x9123
	MAX_GEOMETRY_OUTPUT_COMPONENTS			= 0x9124
	MAX_FRAGMENT_INPUT_COMPONENTS			= 0x9125
	CONTEXT_PROFILE_MASK				= 0x9126
	use VERSION_3_0			    MAX_VARYING_COMPONENTS
	use ARB_framebuffer_object	    FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER
passthru: /* Reuse tokens from ARB_depth_clamp */
	use ARB_depth_clamp		    DEPTH_CLAMP
passthru: /* Reuse tokens from ARB_draw_elements_base_vertex (none) */
passthru: /* Reuse tokens from ARB_fragment_coord_conventions (none) */
passthru: /* Reuse tokens from ARB_provoking_vertex */
	use ARB_provoking_vertex	    QUADS_FOLLOW_PROVOKING_VERTEX_CONVENTION
	use ARB_provoking_vertex	    FIRST_VERTEX_CONVENTION
	use ARB_provoking_vertex	    LAST_VERTEX_CONVENTION
	use ARB_provoking_vertex	    PROVOKING_VERTEX
passthru: /* Reuse tokens from ARB_seamless_cube_map */
	use ARB_seamless_cube_map	    TEXTURE_CUBE_MAP_SEAMLESS
passthru: /* Reuse tokens from ARB_sync */
	use ARB_sync			    MAX_SERVER_WAIT_TIMEOUT
	use ARB_sync			    OBJECT_TYPE
	use ARB_sync			    SYNC_CONDITION
	use ARB_sync			    SYNC_STATUS
	use ARB_sync			    SYNC_FLAGS
	use ARB_sync			    SYNC_FENCE
	use ARB_sync			    SYNC_GPU_COMMANDS_COMPLETE
	use ARB_sync			    UNSIGNALED
	use ARB_sync			    SIGNALED
	use ARB_sync			    ALREADY_SIGNALED
	use ARB_sync			    TIMEOUT_EXPIRED
	use ARB_sync			    CONDITION_SATISFIED
	use ARB_sync			    WAIT_FAILED
	use ARB_sync			    TIMEOUT_IGNORED
	use ARB_sync			    SYNC_FLUSH_COMMANDS_BIT
	use ARB_sync			    TIMEOUT_IGNORED
passthru: /* Reuse tokens from ARB_texture_multisample */
	use ARB_texture_multisample	    SAMPLE_POSITION
	use ARB_texture_multisample	    SAMPLE_MASK
	use ARB_texture_multisample	    SAMPLE_MASK_VALUE
	use ARB_texture_multisample	    MAX_SAMPLE_MASK_WORDS
	use ARB_texture_multisample	    TEXTURE_2D_MULTISAMPLE
	use ARB_texture_multisample	    PROXY_TEXTURE_2D_MULTISAMPLE
	use ARB_texture_multisample	    TEXTURE_2D_MULTISAMPLE_ARRAY
	use ARB_texture_multisample	    PROXY_TEXTURE_2D_MULTISAMPLE_ARRAY
	use ARB_texture_multisample	    TEXTURE_BINDING_2D_MULTISAMPLE
	use ARB_texture_multisample	    TEXTURE_BINDING_2D_MULTISAMPLE_ARRAY
	use ARB_texture_multisample	    TEXTURE_SAMPLES
	use ARB_texture_multisample	    TEXTURE_FIXED_SAMPLE_LOCATIONS
	use ARB_texture_multisample	    SAMPLER_2D_MULTISAMPLE
	use ARB_texture_multisample	    INT_SAMPLER_2D_MULTISAMPLE
	use ARB_texture_multisample	    UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE
	use ARB_texture_multisample	    SAMPLER_2D_MULTISAMPLE_ARRAY
	use ARB_texture_multisample	    INT_SAMPLER_2D_MULTISAMPLE_ARRAY
	use ARB_texture_multisample	    UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE_ARRAY
	use ARB_texture_multisample	    MAX_COLOR_TEXTURE_SAMPLES
	use ARB_texture_multisample	    MAX_DEPTH_TEXTURE_SAMPLES
	use ARB_texture_multisample	    MAX_INTEGER_SAMPLES
passthru: /* Don't need to reuse tokens from ARB_vertex_array_bgra since they're already in 1.2 core */

###############################################################################
#
# OpenGL 3.3 enums
#
###############################################################################

VERSION_3_3 enum:
	VERTEX_ATTRIB_ARRAY_DIVISOR			= 0x88FE    # ARB_instanced_arrays
passthru: /* Reuse tokens from ARB_blend_func_extended */
	use ARB_blend_func_extended	    SRC1_COLOR
	use ARB_blend_func_extended	    ONE_MINUS_SRC1_COLOR
	use ARB_blend_func_extended	    ONE_MINUS_SRC1_ALPHA
	use ARB_blend_func_extended	    MAX_DUAL_SOURCE_DRAW_BUFFERS
passthru: /* Reuse tokens from ARB_explicit_attrib_location (none) */
passthru: /* Reuse tokens from ARB_occlusion_query2 */
	use ARB_occlusion_query2	    ANY_SAMPLES_PASSED
passthru: /* Reuse tokens from ARB_sampler_objects */
	use ARB_sampler_objects		    SAMPLER_BINDING
passthru: /* Reuse tokens from ARB_shader_bit_encoding (none) */
passthru: /* Reuse tokens from ARB_texture_rgb10_a2ui */
	use ARB_texture_rgb10_a2ui	    RGB10_A2UI
passthru: /* Reuse tokens from ARB_texture_swizzle */
	use ARB_texture_swizzle		    TEXTURE_SWIZZLE_R
	use ARB_texture_swizzle		    TEXTURE_SWIZZLE_G
	use ARB_texture_swizzle		    TEXTURE_SWIZZLE_B
	use ARB_texture_swizzle		    TEXTURE_SWIZZLE_A
	use ARB_texture_swizzle		    TEXTURE_SWIZZLE_RGBA
passthru: /* Reuse tokens from ARB_timer_query */
	use ARB_timer_query		    TIME_ELAPSED
	use ARB_timer_query		    TIMESTAMP
passthru: /* Reuse tokens from ARB_vertex_type_2_10_10_10_rev */
	use ARB_vertex_type_2_10_10_10_rev  INT_2_10_10_10_REV

###############################################################################
#
# OpenGL 4.0 enums
#
###############################################################################

VERSION_4_0 enum:
	SAMPLE_SHADING					= 0x8C36    # ARB_sample_shading
	MIN_SAMPLE_SHADING_VALUE			= 0x8C37    # ARB_sample_shading
	MIN_PROGRAM_TEXTURE_GATHER_OFFSET		= 0x8E5E    # ARB_texture_gather
	MAX_PROGRAM_TEXTURE_GATHER_OFFSET		= 0x8E5F    # ARB_texture_gather
	TEXTURE_CUBE_MAP_ARRAY				= 0x9009    # ARB_texture_cube_map_array
	TEXTURE_BINDING_CUBE_MAP_ARRAY			= 0x900A    # ARB_texture_cube_map_array
	PROXY_TEXTURE_CUBE_MAP_ARRAY			= 0x900B    # ARB_texture_cube_map_array
	SAMPLER_CUBE_MAP_ARRAY				= 0x900C    # ARB_texture_cube_map_array
	SAMPLER_CUBE_MAP_ARRAY_SHADOW			= 0x900D    # ARB_texture_cube_map_array
	INT_SAMPLER_CUBE_MAP_ARRAY			= 0x900E    # ARB_texture_cube_map_array
	UNSIGNED_INT_SAMPLER_CUBE_MAP_ARRAY		= 0x900F    # ARB_texture_cube_map_array
passthru: /* Reuse tokens from ARB_texture_query_lod (none) */
passthru: /* Reuse tokens from ARB_draw_buffers_blend (none) */
passthru: /* Reuse tokens from ARB_draw_indirect */
	use ARB_draw_indirect		    DRAW_INDIRECT_BUFFER
	use ARB_draw_indirect		    DRAW_INDIRECT_BUFFER_BINDING
passthru: /* Reuse tokens from ARB_gpu_shader5 */
	use ARB_gpu_shader5		    GEOMETRY_SHADER_INVOCATIONS
	use ARB_gpu_shader5		    MAX_GEOMETRY_SHADER_INVOCATIONS
	use ARB_gpu_shader5		    MIN_FRAGMENT_INTERPOLATION_OFFSET
	use ARB_gpu_shader5		    MAX_FRAGMENT_INTERPOLATION_OFFSET
	use ARB_gpu_shader5		    FRAGMENT_INTERPOLATION_OFFSET_BITS
	use ARB_gpu_shader5		    MAX_VERTEX_STREAMS
passthru: /* Reuse tokens from ARB_gpu_shader_fp64 */
	use ARB_gpu_shader_fp64		    DOUBLE_VEC2
	use ARB_gpu_shader_fp64		    DOUBLE_VEC3
	use ARB_gpu_shader_fp64		    DOUBLE_VEC4
	use ARB_gpu_shader_fp64		    DOUBLE_MAT2
	use ARB_gpu_shader_fp64		    DOUBLE_MAT3
	use ARB_gpu_shader_fp64		    DOUBLE_MAT4
	use ARB_gpu_shader_fp64		    DOUBLE_MAT2x3
	use ARB_gpu_shader_fp64		    DOUBLE_MAT2x4
	use ARB_gpu_shader_fp64		    DOUBLE_MAT3x2
	use ARB_gpu_shader_fp64		    DOUBLE_MAT3x4
	use ARB_gpu_shader_fp64		    DOUBLE_MAT4x2
	use ARB_gpu_shader_fp64		    DOUBLE_MAT4x3
passthru: /* Reuse tokens from ARB_shader_subroutine */
	use ARB_shader_subroutine	    ACTIVE_SUBROUTINES
	use ARB_shader_subroutine	    ACTIVE_SUBROUTINE_UNIFORMS
	use ARB_shader_subroutine	    ACTIVE_SUBROUTINE_UNIFORM_LOCATIONS
	use ARB_shader_subroutine	    ACTIVE_SUBROUTINE_MAX_LENGTH
	use ARB_shader_subroutine	    ACTIVE_SUBROUTINE_UNIFORM_MAX_LENGTH
	use ARB_shader_subroutine	    MAX_SUBROUTINES
	use ARB_shader_subroutine	    MAX_SUBROUTINE_UNIFORM_LOCATIONS
	use ARB_shader_subroutine	    NUM_COMPATIBLE_SUBROUTINES
	use ARB_shader_subroutine	    COMPATIBLE_SUBROUTINES
passthru: /* Reuse tokens from ARB_tessellation_shader */
	use ARB_tessellation_shader	    PATCHES
	use ARB_tessellation_shader	    PATCH_VERTICES
	use ARB_tessellation_shader	    PATCH_DEFAULT_INNER_LEVEL
	use ARB_tessellation_shader	    PATCH_DEFAULT_OUTER_LEVEL
	use ARB_tessellation_shader	    TESS_CONTROL_OUTPUT_VERTICES
	use ARB_tessellation_shader	    TESS_GEN_MODE
	use ARB_tessellation_shader	    TESS_GEN_SPACING
	use ARB_tessellation_shader	    TESS_GEN_VERTEX_ORDER
	use ARB_tessellation_shader	    TESS_GEN_POINT_MODE
	use ARB_tessellation_shader	    ISOLINES
	use ARB_tessellation_shader	    FRACTIONAL_ODD
	use ARB_tessellation_shader	    FRACTIONAL_EVEN
	use ARB_tessellation_shader	    MAX_PATCH_VERTICES
	use ARB_tessellation_shader	    MAX_TESS_GEN_LEVEL
	use ARB_tessellation_shader	    MAX_TESS_CONTROL_UNIFORM_COMPONENTS
	use ARB_tessellation_shader	    MAX_TESS_EVALUATION_UNIFORM_COMPONENTS
	use ARB_tessellation_shader	    MAX_TESS_CONTROL_TEXTURE_IMAGE_UNITS
	use ARB_tessellation_shader	    MAX_TESS_EVALUATION_TEXTURE_IMAGE_UNITS
	use ARB_tessellation_shader	    MAX_TESS_CONTROL_OUTPUT_COMPONENTS
	use ARB_tessellation_shader	    MAX_TESS_PATCH_COMPONENTS
	use ARB_tessellation_shader	    MAX_TESS_CONTROL_TOTAL_OUTPUT_COMPONENTS
	use ARB_tessellation_shader	    MAX_TESS_EVALUATION_OUTPUT_COMPONENTS
	use ARB_tessellation_shader	    MAX_TESS_CONTROL_UNIFORM_BLOCKS
	use ARB_tessellation_shader	    MAX_TESS_EVALUATION_UNIFORM_BLOCKS
	use ARB_tessellation_shader	    MAX_TESS_CONTROL_INPUT_COMPONENTS
	use ARB_tessellation_shader	    MAX_TESS_EVALUATION_INPUT_COMPONENTS
	use ARB_tessellation_shader	    MAX_COMBINED_TESS_CONTROL_UNIFORM_COMPONENTS
	use ARB_tessellation_shader	    MAX_COMBINED_TESS_EVALUATION_UNIFORM_COMPONENTS
	use ARB_tessellation_shader	    UNIFORM_BLOCK_REFERENCED_BY_TESS_CONTROL_SHADER
	use ARB_tessellation_shader	    UNIFORM_BLOCK_REFERENCED_BY_TESS_EVALUATION_SHADER
	use ARB_tessellation_shader	    TESS_EVALUATION_SHADER
	use ARB_tessellation_shader	    TESS_CONTROL_SHADER
passthru: /* Reuse tokens from ARB_texture_buffer_object_rgb32 (none) */
passthru: /* Reuse tokens from ARB_transform_feedback2 */
	use ARB_tessellation_shader	    TRANSFORM_FEEDBACK
	use ARB_tessellation_shader	    TRANSFORM_FEEDBACK_BUFFER_PAUSED
	use ARB_tessellation_shader	    TRANSFORM_FEEDBACK_BUFFER_ACTIVE
	use ARB_tessellation_shader	    TRANSFORM_FEEDBACK_BINDING
passthru: /* Reuse tokens from ARB_transform_feedback3 */
	use ARB_tessellation_shader	    MAX_TRANSFORM_FEEDBACK_BUFFERS
	use ARB_tessellation_shader	    MAX_VERTEX_STREAMS

###############################################################################
#
# OpenGL 4.1 enums
#
###############################################################################

VERSION_4_1 enum:
passthru: /* Reuse tokens from ARB_ES2_compatibility */
	use ARB_ES2_compatibility	    FIXED
	use ARB_ES2_compatibility	    IMPLEMENTATION_COLOR_READ_TYPE
	use ARB_ES2_compatibility	    IMPLEMENTATION_COLOR_READ_FORMAT
	use ARB_ES2_compatibility	    LOW_FLOAT
	use ARB_ES2_compatibility	    MEDIUM_FLOAT
	use ARB_ES2_compatibility	    HIGH_FLOAT
	use ARB_ES2_compatibility	    LOW_INT
	use ARB_ES2_compatibility	    MEDIUM_INT
	use ARB_ES2_compatibility	    HIGH_INT
	use ARB_ES2_compatibility	    SHADER_COMPILER
	use ARB_ES2_compatibility	    NUM_SHADER_BINARY_FORMATS
	use ARB_ES2_compatibility	    MAX_VERTEX_UNIFORM_VECTORS
	use ARB_ES2_compatibility	    MAX_VARYING_VECTORS
	use ARB_ES2_compatibility	    MAX_FRAGMENT_UNIFORM_VECTORS
	use ARB_ES2_compatibility	    RGB565
passthru: /* Reuse tokens from ARB_get_program_binary */
	use ARB_get_program_binary	    PROGRAM_BINARY_RETRIEVABLE_HINT
	use ARB_get_program_binary	    PROGRAM_BINARY_LENGTH
	use ARB_get_program_binary	    NUM_PROGRAM_BINARY_FORMATS
	use ARB_get_program_binary	    PROGRAM_BINARY_FORMATS
passthru: /* Reuse tokens from ARB_separate_shader_objects */
	use ARB_separate_shader_objects     VERTEX_SHADER_BIT
	use ARB_separate_shader_objects     FRAGMENT_SHADER_BIT
	use ARB_separate_shader_objects     GEOMETRY_SHADER_BIT
	use ARB_separate_shader_objects     TESS_CONTROL_SHADER_BIT
	use ARB_separate_shader_objects     TESS_EVALUATION_SHADER_BIT
	use ARB_separate_shader_objects     ALL_SHADER_BITS
	use ARB_separate_shader_objects     PROGRAM_SEPARABLE
	use ARB_separate_shader_objects     ACTIVE_PROGRAM
	use ARB_separate_shader_objects     PROGRAM_PIPELINE_BINDING
passthru: /* Reuse tokens from ARB_shader_precision (none) */
passthru: /* Reuse tokens from ARB_vertex_attrib_64bit - all are in GL 3.0 and 4.0 already */
passthru: /* Reuse tokens from ARB_viewport_array - some are in GL 1.1 and ARB_provoking_vertex already */
	use ARB_viewport_array		    MAX_VIEWPORTS
	use ARB_viewport_array		    VIEWPORT_SUBPIXEL_BITS
	use ARB_viewport_array		    VIEWPORT_BOUNDS_RANGE
	use ARB_viewport_array		    LAYER_PROVOKING_VERTEX
	use ARB_viewport_array		    VIEWPORT_INDEX_PROVOKING_VERTEX
	use ARB_viewport_array		    UNDEFINED_VERTEX

###############################################################################
#
# OpenGL 4.2 enums
#
###############################################################################

VERSION_4_2 enum:
passthru: /* Reuse tokens from ARB_base_instance (none) */
passthru: /* Reuse tokens from ARB_shading_language_420pack (none) */
passthru: /* Reuse tokens from ARB_transform_feedback_instanced (none) */
passthru: /* Reuse tokens from ARB_compressed_texture_pixel_storage */
	use ARB_compressed_texture_pixel_storage    UNPACK_COMPRESSED_BLOCK_WIDTH
	use ARB_compressed_texture_pixel_storage    UNPACK_COMPRESSED_BLOCK_HEIGHT
	use ARB_compressed_texture_pixel_storage    UNPACK_COMPRESSED_BLOCK_DEPTH
	use ARB_compressed_texture_pixel_storage    UNPACK_COMPRESSED_BLOCK_SIZE
	use ARB_compressed_texture_pixel_storage    PACK_COMPRESSED_BLOCK_WIDTH
	use ARB_compressed_texture_pixel_storage    PACK_COMPRESSED_BLOCK_HEIGHT
	use ARB_compressed_texture_pixel_storage    PACK_COMPRESSED_BLOCK_DEPTH
	use ARB_compressed_texture_pixel_storage    PACK_COMPRESSED_BLOCK_SIZE
passthru: /* Reuse tokens from ARB_conservative_depth (none) */
passthru: /* Reuse tokens from ARB_internalformat_query */
	use ARB_internalformat_query	    NUM_SAMPLE_COUNTS
passthru: /* Reuse tokens from ARB_map_buffer_alignment */
	use ARB_map_buffer_alignment	    MIN_MAP_BUFFER_ALIGNMENT
passthru: /* Reuse tokens from ARB_shader_atomic_counters */
	use ARB_shader_atomic_counters	    ATOMIC_COUNTER_BUFFER
	use ARB_shader_atomic_counters	    ATOMIC_COUNTER_BUFFER_BINDING
	use ARB_shader_atomic_counters	    ATOMIC_COUNTER_BUFFER_START
	use ARB_shader_atomic_counters	    ATOMIC_COUNTER_BUFFER_SIZE
	use ARB_shader_atomic_counters	    ATOMIC_COUNTER_BUFFER_DATA_SIZE
	use ARB_shader_atomic_counters	    ATOMIC_COUNTER_BUFFER_ACTIVE_ATOMIC_COUNTERS
	use ARB_shader_atomic_counters	    ATOMIC_COUNTER_BUFFER_ACTIVE_ATOMIC_COUNTER_INDICES
	use ARB_shader_atomic_counters	    ATOMIC_COUNTER_BUFFER_REFERENCED_BY_VERTEX_SHADER
	use ARB_shader_atomic_counters	    ATOMIC_COUNTER_BUFFER_REFERENCED_BY_TESS_CONTROL_SHADER
	use ARB_shader_atomic_counters	    ATOMIC_COUNTER_BUFFER_REFERENCED_BY_TESS_EVALUATION_SHADER
	use ARB_shader_atomic_counters	    ATOMIC_COUNTER_BUFFER_REFERENCED_BY_GEOMETRY_SHADER
	use ARB_shader_atomic_counters	    ATOMIC_COUNTER_BUFFER_REFERENCED_BY_FRAGMENT_SHADER
	use ARB_shader_atomic_counters	    MAX_VERTEX_ATOMIC_COUNTER_BUFFERS
	use ARB_shader_atomic_counters	    MAX_TESS_CONTROL_ATOMIC_COUNTER_BUFFERS
	use ARB_shader_atomic_counters	    MAX_TESS_EVALUATION_ATOMIC_COUNTER_BUFFERS
	use ARB_shader_atomic_counters	    MAX_GEOMETRY_ATOMIC_COUNTER_BUFFERS
	use ARB_shader_atomic_counters	    MAX_FRAGMENT_ATOMIC_COUNTER_BUFFERS
	use ARB_shader_atomic_counters	    MAX_COMBINED_ATOMIC_COUNTER_BUFFERS
	use ARB_shader_atomic_counters	    MAX_VERTEX_ATOMIC_COUNTERS
	use ARB_shader_atomic_counters	    MAX_TESS_CONTROL_ATOMIC_COUNTERS
	use ARB_shader_atomic_counters	    MAX_TESS_EVALUATION_ATOMIC_COUNTERS
	use ARB_shader_atomic_counters	    MAX_GEOMETRY_ATOMIC_COUNTERS
	use ARB_shader_atomic_counters	    MAX_FRAGMENT_ATOMIC_COUNTERS
	use ARB_shader_atomic_counters	    MAX_COMBINED_ATOMIC_COUNTERS
	use ARB_shader_atomic_counters	    MAX_ATOMIC_COUNTER_BUFFER_SIZE
	use ARB_shader_atomic_counters	    MAX_ATOMIC_COUNTER_BUFFER_BINDINGS
	use ARB_shader_atomic_counters	    ACTIVE_ATOMIC_COUNTER_BUFFERS
	use ARB_shader_atomic_counters	    UNIFORM_ATOMIC_COUNTER_BUFFER_INDEX
	use ARB_shader_atomic_counters	    UNSIGNED_INT_ATOMIC_COUNTER
passthru: /* Reuse tokens from ARB_shader_image_load_store */
	use ARB_shader_image_load_store     VERTEX_ATTRIB_ARRAY_BARRIER_BIT
	use ARB_shader_image_load_store     ELEMENT_ARRAY_BARRIER_BIT
	use ARB_shader_image_load_store     UNIFORM_BARRIER_BIT
	use ARB_shader_image_load_store     TEXTURE_FETCH_BARRIER_BIT
	use ARB_shader_image_load_store     SHADER_IMAGE_ACCESS_BARRIER_BIT
	use ARB_shader_image_load_store     COMMAND_BARRIER_BIT
	use ARB_shader_image_load_store     PIXEL_BUFFER_BARRIER_BIT
	use ARB_shader_image_load_store     TEXTURE_UPDATE_BARRIER_BIT
	use ARB_shader_image_load_store     BUFFER_UPDATE_BARRIER_BIT
	use ARB_shader_image_load_store     FRAMEBUFFER_BARRIER_BIT
	use ARB_shader_image_load_store     TRANSFORM_FEEDBACK_BARRIER_BIT
	use ARB_shader_image_load_store     ATOMIC_COUNTER_BARRIER_BIT
	use ARB_shader_image_load_store     ALL_BARRIER_BITS
	use ARB_shader_image_load_store     MAX_IMAGE_UNITS
	use ARB_shader_image_load_store     MAX_COMBINED_IMAGE_UNITS_AND_FRAGMENT_OUTPUTS
	use ARB_shader_image_load_store     IMAGE_BINDING_NAME
	use ARB_shader_image_load_store     IMAGE_BINDING_LEVEL
	use ARB_shader_image_load_store     IMAGE_BINDING_LAYERED
	use ARB_shader_image_load_store     IMAGE_BINDING_LAYER
	use ARB_shader_image_load_store     IMAGE_BINDING_ACCESS
	use ARB_shader_image_load_store     IMAGE_1D
	use ARB_shader_image_load_store     IMAGE_2D
	use ARB_shader_image_load_store     IMAGE_3D
	use ARB_shader_image_load_store     IMAGE_2D_RECT
	use ARB_shader_image_load_store     IMAGE_CUBE
	use ARB_shader_image_load_store     IMAGE_BUFFER
	use ARB_shader_image_load_store     IMAGE_1D_ARRAY
	use ARB_shader_image_load_store     IMAGE_2D_ARRAY
	use ARB_shader_image_load_store     IMAGE_CUBE_MAP_ARRAY
	use ARB_shader_image_load_store     IMAGE_2D_MULTISAMPLE
	use ARB_shader_image_load_store     IMAGE_2D_MULTISAMPLE_ARRAY
	use ARB_shader_image_load_store     INT_IMAGE_1D
	use ARB_shader_image_load_store     INT_IMAGE_2D
	use ARB_shader_image_load_store     INT_IMAGE_3D
	use ARB_shader_image_load_store     INT_IMAGE_2D_RECT
	use ARB_shader_image_load_store     INT_IMAGE_CUBE
	use ARB_shader_image_load_store     INT_IMAGE_BUFFER
	use ARB_shader_image_load_store     INT_IMAGE_1D_ARRAY
	use ARB_shader_image_load_store     INT_IMAGE_2D_ARRAY
	use ARB_shader_image_load_store     INT_IMAGE_CUBE_MAP_ARRAY
	use ARB_shader_image_load_store     INT_IMAGE_2D_MULTISAMPLE
	use ARB_shader_image_load_store     INT_IMAGE_2D_MULTISAMPLE_ARRAY
	use ARB_shader_image_load_store     UNSIGNED_INT_IMAGE_1D
	use ARB_shader_image_load_store     UNSIGNED_INT_IMAGE_2D
	use ARB_shader_image_load_store     UNSIGNED_INT_IMAGE_3D
	use ARB_shader_image_load_store     UNSIGNED_INT_IMAGE_2D_RECT
	use ARB_shader_image_load_store     UNSIGNED_INT_IMAGE_CUBE
	use ARB_shader_image_load_store     UNSIGNED_INT_IMAGE_BUFFER
	use ARB_shader_image_load_store     UNSIGNED_INT_IMAGE_1D_ARRAY
	use ARB_shader_image_load_store     UNSIGNED_INT_IMAGE_2D_ARRAY
	use ARB_shader_image_load_store     UNSIGNED_INT_IMAGE_CUBE_MAP_ARRAY
	use ARB_shader_image_load_store     UNSIGNED_INT_IMAGE_2D_MULTISAMPLE
	use ARB_shader_image_load_store     UNSIGNED_INT_IMAGE_2D_MULTISAMPLE_ARRAY
	use ARB_shader_image_load_store     MAX_IMAGE_SAMPLES
	use ARB_shader_image_load_store     IMAGE_BINDING_FORMAT
	use ARB_shader_image_load_store     IMAGE_FORMAT_COMPATIBILITY_TYPE
	use ARB_shader_image_load_store     IMAGE_FORMAT_COMPATIBILITY_BY_SIZE
	use ARB_shader_image_load_store     IMAGE_FORMAT_COMPATIBILITY_BY_CLASS
	use ARB_shader_image_load_store     MAX_VERTEX_IMAGE_UNIFORMS
	use ARB_shader_image_load_store     MAX_TESS_CONTROL_IMAGE_UNIFORMS
	use ARB_shader_image_load_store     MAX_TESS_EVALUATION_IMAGE_UNIFORMS
	use ARB_shader_image_load_store     MAX_GEOMETRY_IMAGE_UNIFORMS
	use ARB_shader_image_load_store     MAX_FRAGMENT_IMAGE_UNIFORMS
	use ARB_shader_image_load_store     MAX_COMBINED_IMAGE_UNIFORMS
passthru: /* Reuse tokens from ARB_shading_language_packing (none) */
passthru: /* Reuse tokens from ARB_texture_storage */
	use ARB_texture_storage		    TEXTURE_IMMUTABLE_FORMAT

###############################################################################
#
# OpenGL 4.3 enums
#
###############################################################################

VERSION_4_3 enum:
	NUM_SHADING_LANGUAGE_VERSIONS			= 0x82E9
	VERTEX_ATTRIB_ARRAY_LONG			= 0x874E
passthru: /* Reuse tokens from ARB_arrays_of_arrays (none, GLSL only) */
passthru: /* Reuse tokens from ARB_fragment_layer_viewport (none, GLSL only) */
passthru: /* Reuse tokens from ARB_shader_image_size (none, GLSL only) */
passthru: /* Reuse tokens from ARB_ES3_compatibility */
	use ARB_ES3_compatibility		    COMPRESSED_RGB8_ETC2
	use ARB_ES3_compatibility		    COMPRESSED_SRGB8_ETC2
	use ARB_ES3_compatibility		    COMPRESSED_RGB8_PUNCHTHROUGH_ALPHA1_ETC2
	use ARB_ES3_compatibility		    COMPRESSED_SRGB8_PUNCHTHROUGH_ALPHA1_ETC2
	use ARB_ES3_compatibility		    COMPRESSED_RGBA8_ETC2_EAC
	use ARB_ES3_compatibility		    COMPRESSED_SRGB8_ALPHA8_ETC2_EAC
	use ARB_ES3_compatibility		    COMPRESSED_R11_EAC
	use ARB_ES3_compatibility		    COMPRESSED_SIGNED_R11_EAC
	use ARB_ES3_compatibility		    COMPRESSED_RG11_EAC
	use ARB_ES3_compatibility		    COMPRESSED_SIGNED_RG11_EAC
	use ARB_ES3_compatibility		    PRIMITIVE_RESTART_FIXED_INDEX
	use ARB_ES3_compatibility		    ANY_SAMPLES_PASSED_CONSERVATIVE
	use ARB_ES3_compatibility		    MAX_ELEMENT_INDEX
passthru: /* Reuse tokens from ARB_clear_buffer_object (none) */
passthru: /* Reuse tokens from ARB_compute_shader */
	use ARB_compute_shader			    COMPUTE_SHADER
	use ARB_compute_shader			    MAX_COMPUTE_UNIFORM_BLOCKS
	use ARB_compute_shader			    MAX_COMPUTE_TEXTURE_IMAGE_UNITS
	use ARB_compute_shader			    MAX_COMPUTE_IMAGE_UNIFORMS
	use ARB_compute_shader			    MAX_COMPUTE_SHARED_MEMORY_SIZE
	use ARB_compute_shader			    MAX_COMPUTE_UNIFORM_COMPONENTS
	use ARB_compute_shader			    MAX_COMPUTE_ATOMIC_COUNTER_BUFFERS
	use ARB_compute_shader			    MAX_COMPUTE_ATOMIC_COUNTERS
	use ARB_compute_shader			    MAX_COMBINED_COMPUTE_UNIFORM_COMPONENTS
	use ARB_compute_shader			    MAX_COMPUTE_LOCAL_INVOCATIONS
	use ARB_compute_shader			    MAX_COMPUTE_WORK_GROUP_COUNT
	use ARB_compute_shader			    MAX_COMPUTE_WORK_GROUP_SIZE
	use ARB_compute_shader			    COMPUTE_LOCAL_WORK_SIZE
	use ARB_compute_shader			    UNIFORM_BLOCK_REFERENCED_BY_COMPUTE_SHADER
	use ARB_compute_shader			    ATOMIC_COUNTER_BUFFER_REFERENCED_BY_COMPUTE_SHADER
	use ARB_compute_shader			    DISPATCH_INDIRECT_BUFFER
	use ARB_compute_shader			    DISPATCH_INDIRECT_BUFFER_BINDING
passthru: /* Reuse tokens from ARB_copy_image (none) */
passthru: /* Reuse tokens from KHR_debug */
	use KHR_debug				    DEBUG_OUTPUT_SYNCHRONOUS
	use KHR_debug				    DEBUG_NEXT_LOGGED_MESSAGE_LENGTH
	use KHR_debug				    DEBUG_CALLBACK_FUNCTION
	use KHR_debug				    DEBUG_CALLBACK_USER_PARAM
	use KHR_debug				    DEBUG_SOURCE_API
	use KHR_debug				    DEBUG_SOURCE_WINDOW_SYSTEM
	use KHR_debug				    DEBUG_SOURCE_SHADER_COMPILER
	use KHR_debug				    DEBUG_SOURCE_THIRD_PARTY
	use KHR_debug				    DEBUG_SOURCE_APPLICATION
	use KHR_debug				    DEBUG_SOURCE_OTHER
	use KHR_debug				    DEBUG_TYPE_ERROR
	use KHR_debug				    DEBUG_TYPE_DEPRECATED_BEHAVIOR
	use KHR_debug				    DEBUG_TYPE_UNDEFINED_BEHAVIOR
	use KHR_debug				    DEBUG_TYPE_PORTABILITY
	use KHR_debug				    DEBUG_TYPE_PERFORMANCE
	use KHR_debug				    DEBUG_TYPE_OTHER
	use KHR_debug				    MAX_DEBUG_MESSAGE_LENGTH
	use KHR_debug				    MAX_DEBUG_LOGGED_MESSAGES
	use KHR_debug				    DEBUG_LOGGED_MESSAGES
	use KHR_debug				    DEBUG_SEVERITY_HIGH
	use KHR_debug				    DEBUG_SEVERITY_MEDIUM
	use KHR_debug				    DEBUG_SEVERITY_LOW
	use KHR_debug				    DEBUG_TYPE_MARKER
	use KHR_debug				    DEBUG_TYPE_PUSH_GROUP
	use KHR_debug				    DEBUG_TYPE_POP_GROUP
	use KHR_debug				    DEBUG_SEVERITY_NOTIFICATION
	use KHR_debug				    MAX_DEBUG_GROUP_STACK_DEPTH
	use KHR_debug				    DEBUG_GROUP_STACK_DEPTH
	use KHR_debug				    BUFFER
	use KHR_debug				    SHADER
	use KHR_debug				    PROGRAM
	use KHR_debug				    QUERY
	use KHR_debug				    PROGRAM_PIPELINE
	use KHR_debug				    SAMPLER
	use KHR_debug				    DISPLAY_LIST
	use KHR_debug				    MAX_LABEL_LENGTH
	use KHR_debug				    DEBUG_OUTPUT
	use KHR_debug				    CONTEXT_FLAG_DEBUG_BIT
	use ErrorCode				    STACK_UNDERFLOW
	use ErrorCode				    STACK_OVERFLOW
passthru: /* Reuse tokens from ARB_explicit_uniform_location */
	use ARB_explicit_uniform_location	    MAX_UNIFORM_LOCATIONS
passthru: /* Reuse tokens from ARB_framebuffer_no_attachments */
	use ARB_framebuffer_no_attachments	    FRAMEBUFFER_DEFAULT_WIDTH
	use ARB_framebuffer_no_attachments	    FRAMEBUFFER_DEFAULT_HEIGHT
	use ARB_framebuffer_no_attachments	    FRAMEBUFFER_DEFAULT_LAYERS
	use ARB_framebuffer_no_attachments	    FRAMEBUFFER_DEFAULT_SAMPLES
	use ARB_framebuffer_no_attachments	    FRAMEBUFFER_DEFAULT_FIXED_SAMPLE_LOCATIONS
	use ARB_framebuffer_no_attachments	    MAX_FRAMEBUFFER_WIDTH
	use ARB_framebuffer_no_attachments	    MAX_FRAMEBUFFER_HEIGHT
	use ARB_framebuffer_no_attachments	    MAX_FRAMEBUFFER_LAYERS
	use ARB_framebuffer_no_attachments	    MAX_FRAMEBUFFER_SAMPLES
passthru: /* Reuse tokens from ARB_internalformat_query2 */
	use ARB_internalformat_query2		    INTERNALFORMAT_SUPPORTED
	use ARB_internalformat_query2		    INTERNALFORMAT_PREFERRED
	use ARB_internalformat_query2		    INTERNALFORMAT_RED_SIZE
	use ARB_internalformat_query2		    INTERNALFORMAT_GREEN_SIZE
	use ARB_internalformat_query2		    INTERNALFORMAT_BLUE_SIZE
	use ARB_internalformat_query2		    INTERNALFORMAT_ALPHA_SIZE
	use ARB_internalformat_query2		    INTERNALFORMAT_DEPTH_SIZE
	use ARB_internalformat_query2		    INTERNALFORMAT_STENCIL_SIZE
	use ARB_internalformat_query2		    INTERNALFORMAT_SHARED_SIZE
	use ARB_internalformat_query2		    INTERNALFORMAT_RED_TYPE
	use ARB_internalformat_query2		    INTERNALFORMAT_GREEN_TYPE
	use ARB_internalformat_query2		    INTERNALFORMAT_BLUE_TYPE
	use ARB_internalformat_query2		    INTERNALFORMAT_ALPHA_TYPE
	use ARB_internalformat_query2		    INTERNALFORMAT_DEPTH_TYPE
	use ARB_internalformat_query2		    INTERNALFORMAT_STENCIL_TYPE
	use ARB_internalformat_query2		    MAX_WIDTH
	use ARB_internalformat_query2		    MAX_HEIGHT
	use ARB_internalformat_query2		    MAX_DEPTH
	use ARB_internalformat_query2		    MAX_LAYERS
	use ARB_internalformat_query2		    MAX_COMBINED_DIMENSIONS
	use ARB_internalformat_query2		    COLOR_COMPONENTS
	use ARB_internalformat_query2		    DEPTH_COMPONENTS
	use ARB_internalformat_query2		    STENCIL_COMPONENTS
	use ARB_internalformat_query2		    COLOR_RENDERABLE
	use ARB_internalformat_query2		    DEPTH_RENDERABLE
	use ARB_internalformat_query2		    STENCIL_RENDERABLE
	use ARB_internalformat_query2		    FRAMEBUFFER_RENDERABLE
	use ARB_internalformat_query2		    FRAMEBUFFER_RENDERABLE_LAYERED
	use ARB_internalformat_query2		    FRAMEBUFFER_BLEND
	use ARB_internalformat_query2		    READ_PIXELS
	use ARB_internalformat_query2		    READ_PIXELS_FORMAT
	use ARB_internalformat_query2		    READ_PIXELS_TYPE
	use ARB_internalformat_query2		    TEXTURE_IMAGE_FORMAT
	use ARB_internalformat_query2		    TEXTURE_IMAGE_TYPE
	use ARB_internalformat_query2		    GET_TEXTURE_IMAGE_FORMAT
	use ARB_internalformat_query2		    GET_TEXTURE_IMAGE_TYPE
	use ARB_internalformat_query2		    MIPMAP
	use ARB_internalformat_query2		    MANUAL_GENERATE_MIPMAP
	use ARB_internalformat_query2		    AUTO_GENERATE_MIPMAP
	use ARB_internalformat_query2		    COLOR_ENCODING
	use ARB_internalformat_query2		    SRGB_READ
	use ARB_internalformat_query2		    SRGB_WRITE
	use ARB_internalformat_query2		    FILTER
	use ARB_internalformat_query2		    VERTEX_TEXTURE
	use ARB_internalformat_query2		    TESS_CONTROL_TEXTURE
	use ARB_internalformat_query2		    TESS_EVALUATION_TEXTURE
	use ARB_internalformat_query2		    GEOMETRY_TEXTURE
	use ARB_internalformat_query2		    FRAGMENT_TEXTURE
	use ARB_internalformat_query2		    COMPUTE_TEXTURE
	use ARB_internalformat_query2		    TEXTURE_SHADOW
	use ARB_internalformat_query2		    TEXTURE_GATHER
	use ARB_internalformat_query2		    TEXTURE_GATHER_SHADOW
	use ARB_internalformat_query2		    SHADER_IMAGE_LOAD
	use ARB_internalformat_query2		    SHADER_IMAGE_STORE
	use ARB_internalformat_query2		    SHADER_IMAGE_ATOMIC
	use ARB_internalformat_query2		    IMAGE_TEXEL_SIZE
	use ARB_internalformat_query2		    IMAGE_COMPATIBILITY_CLASS
	use ARB_internalformat_query2		    IMAGE_PIXEL_FORMAT
	use ARB_internalformat_query2		    IMAGE_PIXEL_TYPE
	use ARB_internalformat_query2		    SIMULTANEOUS_TEXTURE_AND_DEPTH_TEST
	use ARB_internalformat_query2		    SIMULTANEOUS_TEXTURE_AND_STENCIL_TEST
	use ARB_internalformat_query2		    SIMULTANEOUS_TEXTURE_AND_DEPTH_WRITE
	use ARB_internalformat_query2		    SIMULTANEOUS_TEXTURE_AND_STENCIL_WRITE
	use ARB_internalformat_query2		    TEXTURE_COMPRESSED_BLOCK_WIDTH
	use ARB_internalformat_query2		    TEXTURE_COMPRESSED_BLOCK_HEIGHT
	use ARB_internalformat_query2		    TEXTURE_COMPRESSED_BLOCK_SIZE
	use ARB_internalformat_query2		    CLEAR_BUFFER
	use ARB_internalformat_query2		    TEXTURE_VIEW
	use ARB_internalformat_query2		    VIEW_COMPATIBILITY_CLASS
	use ARB_internalformat_query2		    FULL_SUPPORT
	use ARB_internalformat_query2		    CAVEAT_SUPPORT
	use ARB_internalformat_query2		    IMAGE_CLASS_4_X_32
	use ARB_internalformat_query2		    IMAGE_CLASS_2_X_32
	use ARB_internalformat_query2		    IMAGE_CLASS_1_X_32
	use ARB_internalformat_query2		    IMAGE_CLASS_4_X_16
	use ARB_internalformat_query2		    IMAGE_CLASS_2_X_16
	use ARB_internalformat_query2		    IMAGE_CLASS_1_X_16
	use ARB_internalformat_query2		    IMAGE_CLASS_4_X_8
	use ARB_internalformat_query2		    IMAGE_CLASS_2_X_8
	use ARB_internalformat_query2		    IMAGE_CLASS_1_X_8
	use ARB_internalformat_query2		    IMAGE_CLASS_11_11_10
	use ARB_internalformat_query2		    IMAGE_CLASS_10_10_10_2
	use ARB_internalformat_query2		    VIEW_CLASS_128_BITS
	use ARB_internalformat_query2		    VIEW_CLASS_96_BITS
	use ARB_internalformat_query2		    VIEW_CLASS_64_BITS
	use ARB_internalformat_query2		    VIEW_CLASS_48_BITS
	use ARB_internalformat_query2		    VIEW_CLASS_32_BITS
	use ARB_internalformat_query2		    VIEW_CLASS_24_BITS
	use ARB_internalformat_query2		    VIEW_CLASS_16_BITS
	use ARB_internalformat_query2		    VIEW_CLASS_8_BITS
	use ARB_internalformat_query2		    VIEW_CLASS_S3TC_DXT1_RGB
	use ARB_internalformat_query2		    VIEW_CLASS_S3TC_DXT1_RGBA
	use ARB_internalformat_query2		    VIEW_CLASS_S3TC_DXT3_RGBA
	use ARB_internalformat_query2		    VIEW_CLASS_S3TC_DXT5_RGBA
	use ARB_internalformat_query2		    VIEW_CLASS_RGTC1_RED
	use ARB_internalformat_query2		    VIEW_CLASS_RGTC2_RG
	use ARB_internalformat_query2		    VIEW_CLASS_BPTC_UNORM
	use ARB_internalformat_query2		    VIEW_CLASS_BPTC_FLOAT
passthru: /* Reuse tokens from ARB_invalidate_subdata (none) */
passthru: /* Reuse tokens from ARB_multi_draw_indirect (none) */
passthru: /* Reuse tokens from ARB_program_interface_query */
	use ARB_program_interface_query		    UNIFORM
	use ARB_program_interface_query		    UNIFORM_BLOCK
	use ARB_program_interface_query		    PROGRAM_INPUT
	use ARB_program_interface_query		    PROGRAM_OUTPUT
	use ARB_program_interface_query		    BUFFER_VARIABLE
	use ARB_program_interface_query		    SHADER_STORAGE_BLOCK
	use ARB_program_interface_query		    VERTEX_SUBROUTINE
	use ARB_program_interface_query		    TESS_CONTROL_SUBROUTINE
	use ARB_program_interface_query		    TESS_EVALUATION_SUBROUTINE
	use ARB_program_interface_query		    GEOMETRY_SUBROUTINE
	use ARB_program_interface_query		    FRAGMENT_SUBROUTINE
	use ARB_program_interface_query		    COMPUTE_SUBROUTINE
	use ARB_program_interface_query		    VERTEX_SUBROUTINE_UNIFORM
	use ARB_program_interface_query		    TESS_CONTROL_SUBROUTINE_UNIFORM
	use ARB_program_interface_query		    TESS_EVALUATION_SUBROUTINE_UNIFORM
	use ARB_program_interface_query		    GEOMETRY_SUBROUTINE_UNIFORM
	use ARB_program_interface_query		    FRAGMENT_SUBROUTINE_UNIFORM
	use ARB_program_interface_query		    COMPUTE_SUBROUTINE_UNIFORM
	use ARB_program_interface_query		    TRANSFORM_FEEDBACK_VARYING
	use ARB_program_interface_query		    ACTIVE_RESOURCES
	use ARB_program_interface_query		    MAX_NAME_LENGTH
	use ARB_program_interface_query		    MAX_NUM_ACTIVE_VARIABLES
	use ARB_program_interface_query		    MAX_NUM_COMPATIBLE_SUBROUTINES
	use ARB_program_interface_query		    NAME_LENGTH
	use ARB_program_interface_query		    TYPE
	use ARB_program_interface_query		    ARRAY_SIZE
	use ARB_program_interface_query		    OFFSET
	use ARB_program_interface_query		    BLOCK_INDEX
	use ARB_program_interface_query		    ARRAY_STRIDE
	use ARB_program_interface_query		    MATRIX_STRIDE
	use ARB_program_interface_query		    IS_ROW_MAJOR
	use ARB_program_interface_query		    ATOMIC_COUNTER_BUFFER_INDEX
	use ARB_program_interface_query		    BUFFER_BINDING
	use ARB_program_interface_query		    BUFFER_DATA_SIZE
	use ARB_program_interface_query		    NUM_ACTIVE_VARIABLES
	use ARB_program_interface_query		    ACTIVE_VARIABLES
	use ARB_program_interface_query		    REFERENCED_BY_VERTEX_SHADER
	use ARB_program_interface_query		    REFERENCED_BY_TESS_CONTROL_SHADER
	use ARB_program_interface_query		    REFERENCED_BY_TESS_EVALUATION_SHADER
	use ARB_program_interface_query		    REFERENCED_BY_GEOMETRY_SHADER
	use ARB_program_interface_query		    REFERENCED_BY_FRAGMENT_SHADER
	use ARB_program_interface_query		    REFERENCED_BY_COMPUTE_SHADER
	use ARB_program_interface_query		    TOP_LEVEL_ARRAY_SIZE
	use ARB_program_interface_query		    TOP_LEVEL_ARRAY_STRIDE
	use ARB_program_interface_query		    LOCATION
	use ARB_program_interface_query		    LOCATION_INDEX
	use ARB_program_interface_query		    IS_PER_PATCH
passthru: /* Reuse tokens from ARB_robust_buffer_access_behavior (none) */
passthru: /* Reuse tokens from ARB_shader_storage_buffer_object */
	use ARB_shader_storage_buffer_object	    SHADER_STORAGE_BUFFER
	use ARB_shader_storage_buffer_object	    SHADER_STORAGE_BUFFER_BINDING
	use ARB_shader_storage_buffer_object	    SHADER_STORAGE_BUFFER_START
	use ARB_shader_storage_buffer_object	    SHADER_STORAGE_BUFFER_SIZE
	use ARB_shader_storage_buffer_object	    MAX_VERTEX_SHADER_STORAGE_BLOCKS
	use ARB_shader_storage_buffer_object	    MAX_GEOMETRY_SHADER_STORAGE_BLOCKS
	use ARB_shader_storage_buffer_object	    MAX_TESS_CONTROL_SHADER_STORAGE_BLOCKS
	use ARB_shader_storage_buffer_object	    MAX_TESS_EVALUATION_SHADER_STORAGE_BLOCKS
	use ARB_shader_storage_buffer_object	    MAX_FRAGMENT_SHADER_STORAGE_BLOCKS
	use ARB_shader_storage_buffer_object	    MAX_COMPUTE_SHADER_STORAGE_BLOCKS
	use ARB_shader_storage_buffer_object	    MAX_COMBINED_SHADER_STORAGE_BLOCKS
	use ARB_shader_storage_buffer_object	    MAX_SHADER_STORAGE_BUFFER_BINDINGS
	use ARB_shader_storage_buffer_object	    MAX_SHADER_STORAGE_BLOCK_SIZE
	use ARB_shader_storage_buffer_object	    SHADER_STORAGE_BUFFER_OFFSET_ALIGNMENT
	use ARB_shader_storage_buffer_object	    SHADER_STORAGE_BARRIER_BIT
	use ARB_shader_storage_buffer_object	    MAX_COMBINED_SHADER_OUTPUT_RESOURCES
passthru: /* Reuse tokens from ARB_stencil_texturing */
	use ARB_stencil_texturing		    DEPTH_STENCIL_TEXTURE_MODE
passthru: /* Reuse tokens from ARB_texture_buffer_range */
	use ARB_texture_buffer_range		    TEXTURE_BUFFER_OFFSET
	use ARB_texture_buffer_range		    TEXTURE_BUFFER_SIZE
	use ARB_texture_buffer_range		    TEXTURE_BUFFER_OFFSET_ALIGNMENT
passthru: /* Reuse tokens from ARB_texture_query_levels (none) */
passthru: /* Reuse tokens from ARB_texture_storage_multisample (none) */
passthru: /* Reuse tokens from ARB_texture_view */
	use ARB_texture_view			    TEXTURE_VIEW_MIN_LEVEL
	use ARB_texture_view			    TEXTURE_VIEW_NUM_LEVELS
	use ARB_texture_view			    TEXTURE_VIEW_MIN_LAYER
	use ARB_texture_view			    TEXTURE_VIEW_NUM_LAYERS
	use ARB_texture_view			    TEXTURE_IMMUTABLE_LEVELS
passthru: /* Reuse tokens from ARB_vertex_attrib_binding */
	use ARB_vertex_attrib_binding		    VERTEX_ATTRIB_BINDING
	use ARB_vertex_attrib_binding		    VERTEX_ATTRIB_RELATIVE_OFFSET
	use ARB_vertex_attrib_binding		    VERTEX_BINDING_DIVISOR
	use ARB_vertex_attrib_binding		    VERTEX_BINDING_OFFSET
	use ARB_vertex_attrib_binding		    VERTEX_BINDING_STRIDE
	use ARB_vertex_attrib_binding		    MAX_VERTEX_ATTRIB_RELATIVE_OFFSET
	use ARB_vertex_attrib_binding		    MAX_VERTEX_ATTRIB_BINDINGS


###############################################################################
#
# ARB extensions, in ARB extension order
#
###############################################################################

###############################################################################

# ARB Extension #1
ARB_multitexture enum:
	TEXTURE0_ARB					= 0x84C0
	TEXTURE1_ARB					= 0x84C1
	TEXTURE2_ARB					= 0x84C2
	TEXTURE3_ARB					= 0x84C3
	TEXTURE4_ARB					= 0x84C4
	TEXTURE5_ARB					= 0x84C5
	TEXTURE6_ARB					= 0x84C6
	TEXTURE7_ARB					= 0x84C7
	TEXTURE8_ARB					= 0x84C8
	TEXTURE9_ARB					= 0x84C9
	TEXTURE10_ARB					= 0x84CA
	TEXTURE11_ARB					= 0x84CB
	TEXTURE12_ARB					= 0x84CC
	TEXTURE13_ARB					= 0x84CD
	TEXTURE14_ARB					= 0x84CE
	TEXTURE15_ARB					= 0x84CF
	TEXTURE16_ARB					= 0x84D0
	TEXTURE17_ARB					= 0x84D1
	TEXTURE18_ARB					= 0x84D2
	TEXTURE19_ARB					= 0x84D3
	TEXTURE20_ARB					= 0x84D4
	TEXTURE21_ARB					= 0x84D5
	TEXTURE22_ARB					= 0x84D6
	TEXTURE23_ARB					= 0x84D7
	TEXTURE24_ARB					= 0x84D8
	TEXTURE25_ARB					= 0x84D9
	TEXTURE26_ARB					= 0x84DA
	TEXTURE27_ARB					= 0x84DB
	TEXTURE28_ARB					= 0x84DC
	TEXTURE29_ARB					= 0x84DD
	TEXTURE30_ARB					= 0x84DE
	TEXTURE31_ARB					= 0x84DF
	ACTIVE_TEXTURE_ARB				= 0x84E0 # 1 I
	CLIENT_ACTIVE_TEXTURE_ARB			= 0x84E1 # 1 I
	MAX_TEXTURE_UNITS_ARB				= 0x84E2 # 1 I

###############################################################################

# No new tokens
# ARB Extension #2 - GLX_ARB_get_proc_address

###############################################################################

# ARB Extension #3
ARB_transpose_matrix enum:
	TRANSPOSE_MODELVIEW_MATRIX_ARB			= 0x84E3 # 16 F
	TRANSPOSE_PROJECTION_MATRIX_ARB			= 0x84E4 # 16 F
	TRANSPOSE_TEXTURE_MATRIX_ARB			= 0x84E5 # 16 F
	TRANSPOSE_COLOR_MATRIX_ARB			= 0x84E6 # 16 F

###############################################################################

# No new tokens
# ARB Extension #4 - WGL_ARB_buffer_region

###############################################################################

# ARB Extension #5
ARB_multisample enum:
	MULTISAMPLE_ARB					= 0x809D
	SAMPLE_ALPHA_TO_COVERAGE_ARB			= 0x809E
	SAMPLE_ALPHA_TO_ONE_ARB				= 0x809F
	SAMPLE_COVERAGE_ARB				= 0x80A0
	SAMPLE_BUFFERS_ARB				= 0x80A8
	SAMPLES_ARB					= 0x80A9
	SAMPLE_COVERAGE_VALUE_ARB			= 0x80AA
	SAMPLE_COVERAGE_INVERT_ARB			= 0x80AB
	MULTISAMPLE_BIT_ARB				= 0x20000000

###############################################################################

# No new tokens
# ARB Extension #6
ARB_texture_env_add enum:

###############################################################################

# ARB Extension #7
ARB_texture_cube_map enum:
	NORMAL_MAP_ARB					= 0x8511
	REFLECTION_MAP_ARB				= 0x8512
	TEXTURE_CUBE_MAP_ARB				= 0x8513
	TEXTURE_BINDING_CUBE_MAP_ARB			= 0x8514
	TEXTURE_CUBE_MAP_POSITIVE_X_ARB			= 0x8515
	TEXTURE_CUBE_MAP_NEGATIVE_X_ARB			= 0x8516
	TEXTURE_CUBE_MAP_POSITIVE_Y_ARB			= 0x8517
	TEXTURE_CUBE_MAP_NEGATIVE_Y_ARB			= 0x8518
	TEXTURE_CUBE_MAP_POSITIVE_Z_ARB			= 0x8519
	TEXTURE_CUBE_MAP_NEGATIVE_Z_ARB			= 0x851A
	PROXY_TEXTURE_CUBE_MAP_ARB			= 0x851B
	MAX_CUBE_MAP_TEXTURE_SIZE_ARB			= 0x851C

###############################################################################

# No new tokens
# ARB Extension #8 - WGL_ARB_extensions_string
# ARB Extension #9 - WGL_ARB_pixel_format
# ARB Extension #10 - WGL_ARB_make_current_read
# ARB Extension #11 - WGL_ARB_pbuffer

###############################################################################

# ARB Extension #12
ARB_texture_compression enum:
	COMPRESSED_ALPHA_ARB				= 0x84E9
	COMPRESSED_LUMINANCE_ARB			= 0x84EA
	COMPRESSED_LUMINANCE_ALPHA_ARB			= 0x84EB
	COMPRESSED_INTENSITY_ARB			= 0x84EC
	COMPRESSED_RGB_ARB				= 0x84ED
	COMPRESSED_RGBA_ARB				= 0x84EE
	TEXTURE_COMPRESSION_HINT_ARB			= 0x84EF
	TEXTURE_COMPRESSED_IMAGE_SIZE_ARB		= 0x86A0
	TEXTURE_COMPRESSED_ARB				= 0x86A1
	NUM_COMPRESSED_TEXTURE_FORMATS_ARB		= 0x86A2
	COMPRESSED_TEXTURE_FORMATS_ARB			= 0x86A3

###############################################################################

# ARB Extension #13
# Promoted from #36 SGIS_texture_border_clamp
ARB_texture_border_clamp enum:
	CLAMP_TO_BORDER_ARB				= 0x812D

###############################################################################

# ARB Extension #14 - promoted from #54 EXT_point_parameters
# Promoted from #54 {SGIS,EXT}_point_parameters
ARB_point_parameters enum:
	POINT_SIZE_MIN_ARB				= 0x8126 # 1 F
	POINT_SIZE_MAX_ARB				= 0x8127 # 1 F
	POINT_FADE_THRESHOLD_SIZE_ARB			= 0x8128 # 1 F
	POINT_DISTANCE_ATTENUATION_ARB			= 0x8129 # 3 F

###############################################################################

# ARB Extension #15
ARB_vertex_blend enum:
	MAX_VERTEX_UNITS_ARB				= 0x86A4
	ACTIVE_VERTEX_UNITS_ARB				= 0x86A5
	WEIGHT_SUM_UNITY_ARB				= 0x86A6
	VERTEX_BLEND_ARB				= 0x86A7
	CURRENT_WEIGHT_ARB				= 0x86A8
	WEIGHT_ARRAY_TYPE_ARB				= 0x86A9
	WEIGHT_ARRAY_STRIDE_ARB				= 0x86AA
	WEIGHT_ARRAY_SIZE_ARB				= 0x86AB
	WEIGHT_ARRAY_POINTER_ARB			= 0x86AC
	WEIGHT_ARRAY_ARB				= 0x86AD
	MODELVIEW0_ARB					= 0x1700
	MODELVIEW1_ARB					= 0x850A
	MODELVIEW2_ARB					= 0x8722
	MODELVIEW3_ARB					= 0x8723
	MODELVIEW4_ARB					= 0x8724
	MODELVIEW5_ARB					= 0x8725
	MODELVIEW6_ARB					= 0x8726
	MODELVIEW7_ARB					= 0x8727
	MODELVIEW8_ARB					= 0x8728
	MODELVIEW9_ARB					= 0x8729
	MODELVIEW10_ARB					= 0x872A
	MODELVIEW11_ARB					= 0x872B
	MODELVIEW12_ARB					= 0x872C
	MODELVIEW13_ARB					= 0x872D
	MODELVIEW14_ARB					= 0x872E
	MODELVIEW15_ARB					= 0x872F
	MODELVIEW16_ARB					= 0x8730
	MODELVIEW17_ARB					= 0x8731
	MODELVIEW18_ARB					= 0x8732
	MODELVIEW19_ARB					= 0x8733
	MODELVIEW20_ARB					= 0x8734
	MODELVIEW21_ARB					= 0x8735
	MODELVIEW22_ARB					= 0x8736
	MODELVIEW23_ARB					= 0x8737
	MODELVIEW24_ARB					= 0x8738
	MODELVIEW25_ARB					= 0x8739
	MODELVIEW26_ARB					= 0x873A
	MODELVIEW27_ARB					= 0x873B
	MODELVIEW28_ARB					= 0x873C
	MODELVIEW29_ARB					= 0x873D
	MODELVIEW30_ARB					= 0x873E
	MODELVIEW31_ARB					= 0x873F

###############################################################################

# ARB Extension #16
ARB_matrix_palette enum:
	MATRIX_PALETTE_ARB				= 0x8840
	MAX_MATRIX_PALETTE_STACK_DEPTH_ARB		= 0x8841
	MAX_PALETTE_MATRICES_ARB			= 0x8842
	CURRENT_PALETTE_MATRIX_ARB			= 0x8843
	MATRIX_INDEX_ARRAY_ARB				= 0x8844
	CURRENT_MATRIX_INDEX_ARB			= 0x8845
	MATRIX_INDEX_ARRAY_SIZE_ARB			= 0x8846
	MATRIX_INDEX_ARRAY_TYPE_ARB			= 0x8847
	MATRIX_INDEX_ARRAY_STRIDE_ARB			= 0x8848
	MATRIX_INDEX_ARRAY_POINTER_ARB			= 0x8849

###############################################################################

# ARB Extension #17
# Shares enum values with EXT_texture_env_combine
ARB_texture_env_combine enum:
	COMBINE_ARB					= 0x8570
	COMBINE_RGB_ARB					= 0x8571
	COMBINE_ALPHA_ARB				= 0x8572
	SOURCE0_RGB_ARB					= 0x8580
	SOURCE1_RGB_ARB					= 0x8581
	SOURCE2_RGB_ARB					= 0x8582
	SOURCE0_ALPHA_ARB				= 0x8588
	SOURCE1_ALPHA_ARB				= 0x8589
	SOURCE2_ALPHA_ARB				= 0x858A
	OPERAND0_RGB_ARB				= 0x8590
	OPERAND1_RGB_ARB				= 0x8591
	OPERAND2_RGB_ARB				= 0x8592
	OPERAND0_ALPHA_ARB				= 0x8598
	OPERAND1_ALPHA_ARB				= 0x8599
	OPERAND2_ALPHA_ARB				= 0x859A
	RGB_SCALE_ARB					= 0x8573
	ADD_SIGNED_ARB					= 0x8574
	INTERPOLATE_ARB					= 0x8575
	SUBTRACT_ARB					= 0x84E7
	CONSTANT_ARB					= 0x8576
	PRIMARY_COLOR_ARB				= 0x8577
	PREVIOUS_ARB					= 0x8578

###############################################################################

# No new tokens
# ARB Extension #18
ARB_texture_env_crossbar enum:

###############################################################################

# ARB Extension #19
# Promoted from #220 EXT_texture_env_dot3; enum values changed
ARB_texture_env_dot3 enum:
	DOT3_RGB_ARB					= 0x86AE
	DOT3_RGBA_ARB					= 0x86AF

###############################################################################

# No new tokens
# ARB Extension #20 - WGL_ARB_render_texture

###############################################################################

# ARB Extension #21
ARB_texture_mirrored_repeat enum:
	MIRRORED_REPEAT_ARB				= 0x8370

###############################################################################

# ARB Extension #22
ARB_depth_texture enum:
	DEPTH_COMPONENT16_ARB				= 0x81A5
	DEPTH_COMPONENT24_ARB				= 0x81A6
	DEPTH_COMPONENT32_ARB				= 0x81A7
	TEXTURE_DEPTH_SIZE_ARB				= 0x884A
	DEPTH_TEXTURE_MODE_ARB				= 0x884B

###############################################################################

# ARB Extension #23
ARB_shadow enum:
       TEXTURE_COMPARE_MODE_ARB				= 0x884C
       TEXTURE_COMPARE_FUNC_ARB				= 0x884D
       COMPARE_R_TO_TEXTURE_ARB				= 0x884E

###############################################################################

# ARB Extension #24
ARB_shadow_ambient enum:
	TEXTURE_COMPARE_FAIL_VALUE_ARB			= 0x80BF

###############################################################################

# No new tokens
# ARB Extension #25
ARB_window_pos enum:

###############################################################################

# ARB Extension #26
# ARB_vertex_program enums are shared by ARB_fragment_program are so marked.
# Unfortunately, PROGRAM_BINDING_ARB does accidentally reuse 0x8677 -
#   this was a spec editing typo that's now uncorrectable.
ARB_vertex_program enum:
	COLOR_SUM_ARB					= 0x8458
	VERTEX_PROGRAM_ARB				= 0x8620
	VERTEX_ATTRIB_ARRAY_ENABLED_ARB			= 0x8622
	VERTEX_ATTRIB_ARRAY_SIZE_ARB			= 0x8623
	VERTEX_ATTRIB_ARRAY_STRIDE_ARB			= 0x8624
	VERTEX_ATTRIB_ARRAY_TYPE_ARB			= 0x8625
	CURRENT_VERTEX_ATTRIB_ARB			= 0x8626
	PROGRAM_LENGTH_ARB				= 0x8627    # shared
	PROGRAM_STRING_ARB				= 0x8628    # shared
	MAX_PROGRAM_MATRIX_STACK_DEPTH_ARB		= 0x862E    # shared
	MAX_PROGRAM_MATRICES_ARB			= 0x862F    # shared
	CURRENT_MATRIX_STACK_DEPTH_ARB			= 0x8640    # shared
	CURRENT_MATRIX_ARB				= 0x8641    # shared
	VERTEX_PROGRAM_POINT_SIZE_ARB			= 0x8642
	VERTEX_PROGRAM_TWO_SIDE_ARB			= 0x8643
	VERTEX_ATTRIB_ARRAY_POINTER_ARB			= 0x8645
	PROGRAM_ERROR_POSITION_ARB			= 0x864B    # shared
	PROGRAM_BINDING_ARB				= 0x8677    # shared
	MAX_VERTEX_ATTRIBS_ARB				= 0x8869
	VERTEX_ATTRIB_ARRAY_NORMALIZED_ARB		= 0x886A
	PROGRAM_ERROR_STRING_ARB			= 0x8874    # shared
	PROGRAM_FORMAT_ASCII_ARB			= 0x8875    # shared
	PROGRAM_FORMAT_ARB				= 0x8876    # shared
	PROGRAM_INSTRUCTIONS_ARB			= 0x88A0    # shared
	MAX_PROGRAM_INSTRUCTIONS_ARB			= 0x88A1    # shared
	PROGRAM_NATIVE_INSTRUCTIONS_ARB			= 0x88A2    # shared
	MAX_PROGRAM_NATIVE_INSTRUCTIONS_ARB		= 0x88A3    # shared
	PROGRAM_TEMPORARIES_ARB				= 0x88A4    # shared
	MAX_PROGRAM_TEMPORARIES_ARB			= 0x88A5    # shared
	PROGRAM_NATIVE_TEMPORARIES_ARB			= 0x88A6    # shared
	MAX_PROGRAM_NATIVE_TEMPORARIES_ARB		= 0x88A7    # shared
	PROGRAM_PARAMETERS_ARB				= 0x88A8    # shared
	MAX_PROGRAM_PARAMETERS_ARB			= 0x88A9    # shared
	PROGRAM_NATIVE_PARAMETERS_ARB			= 0x88AA    # shared
	MAX_PROGRAM_NATIVE_PARAMETERS_ARB		= 0x88AB    # shared
	PROGRAM_ATTRIBS_ARB				= 0x88AC    # shared
	MAX_PROGRAM_ATTRIBS_ARB				= 0x88AD    # shared
	PROGRAM_NATIVE_ATTRIBS_ARB			= 0x88AE    # shared
	MAX_PROGRAM_NATIVE_ATTRIBS_ARB			= 0x88AF    # shared
	PROGRAM_ADDRESS_REGISTERS_ARB			= 0x88B0    # shared
	MAX_PROGRAM_ADDRESS_REGISTERS_ARB		= 0x88B1    # shared
	PROGRAM_NATIVE_ADDRESS_REGISTERS_ARB		= 0x88B2    # shared
	MAX_PROGRAM_NATIVE_ADDRESS_REGISTERS_ARB	= 0x88B3    # shared
	MAX_PROGRAM_LOCAL_PARAMETERS_ARB		= 0x88B4    # shared
	MAX_PROGRAM_ENV_PARAMETERS_ARB			= 0x88B5    # shared
	PROGRAM_UNDER_NATIVE_LIMITS_ARB			= 0x88B6    # shared
	TRANSPOSE_CURRENT_MATRIX_ARB			= 0x88B7    # shared
	MATRIX0_ARB					= 0x88C0    # shared
	MATRIX1_ARB					= 0x88C1    # shared
	MATRIX2_ARB					= 0x88C2    # shared
	MATRIX3_ARB					= 0x88C3    # shared
	MATRIX4_ARB					= 0x88C4    # shared
	MATRIX5_ARB					= 0x88C5    # shared
	MATRIX6_ARB					= 0x88C6    # shared
	MATRIX7_ARB					= 0x88C7    # shared
	MATRIX8_ARB					= 0x88C8    # shared
	MATRIX9_ARB					= 0x88C9    # shared
	MATRIX10_ARB					= 0x88CA    # shared
	MATRIX11_ARB					= 0x88CB    # shared
	MATRIX12_ARB					= 0x88CC    # shared
	MATRIX13_ARB					= 0x88CD    # shared
	MATRIX14_ARB					= 0x88CE    # shared
	MATRIX15_ARB					= 0x88CF    # shared
	MATRIX16_ARB					= 0x88D0    # shared
	MATRIX17_ARB					= 0x88D1    # shared
	MATRIX18_ARB					= 0x88D2    # shared
	MATRIX19_ARB					= 0x88D3    # shared
	MATRIX20_ARB					= 0x88D4    # shared
	MATRIX21_ARB					= 0x88D5    # shared
	MATRIX22_ARB					= 0x88D6    # shared
	MATRIX23_ARB					= 0x88D7    # shared
	MATRIX24_ARB					= 0x88D8    # shared
	MATRIX25_ARB					= 0x88D9    # shared
	MATRIX26_ARB					= 0x88DA    # shared
	MATRIX27_ARB					= 0x88DB    # shared
	MATRIX28_ARB					= 0x88DC    # shared
	MATRIX29_ARB					= 0x88DD    # shared
	MATRIX30_ARB					= 0x88DE    # shared
	MATRIX31_ARB					= 0x88DF    # shared

###############################################################################

# ARB Extension #27
# Some ARB_fragment_program enums are shared with ARB_vertex_program,
#   and are only included in that #define block, for now.
ARB_fragment_program enum:
#	PROGRAM_LENGTH_ARB				= 0x8627    # shared
#	PROGRAM_STRING_ARB				= 0x8628    # shared
#	MAX_PROGRAM_MATRIX_STACK_DEPTH_ARB		= 0x862E    # shared
#	MAX_PROGRAM_MATRICES_ARB			= 0x862F    # shared
#	CURRENT_MATRIX_STACK_DEPTH_ARB			= 0x8640    # shared
#	CURRENT_MATRIX_ARB				= 0x8641    # shared
#	PROGRAM_ERROR_POSITION_ARB			= 0x864B    # shared
#	PROGRAM_BINDING_ARB				= 0x8677    # shared
	FRAGMENT_PROGRAM_ARB				= 0x8804
	PROGRAM_ALU_INSTRUCTIONS_ARB			= 0x8805
	PROGRAM_TEX_INSTRUCTIONS_ARB			= 0x8806
	PROGRAM_TEX_INDIRECTIONS_ARB			= 0x8807
	PROGRAM_NATIVE_ALU_INSTRUCTIONS_ARB		= 0x8808
	PROGRAM_NATIVE_TEX_INSTRUCTIONS_ARB		= 0x8809
	PROGRAM_NATIVE_TEX_INDIRECTIONS_ARB		= 0x880A
	MAX_PROGRAM_ALU_INSTRUCTIONS_ARB		= 0x880B
	MAX_PROGRAM_TEX_INSTRUCTIONS_ARB		= 0x880C
	MAX_PROGRAM_TEX_INDIRECTIONS_ARB		= 0x880D
	MAX_PROGRAM_NATIVE_ALU_INSTRUCTIONS_ARB		= 0x880E
	MAX_PROGRAM_NATIVE_TEX_INSTRUCTIONS_ARB		= 0x880F
	MAX_PROGRAM_NATIVE_TEX_INDIRECTIONS_ARB		= 0x8810
	MAX_TEXTURE_COORDS_ARB				= 0x8871
	MAX_TEXTURE_IMAGE_UNITS_ARB			= 0x8872
#	PROGRAM_ERROR_STRING_ARB			= 0x8874    # shared
#	PROGRAM_FORMAT_ASCII_ARB			= 0x8875    # shared
#	PROGRAM_FORMAT_ARB				= 0x8876    # shared
#	PROGRAM_INSTRUCTIONS_ARB			= 0x88A0    # shared
#	MAX_PROGRAM_INSTRUCTIONS_ARB			= 0x88A1    # shared
#	PROGRAM_NATIVE_INSTRUCTIONS_ARB			= 0x88A2    # shared
#	MAX_PROGRAM_NATIVE_INSTRUCTIONS_ARB		= 0x88A3    # shared
#	PROGRAM_TEMPORARIES_ARB				= 0x88A4    # shared
#	MAX_PROGRAM_TEMPORARIES_ARB			= 0x88A5    # shared
#	PROGRAM_NATIVE_TEMPORARIES_ARB			= 0x88A6    # shared
#	MAX_PROGRAM_NATIVE_TEMPORARIES_ARB		= 0x88A7    # shared
#	PROGRAM_PARAMETERS_ARB				= 0x88A8    # shared
#	MAX_PROGRAM_PARAMETERS_ARB			= 0x88A9    # shared
#	PROGRAM_NATIVE_PARAMETERS_ARB			= 0x88AA    # shared
#	MAX_PROGRAM_NATIVE_PARAMETERS_ARB		= 0x88AB    # shared
#	PROGRAM_ATTRIBS_ARB				= 0x88AC    # shared
#	MAX_PROGRAM_ATTRIBS_ARB				= 0x88AD    # shared
#	PROGRAM_NATIVE_ATTRIBS_ARB			= 0x88AE    # shared
#	MAX_PROGRAM_NATIVE_ATTRIBS_ARB			= 0x88AF    # shared
#	PROGRAM_ADDRESS_REGISTERS_ARB			= 0x88B0    # shared
#	MAX_PROGRAM_ADDRESS_REGISTERS_ARB		= 0x88B1    # shared
#	PROGRAM_NATIVE_ADDRESS_REGISTERS_ARB		= 0x88B2    # shared
#	MAX_PROGRAM_NATIVE_ADDRESS_REGISTERS_ARB	= 0x88B3    # shared
#	MAX_PROGRAM_LOCAL_PARAMETERS_ARB		= 0x88B4    # shared
#	MAX_PROGRAM_ENV_PARAMETERS_ARB			= 0x88B5    # shared
#	PROGRAM_UNDER_NATIVE_LIMITS_ARB			= 0x88B6    # shared
#	TRANSPOSE_CURRENT_MATRIX_ARB			= 0x88B7    # shared
#	MATRIX0_ARB					= 0x88C0    # shared
#	MATRIX1_ARB					= 0x88C1    # shared
#	MATRIX2_ARB					= 0x88C2    # shared
#	MATRIX3_ARB					= 0x88C3    # shared
#	MATRIX4_ARB					= 0x88C4    # shared
#	MATRIX5_ARB					= 0x88C5    # shared
#	MATRIX6_ARB					= 0x88C6    # shared
#	MATRIX7_ARB					= 0x88C7    # shared
#	MATRIX8_ARB					= 0x88C8    # shared
#	MATRIX9_ARB					= 0x88C9    # shared
#	MATRIX10_ARB					= 0x88CA    # shared
#	MATRIX11_ARB					= 0x88CB    # shared
#	MATRIX12_ARB					= 0x88CC    # shared
#	MATRIX13_ARB					= 0x88CD    # shared
#	MATRIX14_ARB					= 0x88CE    # shared
#	MATRIX15_ARB					= 0x88CF    # shared
#	MATRIX16_ARB					= 0x88D0    # shared
#	MATRIX17_ARB					= 0x88D1    # shared
#	MATRIX18_ARB					= 0x88D2    # shared
#	MATRIX19_ARB					= 0x88D3    # shared
#	MATRIX20_ARB					= 0x88D4    # shared
#	MATRIX21_ARB					= 0x88D5    # shared
#	MATRIX22_ARB					= 0x88D6    # shared
#	MATRIX23_ARB					= 0x88D7    # shared
#	MATRIX24_ARB					= 0x88D8    # shared
#	MATRIX25_ARB					= 0x88D9    # shared
#	MATRIX26_ARB					= 0x88DA    # shared
#	MATRIX27_ARB					= 0x88DB    # shared
#	MATRIX28_ARB					= 0x88DC    # shared
#	MATRIX29_ARB					= 0x88DD    # shared
#	MATRIX30_ARB					= 0x88DE    # shared
#	MATRIX31_ARB					= 0x88DF    # shared


###############################################################################

# ARB Extension #28
ARB_vertex_buffer_object enum:
	BUFFER_SIZE_ARB					= 0x8764
	BUFFER_USAGE_ARB				= 0x8765
	ARRAY_BUFFER_ARB				= 0x8892
	ELEMENT_ARRAY_BUFFER_ARB			= 0x8893
	ARRAY_BUFFER_BINDING_ARB			= 0x8894
	ELEMENT_ARRAY_BUFFER_BINDING_ARB		= 0x8895
	VERTEX_ARRAY_BUFFER_BINDING_ARB			= 0x8896
	NORMAL_ARRAY_BUFFER_BINDING_ARB			= 0x8897
	COLOR_ARRAY_BUFFER_BINDING_ARB			= 0x8898
	INDEX_ARRAY_BUFFER_BINDING_ARB			= 0x8899
	TEXTURE_COORD_ARRAY_BUFFER_BINDING_ARB		= 0x889A
	EDGE_FLAG_ARRAY_BUFFER_BINDING_ARB		= 0x889B
	SECONDARY_COLOR_ARRAY_BUFFER_BINDING_ARB	= 0x889C
	FOG_COORDINATE_ARRAY_BUFFER_BINDING_ARB		= 0x889D
	WEIGHT_ARRAY_BUFFER_BINDING_ARB			= 0x889E
	VERTEX_ATTRIB_ARRAY_BUFFER_BINDING_ARB		= 0x889F
	READ_ONLY_ARB					= 0x88B8
	WRITE_ONLY_ARB					= 0x88B9
	READ_WRITE_ARB					= 0x88BA
	BUFFER_ACCESS_ARB				= 0x88BB
	BUFFER_MAPPED_ARB				= 0x88BC
	BUFFER_MAP_POINTER_ARB				= 0x88BD
	STREAM_DRAW_ARB					= 0x88E0
	STREAM_READ_ARB					= 0x88E1
	STREAM_COPY_ARB					= 0x88E2
	STATIC_DRAW_ARB					= 0x88E4
	STATIC_READ_ARB					= 0x88E5
	STATIC_COPY_ARB					= 0x88E6
	DYNAMIC_DRAW_ARB				= 0x88E8
	DYNAMIC_READ_ARB				= 0x88E9
	DYNAMIC_COPY_ARB				= 0x88EA

###############################################################################

# ARB Extension #29
ARB_occlusion_query enum:
	QUERY_COUNTER_BITS_ARB				= 0x8864
	CURRENT_QUERY_ARB				= 0x8865
	QUERY_RESULT_ARB				= 0x8866
	QUERY_RESULT_AVAILABLE_ARB			= 0x8867
	SAMPLES_PASSED_ARB				= 0x8914

###############################################################################

# ARB Extension #30
ARB_shader_objects enum:
	PROGRAM_OBJECT_ARB				= 0x8B40
	SHADER_OBJECT_ARB				= 0x8B48
	OBJECT_TYPE_ARB					= 0x8B4E
	OBJECT_SUBTYPE_ARB				= 0x8B4F
	FLOAT_VEC2_ARB					= 0x8B50
	FLOAT_VEC3_ARB					= 0x8B51
	FLOAT_VEC4_ARB					= 0x8B52
	INT_VEC2_ARB					= 0x8B53
	INT_VEC3_ARB					= 0x8B54
	INT_VEC4_ARB					= 0x8B55
	BOOL_ARB					= 0x8B56
	BOOL_VEC2_ARB					= 0x8B57
	BOOL_VEC3_ARB					= 0x8B58
	BOOL_VEC4_ARB					= 0x8B59
	FLOAT_MAT2_ARB					= 0x8B5A
	FLOAT_MAT3_ARB					= 0x8B5B
	FLOAT_MAT4_ARB					= 0x8B5C
	SAMPLER_1D_ARB					= 0x8B5D
	SAMPLER_2D_ARB					= 0x8B5E
	SAMPLER_3D_ARB					= 0x8B5F
	SAMPLER_CUBE_ARB				= 0x8B60
	SAMPLER_1D_SHADOW_ARB				= 0x8B61
	SAMPLER_2D_SHADOW_ARB				= 0x8B62
	SAMPLER_2D_RECT_ARB				= 0x8B63
	SAMPLER_2D_RECT_SHADOW_ARB			= 0x8B64
	OBJECT_DELETE_STATUS_ARB			= 0x8B80
	OBJECT_COMPILE_STATUS_ARB			= 0x8B81
	OBJECT_LINK_STATUS_ARB				= 0x8B82
	OBJECT_VALIDATE_STATUS_ARB			= 0x8B83
	OBJECT_INFO_LOG_LENGTH_ARB			= 0x8B84
	OBJECT_ATTACHED_OBJECTS_ARB			= 0x8B85
	OBJECT_ACTIVE_UNIFORMS_ARB			= 0x8B86
	OBJECT_ACTIVE_UNIFORM_MAX_LENGTH_ARB		= 0x8B87
	OBJECT_SHADER_SOURCE_LENGTH_ARB			= 0x8B88

###############################################################################

# ARB Extension #31
# Additional enums are reused from ARB_vertex/fragment_program and ARB_shader_objects
ARB_vertex_shader enum:
	VERTEX_SHADER_ARB				= 0x8B31
	MAX_VERTEX_UNIFORM_COMPONENTS_ARB		= 0x8B4A
	MAX_VARYING_FLOATS_ARB				= 0x8B4B
	MAX_VERTEX_TEXTURE_IMAGE_UNITS_ARB		= 0x8B4C
	MAX_COMBINED_TEXTURE_IMAGE_UNITS_ARB		= 0x8B4D
	OBJECT_ACTIVE_ATTRIBUTES_ARB			= 0x8B89
	OBJECT_ACTIVE_ATTRIBUTE_MAX_LENGTH_ARB		= 0x8B8A

###############################################################################

# ARB Extension #32
# Additional enums are reused from ARB_fragment_program and ARB_shader_objects
ARB_fragment_shader enum:
	FRAGMENT_SHADER_ARB				= 0x8B30
	MAX_FRAGMENT_UNIFORM_COMPONENTS_ARB		= 0x8B49
	FRAGMENT_SHADER_DERIVATIVE_HINT_ARB		= 0x8B8B

###############################################################################

# ARB Extension #33
ARB_shading_language_100 enum:
	SHADING_LANGUAGE_VERSION_ARB			= 0x8B8C

###############################################################################

# ARB Extension #34
# No new tokens
ARB_texture_non_power_of_two enum:

###############################################################################

# ARB Extension #35
ARB_point_sprite enum:
	POINT_SPRITE_ARB				= 0x8861
	COORD_REPLACE_ARB				= 0x8862

###############################################################################

# ARB Extension #36
# No new tokens
ARB_fragment_program_shadow enum:

###############################################################################

# ARB Extension #37
ARB_draw_buffers enum:
	MAX_DRAW_BUFFERS_ARB				= 0x8824
	DRAW_BUFFER0_ARB				= 0x8825
	DRAW_BUFFER1_ARB				= 0x8826
	DRAW_BUFFER2_ARB				= 0x8827
	DRAW_BUFFER3_ARB				= 0x8828
	DRAW_BUFFER4_ARB				= 0x8829
	DRAW_BUFFER5_ARB				= 0x882A
	DRAW_BUFFER6_ARB				= 0x882B
	DRAW_BUFFER7_ARB				= 0x882C
	DRAW_BUFFER8_ARB				= 0x882D
	DRAW_BUFFER9_ARB				= 0x882E
	DRAW_BUFFER10_ARB				= 0x882F
	DRAW_BUFFER11_ARB				= 0x8830
	DRAW_BUFFER12_ARB				= 0x8831
	DRAW_BUFFER13_ARB				= 0x8832
	DRAW_BUFFER14_ARB				= 0x8833
	DRAW_BUFFER15_ARB				= 0x8834

###############################################################################

# ARB Extension #38
ARB_texture_rectangle enum:
	TEXTURE_RECTANGLE_ARB				= 0x84F5
	TEXTURE_BINDING_RECTANGLE_ARB			= 0x84F6
	PROXY_TEXTURE_RECTANGLE_ARB			= 0x84F7
	MAX_RECTANGLE_TEXTURE_SIZE_ARB			= 0x84F8

###############################################################################

# ARB Extension #39
ARB_color_buffer_float enum:
	RGBA_FLOAT_MODE_ARB				= 0x8820
	CLAMP_VERTEX_COLOR_ARB				= 0x891A
	CLAMP_FRAGMENT_COLOR_ARB			= 0x891B
	CLAMP_READ_COLOR_ARB				= 0x891C
	FIXED_ONLY_ARB					= 0x891D

###############################################################################

# ARB Extension #40
ARB_half_float_pixel enum:
	HALF_FLOAT_ARB					= 0x140B

###############################################################################

# ARB Extension #41
ARB_texture_float enum:
	TEXTURE_RED_TYPE_ARB				= 0x8C10
	TEXTURE_GREEN_TYPE_ARB				= 0x8C11
	TEXTURE_BLUE_TYPE_ARB				= 0x8C12
	TEXTURE_ALPHA_TYPE_ARB				= 0x8C13
	TEXTURE_LUMINANCE_TYPE_ARB			= 0x8C14
	TEXTURE_INTENSITY_TYPE_ARB			= 0x8C15
	TEXTURE_DEPTH_TYPE_ARB				= 0x8C16
	UNSIGNED_NORMALIZED_ARB				= 0x8C17
	RGBA32F_ARB					= 0x8814
	RGB32F_ARB					= 0x8815
	ALPHA32F_ARB					= 0x8816
	INTENSITY32F_ARB				= 0x8817
	LUMINANCE32F_ARB				= 0x8818
	LUMINANCE_ALPHA32F_ARB				= 0x8819
	RGBA16F_ARB					= 0x881A
	RGB16F_ARB					= 0x881B
	ALPHA16F_ARB					= 0x881C
	INTENSITY16F_ARB				= 0x881D
	LUMINANCE16F_ARB				= 0x881E
	LUMINANCE_ALPHA16F_ARB				= 0x881F

###############################################################################

# ARB Extension #42
ARB_pixel_buffer_object enum:
	PIXEL_PACK_BUFFER_ARB				= 0x88EB
	PIXEL_UNPACK_BUFFER_ARB				= 0x88EC
	PIXEL_PACK_BUFFER_BINDING_ARB			= 0x88ED
	PIXEL_UNPACK_BUFFER_BINDING_ARB			= 0x88EF

###############################################################################

# ARB Extension #43
ARB_depth_buffer_float enum:
	DEPTH_COMPONENT32F				= 0x8CAC
	DEPTH32F_STENCIL8				= 0x8CAD
	FLOAT_32_UNSIGNED_INT_24_8_REV			= 0x8DAD

###############################################################################

# ARB Extension #44
# No new tokens
ARB_draw_instanced enum:

###############################################################################

# ARB Extension #45
ARB_framebuffer_object enum:
	INVALID_FRAMEBUFFER_OPERATION			= 0x0506
	FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING		= 0x8210
	FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE		= 0x8211
	FRAMEBUFFER_ATTACHMENT_RED_SIZE			= 0x8212
	FRAMEBUFFER_ATTACHMENT_GREEN_SIZE		= 0x8213
	FRAMEBUFFER_ATTACHMENT_BLUE_SIZE		= 0x8214
	FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE		= 0x8215
	FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE		= 0x8216
	FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE		= 0x8217
	FRAMEBUFFER_DEFAULT				= 0x8218
	FRAMEBUFFER_UNDEFINED				= 0x8219
	DEPTH_STENCIL_ATTACHMENT			= 0x821A
	MAX_RENDERBUFFER_SIZE				= 0x84E8
	DEPTH_STENCIL					= 0x84F9
	UNSIGNED_INT_24_8				= 0x84FA
	DEPTH24_STENCIL8				= 0x88F0
	TEXTURE_STENCIL_SIZE				= 0x88F1
	TEXTURE_RED_TYPE				= 0x8C10
	TEXTURE_GREEN_TYPE				= 0x8C11
	TEXTURE_BLUE_TYPE				= 0x8C12
	TEXTURE_ALPHA_TYPE				= 0x8C13
	TEXTURE_DEPTH_TYPE				= 0x8C16
	UNSIGNED_NORMALIZED				= 0x8C17
	FRAMEBUFFER_BINDING				= 0x8CA6
	DRAW_FRAMEBUFFER_BINDING			= GL_FRAMEBUFFER_BINDING
	RENDERBUFFER_BINDING				= 0x8CA7
	READ_FRAMEBUFFER				= 0x8CA8
	DRAW_FRAMEBUFFER				= 0x8CA9
	READ_FRAMEBUFFER_BINDING			= 0x8CAA
	RENDERBUFFER_SAMPLES				= 0x8CAB
	FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE		= 0x8CD0
	FRAMEBUFFER_ATTACHMENT_OBJECT_NAME		= 0x8CD1
	FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL		= 0x8CD2
	FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE	= 0x8CD3
	FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER		= 0x8CD4
	FRAMEBUFFER_COMPLETE				= 0x8CD5
	FRAMEBUFFER_INCOMPLETE_ATTACHMENT		= 0x8CD6
	FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT	= 0x8CD7
	FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER		= 0x8CDB
	FRAMEBUFFER_INCOMPLETE_READ_BUFFER		= 0x8CDC
	FRAMEBUFFER_UNSUPPORTED				= 0x8CDD
	MAX_COLOR_ATTACHMENTS				= 0x8CDF
	COLOR_ATTACHMENT0				= 0x8CE0
	COLOR_ATTACHMENT1				= 0x8CE1
	COLOR_ATTACHMENT2				= 0x8CE2
	COLOR_ATTACHMENT3				= 0x8CE3
	COLOR_ATTACHMENT4				= 0x8CE4
	COLOR_ATTACHMENT5				= 0x8CE5
	COLOR_ATTACHMENT6				= 0x8CE6
	COLOR_ATTACHMENT7				= 0x8CE7
	COLOR_ATTACHMENT8				= 0x8CE8
	COLOR_ATTACHMENT9				= 0x8CE9
	COLOR_ATTACHMENT10				= 0x8CEA
	COLOR_ATTACHMENT11				= 0x8CEB
	COLOR_ATTACHMENT12				= 0x8CEC
	COLOR_ATTACHMENT13				= 0x8CED
	COLOR_ATTACHMENT14				= 0x8CEE
	COLOR_ATTACHMENT15				= 0x8CEF
	DEPTH_ATTACHMENT				= 0x8D00
	STENCIL_ATTACHMENT				= 0x8D20
	FRAMEBUFFER					= 0x8D40
	RENDERBUFFER					= 0x8D41
	RENDERBUFFER_WIDTH				= 0x8D42
	RENDERBUFFER_HEIGHT				= 0x8D43
	RENDERBUFFER_INTERNAL_FORMAT			= 0x8D44
	STENCIL_INDEX1					= 0x8D46
	STENCIL_INDEX4					= 0x8D47
	STENCIL_INDEX8					= 0x8D48
	STENCIL_INDEX16					= 0x8D49
	RENDERBUFFER_RED_SIZE				= 0x8D50
	RENDERBUFFER_GREEN_SIZE				= 0x8D51
	RENDERBUFFER_BLUE_SIZE				= 0x8D52
	RENDERBUFFER_ALPHA_SIZE				= 0x8D53
	RENDERBUFFER_DEPTH_SIZE				= 0x8D54
	RENDERBUFFER_STENCIL_SIZE			= 0x8D55
	FRAMEBUFFER_INCOMPLETE_MULTISAMPLE		= 0x8D56
	MAX_SAMPLES					= 0x8D57

ARB_framebuffer_object_DEPRECATED enum:
	INDEX						= 0x8222
	TEXTURE_LUMINANCE_TYPE				= 0x8C14
	TEXTURE_INTENSITY_TYPE				= 0x8C15

###############################################################################

# ARB Extension #46
ARB_framebuffer_sRGB enum:
	FRAMEBUFFER_SRGB				= 0x8DB9

###############################################################################

# ARB Extension #47
ARB_geometry_shader4 enum:
	LINES_ADJACENCY_ARB				= 0x000A
	LINE_STRIP_ADJACENCY_ARB			= 0x000B
	TRIANGLES_ADJACENCY_ARB				= 0x000C
	TRIANGLE_STRIP_ADJACENCY_ARB			= 0x000D
	PROGRAM_POINT_SIZE_ARB				= 0x8642
	MAX_GEOMETRY_TEXTURE_IMAGE_UNITS_ARB		= 0x8C29
	FRAMEBUFFER_ATTACHMENT_LAYERED_ARB		= 0x8DA7
	FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS_ARB	= 0x8DA8
	FRAMEBUFFER_INCOMPLETE_LAYER_COUNT_ARB		= 0x8DA9
	GEOMETRY_SHADER_ARB				= 0x8DD9
	GEOMETRY_VERTICES_OUT_ARB			= 0x8DDA
	GEOMETRY_INPUT_TYPE_ARB				= 0x8DDB
	GEOMETRY_OUTPUT_TYPE_ARB			= 0x8DDC
	MAX_GEOMETRY_VARYING_COMPONENTS_ARB		= 0x8DDD
	MAX_VERTEX_VARYING_COMPONENTS_ARB		= 0x8DDE
	MAX_GEOMETRY_UNIFORM_COMPONENTS_ARB		= 0x8DDF
	MAX_GEOMETRY_OUTPUT_VERTICES_ARB		= 0x8DE0
	MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS_ARB	= 0x8DE1
	use VERSION_3_0			    MAX_VARYING_COMPONENTS
	use ARB_framebuffer_object	    FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER

###############################################################################

# ARB Extension #48
ARB_half_float_vertex enum:
	HALF_FLOAT					= 0x140B

###############################################################################

# ARB Extension #49
ARB_instanced_arrays enum:
	VERTEX_ATTRIB_ARRAY_DIVISOR_ARB			= 0x88FE

###############################################################################

# ARB Extension #50
ARB_map_buffer_range enum:
	MAP_READ_BIT					= 0x0001
	MAP_WRITE_BIT					= 0x0002
	MAP_INVALIDATE_RANGE_BIT			= 0x0004
	MAP_INVALIDATE_BUFFER_BIT			= 0x0008
	MAP_FLUSH_EXPLICIT_BIT				= 0x0010
	MAP_UNSYNCHRONIZED_BIT				= 0x0020

###############################################################################

# ARB Extension #51
ARB_texture_buffer_object enum:
	TEXTURE_BUFFER_ARB				= 0x8C2A
	MAX_TEXTURE_BUFFER_SIZE_ARB			= 0x8C2B
	TEXTURE_BINDING_BUFFER_ARB			= 0x8C2C
	TEXTURE_BUFFER_DATA_STORE_BINDING_ARB		= 0x8C2D
	TEXTURE_BUFFER_FORMAT_ARB			= 0x8C2E

###############################################################################

# ARB Extension #52
ARB_texture_compression_rgtc enum:
	COMPRESSED_RED_RGTC1				= 0x8DBB
	COMPRESSED_SIGNED_RED_RGTC1			= 0x8DBC
	COMPRESSED_RG_RGTC2				= 0x8DBD
	COMPRESSED_SIGNED_RG_RGTC2			= 0x8DBE

###############################################################################

# ARB Extension #53
ARB_texture_rg enum:
	RG						= 0x8227
	RG_INTEGER					= 0x8228
	R8						= 0x8229
	R16						= 0x822A
	RG8						= 0x822B
	RG16						= 0x822C
	R16F						= 0x822D
	R32F						= 0x822E
	RG16F						= 0x822F
	RG32F						= 0x8230
	R8I						= 0x8231
	R8UI						= 0x8232
	R16I						= 0x8233
	R16UI						= 0x8234
	R32I						= 0x8235
	R32UI						= 0x8236
	RG8I						= 0x8237
	RG8UI						= 0x8238
	RG16I						= 0x8239
	RG16UI						= 0x823A
	RG32I						= 0x823B
	RG32UI						= 0x823C

###############################################################################

# ARB Extension #54
ARB_vertex_array_object enum:
	VERTEX_ARRAY_BINDING				= 0x85B5

###############################################################################

# No new tokens
# ARB Extension #55 - WGL_ARB_create_context
# ARB Extension #56 - GLX_ARB_create_context

###############################################################################

# ARB Extension #57
ARB_uniform_buffer_object enum:
	UNIFORM_BUFFER					= 0x8A11
	UNIFORM_BUFFER_BINDING				= 0x8A28
	UNIFORM_BUFFER_START				= 0x8A29
	UNIFORM_BUFFER_SIZE				= 0x8A2A
	MAX_VERTEX_UNIFORM_BLOCKS			= 0x8A2B
	MAX_GEOMETRY_UNIFORM_BLOCKS			= 0x8A2C
	MAX_FRAGMENT_UNIFORM_BLOCKS			= 0x8A2D
	MAX_COMBINED_UNIFORM_BLOCKS			= 0x8A2E
	MAX_UNIFORM_BUFFER_BINDINGS			= 0x8A2F
	MAX_UNIFORM_BLOCK_SIZE				= 0x8A30
	MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS		= 0x8A31
	MAX_COMBINED_GEOMETRY_UNIFORM_COMPONENTS	= 0x8A32
	MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS	= 0x8A33
	UNIFORM_BUFFER_OFFSET_ALIGNMENT			= 0x8A34
	ACTIVE_UNIFORM_BLOCK_MAX_NAME_LENGTH		= 0x8A35
	ACTIVE_UNIFORM_BLOCKS				= 0x8A36
	UNIFORM_TYPE					= 0x8A37
	UNIFORM_SIZE					= 0x8A38
	UNIFORM_NAME_LENGTH				= 0x8A39
	UNIFORM_BLOCK_INDEX				= 0x8A3A
	UNIFORM_OFFSET					= 0x8A3B
	UNIFORM_ARRAY_STRIDE				= 0x8A3C
	UNIFORM_MATRIX_STRIDE				= 0x8A3D
	UNIFORM_IS_ROW_MAJOR				= 0x8A3E
	UNIFORM_BLOCK_BINDING				= 0x8A3F
	UNIFORM_BLOCK_DATA_SIZE				= 0x8A40
	UNIFORM_BLOCK_NAME_LENGTH			= 0x8A41
	UNIFORM_BLOCK_ACTIVE_UNIFORMS			= 0x8A42
	UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES		= 0x8A43
	UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER	= 0x8A44
	UNIFORM_BLOCK_REFERENCED_BY_GEOMETRY_SHADER	= 0x8A45
	UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER	= 0x8A46
	INVALID_INDEX					= 0xFFFFFFFFu

###############################################################################

# ARB Extension #58
# No new tokens
ARB_compatibility enum:
passthru: /* ARB_compatibility just defines tokens from core 3.0 */

###############################################################################

# ARB Extension #59
ARB_copy_buffer enum:
	COPY_READ_BUFFER_BINDING			= 0x8F36
	COPY_READ_BUFFER				= GL_COPY_READ_BUFFER_BINDING
	COPY_WRITE_BUFFER_BINDING			= 0x8F37
	COPY_WRITE_BUFFER				= GL_COPY_WRITE_BUFFER_BINDING

###############################################################################

# ARB Extension #60
# No new tokens
ARB_shader_texture_lod enum:

###############################################################################

# ARB Extension #61
ARB_depth_clamp enum:
	DEPTH_CLAMP					= 0x864F

###############################################################################

# No new tokens
# ARB Extension #62
ARB_draw_elements_base_vertex enum:

###############################################################################

# No new tokens
# ARB Extension #63
ARB_fragment_coord_conventions enum:

###############################################################################

# ARB Extension #64
ARB_provoking_vertex enum:
	QUADS_FOLLOW_PROVOKING_VERTEX_CONVENTION	= 0x8E4C
	FIRST_VERTEX_CONVENTION				= 0x8E4D
	LAST_VERTEX_CONVENTION				= 0x8E4E
	PROVOKING_VERTEX				= 0x8E4F

###############################################################################

# ARB Extension #65
ARB_seamless_cube_map enum:
	TEXTURE_CUBE_MAP_SEAMLESS			= 0x884F

###############################################################################

# ARB Extension #66
ARB_sync enum:
	MAX_SERVER_WAIT_TIMEOUT				= 0x9111
	OBJECT_TYPE					= 0x9112
	SYNC_CONDITION					= 0x9113
	SYNC_STATUS					= 0x9114
	SYNC_FLAGS					= 0x9115
	SYNC_FENCE					= 0x9116
	SYNC_GPU_COMMANDS_COMPLETE			= 0x9117
	UNSIGNALED					= 0x9118
	SIGNALED					= 0x9119
	ALREADY_SIGNALED				= 0x911A
	TIMEOUT_EXPIRED					= 0x911B
	CONDITION_SATISFIED				= 0x911C
	WAIT_FAILED					= 0x911D
	SYNC_FLUSH_COMMANDS_BIT				= 0x00000001
	TIMEOUT_IGNORED					= 0xFFFFFFFFFFFFFFFFull

###############################################################################

# ARB Extension #67
ARB_texture_multisample enum:
	SAMPLE_POSITION					= 0x8E50
	SAMPLE_MASK					= 0x8E51
	SAMPLE_MASK_VALUE				= 0x8E52
	MAX_SAMPLE_MASK_WORDS				= 0x8E59
	TEXTURE_2D_MULTISAMPLE				= 0x9100
	PROXY_TEXTURE_2D_MULTISAMPLE			= 0x9101
	TEXTURE_2D_MULTISAMPLE_ARRAY			= 0x9102
	PROXY_TEXTURE_2D_MULTISAMPLE_ARRAY		= 0x9103
	TEXTURE_BINDING_2D_MULTISAMPLE			= 0x9104
	TEXTURE_BINDING_2D_MULTISAMPLE_ARRAY		= 0x9105
	TEXTURE_SAMPLES					= 0x9106
	TEXTURE_FIXED_SAMPLE_LOCATIONS			= 0x9107
	SAMPLER_2D_MULTISAMPLE				= 0x9108
	INT_SAMPLER_2D_MULTISAMPLE			= 0x9109
	UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE		= 0x910A
	SAMPLER_2D_MULTISAMPLE_ARRAY			= 0x910B
	INT_SAMPLER_2D_MULTISAMPLE_ARRAY		= 0x910C
	UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE_ARRAY	= 0x910D
	MAX_COLOR_TEXTURE_SAMPLES			= 0x910E
	MAX_DEPTH_TEXTURE_SAMPLES			= 0x910F
	MAX_INTEGER_SAMPLES				= 0x9110

###############################################################################

# ARB Extension #68
ARB_vertex_array_bgra enum:
	use VERSION_1_2			    BGRA

###############################################################################

# No new tokens
# ARB Extension #69
ARB_draw_buffers_blend enum:

###############################################################################

# ARB Extension #70
ARB_sample_shading enum:
	SAMPLE_SHADING_ARB				= 0x8C36
	MIN_SAMPLE_SHADING_VALUE_ARB			= 0x8C37

###############################################################################

# ARB Extension #71
ARB_texture_cube_map_array enum:
	TEXTURE_CUBE_MAP_ARRAY_ARB			= 0x9009
	TEXTURE_BINDING_CUBE_MAP_ARRAY_ARB		= 0x900A
	PROXY_TEXTURE_CUBE_MAP_ARRAY_ARB		= 0x900B
	SAMPLER_CUBE_MAP_ARRAY_ARB			= 0x900C
	SAMPLER_CUBE_MAP_ARRAY_SHADOW_ARB		= 0x900D
	INT_SAMPLER_CUBE_MAP_ARRAY_ARB			= 0x900E
	UNSIGNED_INT_SAMPLER_CUBE_MAP_ARRAY_ARB		= 0x900F

###############################################################################

# ARB Extension #72
ARB_texture_gather enum:
	MIN_PROGRAM_TEXTURE_GATHER_OFFSET_ARB		= 0x8E5E
	MAX_PROGRAM_TEXTURE_GATHER_OFFSET_ARB		= 0x8E5F

###############################################################################

# No new tokens
# ARB Extension #73
ARB_texture_query_lod enum:

###############################################################################

# No new tokens
# ARB Extension #74 - WGL_ARB_create_context_profile
# ARB Extension #75 - GLX_ARB_create_context_profile

###############################################################################

# ARB Extension #76
ARB_shading_language_include enum:
	SHADER_INCLUDE_ARB				= 0x8DAE
	NAMED_STRING_LENGTH_ARB				= 0x8DE9
	NAMED_STRING_TYPE_ARB				= 0x8DEA

###############################################################################

# ARB Extension #77
ARB_texture_compression_bptc enum:
	COMPRESSED_RGBA_BPTC_UNORM_ARB			= 0x8E8C
	COMPRESSED_SRGB_ALPHA_BPTC_UNORM_ARB		= 0x8E8D
	COMPRESSED_RGB_BPTC_SIGNED_FLOAT_ARB		= 0x8E8E
	COMPRESSED_RGB_BPTC_UNSIGNED_FLOAT_ARB		= 0x8E8F

###############################################################################

# ARB Extension #78
ARB_blend_func_extended enum:
	SRC1_COLOR					= 0x88F9
	use VERSION_1_5_DEPRECATED	    SRC1_ALPHA
	ONE_MINUS_SRC1_COLOR				= 0x88FA
	ONE_MINUS_SRC1_ALPHA				= 0x88FB
	MAX_DUAL_SOURCE_DRAW_BUFFERS			= 0x88FC

###############################################################################

# No new tokens
# ARB Extension #79
ARB_explicit_attrib_location enum:

###############################################################################

# ARB Extension #80
ARB_occlusion_query2 enum:
	ANY_SAMPLES_PASSED				= 0x8C2F

###############################################################################

# ARB Extension #81
ARB_sampler_objects enum:
	SAMPLER_BINDING					= 0x8919

###############################################################################

# No new tokens
# ARB Extension #82
ARB_shader_bit_encoding enum:

###############################################################################

# ARB Extension #83
ARB_texture_rgb10_a2ui enum:
	RGB10_A2UI					= 0x906F

###############################################################################

# ARB Extension #84
ARB_texture_swizzle enum:
	TEXTURE_SWIZZLE_R				= 0x8E42
	TEXTURE_SWIZZLE_G				= 0x8E43
	TEXTURE_SWIZZLE_B				= 0x8E44
	TEXTURE_SWIZZLE_A				= 0x8E45
	TEXTURE_SWIZZLE_RGBA				= 0x8E46

###############################################################################

# ARB Extension #85
ARB_timer_query enum:
	TIME_ELAPSED					= 0x88BF
	TIMESTAMP					= 0x8E28

###############################################################################

# ARB Extension #86
ARB_vertex_type_2_10_10_10_rev enum:
	use VERSION_1_2			    UNSIGNED_INT_2_10_10_10_REV
	INT_2_10_10_10_REV				= 0x8D9F

###############################################################################

# ARB Extension #87
ARB_draw_indirect enum:
	DRAW_INDIRECT_BUFFER				= 0x8F3F
	DRAW_INDIRECT_BUFFER_BINDING			= 0x8F43

###############################################################################

# ARB Extension #88
ARB_gpu_shader5 enum:
	GEOMETRY_SHADER_INVOCATIONS			= 0x887F
	MAX_GEOMETRY_SHADER_INVOCATIONS			= 0x8E5A
	MIN_FRAGMENT_INTERPOLATION_OFFSET		= 0x8E5B
	MAX_FRAGMENT_INTERPOLATION_OFFSET		= 0x8E5C
	FRAGMENT_INTERPOLATION_OFFSET_BITS		= 0x8E5D
	use ARB_texture_multisample	    MAX_VERTEX_STREAMS

###############################################################################

# ARB Extension #89
ARB_gpu_shader_fp64 enum:
	use VERSION_1_1			    DOUBLE
	DOUBLE_VEC2					= 0x8FFC
	DOUBLE_VEC3					= 0x8FFD
	DOUBLE_VEC4					= 0x8FFE
	DOUBLE_MAT2					= 0x8F46
	DOUBLE_MAT3					= 0x8F47
	DOUBLE_MAT4					= 0x8F48
	DOUBLE_MAT2x3					= 0x8F49
	DOUBLE_MAT2x4					= 0x8F4A
	DOUBLE_MAT3x2					= 0x8F4B
	DOUBLE_MAT3x4					= 0x8F4C
	DOUBLE_MAT4x2					= 0x8F4D
	DOUBLE_MAT4x3					= 0x8F4E

###############################################################################

# ARB Extension #90
ARB_shader_subroutine enum:
	ACTIVE_SUBROUTINES				= 0x8DE5
	ACTIVE_SUBROUTINE_UNIFORMS			= 0x8DE6
	ACTIVE_SUBROUTINE_UNIFORM_LOCATIONS		= 0x8E47
	ACTIVE_SUBROUTINE_MAX_LENGTH			= 0x8E48
	ACTIVE_SUBROUTINE_UNIFORM_MAX_LENGTH		= 0x8E49
	MAX_SUBROUTINES					= 0x8DE7
	MAX_SUBROUTINE_UNIFORM_LOCATIONS		= 0x8DE8
	NUM_COMPATIBLE_SUBROUTINES			= 0x8E4A
	COMPATIBLE_SUBROUTINES				= 0x8E4B
	use ARB_uniform_buffer_object	    UNIFORM_SIZE
	use ARB_uniform_buffer_object	    UNIFORM_NAME_LENGTH

###############################################################################

# ARB Extension #91
ARB_tessellation_shader enum:
	PATCHES						= 0x000E
	PATCH_VERTICES					= 0x8E72
	PATCH_DEFAULT_INNER_LEVEL			= 0x8E73
	PATCH_DEFAULT_OUTER_LEVEL			= 0x8E74
	TESS_CONTROL_OUTPUT_VERTICES			= 0x8E75
	TESS_GEN_MODE					= 0x8E76
	TESS_GEN_SPACING				= 0x8E77
	TESS_GEN_VERTEX_ORDER				= 0x8E78
	TESS_GEN_POINT_MODE				= 0x8E79
	use VERSION_1_1			    TRIANGLES
	use VERSION_1_1			    QUADS
	ISOLINES					= 0x8E7A
	use VERSION_1_1			    EQUAL
	FRACTIONAL_ODD					= 0x8E7B
	FRACTIONAL_EVEN					= 0x8E7C
	use VERSION_1_1			    CCW
	use VERSION_1_1			    CW
	MAX_PATCH_VERTICES				= 0x8E7D
	MAX_TESS_GEN_LEVEL				= 0x8E7E
	MAX_TESS_CONTROL_UNIFORM_COMPONENTS		= 0x8E7F
	MAX_TESS_EVALUATION_UNIFORM_COMPONENTS		= 0x8E80
	MAX_TESS_CONTROL_TEXTURE_IMAGE_UNITS		= 0x8E81
	MAX_TESS_EVALUATION_TEXTURE_IMAGE_UNITS		= 0x8E82
	MAX_TESS_CONTROL_OUTPUT_COMPONENTS		= 0x8E83
	MAX_TESS_PATCH_COMPONENTS			= 0x8E84
	MAX_TESS_CONTROL_TOTAL_OUTPUT_COMPONENTS	= 0x8E85
	MAX_TESS_EVALUATION_OUTPUT_COMPONENTS		= 0x8E86
	MAX_TESS_CONTROL_UNIFORM_BLOCKS			= 0x8E89
	MAX_TESS_EVALUATION_UNIFORM_BLOCKS		= 0x8E8A
	MAX_TESS_CONTROL_INPUT_COMPONENTS		= 0x886C
	MAX_TESS_EVALUATION_INPUT_COMPONENTS		= 0x886D
	MAX_COMBINED_TESS_CONTROL_UNIFORM_COMPONENTS	= 0x8E1E
	MAX_COMBINED_TESS_EVALUATION_UNIFORM_COMPONENTS = 0x8E1F
	UNIFORM_BLOCK_REFERENCED_BY_TESS_CONTROL_SHADER = 0x84F0
	UNIFORM_BLOCK_REFERENCED_BY_TESS_EVALUATION_SHADER = 0x84F1
	TESS_EVALUATION_SHADER				= 0x8E87
	TESS_CONTROL_SHADER				= 0x8E88

###############################################################################

# ARB Extension #92
ARB_texture_buffer_object_rgb32 enum:
	use VERSION_3_0			    RGB32F
	use VERSION_3_0			    RGB32UI
	use VERSION_3_0			    RGB32I

###############################################################################

# ARB Extension #93
ARB_transform_feedback2 enum:
	TRANSFORM_FEEDBACK				= 0x8E22
	TRANSFORM_FEEDBACK_PAUSED			= 0x8E23
	TRANSFORM_FEEDBACK_BUFFER_PAUSED		= GL_TRANSFORM_FEEDBACK_PAUSED
	TRANSFORM_FEEDBACK_ACTIVE			= 0x8E24
	TRANSFORM_FEEDBACK_BUFFER_ACTIVE		= GL_TRANSFORM_FEEDBACK_ACTIVE
	TRANSFORM_FEEDBACK_BINDING			= 0x8E25

###############################################################################

# ARB Extension #94
ARB_transform_feedback3 enum:
	MAX_TRANSFORM_FEEDBACK_BUFFERS			= 0x8E70
	MAX_VERTEX_STREAMS				= 0x8E71

###############################################################################

# ARB Extension #95
ARB_ES2_compatibility enum:
	FIXED						= 0x140C
	IMPLEMENTATION_COLOR_READ_TYPE			= 0x8B9A
	IMPLEMENTATION_COLOR_READ_FORMAT		= 0x8B9B
	LOW_FLOAT					= 0x8DF0
	MEDIUM_FLOAT					= 0x8DF1
	HIGH_FLOAT					= 0x8DF2
	LOW_INT						= 0x8DF3
	MEDIUM_INT					= 0x8DF4
	HIGH_INT					= 0x8DF5
	SHADER_COMPILER					= 0x8DFA
	NUM_SHADER_BINARY_FORMATS			= 0x8DF9
	MAX_VERTEX_UNIFORM_VECTORS			= 0x8DFB
	MAX_VARYING_VECTORS				= 0x8DFC
	MAX_FRAGMENT_UNIFORM_VECTORS			= 0x8DFD
	RGB565						= 0x8D62

###############################################################################

# ARB Extension #96
ARB_get_program_binary enum:
	PROGRAM_BINARY_RETRIEVABLE_HINT			= 0x8257
	PROGRAM_BINARY_LENGTH				= 0x8741
	NUM_PROGRAM_BINARY_FORMATS			= 0x87FE
	PROGRAM_BINARY_FORMATS				= 0x87FF

###############################################################################

# ARB Extension #97
ARB_separate_shader_objects enum:
	VERTEX_SHADER_BIT				= 0x00000001
	FRAGMENT_SHADER_BIT				= 0x00000002
	GEOMETRY_SHADER_BIT				= 0x00000004
	TESS_CONTROL_SHADER_BIT				= 0x00000008
	TESS_EVALUATION_SHADER_BIT			= 0x00000010
	ALL_SHADER_BITS					= 0xFFFFFFFF
	PROGRAM_SEPARABLE				= 0x8258
	ACTIVE_PROGRAM					= 0x8259
	PROGRAM_PIPELINE_BINDING			= 0x825A

###############################################################################

# No new tokens
# ARB Extension #98
ARB_shader_precision enum:

###############################################################################

# ARB Extension #99
ARB_vertex_attrib_64bit enum:
	use VERSION_3_0			    RGB32I
	use ARB_gpu_shader_fp64		    DOUBLE_VEC2
	use ARB_gpu_shader_fp64		    DOUBLE_VEC3
	use ARB_gpu_shader_fp64		    DOUBLE_VEC4
	use ARB_gpu_shader_fp64		    DOUBLE_MAT2
	use ARB_gpu_shader_fp64		    DOUBLE_MAT3
	use ARB_gpu_shader_fp64		    DOUBLE_MAT4
	use ARB_gpu_shader_fp64		    DOUBLE_MAT2x3
	use ARB_gpu_shader_fp64		    DOUBLE_MAT2x4
	use ARB_gpu_shader_fp64		    DOUBLE_MAT3x2
	use ARB_gpu_shader_fp64		    DOUBLE_MAT3x4
	use ARB_gpu_shader_fp64		    DOUBLE_MAT4x2
	use ARB_gpu_shader_fp64		    DOUBLE_MAT4x3

###############################################################################

# ARB Extension #100
ARB_viewport_array enum:
	use VERSION_1_1			    SCISSOR_BOX
	use VERSION_1_1			    VIEWPORT
	use VERSION_1_1			    DEPTH_RANGE
	use VERSION_1_1			    SCISSOR_TEST
	MAX_VIEWPORTS					= 0x825B
	VIEWPORT_SUBPIXEL_BITS				= 0x825C
	VIEWPORT_BOUNDS_RANGE				= 0x825D
	LAYER_PROVOKING_VERTEX				= 0x825E
	VIEWPORT_INDEX_PROVOKING_VERTEX			= 0x825F
	UNDEFINED_VERTEX				= 0x8260
	use ARB_provoking_vertex	    FIRST_VERTEX_CONVENTION
	use ARB_provoking_vertex	    LAST_VERTEX_CONVENTION
	use ARB_provoking_vertex	    PROVOKING_VERTEX

###############################################################################

# No new tokens
# ARB Extension #101 - GLX_ARB_create_context_robustness
# ARB Extension #102 - WGL_ARB_create_context_robustness

###############################################################################

# ARB Extension #103
ARB_cl_event enum:
	SYNC_CL_EVENT_ARB				= 0x8240
	SYNC_CL_EVENT_COMPLETE_ARB			= 0x8241

###############################################################################

# ARB Extension #104
ARB_debug_output enum:
	DEBUG_OUTPUT_SYNCHRONOUS_ARB			= 0x8242
	DEBUG_NEXT_LOGGED_MESSAGE_LENGTH_ARB		= 0x8243
	DEBUG_CALLBACK_FUNCTION_ARB			= 0x8244
	DEBUG_CALLBACK_USER_PARAM_ARB			= 0x8245
	DEBUG_SOURCE_API_ARB				= 0x8246
	DEBUG_SOURCE_WINDOW_SYSTEM_ARB			= 0x8247
	DEBUG_SOURCE_SHADER_COMPILER_ARB		= 0x8248
	DEBUG_SOURCE_THIRD_PARTY_ARB			= 0x8249
	DEBUG_SOURCE_APPLICATION_ARB			= 0x824A
	DEBUG_SOURCE_OTHER_ARB				= 0x824B
	DEBUG_TYPE_ERROR_ARB				= 0x824C
	DEBUG_TYPE_DEPRECATED_BEHAVIOR_ARB		= 0x824D
	DEBUG_TYPE_UNDEFINED_BEHAVIOR_ARB		= 0x824E
	DEBUG_TYPE_PORTABILITY_ARB			= 0x824F
	DEBUG_TYPE_PERFORMANCE_ARB			= 0x8250
	DEBUG_TYPE_OTHER_ARB				= 0x8251
	MAX_DEBUG_MESSAGE_LENGTH_ARB			= 0x9143
	MAX_DEBUG_LOGGED_MESSAGES_ARB			= 0x9144
	DEBUG_LOGGED_MESSAGES_ARB			= 0x9145
	DEBUG_SEVERITY_HIGH_ARB				= 0x9146
	DEBUG_SEVERITY_MEDIUM_ARB			= 0x9147
	DEBUG_SEVERITY_LOW_ARB				= 0x9148

###############################################################################

# ARB Extension #105
ARB_robustness enum:
	use VERSION_1_1			    NO_ERROR
	CONTEXT_FLAG_ROBUST_ACCESS_BIT_ARB		= 0x00000004
	LOSE_CONTEXT_ON_RESET_ARB			= 0x8252
	GUILTY_CONTEXT_RESET_ARB			= 0x8253
	INNOCENT_CONTEXT_RESET_ARB			= 0x8254
	UNKNOWN_CONTEXT_RESET_ARB			= 0x8255
	RESET_NOTIFICATION_STRATEGY_ARB			= 0x8256
	NO_RESET_NOTIFICATION_ARB			= 0x8261

###############################################################################

# No new tokens
# ARB Extension #106
ARB_shader_stencil_export enum:

###############################################################################

# No new tokens
# ARB Extension #107
ARB_base_instance enum:

###############################################################################

# No new tokens
# ARB Extension #108
ARB_shading_language_420pack enum:

###############################################################################

# No new tokens
# ARB Extension #109
ARB_transform_feedback_instanced enum:

###############################################################################

# ARB Extension #110
ARB_compressed_texture_pixel_storage enum:
	UNPACK_COMPRESSED_BLOCK_WIDTH			= 0x9127
	UNPACK_COMPRESSED_BLOCK_HEIGHT			= 0x9128
	UNPACK_COMPRESSED_BLOCK_DEPTH			= 0x9129
	UNPACK_COMPRESSED_BLOCK_SIZE			= 0x912A
	PACK_COMPRESSED_BLOCK_WIDTH			= 0x912B
	PACK_COMPRESSED_BLOCK_HEIGHT			= 0x912C
	PACK_COMPRESSED_BLOCK_DEPTH			= 0x912D
	PACK_COMPRESSED_BLOCK_SIZE			= 0x912E

###############################################################################

# No new tokens
# ARB Extension #111
ARB_conservative_depth enum:

###############################################################################

# ARB Extension #112
ARB_internalformat_query enum:
	NUM_SAMPLE_COUNTS				= 0x9380

###############################################################################

# ARB Extension #113
ARB_map_buffer_alignment enum:
	MIN_MAP_BUFFER_ALIGNMENT			= 0x90BC

###############################################################################

# ARB Extension #114
ARB_shader_atomic_counters enum:
	ATOMIC_COUNTER_BUFFER				 = 0x92C0
	ATOMIC_COUNTER_BUFFER_BINDING			 = 0x92C1
	ATOMIC_COUNTER_BUFFER_START			 = 0x92C2
	ATOMIC_COUNTER_BUFFER_SIZE			 = 0x92C3
	ATOMIC_COUNTER_BUFFER_DATA_SIZE			 = 0x92C4
	ATOMIC_COUNTER_BUFFER_ACTIVE_ATOMIC_COUNTERS	 = 0x92C5
	ATOMIC_COUNTER_BUFFER_ACTIVE_ATOMIC_COUNTER_INDICES	   = 0x92C6
	ATOMIC_COUNTER_BUFFER_REFERENCED_BY_VERTEX_SHADER	   = 0x92C7
	ATOMIC_COUNTER_BUFFER_REFERENCED_BY_TESS_CONTROL_SHADER    = 0x92C8
	ATOMIC_COUNTER_BUFFER_REFERENCED_BY_TESS_EVALUATION_SHADER = 0x92C9
	ATOMIC_COUNTER_BUFFER_REFERENCED_BY_GEOMETRY_SHADER	   = 0x92CA
	ATOMIC_COUNTER_BUFFER_REFERENCED_BY_FRAGMENT_SHADER	   = 0x92CB
	MAX_VERTEX_ATOMIC_COUNTER_BUFFERS		 = 0x92CC
	MAX_TESS_CONTROL_ATOMIC_COUNTER_BUFFERS		 = 0x92CD
	MAX_TESS_EVALUATION_ATOMIC_COUNTER_BUFFERS	 = 0x92CE
	MAX_GEOMETRY_ATOMIC_COUNTER_BUFFERS		 = 0x92CF
	MAX_FRAGMENT_ATOMIC_COUNTER_BUFFERS		 = 0x92D0
	MAX_COMBINED_ATOMIC_COUNTER_BUFFERS		 = 0x92D1
	MAX_VERTEX_ATOMIC_COUNTERS			 = 0x92D2
	MAX_TESS_CONTROL_ATOMIC_COUNTERS		 = 0x92D3
	MAX_TESS_EVALUATION_ATOMIC_COUNTERS		 = 0x92D4
	MAX_GEOMETRY_ATOMIC_COUNTERS			 = 0x92D5
	MAX_FRAGMENT_ATOMIC_COUNTERS			 = 0x92D6
	MAX_COMBINED_ATOMIC_COUNTERS			 = 0x92D7
	MAX_ATOMIC_COUNTER_BUFFER_SIZE			 = 0x92D8
	MAX_ATOMIC_COUNTER_BUFFER_BINDINGS		 = 0x92DC
	ACTIVE_ATOMIC_COUNTER_BUFFERS			 = 0x92D9
	UNIFORM_ATOMIC_COUNTER_BUFFER_INDEX		 = 0x92DA
	UNSIGNED_INT_ATOMIC_COUNTER			 = 0x92DB

###############################################################################

# ARB Extension #115
ARB_shader_image_load_store enum:
	VERTEX_ATTRIB_ARRAY_BARRIER_BIT			= 0x00000001
	ELEMENT_ARRAY_BARRIER_BIT			= 0x00000002
	UNIFORM_BARRIER_BIT				= 0x00000004
	TEXTURE_FETCH_BARRIER_BIT			= 0x00000008
	SHADER_IMAGE_ACCESS_BARRIER_BIT			= 0x00000020
	COMMAND_BARRIER_BIT				= 0x00000040
	PIXEL_BUFFER_BARRIER_BIT			= 0x00000080
	TEXTURE_UPDATE_BARRIER_BIT			= 0x00000100
	BUFFER_UPDATE_BARRIER_BIT			= 0x00000200
	FRAMEBUFFER_BARRIER_BIT				= 0x00000400
	TRANSFORM_FEEDBACK_BARRIER_BIT			= 0x00000800
	ATOMIC_COUNTER_BARRIER_BIT			= 0x00001000
	ALL_BARRIER_BITS				= 0xFFFFFFFF
	MAX_IMAGE_UNITS					= 0x8F38
	MAX_COMBINED_IMAGE_UNITS_AND_FRAGMENT_OUTPUTS	= 0x8F39
	IMAGE_BINDING_NAME				= 0x8F3A
	IMAGE_BINDING_LEVEL				= 0x8F3B
	IMAGE_BINDING_LAYERED				= 0x8F3C
	IMAGE_BINDING_LAYER				= 0x8F3D
	IMAGE_BINDING_ACCESS				= 0x8F3E
	IMAGE_1D					= 0x904C
	IMAGE_2D					= 0x904D
	IMAGE_3D					= 0x904E
	IMAGE_2D_RECT					= 0x904F
	IMAGE_CUBE					= 0x9050
	IMAGE_BUFFER					= 0x9051
	IMAGE_1D_ARRAY					= 0x9052
	IMAGE_2D_ARRAY					= 0x9053
	IMAGE_CUBE_MAP_ARRAY				= 0x9054
	IMAGE_2D_MULTISAMPLE				= 0x9055
	IMAGE_2D_MULTISAMPLE_ARRAY			= 0x9056
	INT_IMAGE_1D					= 0x9057
	INT_IMAGE_2D					= 0x9058
	INT_IMAGE_3D					= 0x9059
	INT_IMAGE_2D_RECT				= 0x905A
	INT_IMAGE_CUBE					= 0x905B
	INT_IMAGE_BUFFER				= 0x905C
	INT_IMAGE_1D_ARRAY				= 0x905D
	INT_IMAGE_2D_ARRAY				= 0x905E
	INT_IMAGE_CUBE_MAP_ARRAY			= 0x905F
	INT_IMAGE_2D_MULTISAMPLE			= 0x9060
	INT_IMAGE_2D_MULTISAMPLE_ARRAY			= 0x9061
	UNSIGNED_INT_IMAGE_1D				= 0x9062
	UNSIGNED_INT_IMAGE_2D				= 0x9063
	UNSIGNED_INT_IMAGE_3D				= 0x9064
	UNSIGNED_INT_IMAGE_2D_RECT			= 0x9065
	UNSIGNED_INT_IMAGE_CUBE				= 0x9066
	UNSIGNED_INT_IMAGE_BUFFER			= 0x9067
	UNSIGNED_INT_IMAGE_1D_ARRAY			= 0x9068
	UNSIGNED_INT_IMAGE_2D_ARRAY			= 0x9069
	UNSIGNED_INT_IMAGE_CUBE_MAP_ARRAY		= 0x906A
	UNSIGNED_INT_IMAGE_2D_MULTISAMPLE		= 0x906B
	UNSIGNED_INT_IMAGE_2D_MULTISAMPLE_ARRAY		= 0x906C
	MAX_IMAGE_SAMPLES				= 0x906D
	IMAGE_BINDING_FORMAT				= 0x906E
	IMAGE_FORMAT_COMPATIBILITY_TYPE			= 0x90C7
	IMAGE_FORMAT_COMPATIBILITY_BY_SIZE		= 0x90C8
	IMAGE_FORMAT_COMPATIBILITY_BY_CLASS		= 0x90C9
	MAX_VERTEX_IMAGE_UNIFORMS			= 0x90CA
	MAX_TESS_CONTROL_IMAGE_UNIFORMS			= 0x90CB
	MAX_TESS_EVALUATION_IMAGE_UNIFORMS		= 0x90CC
	MAX_GEOMETRY_IMAGE_UNIFORMS			= 0x90CD
	MAX_FRAGMENT_IMAGE_UNIFORMS			= 0x90CE
	MAX_COMBINED_IMAGE_UNIFORMS			= 0x90CF

###############################################################################

# No new tokens
# ARB Extension #116
ARB_shading_language_packing enum:

###############################################################################

# ARB Extension #117
ARB_texture_storage enum:
	TEXTURE_IMMUTABLE_FORMAT			= 0x912F

###############################################################################

# ARB Extension #118
KHR_texture_compression_astc_ldr enum:
	COMPRESSED_RGBA_ASTC_4x4_KHR			= 0x93B0
	COMPRESSED_RGBA_ASTC_5x4_KHR			= 0x93B1
	COMPRESSED_RGBA_ASTC_5x5_KHR			= 0x93B2
	COMPRESSED_RGBA_ASTC_6x5_KHR			= 0x93B3
	COMPRESSED_RGBA_ASTC_6x6_KHR			= 0x93B4
	COMPRESSED_RGBA_ASTC_8x5_KHR			= 0x93B5
	COMPRESSED_RGBA_ASTC_8x6_KHR			= 0x93B6
	COMPRESSED_RGBA_ASTC_8x8_KHR			= 0x93B7
	COMPRESSED_RGBA_ASTC_10x5_KHR			= 0x93B8
	COMPRESSED_RGBA_ASTC_10x6_KHR			= 0x93B9
	COMPRESSED_RGBA_ASTC_10x8_KHR			= 0x93BA
	COMPRESSED_RGBA_ASTC_10x10_KHR			= 0x93BB
	COMPRESSED_RGBA_ASTC_12x10_KHR			= 0x93BC
	COMPRESSED_RGBA_ASTC_12x12_KHR			= 0x93BD
	COMPRESSED_SRGB8_ALPHA8_ASTC_4x4_KHR		= 0x93D0
	COMPRESSED_SRGB8_ALPHA8_ASTC_5x4_KHR		= 0x93D1
	COMPRESSED_SRGB8_ALPHA8_ASTC_5x5_KHR		= 0x93D2
	COMPRESSED_SRGB8_ALPHA8_ASTC_6x5_KHR		= 0x93D3
	COMPRESSED_SRGB8_ALPHA8_ASTC_6x6_KHR		= 0x93D4
	COMPRESSED_SRGB8_ALPHA8_ASTC_8x5_KHR		= 0x93D5
	COMPRESSED_SRGB8_ALPHA8_ASTC_8x6_KHR		= 0x93D6
	COMPRESSED_SRGB8_ALPHA8_ASTC_8x8_KHR		= 0x93D7
	COMPRESSED_SRGB8_ALPHA8_ASTC_10x5_KHR		= 0x93D8
	COMPRESSED_SRGB8_ALPHA8_ASTC_10x6_KHR		= 0x93D9
	COMPRESSED_SRGB8_ALPHA8_ASTC_10x8_KHR		= 0x93DA
	COMPRESSED_SRGB8_ALPHA8_ASTC_10x10_KHR		= 0x93DB
	COMPRESSED_SRGB8_ALPHA8_ASTC_12x10_KHR		= 0x93DC
	COMPRESSED_SRGB8_ALPHA8_ASTC_12x12_KHR		= 0x93DD

###############################################################################

# ARB Extension #119
KHR_debug enum:
	DEBUG_OUTPUT_SYNCHRONOUS			= 0x8242
	DEBUG_NEXT_LOGGED_MESSAGE_LENGTH		= 0x8243
	DEBUG_CALLBACK_FUNCTION				= 0x8244
	DEBUG_CALLBACK_USER_PARAM			= 0x8245
	DEBUG_SOURCE_API				= 0x8246
	DEBUG_SOURCE_WINDOW_SYSTEM			= 0x8247
	DEBUG_SOURCE_SHADER_COMPILER			= 0x8248
	DEBUG_SOURCE_THIRD_PARTY			= 0x8249
	DEBUG_SOURCE_APPLICATION			= 0x824A
	DEBUG_SOURCE_OTHER				= 0x824B
	DEBUG_TYPE_ERROR				= 0x824C
	DEBUG_TYPE_DEPRECATED_BEHAVIOR			= 0x824D
	DEBUG_TYPE_UNDEFINED_BEHAVIOR			= 0x824E
	DEBUG_TYPE_PORTABILITY				= 0x824F
	DEBUG_TYPE_PERFORMANCE				= 0x8250
	DEBUG_TYPE_OTHER				= 0x8251
	DEBUG_TYPE_MARKER				= 0x8268
	DEBUG_TYPE_PUSH_GROUP				= 0x8269
	DEBUG_TYPE_POP_GROUP				= 0x826A
	DEBUG_SEVERITY_NOTIFICATION			= 0x826B
	MAX_DEBUG_GROUP_STACK_DEPTH			= 0x826C
	DEBUG_GROUP_STACK_DEPTH				= 0x826D
	BUFFER						= 0x82E0
	SHADER						= 0x82E1
	PROGRAM						= 0x82E2
	QUERY						= 0x82E3
	PROGRAM_PIPELINE				= 0x82E4
	SAMPLER						= 0x82E6
	DISPLAY_LIST					= 0x82E7
	MAX_LABEL_LENGTH				= 0x82E8
	MAX_DEBUG_MESSAGE_LENGTH			= 0x9143
	MAX_DEBUG_LOGGED_MESSAGES			= 0x9144
	DEBUG_LOGGED_MESSAGES				= 0x9145
	DEBUG_SEVERITY_HIGH				= 0x9146
	DEBUG_SEVERITY_MEDIUM				= 0x9147
	DEBUG_SEVERITY_LOW				= 0x9148
	DEBUG_OUTPUT					= 0x92E0
	CONTEXT_FLAG_DEBUG_BIT				= 0x00000002
	use ErrorCode STACK_UNDERFLOW
	use ErrorCode STACK_OVERFLOW

###############################################################################

# No new tokens
# ARB Extension #120
ARB_arrays_of_arrays enum:

###############################################################################

# No new tokens
# ARB Extension #121
ARB_clear_buffer_object enum:

###############################################################################

# ARB Extension #122
ARB_compute_shader enum:
	COMPUTE_SHADER					= 0x91B9
	MAX_COMPUTE_UNIFORM_BLOCKS			= 0x91BB
	MAX_COMPUTE_TEXTURE_IMAGE_UNITS			= 0x91BC
	MAX_COMPUTE_IMAGE_UNIFORMS			= 0x91BD
	MAX_COMPUTE_SHARED_MEMORY_SIZE			= 0x8262
	MAX_COMPUTE_UNIFORM_COMPONENTS			= 0x8263
	MAX_COMPUTE_ATOMIC_COUNTER_BUFFERS		= 0x8264
	MAX_COMPUTE_ATOMIC_COUNTERS			= 0x8265
	MAX_COMBINED_COMPUTE_UNIFORM_COMPONENTS		= 0x8266
	MAX_COMPUTE_LOCAL_INVOCATIONS			= 0x90EB
	MAX_COMPUTE_WORK_GROUP_COUNT			= 0x91BE
	MAX_COMPUTE_WORK_GROUP_SIZE			= 0x91BF
	COMPUTE_LOCAL_WORK_SIZE				= 0x8267
	UNIFORM_BLOCK_REFERENCED_BY_COMPUTE_SHADER	= 0x90EC
	ATOMIC_COUNTER_BUFFER_REFERENCED_BY_COMPUTE_SHADER = 0x90ED
	DISPATCH_INDIRECT_BUFFER			= 0x90EE
	DISPATCH_INDIRECT_BUFFER_BINDING		= 0x90EF
	COMPUTE_SHADER_BIT				= 0x00000020	# UseProgramStages <stage> bitfield

###############################################################################

# No new tokens
# ARB Extension #123
ARB_copy_image enum:

###############################################################################

# ARB Extension #124
ARB_debug_group enum:
	use KHR_debug DEBUG_TYPE_MARKER
	use KHR_debug DEBUG_TYPE_PUSH_GROUP
	use KHR_debug DEBUG_TYPE_POP_GROUP
	use KHR_debug DEBUG_SEVERITY_NOTIFICATION
	use KHR_debug MAX_DEBUG_GROUP_STACK_DEPTH
	use KHR_debug DEBUG_GROUP_STACK_DEPTH
	use ErrorCode STACK_UNDERFLOW
	use ErrorCode STACK_OVERFLOW

###############################################################################

# ARB Extension #125
ARB_debug_label enum:
	use KHR_debug BUFFER
	use KHR_debug SHADER
	use KHR_debug PROGRAM
	use KHR_debug QUERY
	use KHR_debug PROGRAM_PIPELINE
# SYNC = 0x82E5 no longer used in extension
	use KHR_debug SAMPLER
passthru: /* DISPLAY_LIST used in compatibility profile only */
	use KHR_debug DISPLAY_LIST
	use KHR_debug MAX_LABEL_LENGTH
	use GetPName VERTEX_ARRAY

###############################################################################

# ARB Extension #126
ARB_debug_output2 enum:
	use KHR_debug CONTEXT_FLAG_DEBUG_BIT
	use KHR_debug DEBUG_OUTPUT

###############################################################################

# ARB Extension #127
ARB_ES3_compatibility enum:
	COMPRESSED_RGB8_ETC2				= 0x9274
	COMPRESSED_SRGB8_ETC2				= 0x9275
	COMPRESSED_RGB8_PUNCHTHROUGH_ALPHA1_ETC2	= 0x9276
	COMPRESSED_SRGB8_PUNCHTHROUGH_ALPHA1_ETC2	= 0x9277
	COMPRESSED_RGBA8_ETC2_EAC			= 0x9278
	COMPRESSED_SRGB8_ALPHA8_ETC2_EAC		= 0x9279
	COMPRESSED_R11_EAC				= 0x9270
	COMPRESSED_SIGNED_R11_EAC			= 0x9271
	COMPRESSED_RG11_EAC				= 0x9272
	COMPRESSED_SIGNED_RG11_EAC			= 0x9273
	PRIMITIVE_RESTART_FIXED_INDEX			= 0x8D69
	ANY_SAMPLES_PASSED_CONSERVATIVE			= 0x8D6A
	MAX_ELEMENT_INDEX				= 0x8D6B

###############################################################################

# ARB Extension #128
ARB_explicit_uniform_location enum:
	MAX_UNIFORM_LOCATIONS				= 0x826E

###############################################################################

# No new tokens
# ARB Extension #129
ARB_fragment_layer_viewport enum:

###############################################################################

# ARB Extension #130
ARB_framebuffer_no_attachments enum:
	FRAMEBUFFER_DEFAULT_WIDTH			= 0x9310
	FRAMEBUFFER_DEFAULT_HEIGHT			= 0x9311
	FRAMEBUFFER_DEFAULT_LAYERS			= 0x9312
	FRAMEBUFFER_DEFAULT_SAMPLES			= 0x9313
	FRAMEBUFFER_DEFAULT_FIXED_SAMPLE_LOCATIONS	= 0x9314
	MAX_FRAMEBUFFER_WIDTH				= 0x9315
	MAX_FRAMEBUFFER_HEIGHT				= 0x9316
	MAX_FRAMEBUFFER_LAYERS				= 0x9317
	MAX_FRAMEBUFFER_SAMPLES				= 0x9318

###############################################################################

# ARB Extension #131
ARB_internalformat_query2 enum:
	use ARB_shader_image_load_store IMAGE_FORMAT_COMPATIBILITY_TYPE
	use ARB_internalformat_query NUM_SAMPLE_COUNTS
	use VERSION_3_0 RENDERBUFFER
	use VERSION_1_3 SAMPLES
	use GetPName TEXTURE_1D
	use VERSION_3_0 TEXTURE_1D_ARRAY
	use GetPName TEXTURE_2D
	use VERSION_3_0 TEXTURE_2D_ARRAY
	use VERSION_1_2 TEXTURE_3D
	use VERSION_1_3 TEXTURE_CUBE_MAP
	use ARB_texture_cube_map TEXTURE_CUBE_MAP_ARRAY
	use VERSION_3_1 TEXTURE_RECTANGLE
	use VERSION_3_1 TEXTURE_BUFFER
	use ARB_texture_multisample TEXTURE_2D_MULTISAMPLE
	use ARB_texture_multisample TEXTURE_2D_MULTISAMPLE_ARRAY
	use VERSION_1_3 TEXTURE_COMPRESSED
	INTERNALFORMAT_SUPPORTED			= 0x826F
	INTERNALFORMAT_PREFERRED			= 0x8270
	INTERNALFORMAT_RED_SIZE				= 0x8271
	INTERNALFORMAT_GREEN_SIZE			= 0x8272
	INTERNALFORMAT_BLUE_SIZE			= 0x8273
	INTERNALFORMAT_ALPHA_SIZE			= 0x8274
	INTERNALFORMAT_DEPTH_SIZE			= 0x8275
	INTERNALFORMAT_STENCIL_SIZE			= 0x8276
	INTERNALFORMAT_SHARED_SIZE			= 0x8277
	INTERNALFORMAT_RED_TYPE				= 0x8278
	INTERNALFORMAT_GREEN_TYPE			= 0x8279
	INTERNALFORMAT_BLUE_TYPE			= 0x827A
	INTERNALFORMAT_ALPHA_TYPE			= 0x827B
	INTERNALFORMAT_DEPTH_TYPE			= 0x827C
	INTERNALFORMAT_STENCIL_TYPE			= 0x827D
	MAX_WIDTH					= 0x827E
	MAX_HEIGHT					= 0x827F
	MAX_DEPTH					= 0x8280
	MAX_LAYERS					= 0x8281
	MAX_COMBINED_DIMENSIONS				= 0x8282
	COLOR_COMPONENTS				= 0x8283
	DEPTH_COMPONENTS				= 0x8284
	STENCIL_COMPONENTS				= 0x8285
	COLOR_RENDERABLE				= 0x8286
	DEPTH_RENDERABLE				= 0x8287
	STENCIL_RENDERABLE				= 0x8288
	FRAMEBUFFER_RENDERABLE				= 0x8289
	FRAMEBUFFER_RENDERABLE_LAYERED			= 0x828A
	FRAMEBUFFER_BLEND				= 0x828B
	READ_PIXELS					= 0x828C
	READ_PIXELS_FORMAT				= 0x828D
	READ_PIXELS_TYPE				= 0x828E
	TEXTURE_IMAGE_FORMAT				= 0x828F
	TEXTURE_IMAGE_TYPE				= 0x8290
	GET_TEXTURE_IMAGE_FORMAT			= 0x8291
	GET_TEXTURE_IMAGE_TYPE				= 0x8292
	MIPMAP						= 0x8293
	MANUAL_GENERATE_MIPMAP				= 0x8294
# Should be deprecated
	AUTO_GENERATE_MIPMAP				= 0x8295
	COLOR_ENCODING					= 0x8296
	SRGB_READ					= 0x8297
	SRGB_WRITE					= 0x8298
	SRGB_DECODE_ARB					= 0x8299
	FILTER						= 0x829A
	VERTEX_TEXTURE					= 0x829B
	TESS_CONTROL_TEXTURE				= 0x829C
	TESS_EVALUATION_TEXTURE				= 0x829D
	GEOMETRY_TEXTURE				= 0x829E
	FRAGMENT_TEXTURE				= 0x829F
	COMPUTE_TEXTURE					= 0x82A0
	TEXTURE_SHADOW					= 0x82A1
	TEXTURE_GATHER					= 0x82A2
	TEXTURE_GATHER_SHADOW				= 0x82A3
	SHADER_IMAGE_LOAD				= 0x82A4
	SHADER_IMAGE_STORE				= 0x82A5
	SHADER_IMAGE_ATOMIC				= 0x82A6
	IMAGE_TEXEL_SIZE				= 0x82A7
	IMAGE_COMPATIBILITY_CLASS			= 0x82A8
	IMAGE_PIXEL_FORMAT				= 0x82A9
	IMAGE_PIXEL_TYPE				= 0x82AA
	SIMULTANEOUS_TEXTURE_AND_DEPTH_TEST		= 0x82AC
	SIMULTANEOUS_TEXTURE_AND_STENCIL_TEST		= 0x82AD
	SIMULTANEOUS_TEXTURE_AND_DEPTH_WRITE		= 0x82AE
	SIMULTANEOUS_TEXTURE_AND_STENCIL_WRITE		= 0x82AF
	TEXTURE_COMPRESSED_BLOCK_WIDTH			= 0x82B1
	TEXTURE_COMPRESSED_BLOCK_HEIGHT			= 0x82B2
	TEXTURE_COMPRESSED_BLOCK_SIZE			= 0x82B3
	CLEAR_BUFFER					= 0x82B4
	TEXTURE_VIEW					= 0x82B5
	VIEW_COMPATIBILITY_CLASS			= 0x82B6
	FULL_SUPPORT					= 0x82B7
	CAVEAT_SUPPORT					= 0x82B8
	IMAGE_CLASS_4_X_32				= 0x82B9
	IMAGE_CLASS_2_X_32				= 0x82BA
	IMAGE_CLASS_1_X_32				= 0x82BB
	IMAGE_CLASS_4_X_16				= 0x82BC
	IMAGE_CLASS_2_X_16				= 0x82BD
	IMAGE_CLASS_1_X_16				= 0x82BE
	IMAGE_CLASS_4_X_8				= 0x82BF
	IMAGE_CLASS_2_X_8				= 0x82C0
	IMAGE_CLASS_1_X_8				= 0x82C1
	IMAGE_CLASS_11_11_10				= 0x82C2
	IMAGE_CLASS_10_10_10_2				= 0x82C3
	VIEW_CLASS_128_BITS				= 0x82C4
	VIEW_CLASS_96_BITS				= 0x82C5
	VIEW_CLASS_64_BITS				= 0x82C6
	VIEW_CLASS_48_BITS				= 0x82C7
	VIEW_CLASS_32_BITS				= 0x82C8
	VIEW_CLASS_24_BITS				= 0x82C9
	VIEW_CLASS_16_BITS				= 0x82CA
	VIEW_CLASS_8_BITS				= 0x82CB
	VIEW_CLASS_S3TC_DXT1_RGB			= 0x82CC
	VIEW_CLASS_S3TC_DXT1_RGBA			= 0x82CD
	VIEW_CLASS_S3TC_DXT3_RGBA			= 0x82CE
	VIEW_CLASS_S3TC_DXT5_RGBA			= 0x82CF
	VIEW_CLASS_RGTC1_RED				= 0x82D0
	VIEW_CLASS_RGTC2_RG				= 0x82D1
	VIEW_CLASS_BPTC_UNORM				= 0x82D2
	VIEW_CLASS_BPTC_FLOAT				= 0x82D3

###############################################################################

# No new tokens
# ARB Extension #132
ARB_invalidate_subdata enum:

###############################################################################

# No new tokens ; might not exist as an ARB extension
# ARB Extension #133
ARB_multi_draw_indirect enum:

###############################################################################

# ARB Extension #134
ARB_program_interface_query enum:
	UNIFORM						= 0x92E1
	UNIFORM_BLOCK					= 0x92E2
	PROGRAM_INPUT					= 0x92E3
	PROGRAM_OUTPUT					= 0x92E4
	BUFFER_VARIABLE					= 0x92E5
	SHADER_STORAGE_BLOCK				= 0x92E6
	use ARB_shader_atomic_counters ATOMIC_COUNTER_BUFFER
	VERTEX_SUBROUTINE				= 0x92E8
	TESS_CONTROL_SUBROUTINE				= 0x92E9
	TESS_EVALUATION_SUBROUTINE			= 0x92EA
	GEOMETRY_SUBROUTINE				= 0x92EB
	FRAGMENT_SUBROUTINE				= 0x92EC
	COMPUTE_SUBROUTINE				= 0x92ED
	VERTEX_SUBROUTINE_UNIFORM			= 0x92EE
	TESS_CONTROL_SUBROUTINE_UNIFORM			= 0x92EF
	TESS_EVALUATION_SUBROUTINE_UNIFORM		= 0x92F0
	GEOMETRY_SUBROUTINE_UNIFORM			= 0x92F1
	FRAGMENT_SUBROUTINE_UNIFORM			= 0x92F2
	COMPUTE_SUBROUTINE_UNIFORM			= 0x92F3
	TRANSFORM_FEEDBACK_VARYING			= 0x92F4
	ACTIVE_RESOURCES				= 0x92F5
	MAX_NAME_LENGTH					= 0x92F6
	MAX_NUM_ACTIVE_VARIABLES			= 0x92F7
	MAX_NUM_COMPATIBLE_SUBROUTINES			= 0x92F8
	NAME_LENGTH					= 0x92F9
	TYPE						= 0x92FA
	ARRAY_SIZE					= 0x92FB
	OFFSET						= 0x92FC
	BLOCK_INDEX					= 0x92FD
	ARRAY_STRIDE					= 0x92FE
	MATRIX_STRIDE					= 0x92FF
	IS_ROW_MAJOR					= 0x9300
	ATOMIC_COUNTER_BUFFER_INDEX			= 0x9301
	BUFFER_BINDING					= 0x9302
	BUFFER_DATA_SIZE				= 0x9303
	NUM_ACTIVE_VARIABLES				= 0x9304
	ACTIVE_VARIABLES				= 0x9305
	REFERENCED_BY_VERTEX_SHADER			= 0x9306
	REFERENCED_BY_TESS_CONTROL_SHADER		= 0x9307
	REFERENCED_BY_TESS_EVALUATION_SHADER		= 0x9308
	REFERENCED_BY_GEOMETRY_SHADER			= 0x9309
	REFERENCED_BY_FRAGMENT_SHADER			= 0x930A
	REFERENCED_BY_COMPUTE_SHADER			= 0x930B
	TOP_LEVEL_ARRAY_SIZE				= 0x930C
	TOP_LEVEL_ARRAY_STRIDE				= 0x930D
	LOCATION					= 0x930E
	LOCATION_INDEX					= 0x930F
	IS_PER_PATCH					= 0x92E7
	use ARB_shader_subroutine NUM_COMPATIBLE_SUBROUTINES
	use ARB_shader_subroutine COMPATIBLE_SUBROUTINES

###############################################################################

# No new tokens
# ARB Extension #135
ARB_robust_buffer_access_behavior enum:

###############################################################################

# No new tokens
# ARB Extension #136
ARB_shader_image_size enum:

###############################################################################

# ARB Extension #137
ARB_shader_storage_buffer_object enum:
	SHADER_STORAGE_BUFFER				= 0x90D2
	SHADER_STORAGE_BUFFER_BINDING			= 0x90D3
	SHADER_STORAGE_BUFFER_START			= 0x90D4
	SHADER_STORAGE_BUFFER_SIZE			= 0x90D5
	MAX_VERTEX_SHADER_STORAGE_BLOCKS		= 0x90D6
	MAX_GEOMETRY_SHADER_STORAGE_BLOCKS		= 0x90D7
	MAX_TESS_CONTROL_SHADER_STORAGE_BLOCKS		= 0x90D8
	MAX_TESS_EVALUATION_SHADER_STORAGE_BLOCKS	= 0x90D9
	MAX_FRAGMENT_SHADER_STORAGE_BLOCKS		= 0x90DA
	MAX_COMPUTE_SHADER_STORAGE_BLOCKS		= 0x90DB
	MAX_COMBINED_SHADER_STORAGE_BLOCKS		= 0x90DC
	MAX_SHADER_STORAGE_BUFFER_BINDINGS		= 0x90DD
	MAX_SHADER_STORAGE_BLOCK_SIZE			= 0x90DE
	SHADER_STORAGE_BUFFER_OFFSET_ALIGNMENT		= 0x90DF
	SHADER_STORAGE_BARRIER_BIT			= 0x2000
	MAX_COMBINED_SHADER_OUTPUT_RESOURCES		= MAX_COMBINED_IMAGE_UNITS_AND_FRAGMENT_OUTPUTS
	use ARB_shader_image_load_store			MAX_COMBINED_IMAGE_UNITS_AND_FRAGMENT_OUTPUTS

###############################################################################

# ARB Extension #138
ARB_stencil_texturing enum:
	DEPTH_STENCIL_TEXTURE_MODE			= 0x90EA

###############################################################################

# ARB Extension #139
ARB_texture_buffer_range enum:
	TEXTURE_BUFFER_OFFSET				= 0x919D
	TEXTURE_BUFFER_SIZE				= 0x919E
	TEXTURE_BUFFER_OFFSET_ALIGNMENT			= 0x919F

###############################################################################

# No new tokens
# ARB Extension #140
ARB_texture_query_levels enum:

###############################################################################

# No new tokens
# ARB Extension #141
ARB_texture_storage_multisample enum:

###############################################################################

# ARB Extension #142
ARB_texture_view enum:
	TEXTURE_VIEW_MIN_LEVEL				= 0x82DB
	TEXTURE_VIEW_NUM_LEVELS				= 0x82DC
	TEXTURE_VIEW_MIN_LAYER				= 0x82DD
	TEXTURE_VIEW_NUM_LAYERS				= 0x82DE
	TEXTURE_IMMUTABLE_LEVELS			= 0x82DF

###############################################################################

# ARB Extension #143
ARB_vertex_attrib_binding enum:
	VERTEX_ATTRIB_BINDING				= 0x82D4
	VERTEX_ATTRIB_RELATIVE_OFFSET			= 0x82D5
	VERTEX_BINDING_DIVISOR				= 0x82D6
	VERTEX_BINDING_OFFSET				= 0x82D7
	VERTEX_BINDING_STRIDE				= 0x82D8
	MAX_VERTEX_ATTRIB_RELATIVE_OFFSET		= 0x82D9
	MAX_VERTEX_ATTRIB_BINDINGS			= 0x82DA

###############################################################################

# No new tokens
# ARB Extension #144
ARB_robustness_isolation enum:

###############################################################################

# Extension #145 - GLX_ARB_robustness_application_isolation
# Extension #146 - WGL_ARB_robustness_application_isolation

###############################################################################


###############################################################################
#
# Non-ARB extensions follow, in registry order
#
###############################################################################

###############################################################################

# Extension #1
EXT_abgr enum:
	ABGR_EXT					= 0x8000

###############################################################################

# Extension #2
EXT_blend_color enum:
	CONSTANT_COLOR_EXT				= 0x8001
	ONE_MINUS_CONSTANT_COLOR_EXT			= 0x8002
	CONSTANT_ALPHA_EXT				= 0x8003
	ONE_MINUS_CONSTANT_ALPHA_EXT			= 0x8004
	BLEND_COLOR_EXT					= 0x8005 # 4 F

###############################################################################

# Extension #3
EXT_polygon_offset enum:
	POLYGON_OFFSET_EXT				= 0x8037
	POLYGON_OFFSET_FACTOR_EXT			= 0x8038
	POLYGON_OFFSET_BIAS_EXT				= 0x8039 # 1 F

###############################################################################

# Extension #4
EXT_texture enum:
	ALPHA4_EXT					= 0x803B
	ALPHA8_EXT					= 0x803C
	ALPHA12_EXT					= 0x803D
	ALPHA16_EXT					= 0x803E
	LUMINANCE4_EXT					= 0x803F
	LUMINANCE8_EXT					= 0x8040
	LUMINANCE12_EXT					= 0x8041
	LUMINANCE16_EXT					= 0x8042
	LUMINANCE4_ALPHA4_EXT				= 0x8043
	LUMINANCE6_ALPHA2_EXT				= 0x8044
	LUMINANCE8_ALPHA8_EXT				= 0x8045
	LUMINANCE12_ALPHA4_EXT				= 0x8046
	LUMINANCE12_ALPHA12_EXT				= 0x8047
	LUMINANCE16_ALPHA16_EXT				= 0x8048
	INTENSITY_EXT					= 0x8049
	INTENSITY4_EXT					= 0x804A
	INTENSITY8_EXT					= 0x804B
	INTENSITY12_EXT					= 0x804C
	INTENSITY16_EXT					= 0x804D
	RGB2_EXT					= 0x804E
	RGB4_EXT					= 0x804F
	RGB5_EXT					= 0x8050
	RGB8_EXT					= 0x8051
	RGB10_EXT					= 0x8052
	RGB12_EXT					= 0x8053
	RGB16_EXT					= 0x8054
	RGBA2_EXT					= 0x8055
	RGBA4_EXT					= 0x8056
	RGB5_A1_EXT					= 0x8057
	RGBA8_EXT					= 0x8058
	RGB10_A2_EXT					= 0x8059
	RGBA12_EXT					= 0x805A
	RGBA16_EXT					= 0x805B
	TEXTURE_RED_SIZE_EXT				= 0x805C
	TEXTURE_GREEN_SIZE_EXT				= 0x805D
	TEXTURE_BLUE_SIZE_EXT				= 0x805E
	TEXTURE_ALPHA_SIZE_EXT				= 0x805F
	TEXTURE_LUMINANCE_SIZE_EXT			= 0x8060
	TEXTURE_INTENSITY_SIZE_EXT			= 0x8061
	REPLACE_EXT					= 0x8062
	PROXY_TEXTURE_1D_EXT				= 0x8063
	PROXY_TEXTURE_2D_EXT				= 0x8064
	TEXTURE_TOO_LARGE_EXT				= 0x8065

###############################################################################

# Extension #5 - skipped

###############################################################################

# Extension #6
EXT_texture3D enum:
	PACK_SKIP_IMAGES_EXT				= 0x806B # 1 I
	PACK_IMAGE_HEIGHT_EXT				= 0x806C # 1 F
	UNPACK_SKIP_IMAGES_EXT				= 0x806D # 1 I
	UNPACK_IMAGE_HEIGHT_EXT				= 0x806E # 1 F
	TEXTURE_3D_EXT					= 0x806F # 1 I
	PROXY_TEXTURE_3D_EXT				= 0x8070
	TEXTURE_DEPTH_EXT				= 0x8071
	TEXTURE_WRAP_R_EXT				= 0x8072
	MAX_3D_TEXTURE_SIZE_EXT				= 0x8073 # 1 I

###############################################################################

# Extension #7
SGIS_texture_filter4 enum:
	FILTER4_SGIS					= 0x8146
	TEXTURE_FILTER4_SIZE_SGIS			= 0x8147

###############################################################################

# Extension #8 - skipped

###############################################################################

# No new tokens
# Extension #9
EXT_subtexture enum:

###############################################################################

# No new tokens
# Extension #10
EXT_copy_texture enum:

###############################################################################

# Extension #11
EXT_histogram enum:
	HISTOGRAM_EXT					= 0x8024 # 1 I
	PROXY_HISTOGRAM_EXT				= 0x8025
	HISTOGRAM_WIDTH_EXT				= 0x8026
	HISTOGRAM_FORMAT_EXT				= 0x8027
	HISTOGRAM_RED_SIZE_EXT				= 0x8028
	HISTOGRAM_GREEN_SIZE_EXT			= 0x8029
	HISTOGRAM_BLUE_SIZE_EXT				= 0x802A
	HISTOGRAM_ALPHA_SIZE_EXT			= 0x802B
	HISTOGRAM_LUMINANCE_SIZE_EXT			= 0x802C
	HISTOGRAM_SINK_EXT				= 0x802D
	MINMAX_EXT					= 0x802E # 1 I
	MINMAX_FORMAT_EXT				= 0x802F
	MINMAX_SINK_EXT					= 0x8030
	TABLE_TOO_LARGE_EXT				= 0x8031

###############################################################################

# Extension #12
EXT_convolution enum:
	CONVOLUTION_1D_EXT				= 0x8010 # 1 I
	CONVOLUTION_2D_EXT				= 0x8011 # 1 I
	SEPARABLE_2D_EXT				= 0x8012 # 1 I
	CONVOLUTION_BORDER_MODE_EXT			= 0x8013
	CONVOLUTION_FILTER_SCALE_EXT			= 0x8014
	CONVOLUTION_FILTER_BIAS_EXT			= 0x8015
	REDUCE_EXT					= 0x8016
	CONVOLUTION_FORMAT_EXT				= 0x8017
	CONVOLUTION_WIDTH_EXT				= 0x8018
	CONVOLUTION_HEIGHT_EXT				= 0x8019
	MAX_CONVOLUTION_WIDTH_EXT			= 0x801A
	MAX_CONVOLUTION_HEIGHT_EXT			= 0x801B
	POST_CONVOLUTION_RED_SCALE_EXT			= 0x801C # 1 F
	POST_CONVOLUTION_GREEN_SCALE_EXT		= 0x801D # 1 F
	POST_CONVOLUTION_BLUE_SCALE_EXT			= 0x801E # 1 F
	POST_CONVOLUTION_ALPHA_SCALE_EXT		= 0x801F # 1 F
	POST_CONVOLUTION_RED_BIAS_EXT			= 0x8020 # 1 F
	POST_CONVOLUTION_GREEN_BIAS_EXT			= 0x8021 # 1 F
	POST_CONVOLUTION_BLUE_BIAS_EXT			= 0x8022 # 1 F
	POST_CONVOLUTION_ALPHA_BIAS_EXT			= 0x8023 # 1 F

###############################################################################

# Extension #13
SGI_color_matrix enum:
	COLOR_MATRIX_SGI				= 0x80B1 # 16 F
	COLOR_MATRIX_STACK_DEPTH_SGI			= 0x80B2 # 1 I
	MAX_COLOR_MATRIX_STACK_DEPTH_SGI		= 0x80B3 # 1 I
	POST_COLOR_MATRIX_RED_SCALE_SGI			= 0x80B4 # 1 F
	POST_COLOR_MATRIX_GREEN_SCALE_SGI		= 0x80B5 # 1 F
	POST_COLOR_MATRIX_BLUE_SCALE_SGI		= 0x80B6 # 1 F
	POST_COLOR_MATRIX_ALPHA_SCALE_SGI		= 0x80B7 # 1 F
	POST_COLOR_MATRIX_RED_BIAS_SGI			= 0x80B8 # 1 F
	POST_COLOR_MATRIX_GREEN_BIAS_SGI		= 0x80B9 # 1 F
	POST_COLOR_MATRIX_BLUE_BIAS_SGI			= 0x80BA # 1 F
	POST_COLOR_MATRIX_ALPHA_BIAS_SGI		= 0x80BB # 1 F

###############################################################################

# Extension #14
SGI_color_table enum:
	COLOR_TABLE_SGI					= 0x80D0 # 1 I
	POST_CONVOLUTION_COLOR_TABLE_SGI		= 0x80D1 # 1 I
	POST_COLOR_MATRIX_COLOR_TABLE_SGI		= 0x80D2 # 1 I
	PROXY_COLOR_TABLE_SGI				= 0x80D3
	PROXY_POST_CONVOLUTION_COLOR_TABLE_SGI		= 0x80D4
	PROXY_POST_COLOR_MATRIX_COLOR_TABLE_SGI		= 0x80D5
	COLOR_TABLE_SCALE_SGI				= 0x80D6
	COLOR_TABLE_BIAS_SGI				= 0x80D7
	COLOR_TABLE_FORMAT_SGI				= 0x80D8
	COLOR_TABLE_WIDTH_SGI				= 0x80D9
	COLOR_TABLE_RED_SIZE_SGI			= 0x80DA
	COLOR_TABLE_GREEN_SIZE_SGI			= 0x80DB
	COLOR_TABLE_BLUE_SIZE_SGI			= 0x80DC
	COLOR_TABLE_ALPHA_SIZE_SGI			= 0x80DD
	COLOR_TABLE_LUMINANCE_SIZE_SGI			= 0x80DE
	COLOR_TABLE_INTENSITY_SIZE_SGI			= 0x80DF

###############################################################################

# Extension #15
SGIS_pixel_texture enum:
	PIXEL_TEXTURE_SGIS				= 0x8353 # 1 I
	PIXEL_FRAGMENT_RGB_SOURCE_SGIS			= 0x8354 # 1 I
	PIXEL_FRAGMENT_ALPHA_SOURCE_SGIS		= 0x8355 # 1 I
	PIXEL_GROUP_COLOR_SGIS				= 0x8356 # 1 I

###############################################################################

# Extension #15a
SGIX_pixel_texture enum:
	PIXEL_TEX_GEN_SGIX				= 0x8139 # 1 I
	PIXEL_TEX_GEN_MODE_SGIX				= 0x832B # 1 I

###############################################################################

# Extension #16
SGIS_texture4D enum:
	PACK_SKIP_VOLUMES_SGIS				= 0x8130 # 1 I
	PACK_IMAGE_DEPTH_SGIS				= 0x8131 # 1 I
	UNPACK_SKIP_VOLUMES_SGIS			= 0x8132 # 1 I
	UNPACK_IMAGE_DEPTH_SGIS				= 0x8133 # 1 I
	TEXTURE_4D_SGIS					= 0x8134 # 1 I
	PROXY_TEXTURE_4D_SGIS				= 0x8135
	TEXTURE_4DSIZE_SGIS				= 0x8136
	TEXTURE_WRAP_Q_SGIS				= 0x8137
	MAX_4D_TEXTURE_SIZE_SGIS			= 0x8138 # 1 I
	TEXTURE_4D_BINDING_SGIS				= 0x814F # 1 I

###############################################################################

# Extension #17
SGI_texture_color_table enum:
	TEXTURE_COLOR_TABLE_SGI				= 0x80BC # 1 I
	PROXY_TEXTURE_COLOR_TABLE_SGI			= 0x80BD

###############################################################################

# Extension #18
EXT_cmyka enum:
	CMYK_EXT					= 0x800C
	CMYKA_EXT					= 0x800D
	PACK_CMYK_HINT_EXT				= 0x800E # 1 I
	UNPACK_CMYK_HINT_EXT				= 0x800F # 1 I

###############################################################################

# Extension #19 - skipped

###############################################################################

# Extension #20
EXT_texture_object enum:
	TEXTURE_PRIORITY_EXT				= 0x8066
	TEXTURE_RESIDENT_EXT				= 0x8067
	TEXTURE_1D_BINDING_EXT				= 0x8068
	TEXTURE_2D_BINDING_EXT				= 0x8069
	TEXTURE_3D_BINDING_EXT				= 0x806A # 1 I

###############################################################################

# Extension #21
SGIS_detail_texture enum:
	DETAIL_TEXTURE_2D_SGIS				= 0x8095
	DETAIL_TEXTURE_2D_BINDING_SGIS			= 0x8096 # 1 I
	LINEAR_DETAIL_SGIS				= 0x8097
	LINEAR_DETAIL_ALPHA_SGIS			= 0x8098
	LINEAR_DETAIL_COLOR_SGIS			= 0x8099
	DETAIL_TEXTURE_LEVEL_SGIS			= 0x809A
	DETAIL_TEXTURE_MODE_SGIS			= 0x809B
	DETAIL_TEXTURE_FUNC_POINTS_SGIS			= 0x809C

###############################################################################

# Extension #22
SGIS_sharpen_texture enum:
	LINEAR_SHARPEN_SGIS				= 0x80AD
	LINEAR_SHARPEN_ALPHA_SGIS			= 0x80AE
	LINEAR_SHARPEN_COLOR_SGIS			= 0x80AF
	SHARPEN_TEXTURE_FUNC_POINTS_SGIS		= 0x80B0

###############################################################################

# Extension #23
EXT_packed_pixels enum:
	UNSIGNED_BYTE_3_3_2_EXT				= 0x8032
	UNSIGNED_SHORT_4_4_4_4_EXT			= 0x8033
	UNSIGNED_SHORT_5_5_5_1_EXT			= 0x8034
	UNSIGNED_INT_8_8_8_8_EXT			= 0x8035
	UNSIGNED_INT_10_10_10_2_EXT			= 0x8036

###############################################################################

# Extension #24
SGIS_texture_lod enum:
	TEXTURE_MIN_LOD_SGIS				= 0x813A
	TEXTURE_MAX_LOD_SGIS				= 0x813B
	TEXTURE_BASE_LEVEL_SGIS				= 0x813C
	TEXTURE_MAX_LEVEL_SGIS				= 0x813D

###############################################################################

# Extension #25
SGIS_multisample enum:
	MULTISAMPLE_SGIS				= 0x809D # 1 I
	SAMPLE_ALPHA_TO_MASK_SGIS			= 0x809E # 1 I
	SAMPLE_ALPHA_TO_ONE_SGIS			= 0x809F # 1 I
	SAMPLE_MASK_SGIS				= 0x80A0 # 1 I
	1PASS_SGIS					= 0x80A1
	2PASS_0_SGIS					= 0x80A2
	2PASS_1_SGIS					= 0x80A3
	4PASS_0_SGIS					= 0x80A4
	4PASS_1_SGIS					= 0x80A5
	4PASS_2_SGIS					= 0x80A6
	4PASS_3_SGIS					= 0x80A7
	SAMPLE_BUFFERS_SGIS				= 0x80A8 # 1 I
	SAMPLES_SGIS					= 0x80A9 # 1 I
	SAMPLE_MASK_VALUE_SGIS				= 0x80AA # 1 F
	SAMPLE_MASK_INVERT_SGIS				= 0x80AB # 1 I
	SAMPLE_PATTERN_SGIS				= 0x80AC # 1 I

###############################################################################

# Extension #26 - no specification?
# SGIS_premultiply_blend enum:

##############################################################################

# Extension #27
# Diamond ships an otherwise identical IBM_rescale_normal extension;
#  Dan Brokenshire says this is deprecated and should not be advertised.
EXT_rescale_normal enum:
	RESCALE_NORMAL_EXT				= 0x803A # 1 I

###############################################################################

# Extension #28 - GLX_EXT_visual_info

###############################################################################

# Extension #29 - skipped

###############################################################################

# Extension #30
EXT_vertex_array enum:
	VERTEX_ARRAY_EXT				= 0x8074
	NORMAL_ARRAY_EXT				= 0x8075
	COLOR_ARRAY_EXT					= 0x8076
	INDEX_ARRAY_EXT					= 0x8077
	TEXTURE_COORD_ARRAY_EXT				= 0x8078
	EDGE_FLAG_ARRAY_EXT				= 0x8079
	VERTEX_ARRAY_SIZE_EXT				= 0x807A
	VERTEX_ARRAY_TYPE_EXT				= 0x807B
	VERTEX_ARRAY_STRIDE_EXT				= 0x807C
	VERTEX_ARRAY_COUNT_EXT				= 0x807D # 1 I
	NORMAL_ARRAY_TYPE_EXT				= 0x807E
	NORMAL_ARRAY_STRIDE_EXT				= 0x807F
	NORMAL_ARRAY_COUNT_EXT				= 0x8080 # 1 I
	COLOR_ARRAY_SIZE_EXT				= 0x8081
	COLOR_ARRAY_TYPE_EXT				= 0x8082
	COLOR_ARRAY_STRIDE_EXT				= 0x8083
	COLOR_ARRAY_COUNT_EXT				= 0x8084 # 1 I
	INDEX_ARRAY_TYPE_EXT				= 0x8085
	INDEX_ARRAY_STRIDE_EXT				= 0x8086
	INDEX_ARRAY_COUNT_EXT				= 0x8087 # 1 I
	TEXTURE_COORD_ARRAY_SIZE_EXT			= 0x8088
	TEXTURE_COORD_ARRAY_TYPE_EXT			= 0x8089
	TEXTURE_COORD_ARRAY_STRIDE_EXT			= 0x808A
	TEXTURE_COORD_ARRAY_COUNT_EXT			= 0x808B # 1 I
	EDGE_FLAG_ARRAY_STRIDE_EXT			= 0x808C
	EDGE_FLAG_ARRAY_COUNT_EXT			= 0x808D # 1 I
	VERTEX_ARRAY_POINTER_EXT			= 0x808E
	NORMAL_ARRAY_POINTER_EXT			= 0x808F
	COLOR_ARRAY_POINTER_EXT				= 0x8090
	INDEX_ARRAY_POINTER_EXT				= 0x8091
	TEXTURE_COORD_ARRAY_POINTER_EXT			= 0x8092
	EDGE_FLAG_ARRAY_POINTER_EXT			= 0x8093

###############################################################################

# Extension #31
EXT_misc_attribute enum:
#	 MISC_BIT					 = 0x????

###############################################################################

# Extension #32
SGIS_generate_mipmap enum:
	GENERATE_MIPMAP_SGIS				= 0x8191
	GENERATE_MIPMAP_HINT_SGIS			= 0x8192 # 1 I

###############################################################################

# Extension #33
SGIX_clipmap enum:
	LINEAR_CLIPMAP_LINEAR_SGIX			= 0x8170
	TEXTURE_CLIPMAP_CENTER_SGIX			= 0x8171
	TEXTURE_CLIPMAP_FRAME_SGIX			= 0x8172
	TEXTURE_CLIPMAP_OFFSET_SGIX			= 0x8173
	TEXTURE_CLIPMAP_VIRTUAL_DEPTH_SGIX		= 0x8174
	TEXTURE_CLIPMAP_LOD_OFFSET_SGIX			= 0x8175
	TEXTURE_CLIPMAP_DEPTH_SGIX			= 0x8176
	MAX_CLIPMAP_DEPTH_SGIX				= 0x8177 # 1 I
	MAX_CLIPMAP_VIRTUAL_DEPTH_SGIX			= 0x8178 # 1 I
	NEAREST_CLIPMAP_NEAREST_SGIX			= 0x844D
	NEAREST_CLIPMAP_LINEAR_SGIX			= 0x844E
	LINEAR_CLIPMAP_NEAREST_SGIX			= 0x844F

###############################################################################

# Extension #34
SGIX_shadow enum:
	TEXTURE_COMPARE_SGIX				= 0x819A
	TEXTURE_COMPARE_OPERATOR_SGIX			= 0x819B
	TEXTURE_LEQUAL_R_SGIX				= 0x819C
	TEXTURE_GEQUAL_R_SGIX				= 0x819D

###############################################################################

# Extension #35
SGIS_texture_edge_clamp enum:
	CLAMP_TO_EDGE_SGIS				= 0x812F

###############################################################################

# Extension #36
# Promoted to ARB_texture_border_clamp
SGIS_texture_border_clamp enum:
	CLAMP_TO_BORDER_SGIS				= 0x812D

###############################################################################

# Extension #37
EXT_blend_minmax enum:
	FUNC_ADD_EXT					= 0x8006
	MIN_EXT						= 0x8007
	MAX_EXT						= 0x8008
	BLEND_EQUATION_EXT				= 0x8009 # 1 I

###############################################################################

# Extension #38
EXT_blend_subtract enum:
	FUNC_SUBTRACT_EXT				= 0x800A
	FUNC_REVERSE_SUBTRACT_EXT			= 0x800B

###############################################################################

# No new tokens
# Extension #39
EXT_blend_logic_op enum:

###############################################################################

# Extension #40 - GLX_SGI_swap_control
# Extension #41 - GLX_SGI_video_sync
# Extension #42 - GLX_SGI_make_current_read
# Extension #43 - GLX_SGIX_video_source
# Extension #44 - GLX_EXT_visual_rating

###############################################################################

# Extension #45
SGIX_interlace enum:
	INTERLACE_SGIX					= 0x8094 # 1 I

###############################################################################

# Extension #46
SGIX_pixel_tiles enum:
	PIXEL_TILE_BEST_ALIGNMENT_SGIX			= 0x813E # 1 I
	PIXEL_TILE_CACHE_INCREMENT_SGIX			= 0x813F # 1 I
	PIXEL_TILE_WIDTH_SGIX				= 0x8140 # 1 I
	PIXEL_TILE_HEIGHT_SGIX				= 0x8141 # 1 I
	PIXEL_TILE_GRID_WIDTH_SGIX			= 0x8142 # 1 I
	PIXEL_TILE_GRID_HEIGHT_SGIX			= 0x8143 # 1 I
	PIXEL_TILE_GRID_DEPTH_SGIX			= 0x8144 # 1 I
	PIXEL_TILE_CACHE_SIZE_SGIX			= 0x8145 # 1 I

###############################################################################

# Extension #47 - GLX_EXT_import_context

###############################################################################

# Extension #48 - skipped

###############################################################################

# Extension #49 - GLX_SGIX_fbconfig
# Extension #50 - GLX_SGIX_pbuffer

###############################################################################

# Extension #51
SGIS_texture_select enum:
	DUAL_ALPHA4_SGIS				= 0x8110
	DUAL_ALPHA8_SGIS				= 0x8111
	DUAL_ALPHA12_SGIS				= 0x8112
	DUAL_ALPHA16_SGIS				= 0x8113
	DUAL_LUMINANCE4_SGIS				= 0x8114
	DUAL_LUMINANCE8_SGIS				= 0x8115
	DUAL_LUMINANCE12_SGIS				= 0x8116
	DUAL_LUMINANCE16_SGIS				= 0x8117
	DUAL_INTENSITY4_SGIS				= 0x8118
	DUAL_INTENSITY8_SGIS				= 0x8119
	DUAL_INTENSITY12_SGIS				= 0x811A
	DUAL_INTENSITY16_SGIS				= 0x811B
	DUAL_LUMINANCE_ALPHA4_SGIS			= 0x811C
	DUAL_LUMINANCE_ALPHA8_SGIS			= 0x811D
	QUAD_ALPHA4_SGIS				= 0x811E
	QUAD_ALPHA8_SGIS				= 0x811F
	QUAD_LUMINANCE4_SGIS				= 0x8120
	QUAD_LUMINANCE8_SGIS				= 0x8121
	QUAD_INTENSITY4_SGIS				= 0x8122
	QUAD_INTENSITY8_SGIS				= 0x8123
	DUAL_TEXTURE_SELECT_SGIS			= 0x8124
	QUAD_TEXTURE_SELECT_SGIS			= 0x8125

###############################################################################

# Extension #52
SGIX_sprite enum:
	SPRITE_SGIX					= 0x8148 # 1 I
	SPRITE_MODE_SGIX				= 0x8149 # 1 I
	SPRITE_AXIS_SGIX				= 0x814A # 3 F
	SPRITE_TRANSLATION_SGIX				= 0x814B # 3 F
	SPRITE_AXIAL_SGIX				= 0x814C
	SPRITE_OBJECT_ALIGNED_SGIX			= 0x814D
	SPRITE_EYE_ALIGNED_SGIX				= 0x814E

###############################################################################

# Extension #53
SGIX_texture_multi_buffer enum:
	TEXTURE_MULTI_BUFFER_HINT_SGIX			= 0x812E

###############################################################################

# Extension #54
# EXT form promoted from SGIS form; both are included
EXT_point_parameters enum:
	POINT_SIZE_MIN_EXT				= 0x8126 # 1 F
	POINT_SIZE_MAX_EXT				= 0x8127 # 1 F
	POINT_FADE_THRESHOLD_SIZE_EXT			= 0x8128 # 1 F
	DISTANCE_ATTENUATION_EXT			= 0x8129 # 3 F

SGIS_point_parameters enum:
	POINT_SIZE_MIN_SGIS				= 0x8126 # 1 F
	POINT_SIZE_MAX_SGIS				= 0x8127 # 1 F
	POINT_FADE_THRESHOLD_SIZE_SGIS			= 0x8128 # 1 F
	DISTANCE_ATTENUATION_SGIS			= 0x8129 # 3 F

###############################################################################

# Extension #55
SGIX_instruments enum:
	INSTRUMENT_BUFFER_POINTER_SGIX			= 0x8180
	INSTRUMENT_MEASUREMENTS_SGIX			= 0x8181 # 1 I

###############################################################################

# Extension #56
SGIX_texture_scale_bias enum:
	POST_TEXTURE_FILTER_BIAS_SGIX			= 0x8179
	POST_TEXTURE_FILTER_SCALE_SGIX			= 0x817A
	POST_TEXTURE_FILTER_BIAS_RANGE_SGIX		= 0x817B # 2 F
	POST_TEXTURE_FILTER_SCALE_RANGE_SGIX		= 0x817C # 2 F

###############################################################################

# Extension #57
SGIX_framezoom enum:
	FRAMEZOOM_SGIX					= 0x818B # 1 I
	FRAMEZOOM_FACTOR_SGIX				= 0x818C # 1 I
	MAX_FRAMEZOOM_FACTOR_SGIX			= 0x818D # 1 I

###############################################################################

# No new tokens
# Extension #58
SGIX_tag_sample_buffer enum:

###############################################################################

# Extension #59
FfdMaskSGIX enum:
	TEXTURE_DEFORMATION_BIT_SGIX			= 0x00000001
	GEOMETRY_DEFORMATION_BIT_SGIX			= 0x00000002
SGIX_polynomial_ffd enum:
	GEOMETRY_DEFORMATION_SGIX			= 0x8194
	TEXTURE_DEFORMATION_SGIX			= 0x8195
	DEFORMATIONS_MASK_SGIX				= 0x8196 # 1 I
	MAX_DEFORMATION_ORDER_SGIX			= 0x8197

###############################################################################

# Extension #60
SGIX_reference_plane enum:
	REFERENCE_PLANE_SGIX				= 0x817D # 1 I
	REFERENCE_PLANE_EQUATION_SGIX			= 0x817E # 4 F

###############################################################################

# No new tokens
# Extension #61
SGIX_flush_raster enum:

###############################################################################

# Extension #62 - GLX_SGIX_cushion

###############################################################################

# Extension #63
SGIX_depth_texture enum:
	DEPTH_COMPONENT16_SGIX				= 0x81A5
	DEPTH_COMPONENT24_SGIX				= 0x81A6
	DEPTH_COMPONENT32_SGIX				= 0x81A7

###############################################################################

# Extension #64
SGIS_fog_function enum:
	FOG_FUNC_SGIS					= 0x812A
	FOG_FUNC_POINTS_SGIS				= 0x812B # 1 I
	MAX_FOG_FUNC_POINTS_SGIS			= 0x812C # 1 I

###############################################################################

# Extension #65
SGIX_fog_offset enum:
	FOG_OFFSET_SGIX					= 0x8198 # 1 I
	FOG_OFFSET_VALUE_SGIX				= 0x8199 # 4 F

###############################################################################

# Extension #66
HP_image_transform enum:
	IMAGE_SCALE_X_HP				= 0x8155
	IMAGE_SCALE_Y_HP				= 0x8156
	IMAGE_TRANSLATE_X_HP				= 0x8157
	IMAGE_TRANSLATE_Y_HP				= 0x8158
	IMAGE_ROTATE_ANGLE_HP				= 0x8159
	IMAGE_ROTATE_ORIGIN_X_HP			= 0x815A
	IMAGE_ROTATE_ORIGIN_Y_HP			= 0x815B
	IMAGE_MAG_FILTER_HP				= 0x815C
	IMAGE_MIN_FILTER_HP				= 0x815D
	IMAGE_CUBIC_WEIGHT_HP				= 0x815E
	CUBIC_HP					= 0x815F
	AVERAGE_HP					= 0x8160
	IMAGE_TRANSFORM_2D_HP				= 0x8161
	POST_IMAGE_TRANSFORM_COLOR_TABLE_HP		= 0x8162
	PROXY_POST_IMAGE_TRANSFORM_COLOR_TABLE_HP	= 0x8163

###############################################################################

# Extension #67
HP_convolution_border_modes enum:
	IGNORE_BORDER_HP				= 0x8150
	CONSTANT_BORDER_HP				= 0x8151
	REPLICATE_BORDER_HP				= 0x8153
	CONVOLUTION_BORDER_COLOR_HP			= 0x8154

###############################################################################

# Extension #68
# (Unknown token values???)
INGR_palette_buffer enum:

###############################################################################

# Extension #69
SGIX_texture_add_env enum:
	TEXTURE_ENV_BIAS_SGIX				= 0x80BE

###############################################################################

# Extension #70 - skipped
# Extension #71 - skipped
# Extension #72 - skipped
# Extension #73 - skipped

###############################################################################

# No new tokens
# Extension #74
EXT_color_subtable enum:

###############################################################################

# Extension #75 - GLU_EXT_object_space_tess

###############################################################################

# Extension #76
PGI_vertex_hints enum:
	VERTEX_DATA_HINT_PGI				= 0x1A22A
	VERTEX_CONSISTENT_HINT_PGI			= 0x1A22B
	MATERIAL_SIDE_HINT_PGI				= 0x1A22C
	MAX_VERTEX_HINT_PGI				= 0x1A22D
	COLOR3_BIT_PGI					= 0x00010000
	COLOR4_BIT_PGI					= 0x00020000
	EDGEFLAG_BIT_PGI				= 0x00040000
	INDEX_BIT_PGI					= 0x00080000
	MAT_AMBIENT_BIT_PGI				= 0x00100000
	MAT_AMBIENT_AND_DIFFUSE_BIT_PGI			= 0x00200000
	MAT_DIFFUSE_BIT_PGI				= 0x00400000
	MAT_EMISSION_BIT_PGI				= 0x00800000
	MAT_COLOR_INDEXES_BIT_PGI			= 0x01000000
	MAT_SHININESS_BIT_PGI				= 0x02000000
	MAT_SPECULAR_BIT_PGI				= 0x04000000
	NORMAL_BIT_PGI					= 0x08000000
	TEXCOORD1_BIT_PGI				= 0x10000000
	TEXCOORD2_BIT_PGI				= 0x20000000
	TEXCOORD3_BIT_PGI				= 0x40000000
	TEXCOORD4_BIT_PGI				= 0x80000000
	VERTEX23_BIT_PGI				= 0x00000004
	VERTEX4_BIT_PGI					= 0x00000008

###############################################################################

# Extension #77
PGI_misc_hints enum:
	PREFER_DOUBLEBUFFER_HINT_PGI			= 0x1A1F8
	CONSERVE_MEMORY_HINT_PGI			= 0x1A1FD
	RECLAIM_MEMORY_HINT_PGI				= 0x1A1FE
	NATIVE_GRAPHICS_HANDLE_PGI			= 0x1A202
	NATIVE_GRAPHICS_BEGIN_HINT_PGI			= 0x1A203
	NATIVE_GRAPHICS_END_HINT_PGI			= 0x1A204
	ALWAYS_FAST_HINT_PGI				= 0x1A20C
	ALWAYS_SOFT_HINT_PGI				= 0x1A20D
	ALLOW_DRAW_OBJ_HINT_PGI				= 0x1A20E
	ALLOW_DRAW_WIN_HINT_PGI				= 0x1A20F
	ALLOW_DRAW_FRG_HINT_PGI				= 0x1A210
	ALLOW_DRAW_MEM_HINT_PGI				= 0x1A211
	STRICT_DEPTHFUNC_HINT_PGI			= 0x1A216
	STRICT_LIGHTING_HINT_PGI			= 0x1A217
	STRICT_SCISSOR_HINT_PGI				= 0x1A218
	FULL_STIPPLE_HINT_PGI				= 0x1A219
	CLIP_NEAR_HINT_PGI				= 0x1A220
	CLIP_FAR_HINT_PGI				= 0x1A221
	WIDE_LINE_HINT_PGI				= 0x1A222
	BACK_NORMALS_HINT_PGI				= 0x1A223

###############################################################################

# Extension #78
EXT_paletted_texture enum:
	COLOR_INDEX1_EXT				= 0x80E2
	COLOR_INDEX2_EXT				= 0x80E3
	COLOR_INDEX4_EXT				= 0x80E4
	COLOR_INDEX8_EXT				= 0x80E5
	COLOR_INDEX12_EXT				= 0x80E6
	COLOR_INDEX16_EXT				= 0x80E7
	TEXTURE_INDEX_SIZE_EXT				= 0x80ED

###############################################################################

# Extension #79
EXT_clip_volume_hint enum:
	CLIP_VOLUME_CLIPPING_HINT_EXT			= 0x80F0

###############################################################################

# Extension #80
SGIX_list_priority enum:
	LIST_PRIORITY_SGIX				= 0x8182

###############################################################################

# Extension #81
SGIX_ir_instrument1 enum:
	IR_INSTRUMENT1_SGIX				= 0x817F # 1 I

###############################################################################

# Extension #82
SGIX_calligraphic_fragment enum:
	CALLIGRAPHIC_FRAGMENT_SGIX			= 0x8183 # 1 I

###############################################################################

# Extension #83 - GLX_SGIX_video_resize

###############################################################################

# Extension #84
SGIX_texture_lod_bias enum:
	TEXTURE_LOD_BIAS_S_SGIX				= 0x818E
	TEXTURE_LOD_BIAS_T_SGIX				= 0x818F
	TEXTURE_LOD_BIAS_R_SGIX				= 0x8190

###############################################################################

# Extension #85 - skipped

###############################################################################

# Extension #86 - GLX_SGIX_dmbuffer

###############################################################################

# Extension #87 - skipped
# Extension #88 - skipped
# Extension #89 - skipped

###############################################################################

# Extension #90
SGIX_shadow_ambient enum:
	SHADOW_AMBIENT_SGIX				= 0x80BF

###############################################################################

# Extension #91 - GLX_SGIX_swap_group
# Extension #92 - GLX_SGIX_swap_barrier

###############################################################################

# No new tokens
# Extension #93
EXT_index_texture enum:

###############################################################################

# Extension #94
# Promoted from SGI?
EXT_index_material enum:
	INDEX_MATERIAL_EXT				= 0x81B8
	INDEX_MATERIAL_PARAMETER_EXT			= 0x81B9
	INDEX_MATERIAL_FACE_EXT				= 0x81BA

###############################################################################

# Extension #95
# Promoted from SGI?
EXT_index_func enum:
	INDEX_TEST_EXT					= 0x81B5
	INDEX_TEST_FUNC_EXT				= 0x81B6
	INDEX_TEST_REF_EXT				= 0x81B7

###############################################################################

# Extension #96
# Promoted from SGI?
EXT_index_array_formats enum:
	IUI_V2F_EXT					= 0x81AD
	IUI_V3F_EXT					= 0x81AE
	IUI_N3F_V2F_EXT					= 0x81AF
	IUI_N3F_V3F_EXT					= 0x81B0
	T2F_IUI_V2F_EXT					= 0x81B1
	T2F_IUI_V3F_EXT					= 0x81B2
	T2F_IUI_N3F_V2F_EXT				= 0x81B3
	T2F_IUI_N3F_V3F_EXT				= 0x81B4

###############################################################################

# Extension #97
# Promoted from SGI?
EXT_compiled_vertex_array enum:
	ARRAY_ELEMENT_LOCK_FIRST_EXT			= 0x81A8
	ARRAY_ELEMENT_LOCK_COUNT_EXT			= 0x81A9

###############################################################################

# Extension #98
# Promoted from SGI?
EXT_cull_vertex enum:
	CULL_VERTEX_EXT					= 0x81AA
	CULL_VERTEX_EYE_POSITION_EXT			= 0x81AB
	CULL_VERTEX_OBJECT_POSITION_EXT			= 0x81AC

###############################################################################

# Extension #99 - skipped

###############################################################################

# Extension #100 - GLU_EXT_nurbs_tessellator

###############################################################################

# Extension #101
SGIX_ycrcb enum:
	YCRCB_422_SGIX					= 0x81BB
	YCRCB_444_SGIX					= 0x81BC

###############################################################################

# Extension #102
SGIX_fragment_lighting enum:
	FRAGMENT_LIGHTING_SGIX				= 0x8400 # 1 I
	FRAGMENT_COLOR_MATERIAL_SGIX			= 0x8401 # 1 I
	FRAGMENT_COLOR_MATERIAL_FACE_SGIX		= 0x8402 # 1 I
	FRAGMENT_COLOR_MATERIAL_PARAMETER_SGIX		= 0x8403 # 1 I
	MAX_FRAGMENT_LIGHTS_SGIX			= 0x8404 # 1 I
	MAX_ACTIVE_LIGHTS_SGIX				= 0x8405 # 1 I
	CURRENT_RASTER_NORMAL_SGIX			= 0x8406 # 1 I
	LIGHT_ENV_MODE_SGIX				= 0x8407 # 1 I
	FRAGMENT_LIGHT_MODEL_LOCAL_VIEWER_SGIX		= 0x8408 # 1 I
	FRAGMENT_LIGHT_MODEL_TWO_SIDE_SGIX		= 0x8409 # 1 I
	FRAGMENT_LIGHT_MODEL_AMBIENT_SGIX		= 0x840A # 4 F
	FRAGMENT_LIGHT_MODEL_NORMAL_INTERPOLATION_SGIX	= 0x840B # 1 I
	FRAGMENT_LIGHT0_SGIX				= 0x840C # 1 I
	FRAGMENT_LIGHT1_SGIX				= 0x840D
	FRAGMENT_LIGHT2_SGIX				= 0x840E
	FRAGMENT_LIGHT3_SGIX				= 0x840F
	FRAGMENT_LIGHT4_SGIX				= 0x8410
	FRAGMENT_LIGHT5_SGIX				= 0x8411
	FRAGMENT_LIGHT6_SGIX				= 0x8412
	FRAGMENT_LIGHT7_SGIX				= 0x8413

###############################################################################

# Extension #103 - skipped
# Extension #104 - skipped
# Extension #105 - skipped
# Extension #106 - skipped
# Extension #107 - skipped
# Extension #108 - skipped
# Extension #109 - skipped

###############################################################################

# Extension #110
IBM_rasterpos_clip enum:
	RASTER_POSITION_UNCLIPPED_IBM			= 0x19262

###############################################################################

# Extension #111
HP_texture_lighting enum:
	TEXTURE_LIGHTING_MODE_HP			= 0x8167
	TEXTURE_POST_SPECULAR_HP			= 0x8168
	TEXTURE_PRE_SPECULAR_HP				= 0x8169

###############################################################################

# Extension #112
EXT_draw_range_elements enum:
	MAX_ELEMENTS_VERTICES_EXT			= 0x80E8
	MAX_ELEMENTS_INDICES_EXT			= 0x80E9

###############################################################################

# Extension #113
WIN_phong_shading enum:
	PHONG_WIN					= 0x80EA
	PHONG_HINT_WIN					= 0x80EB

###############################################################################

# Extension #114
WIN_specular_fog enum:
	FOG_SPECULAR_TEXTURE_WIN			= 0x80EC

###############################################################################

# Extension #115 - skipped
# Extension #116 - skipped

###############################################################################

# Extension #117
EXT_light_texture enum:
	FRAGMENT_MATERIAL_EXT				= 0x8349
	FRAGMENT_NORMAL_EXT				= 0x834A
	FRAGMENT_COLOR_EXT				= 0x834C
	ATTENUATION_EXT					= 0x834D
	SHADOW_ATTENUATION_EXT				= 0x834E
	TEXTURE_APPLICATION_MODE_EXT			= 0x834F # 1 I
	TEXTURE_LIGHT_EXT				= 0x8350 # 1 I
	TEXTURE_MATERIAL_FACE_EXT			= 0x8351 # 1 I
	TEXTURE_MATERIAL_PARAMETER_EXT			= 0x8352 # 1 I
	use EXT_fog_coord		    FRAGMENT_DEPTH_EXT

###############################################################################

# Extension #118 - skipped

###############################################################################

# Extension #119
SGIX_blend_alpha_minmax enum:
	ALPHA_MIN_SGIX					= 0x8320
	ALPHA_MAX_SGIX					= 0x8321

###############################################################################

# Extension #120 - skipped
# Extension #121 - skipped
# Extension #122 - skipped
# Extension #123 - skipped
# Extension #124 - skipped
# Extension #125 - skipped

###############################################################################

# Extension #126
SGIX_impact_pixel_texture enum:
	PIXEL_TEX_GEN_Q_CEILING_SGIX			= 0x8184
	PIXEL_TEX_GEN_Q_ROUND_SGIX			= 0x8185
	PIXEL_TEX_GEN_Q_FLOOR_SGIX			= 0x8186
	PIXEL_TEX_GEN_ALPHA_REPLACE_SGIX		= 0x8187
	PIXEL_TEX_GEN_ALPHA_NO_REPLACE_SGIX		= 0x8188
	PIXEL_TEX_GEN_ALPHA_LS_SGIX			= 0x8189
	PIXEL_TEX_GEN_ALPHA_MS_SGIX			= 0x818A

###############################################################################

# Extension #127 - skipped
# Extension #128 - skipped

###############################################################################

# Extension #129
EXT_bgra enum:
	BGR_EXT						= 0x80E0
	BGRA_EXT					= 0x80E1

###############################################################################

# Extension #130 - skipped
# Extension #131 - skipped

###############################################################################

# Extension #132
SGIX_async enum:
	ASYNC_MARKER_SGIX				= 0x8329

###############################################################################

# Extension #133
SGIX_async_pixel enum:
	ASYNC_TEX_IMAGE_SGIX				= 0x835C
	ASYNC_DRAW_PIXELS_SGIX				= 0x835D
	ASYNC_READ_PIXELS_SGIX				= 0x835E
	MAX_ASYNC_TEX_IMAGE_SGIX			= 0x835F
	MAX_ASYNC_DRAW_PIXELS_SGIX			= 0x8360
	MAX_ASYNC_READ_PIXELS_SGIX			= 0x8361

###############################################################################

# Extension #134
SGIX_async_histogram enum:
	ASYNC_HISTOGRAM_SGIX				= 0x832C
	MAX_ASYNC_HISTOGRAM_SGIX			= 0x832D

###############################################################################

# Intel has not implemented this; enums never assigned
# Extension #135
INTEL_texture_scissor enum:
#	 TEXTURE_SCISSOR_INTEL				 = 0x????
#	 TEXTURE_SCISSOR_INTEL				 = 0x????
#	 TEXTURE_SCISSOR_FUNC_INTEL			 = 0x????
#	 TEXTURE_SCISSOR_S_INTEL			 = 0x????
#	 TEXTURE_SCISSOR_T_INTEL			 = 0x????
#	 TEXTURE_SCISSOR_R_INTEL			 = 0x????

###############################################################################

# Extension #136
INTEL_parallel_arrays enum:
	PARALLEL_ARRAYS_INTEL				= 0x83F4
	VERTEX_ARRAY_PARALLEL_POINTERS_INTEL		= 0x83F5
	NORMAL_ARRAY_PARALLEL_POINTERS_INTEL		= 0x83F6
	COLOR_ARRAY_PARALLEL_POINTERS_INTEL		= 0x83F7
	TEXTURE_COORD_ARRAY_PARALLEL_POINTERS_INTEL	= 0x83F8

###############################################################################

# Extension #137
HP_occlusion_test enum:
	OCCLUSION_TEST_HP				= 0x8165
	OCCLUSION_TEST_RESULT_HP			= 0x8166

###############################################################################

# Extension #138
EXT_pixel_transform enum:
	PIXEL_TRANSFORM_2D_EXT				= 0x8330
	PIXEL_MAG_FILTER_EXT				= 0x8331
	PIXEL_MIN_FILTER_EXT				= 0x8332
	PIXEL_CUBIC_WEIGHT_EXT				= 0x8333
	CUBIC_EXT					= 0x8334
	AVERAGE_EXT					= 0x8335
	PIXEL_TRANSFORM_2D_STACK_DEPTH_EXT		= 0x8336
	MAX_PIXEL_TRANSFORM_2D_STACK_DEPTH_EXT		= 0x8337
	PIXEL_TRANSFORM_2D_MATRIX_EXT			= 0x8338

###############################################################################

# Unknown enum values
# Extension #139
EXT_pixel_transform_color_table enum:

#	 PIXEL_TRANSFORM_COLOR_TABLE_EXT
#	 PROXY_PIXEL_TRANSFORM_COLOR_TABLE_EXT

###############################################################################

# Extension #140 - skipped

###############################################################################

# Extension #141
EXT_shared_texture_palette enum:
	SHARED_TEXTURE_PALETTE_EXT			= 0x81FB

###############################################################################

# Extension #142 - GLX_SGIS_blended_overlay

###############################################################################

# Extension #143 - SGIS_shared_multisample
#	MULTISAMPLE_SUB_RECT_POSITION_SGIS		= <TBD>
#	MULTISAMPLE_SUB_RECT_DIMS_SGIS			= <TBD>

###############################################################################

# Extension #144
EXT_separate_specular_color enum:
	LIGHT_MODEL_COLOR_CONTROL_EXT			= 0x81F8
	SINGLE_COLOR_EXT				= 0x81F9
	SEPARATE_SPECULAR_COLOR_EXT			= 0x81FA

###############################################################################

# Extension #145
EXT_secondary_color enum:
	COLOR_SUM_EXT					= 0x8458 # 1 I
	CURRENT_SECONDARY_COLOR_EXT			= 0x8459 # 3 F
	SECONDARY_COLOR_ARRAY_SIZE_EXT			= 0x845A # 1 I
	SECONDARY_COLOR_ARRAY_TYPE_EXT			= 0x845B # 1 I
	SECONDARY_COLOR_ARRAY_STRIDE_EXT		= 0x845C # 1 I
	SECONDARY_COLOR_ARRAY_POINTER_EXT		= 0x845D
	SECONDARY_COLOR_ARRAY_EXT			= 0x845E # 1 I

###############################################################################

# Dead extension - EXT_texture_env_combine was finished instead
# Extension #146
#EXT_texture_env enum:

###############################################################################

# Extension #147
EXT_texture_perturb_normal enum:
	PERTURB_EXT					= 0x85AE
	TEXTURE_NORMAL_EXT				= 0x85AF

###############################################################################

# No new tokens
# Extension #148
# Diamond ships an otherwise identical IBM_multi_draw_arrays extension;
#  Dan Brokenshire says this is deprecated and should not be advertised.
EXT_multi_draw_arrays enum:

###############################################################################

# Extension #149
EXT_fog_coord enum:
	FOG_COORDINATE_SOURCE_EXT			= 0x8450 # 1 I
	FOG_COORDINATE_EXT				= 0x8451
	FRAGMENT_DEPTH_EXT				= 0x8452
	CURRENT_FOG_COORDINATE_EXT			= 0x8453 # 1 F
	FOG_COORDINATE_ARRAY_TYPE_EXT			= 0x8454 # 1 I
	FOG_COORDINATE_ARRAY_STRIDE_EXT			= 0x8455 # 1 I
	FOG_COORDINATE_ARRAY_POINTER_EXT		= 0x8456
	FOG_COORDINATE_ARRAY_EXT			= 0x8457 # 1 I

###############################################################################

# Extension #150 - skipped
# Extension #151 - skipped
# Extension #152 - skipped
# Extension #153 - skipped
# Extension #154 - skipped

###############################################################################

# Extension #155
REND_screen_coordinates enum:
	SCREEN_COORDINATES_REND				= 0x8490
	INVERTED_SCREEN_W_REND				= 0x8491

###############################################################################

# Extension #156
EXT_coordinate_frame enum:
	TANGENT_ARRAY_EXT				= 0x8439
	BINORMAL_ARRAY_EXT				= 0x843A
	CURRENT_TANGENT_EXT				= 0x843B
	CURRENT_BINORMAL_EXT				= 0x843C
	TANGENT_ARRAY_TYPE_EXT				= 0x843E
	TANGENT_ARRAY_STRIDE_EXT			= 0x843F
	BINORMAL_ARRAY_TYPE_EXT				= 0x8440
	BINORMAL_ARRAY_STRIDE_EXT			= 0x8441
	TANGENT_ARRAY_POINTER_EXT			= 0x8442
	BINORMAL_ARRAY_POINTER_EXT			= 0x8443
	MAP1_TANGENT_EXT				= 0x8444
	MAP2_TANGENT_EXT				= 0x8445
	MAP1_BINORMAL_EXT				= 0x8446
	MAP2_BINORMAL_EXT				= 0x8447

###############################################################################

# Extension #157 - skipped

###############################################################################

# Extension #158
EXT_texture_env_combine enum:
	COMBINE_EXT					= 0x8570
	COMBINE_RGB_EXT					= 0x8571
	COMBINE_ALPHA_EXT				= 0x8572
	RGB_SCALE_EXT					= 0x8573
	ADD_SIGNED_EXT					= 0x8574
	INTERPOLATE_EXT					= 0x8575
	CONSTANT_EXT					= 0x8576
	PRIMARY_COLOR_EXT				= 0x8577
	PREVIOUS_EXT					= 0x8578
	SOURCE0_RGB_EXT					= 0x8580
	SOURCE1_RGB_EXT					= 0x8581
	SOURCE2_RGB_EXT					= 0x8582
	SOURCE0_ALPHA_EXT				= 0x8588
	SOURCE1_ALPHA_EXT				= 0x8589
	SOURCE2_ALPHA_EXT				= 0x858A
	OPERAND0_RGB_EXT				= 0x8590
	OPERAND1_RGB_EXT				= 0x8591
	OPERAND2_RGB_EXT				= 0x8592
	OPERAND0_ALPHA_EXT				= 0x8598
	OPERAND1_ALPHA_EXT				= 0x8599
	OPERAND2_ALPHA_EXT				= 0x859A

###############################################################################

# Extension #159
APPLE_specular_vector enum:
	LIGHT_MODEL_SPECULAR_VECTOR_APPLE		= 0x85B0

###############################################################################

# Extension #160
APPLE_transform_hint enum:
	TRANSFORM_HINT_APPLE				= 0x85B1

###############################################################################

# Extension #161
SGIX_fog_scale enum:
	FOG_SCALE_SGIX					= 0x81FC
	FOG_SCALE_VALUE_SGIX				= 0x81FD

###############################################################################

# Extension #162 - skipped

###############################################################################

# Extension #163
SUNX_constant_data enum:
	UNPACK_CONSTANT_DATA_SUNX			= 0x81D5
	TEXTURE_CONSTANT_DATA_SUNX			= 0x81D6

###############################################################################

# Extension #164
SUN_global_alpha enum:
	GLOBAL_ALPHA_SUN				= 0x81D9
	GLOBAL_ALPHA_FACTOR_SUN				= 0x81DA

###############################################################################

# Extension #165
SUN_triangle_list enum:
	RESTART_SUN					= 0x0001
	REPLACE_MIDDLE_SUN				= 0x0002
	REPLACE_OLDEST_SUN				= 0x0003
	TRIANGLE_LIST_SUN				= 0x81D7
	REPLACEMENT_CODE_SUN				= 0x81D8
	REPLACEMENT_CODE_ARRAY_SUN			= 0x85C0
	REPLACEMENT_CODE_ARRAY_TYPE_SUN			= 0x85C1
	REPLACEMENT_CODE_ARRAY_STRIDE_SUN		= 0x85C2
	REPLACEMENT_CODE_ARRAY_POINTER_SUN		= 0x85C3
	R1UI_V3F_SUN					= 0x85C4
	R1UI_C4UB_V3F_SUN				= 0x85C5
	R1UI_C3F_V3F_SUN				= 0x85C6
	R1UI_N3F_V3F_SUN				= 0x85C7
	R1UI_C4F_N3F_V3F_SUN				= 0x85C8
	R1UI_T2F_V3F_SUN				= 0x85C9
	R1UI_T2F_N3F_V3F_SUN				= 0x85CA
	R1UI_T2F_C4F_N3F_V3F_SUN			= 0x85CB

###############################################################################

# No new tokens
# Extension #166
SUN_vertex enum:

###############################################################################

# Extension #167 - WGL_EXT_display_color_table
# Extension #168 - WGL_EXT_extensions_string
# Extension #169 - WGL_EXT_make_current_read
# Extension #170 - WGL_EXT_pixel_format
# Extension #171 - WGL_EXT_pbuffer
# Extension #172 - WGL_EXT_swap_control

###############################################################################

# Extension #173
EXT_blend_func_separate enum:
	BLEND_DST_RGB_EXT				= 0x80C8
	BLEND_SRC_RGB_EXT				= 0x80C9
	BLEND_DST_ALPHA_EXT				= 0x80CA
	BLEND_SRC_ALPHA_EXT				= 0x80CB

###############################################################################

# Extension #174
INGR_color_clamp enum:
	RED_MIN_CLAMP_INGR				= 0x8560
	GREEN_MIN_CLAMP_INGR				= 0x8561
	BLUE_MIN_CLAMP_INGR				= 0x8562
	ALPHA_MIN_CLAMP_INGR				= 0x8563
	RED_MAX_CLAMP_INGR				= 0x8564
	GREEN_MAX_CLAMP_INGR				= 0x8565
	BLUE_MAX_CLAMP_INGR				= 0x8566
	ALPHA_MAX_CLAMP_INGR				= 0x8567

###############################################################################

# Extension #175
INGR_interlace_read enum:
	INTERLACE_READ_INGR				= 0x8568

###############################################################################

# Extension #176
EXT_stencil_wrap enum:
	INCR_WRAP_EXT					= 0x8507
	DECR_WRAP_EXT					= 0x8508

###############################################################################

# Extension #177 - skipped

###############################################################################

# Extension #178
EXT_422_pixels enum:
	422_EXT						= 0x80CC
	422_REV_EXT					= 0x80CD
	422_AVERAGE_EXT					= 0x80CE
	422_REV_AVERAGE_EXT				= 0x80CF

###############################################################################

# Extension #179
NV_texgen_reflection enum:
	NORMAL_MAP_NV					= 0x8511
	REFLECTION_MAP_NV				= 0x8512

###############################################################################

# Extension #180 - skipped
# Extension #181 - skipped

###############################################################################

# Is this shipping? No extension number assigned.
# Extension #?
EXT_texture_cube_map enum:
	NORMAL_MAP_EXT					= 0x8511
	REFLECTION_MAP_EXT				= 0x8512
	TEXTURE_CUBE_MAP_EXT				= 0x8513
	TEXTURE_BINDING_CUBE_MAP_EXT			= 0x8514
	TEXTURE_CUBE_MAP_POSITIVE_X_EXT			= 0x8515
	TEXTURE_CUBE_MAP_NEGATIVE_X_EXT			= 0x8516
	TEXTURE_CUBE_MAP_POSITIVE_Y_EXT			= 0x8517
	TEXTURE_CUBE_MAP_NEGATIVE_Y_EXT			= 0x8518
	TEXTURE_CUBE_MAP_POSITIVE_Z_EXT			= 0x8519
	TEXTURE_CUBE_MAP_NEGATIVE_Z_EXT			= 0x851A
	PROXY_TEXTURE_CUBE_MAP_EXT			= 0x851B
	MAX_CUBE_MAP_TEXTURE_SIZE_EXT			= 0x851C

###############################################################################

# Extension #182
SUN_convolution_border_modes enum:
	WRAP_BORDER_SUN					= 0x81D4

###############################################################################

# Extension #183 - GLX_SUN_transparent_index

###############################################################################

# Extension #184 - skipped

###############################################################################

# No new tokens
# Extension #185
EXT_texture_env_add enum:

###############################################################################

# Extension #186
EXT_texture_lod_bias enum:
	MAX_TEXTURE_LOD_BIAS_EXT			= 0x84FD
	TEXTURE_FILTER_CONTROL_EXT			= 0x8500
	TEXTURE_LOD_BIAS_EXT				= 0x8501

###############################################################################

# Extension #187
EXT_texture_filter_anisotropic enum:
	TEXTURE_MAX_ANISOTROPY_EXT			= 0x84FE
	MAX_TEXTURE_MAX_ANISOTROPY_EXT			= 0x84FF

###############################################################################

# Extension #188
EXT_vertex_weighting enum:
	MODELVIEW0_STACK_DEPTH_EXT			= GL_MODELVIEW_STACK_DEPTH
	MODELVIEW1_STACK_DEPTH_EXT			= 0x8502
	MODELVIEW0_MATRIX_EXT				= GL_MODELVIEW_MATRIX
	MODELVIEW1_MATRIX_EXT				= 0x8506
	VERTEX_WEIGHTING_EXT				= 0x8509
	MODELVIEW0_EXT					= GL_MODELVIEW
	MODELVIEW1_EXT					= 0x850A
	CURRENT_VERTEX_WEIGHT_EXT			= 0x850B
	VERTEX_WEIGHT_ARRAY_EXT				= 0x850C
	VERTEX_WEIGHT_ARRAY_SIZE_EXT			= 0x850D
	VERTEX_WEIGHT_ARRAY_TYPE_EXT			= 0x850E
	VERTEX_WEIGHT_ARRAY_STRIDE_EXT			= 0x850F
	VERTEX_WEIGHT_ARRAY_POINTER_EXT			= 0x8510

###############################################################################

# Extension #189
NV_light_max_exponent enum:
	MAX_SHININESS_NV				= 0x8504
	MAX_SPOT_EXPONENT_NV				= 0x8505

###############################################################################

# Extension #190
NV_vertex_array_range enum:
	VERTEX_ARRAY_RANGE_NV				= 0x851D
	VERTEX_ARRAY_RANGE_LENGTH_NV			= 0x851E
	VERTEX_ARRAY_RANGE_VALID_NV			= 0x851F
	MAX_VERTEX_ARRAY_RANGE_ELEMENT_NV		= 0x8520
	VERTEX_ARRAY_RANGE_POINTER_NV			= 0x8521

###############################################################################

# Extension #191
NV_register_combiners enum:
	REGISTER_COMBINERS_NV				= 0x8522
	VARIABLE_A_NV					= 0x8523
	VARIABLE_B_NV					= 0x8524
	VARIABLE_C_NV					= 0x8525
	VARIABLE_D_NV					= 0x8526
	VARIABLE_E_NV					= 0x8527
	VARIABLE_F_NV					= 0x8528
	VARIABLE_G_NV					= 0x8529
	CONSTANT_COLOR0_NV				= 0x852A
	CONSTANT_COLOR1_NV				= 0x852B
	PRIMARY_COLOR_NV				= 0x852C
	SECONDARY_COLOR_NV				= 0x852D
	SPARE0_NV					= 0x852E
	SPARE1_NV					= 0x852F
	DISCARD_NV					= 0x8530
	E_TIMES_F_NV					= 0x8531
	SPARE0_PLUS_SECONDARY_COLOR_NV			= 0x8532
	UNSIGNED_IDENTITY_NV				= 0x8536
	UNSIGNED_INVERT_NV				= 0x8537
	EXPAND_NORMAL_NV				= 0x8538
	EXPAND_NEGATE_NV				= 0x8539
	HALF_BIAS_NORMAL_NV				= 0x853A
	HALF_BIAS_NEGATE_NV				= 0x853B
	SIGNED_IDENTITY_NV				= 0x853C
	SIGNED_NEGATE_NV				= 0x853D
	SCALE_BY_TWO_NV					= 0x853E
	SCALE_BY_FOUR_NV				= 0x853F
	SCALE_BY_ONE_HALF_NV				= 0x8540
	BIAS_BY_NEGATIVE_ONE_HALF_NV			= 0x8541
	COMBINER_INPUT_NV				= 0x8542
	COMBINER_MAPPING_NV				= 0x8543
	COMBINER_COMPONENT_USAGE_NV			= 0x8544
	COMBINER_AB_DOT_PRODUCT_NV			= 0x8545
	COMBINER_CD_DOT_PRODUCT_NV			= 0x8546
	COMBINER_MUX_SUM_NV				= 0x8547
	COMBINER_SCALE_NV				= 0x8548
	COMBINER_BIAS_NV				= 0x8549
	COMBINER_AB_OUTPUT_NV				= 0x854A
	COMBINER_CD_OUTPUT_NV				= 0x854B
	COMBINER_SUM_OUTPUT_NV				= 0x854C
	MAX_GENERAL_COMBINERS_NV			= 0x854D
	NUM_GENERAL_COMBINERS_NV			= 0x854E
	COLOR_SUM_CLAMP_NV				= 0x854F
	COMBINER0_NV					= 0x8550
	COMBINER1_NV					= 0x8551
	COMBINER2_NV					= 0x8552
	COMBINER3_NV					= 0x8553
	COMBINER4_NV					= 0x8554
	COMBINER5_NV					= 0x8555
	COMBINER6_NV					= 0x8556
	COMBINER7_NV					= 0x8557
	use ARB_multitexture		    TEXTURE0_ARB
	use ARB_multitexture		    TEXTURE1_ARB
	use BlendingFactorDest		    ZERO
	use DrawBufferMode		    NONE
	use GetPName			    FOG

###############################################################################

# Extension #192
NV_fog_distance enum:
	FOG_DISTANCE_MODE_NV				= 0x855A
	EYE_RADIAL_NV					= 0x855B
	EYE_PLANE_ABSOLUTE_NV				= 0x855C
	use TextureGenParameter		    EYE_PLANE

###############################################################################

# Extension #193
NV_texgen_emboss enum:
	EMBOSS_LIGHT_NV					= 0x855D
	EMBOSS_CONSTANT_NV				= 0x855E
	EMBOSS_MAP_NV					= 0x855F

###############################################################################

# No new tokens
# Extension #194
NV_blend_square enum:

###############################################################################

# Extension #195
NV_texture_env_combine4 enum:
	COMBINE4_NV					= 0x8503
	SOURCE3_RGB_NV					= 0x8583
	SOURCE3_ALPHA_NV				= 0x858B
	OPERAND3_RGB_NV					= 0x8593
	OPERAND3_ALPHA_NV				= 0x859B

###############################################################################

# No new tokens
# Extension #196
MESA_resize_buffers enum:

###############################################################################

# No new tokens
# Extension #197
MESA_window_pos enum:

###############################################################################

# Extension #198
EXT_texture_compression_s3tc enum:
	COMPRESSED_RGB_S3TC_DXT1_EXT			= 0x83F0
	COMPRESSED_RGBA_S3TC_DXT1_EXT			= 0x83F1
	COMPRESSED_RGBA_S3TC_DXT3_EXT			= 0x83F2
	COMPRESSED_RGBA_S3TC_DXT5_EXT			= 0x83F3

###############################################################################

# Extension #199
IBM_cull_vertex enum:
	CULL_VERTEX_IBM					= 103050

###############################################################################

# No new tokens
# Extension #200
IBM_multimode_draw_arrays enum:

###############################################################################

# Extension #201
IBM_vertex_array_lists enum:
	VERTEX_ARRAY_LIST_IBM				= 103070
	NORMAL_ARRAY_LIST_IBM				= 103071
	COLOR_ARRAY_LIST_IBM				= 103072
	INDEX_ARRAY_LIST_IBM				= 103073
	TEXTURE_COORD_ARRAY_LIST_IBM			= 103074
	EDGE_FLAG_ARRAY_LIST_IBM			= 103075
	FOG_COORDINATE_ARRAY_LIST_IBM			= 103076
	SECONDARY_COLOR_ARRAY_LIST_IBM			= 103077
	VERTEX_ARRAY_LIST_STRIDE_IBM			= 103080
	NORMAL_ARRAY_LIST_STRIDE_IBM			= 103081
	COLOR_ARRAY_LIST_STRIDE_IBM			= 103082
	INDEX_ARRAY_LIST_STRIDE_IBM			= 103083
	TEXTURE_COORD_ARRAY_LIST_STRIDE_IBM		= 103084
	EDGE_FLAG_ARRAY_LIST_STRIDE_IBM			= 103085
	FOG_COORDINATE_ARRAY_LIST_STRIDE_IBM		= 103086
	SECONDARY_COLOR_ARRAY_LIST_STRIDE_IBM		= 103087

###############################################################################

# Extension #202
SGIX_subsample enum:
	PACK_SUBSAMPLE_RATE_SGIX			= 0x85A0
	UNPACK_SUBSAMPLE_RATE_SGIX			= 0x85A1
	PIXEL_SUBSAMPLE_4444_SGIX			= 0x85A2
	PIXEL_SUBSAMPLE_2424_SGIX			= 0x85A3
	PIXEL_SUBSAMPLE_4242_SGIX			= 0x85A4

###############################################################################

# Extension #203
SGIX_ycrcb_subsample enum:
	PACK_SUBSAMPLE_RATE_SGIX			= 0x85A0
	UNPACK_SUBSAMPLE_RATE_SGIX			= 0x85A1
	PIXEL_SUBSAMPLE_4444_SGIX			= 0x85A2
	PIXEL_SUBSAMPLE_2424_SGIX			= 0x85A3
	PIXEL_SUBSAMPLE_4242_SGIX			= 0x85A4

###############################################################################

# Extension #204
SGIX_ycrcba enum:
	YCRCB_SGIX					= 0x8318
	YCRCBA_SGIX					= 0x8319

###############################################################################

# Extension #205
SGI_depth_pass_instrument enum:
	DEPTH_PASS_INSTRUMENT_SGIX			= 0x8310
	DEPTH_PASS_INSTRUMENT_COUNTERS_SGIX		= 0x8311
	DEPTH_PASS_INSTRUMENT_MAX_SGIX			= 0x8312

###############################################################################

# Extension #206
3DFX_texture_compression_FXT1 enum:
	COMPRESSED_RGB_FXT1_3DFX			= 0x86B0
	COMPRESSED_RGBA_FXT1_3DFX			= 0x86B1

###############################################################################

# Extension #207
3DFX_multisample enum:
	MULTISAMPLE_3DFX				= 0x86B2
	SAMPLE_BUFFERS_3DFX				= 0x86B3
	SAMPLES_3DFX					= 0x86B4
	MULTISAMPLE_BIT_3DFX				= 0x20000000

###############################################################################

# No new tokens
# Extension #208
3DFX_tbuffer enum:

###############################################################################

# Extension #209
EXT_multisample enum:
	MULTISAMPLE_EXT					= 0x809D
	SAMPLE_ALPHA_TO_MASK_EXT			= 0x809E
	SAMPLE_ALPHA_TO_ONE_EXT				= 0x809F
	SAMPLE_MASK_EXT					= 0x80A0
	1PASS_EXT					= 0x80A1
	2PASS_0_EXT					= 0x80A2
	2PASS_1_EXT					= 0x80A3
	4PASS_0_EXT					= 0x80A4
	4PASS_1_EXT					= 0x80A5
	4PASS_2_EXT					= 0x80A6
	4PASS_3_EXT					= 0x80A7
	SAMPLE_BUFFERS_EXT				= 0x80A8 # 1 I
	SAMPLES_EXT					= 0x80A9 # 1 I
	SAMPLE_MASK_VALUE_EXT				= 0x80AA # 1 F
	SAMPLE_MASK_INVERT_EXT				= 0x80AB # 1 I
	SAMPLE_PATTERN_EXT				= 0x80AC # 1 I
	MULTISAMPLE_BIT_EXT				= 0x20000000

###############################################################################

# Extension #210
SGIX_vertex_preclip enum:
	VERTEX_PRECLIP_SGIX				= 0x83EE
	VERTEX_PRECLIP_HINT_SGIX			= 0x83EF

###############################################################################

# Extension #211
SGIX_convolution_accuracy enum:
	CONVOLUTION_HINT_SGIX				= 0x8316 # 1 I

###############################################################################

# Extension #212
SGIX_resample enum:
	PACK_RESAMPLE_SGIX				= 0x842C
	UNPACK_RESAMPLE_SGIX				= 0x842D
	RESAMPLE_REPLICATE_SGIX				= 0x842E
	RESAMPLE_ZERO_FILL_SGIX				= 0x842F
	RESAMPLE_DECIMATE_SGIX				= 0x8430

###############################################################################

# Extension #213
SGIS_point_line_texgen enum:
	EYE_DISTANCE_TO_POINT_SGIS			= 0x81F0
	OBJECT_DISTANCE_TO_POINT_SGIS			= 0x81F1
	EYE_DISTANCE_TO_LINE_SGIS			= 0x81F2
	OBJECT_DISTANCE_TO_LINE_SGIS			= 0x81F3
	EYE_POINT_SGIS					= 0x81F4
	OBJECT_POINT_SGIS				= 0x81F5
	EYE_LINE_SGIS					= 0x81F6
	OBJECT_LINE_SGIS				= 0x81F7

###############################################################################

# Extension #214
SGIS_texture_color_mask enum:
	TEXTURE_COLOR_WRITEMASK_SGIS			= 0x81EF

###############################################################################

# Extension #220
# Promoted to ARB_texture_env_dot3, enum values changed
EXT_texture_env_dot3 enum:
	DOT3_RGB_EXT					= 0x8740
	DOT3_RGBA_EXT					= 0x8741

###############################################################################

# Extension #221
ATI_texture_mirror_once enum:
	MIRROR_CLAMP_ATI				= 0x8742
	MIRROR_CLAMP_TO_EDGE_ATI			= 0x8743

###############################################################################

# Extension #222
NV_fence enum:
	ALL_COMPLETED_NV				= 0x84F2
	FENCE_STATUS_NV					= 0x84F3
	FENCE_CONDITION_NV				= 0x84F4

###############################################################################

# Extension #224
IBM_texture_mirrored_repeat enum:
	MIRRORED_REPEAT_IBM				= 0x8370

###############################################################################

# Extension #225
NV_evaluators enum:
	EVAL_2D_NV					= 0x86C0
	EVAL_TRIANGULAR_2D_NV				= 0x86C1
	MAP_TESSELLATION_NV				= 0x86C2
	MAP_ATTRIB_U_ORDER_NV				= 0x86C3
	MAP_ATTRIB_V_ORDER_NV				= 0x86C4
	EVAL_FRACTIONAL_TESSELLATION_NV			= 0x86C5
	EVAL_VERTEX_ATTRIB0_NV				= 0x86C6
	EVAL_VERTEX_ATTRIB1_NV				= 0x86C7
	EVAL_VERTEX_ATTRIB2_NV				= 0x86C8
	EVAL_VERTEX_ATTRIB3_NV				= 0x86C9
	EVAL_VERTEX_ATTRIB4_NV				= 0x86CA
	EVAL_VERTEX_ATTRIB5_NV				= 0x86CB
	EVAL_VERTEX_ATTRIB6_NV				= 0x86CC
	EVAL_VERTEX_ATTRIB7_NV				= 0x86CD
	EVAL_VERTEX_ATTRIB8_NV				= 0x86CE
	EVAL_VERTEX_ATTRIB9_NV				= 0x86CF
	EVAL_VERTEX_ATTRIB10_NV				= 0x86D0
	EVAL_VERTEX_ATTRIB11_NV				= 0x86D1
	EVAL_VERTEX_ATTRIB12_NV				= 0x86D2
	EVAL_VERTEX_ATTRIB13_NV				= 0x86D3
	EVAL_VERTEX_ATTRIB14_NV				= 0x86D4
	EVAL_VERTEX_ATTRIB15_NV				= 0x86D5
	MAX_MAP_TESSELLATION_NV				= 0x86D6
	MAX_RATIONAL_EVAL_ORDER_NV			= 0x86D7

###############################################################################

# Extension #226
NV_packed_depth_stencil enum:
	DEPTH_STENCIL_NV				= 0x84F9
	UNSIGNED_INT_24_8_NV				= 0x84FA

###############################################################################

# Extension #227
NV_register_combiners2 enum:
	PER_STAGE_CONSTANTS_NV				= 0x8535

###############################################################################

# No new tokens
# Extension #228
NV_texture_compression_vtc enum:

###############################################################################

# Extension #229
NV_texture_rectangle enum:
	TEXTURE_RECTANGLE_NV				= 0x84F5
	TEXTURE_BINDING_RECTANGLE_NV			= 0x84F6
	PROXY_TEXTURE_RECTANGLE_NV			= 0x84F7
	MAX_RECTANGLE_TEXTURE_SIZE_NV			= 0x84F8

###############################################################################

# Extension #230
NV_texture_shader enum:
	OFFSET_TEXTURE_RECTANGLE_NV			= 0x864C
	OFFSET_TEXTURE_RECTANGLE_SCALE_NV		= 0x864D
	DOT_PRODUCT_TEXTURE_RECTANGLE_NV		= 0x864E
	RGBA_UNSIGNED_DOT_PRODUCT_MAPPING_NV		= 0x86D9
	UNSIGNED_INT_S8_S8_8_8_NV			= 0x86DA
	UNSIGNED_INT_8_8_S8_S8_REV_NV			= 0x86DB
	DSDT_MAG_INTENSITY_NV				= 0x86DC
	SHADER_CONSISTENT_NV				= 0x86DD
	TEXTURE_SHADER_NV				= 0x86DE
	SHADER_OPERATION_NV				= 0x86DF
	CULL_MODES_NV					= 0x86E0
	OFFSET_TEXTURE_MATRIX_NV			= 0x86E1
	OFFSET_TEXTURE_SCALE_NV				= 0x86E2
	OFFSET_TEXTURE_BIAS_NV				= 0x86E3
	OFFSET_TEXTURE_2D_MATRIX_NV			= GL_OFFSET_TEXTURE_MATRIX_NV
	OFFSET_TEXTURE_2D_SCALE_NV			= GL_OFFSET_TEXTURE_SCALE_NV
	OFFSET_TEXTURE_2D_BIAS_NV			= GL_OFFSET_TEXTURE_BIAS_NV
	PREVIOUS_TEXTURE_INPUT_NV			= 0x86E4
	CONST_EYE_NV					= 0x86E5
	PASS_THROUGH_NV					= 0x86E6
	CULL_FRAGMENT_NV				= 0x86E7
	OFFSET_TEXTURE_2D_NV				= 0x86E8
	DEPENDENT_AR_TEXTURE_2D_NV			= 0x86E9
	DEPENDENT_GB_TEXTURE_2D_NV			= 0x86EA
	DOT_PRODUCT_NV					= 0x86EC
	DOT_PRODUCT_DEPTH_REPLACE_NV			= 0x86ED
	DOT_PRODUCT_TEXTURE_2D_NV			= 0x86EE
	DOT_PRODUCT_TEXTURE_CUBE_MAP_NV			= 0x86F0
	DOT_PRODUCT_DIFFUSE_CUBE_MAP_NV			= 0x86F1
	DOT_PRODUCT_REFLECT_CUBE_MAP_NV			= 0x86F2
	DOT_PRODUCT_CONST_EYE_REFLECT_CUBE_MAP_NV	= 0x86F3
	HILO_NV						= 0x86F4
	DSDT_NV						= 0x86F5
	DSDT_MAG_NV					= 0x86F6
	DSDT_MAG_VIB_NV					= 0x86F7
	HILO16_NV					= 0x86F8
	SIGNED_HILO_NV					= 0x86F9
	SIGNED_HILO16_NV				= 0x86FA
	SIGNED_RGBA_NV					= 0x86FB
	SIGNED_RGBA8_NV					= 0x86FC
	SIGNED_RGB_NV					= 0x86FE
	SIGNED_RGB8_NV					= 0x86FF
	SIGNED_LUMINANCE_NV				= 0x8701
	SIGNED_LUMINANCE8_NV				= 0x8702
	SIGNED_LUMINANCE_ALPHA_NV			= 0x8703
	SIGNED_LUMINANCE8_ALPHA8_NV			= 0x8704
	SIGNED_ALPHA_NV					= 0x8705
	SIGNED_ALPHA8_NV				= 0x8706
	SIGNED_INTENSITY_NV				= 0x8707
	SIGNED_INTENSITY8_NV				= 0x8708
	DSDT8_NV					= 0x8709
	DSDT8_MAG8_NV					= 0x870A
	DSDT8_MAG8_INTENSITY8_NV			= 0x870B
	SIGNED_RGB_UNSIGNED_ALPHA_NV			= 0x870C
	SIGNED_RGB8_UNSIGNED_ALPHA8_NV			= 0x870D
	HI_SCALE_NV					= 0x870E
	LO_SCALE_NV					= 0x870F
	DS_SCALE_NV					= 0x8710
	DT_SCALE_NV					= 0x8711
	MAGNITUDE_SCALE_NV				= 0x8712
	VIBRANCE_SCALE_NV				= 0x8713
	HI_BIAS_NV					= 0x8714
	LO_BIAS_NV					= 0x8715
	DS_BIAS_NV					= 0x8716
	DT_BIAS_NV					= 0x8717
	MAGNITUDE_BIAS_NV				= 0x8718
	VIBRANCE_BIAS_NV				= 0x8719
	TEXTURE_BORDER_VALUES_NV			= 0x871A
	TEXTURE_HI_SIZE_NV				= 0x871B
	TEXTURE_LO_SIZE_NV				= 0x871C
	TEXTURE_DS_SIZE_NV				= 0x871D
	TEXTURE_DT_SIZE_NV				= 0x871E
	TEXTURE_MAG_SIZE_NV				= 0x871F

###############################################################################

# Extension #231
NV_texture_shader2 enum:
	DOT_PRODUCT_TEXTURE_3D_NV			= 0x86EF

###############################################################################

# Extension #232
NV_vertex_array_range2 enum:
	VERTEX_ARRAY_RANGE_WITHOUT_FLUSH_NV		= 0x8533

###############################################################################

# Extension #233
NV_vertex_program enum:
	VERTEX_PROGRAM_NV				= 0x8620
	VERTEX_STATE_PROGRAM_NV				= 0x8621
	ATTRIB_ARRAY_SIZE_NV				= 0x8623
	ATTRIB_ARRAY_STRIDE_NV				= 0x8624
	ATTRIB_ARRAY_TYPE_NV				= 0x8625
	CURRENT_ATTRIB_NV				= 0x8626
	PROGRAM_LENGTH_NV				= 0x8627
	PROGRAM_STRING_NV				= 0x8628
	MODELVIEW_PROJECTION_NV				= 0x8629
	IDENTITY_NV					= 0x862A
	INVERSE_NV					= 0x862B
	TRANSPOSE_NV					= 0x862C
	INVERSE_TRANSPOSE_NV				= 0x862D
	MAX_TRACK_MATRIX_STACK_DEPTH_NV			= 0x862E
	MAX_TRACK_MATRICES_NV				= 0x862F
	MATRIX0_NV					= 0x8630
	MATRIX1_NV					= 0x8631
	MATRIX2_NV					= 0x8632
	MATRIX3_NV					= 0x8633
	MATRIX4_NV					= 0x8634
	MATRIX5_NV					= 0x8635
	MATRIX6_NV					= 0x8636
	MATRIX7_NV					= 0x8637
##################
#
#	Reserved:
#
#	MATRIX8_NV					= 0x8638
#	MATRIX9_NV					= 0x8639
#	MATRIX10_NV					= 0x863A
#	MATRIX11_NV					= 0x863B
#	MATRIX12_NV					= 0x863C
#	MATRIX13_NV					= 0x863D
#	MATRIX14_NV					= 0x863E
#	MATRIX15_NV					= 0x863F
#
###################
	CURRENT_MATRIX_STACK_DEPTH_NV			= 0x8640
	CURRENT_MATRIX_NV				= 0x8641
	VERTEX_PROGRAM_POINT_SIZE_NV			= 0x8642
	VERTEX_PROGRAM_TWO_SIDE_NV			= 0x8643
	PROGRAM_PARAMETER_NV				= 0x8644
	ATTRIB_ARRAY_POINTER_NV				= 0x8645
	PROGRAM_TARGET_NV				= 0x8646
	PROGRAM_RESIDENT_NV				= 0x8647
	TRACK_MATRIX_NV					= 0x8648
	TRACK_MATRIX_TRANSFORM_NV			= 0x8649
	VERTEX_PROGRAM_BINDING_NV			= 0x864A
	PROGRAM_ERROR_POSITION_NV			= 0x864B
	VERTEX_ATTRIB_ARRAY0_NV				= 0x8650
	VERTEX_ATTRIB_ARRAY1_NV				= 0x8651
	VERTEX_ATTRIB_ARRAY2_NV				= 0x8652
	VERTEX_ATTRIB_ARRAY3_NV				= 0x8653
	VERTEX_ATTRIB_ARRAY4_NV				= 0x8654
	VERTEX_ATTRIB_ARRAY5_NV				= 0x8655
	VERTEX_ATTRIB_ARRAY6_NV				= 0x8656
	VERTEX_ATTRIB_ARRAY7_NV				= 0x8657
	VERTEX_ATTRIB_ARRAY8_NV				= 0x8658
	VERTEX_ATTRIB_ARRAY9_NV				= 0x8659
	VERTEX_ATTRIB_ARRAY10_NV			= 0x865A
	VERTEX_ATTRIB_ARRAY11_NV			= 0x865B
	VERTEX_ATTRIB_ARRAY12_NV			= 0x865C
	VERTEX_ATTRIB_ARRAY13_NV			= 0x865D
	VERTEX_ATTRIB_ARRAY14_NV			= 0x865E
	VERTEX_ATTRIB_ARRAY15_NV			= 0x865F
	MAP1_VERTEX_ATTRIB0_4_NV			= 0x8660
	MAP1_VERTEX_ATTRIB1_4_NV			= 0x8661
	MAP1_VERTEX_ATTRIB2_4_NV			= 0x8662
	MAP1_VERTEX_ATTRIB3_4_NV			= 0x8663
	MAP1_VERTEX_ATTRIB4_4_NV			= 0x8664
	MAP1_VERTEX_ATTRIB5_4_NV			= 0x8665
	MAP1_VERTEX_ATTRIB6_4_NV			= 0x8666
	MAP1_VERTEX_ATTRIB7_4_NV			= 0x8667
	MAP1_VERTEX_ATTRIB8_4_NV			= 0x8668
	MAP1_VERTEX_ATTRIB9_4_NV			= 0x8669
	MAP1_VERTEX_ATTRIB10_4_NV			= 0x866A
	MAP1_VERTEX_ATTRIB11_4_NV			= 0x866B
	MAP1_VERTEX_ATTRIB12_4_NV			= 0x866C
	MAP1_VERTEX_ATTRIB13_4_NV			= 0x866D
	MAP1_VERTEX_ATTRIB14_4_NV			= 0x866E
	MAP1_VERTEX_ATTRIB15_4_NV			= 0x866F
	MAP2_VERTEX_ATTRIB0_4_NV			= 0x8670
	MAP2_VERTEX_ATTRIB1_4_NV			= 0x8671
	MAP2_VERTEX_ATTRIB2_4_NV			= 0x8672
	MAP2_VERTEX_ATTRIB3_4_NV			= 0x8673
	MAP2_VERTEX_ATTRIB4_4_NV			= 0x8674
	MAP2_VERTEX_ATTRIB5_4_NV			= 0x8675
	MAP2_VERTEX_ATTRIB6_4_NV			= 0x8676
	MAP2_VERTEX_ATTRIB7_4_NV			= 0x8677
	MAP2_VERTEX_ATTRIB8_4_NV			= 0x8678
	MAP2_VERTEX_ATTRIB9_4_NV			= 0x8679
	MAP2_VERTEX_ATTRIB10_4_NV			= 0x867A
	MAP2_VERTEX_ATTRIB11_4_NV			= 0x867B
	MAP2_VERTEX_ATTRIB12_4_NV			= 0x867C
	MAP2_VERTEX_ATTRIB13_4_NV			= 0x867D
	MAP2_VERTEX_ATTRIB14_4_NV			= 0x867E
	MAP2_VERTEX_ATTRIB15_4_NV			= 0x867F

###############################################################################

# Extension #235
SGIX_texture_coordinate_clamp enum:
	TEXTURE_MAX_CLAMP_S_SGIX			= 0x8369
	TEXTURE_MAX_CLAMP_T_SGIX			= 0x836A
	TEXTURE_MAX_CLAMP_R_SGIX			= 0x836B

###############################################################################

# Extension #236
SGIX_scalebias_hint enum:
	SCALEBIAS_HINT_SGIX				= 0x8322

###############################################################################

# Extension #237 - GLX_OML_swap_method
# Extension #238 - GLX_OML_sync_control

###############################################################################

# Extension #239
OML_interlace enum:
	INTERLACE_OML					= 0x8980
	INTERLACE_READ_OML				= 0x8981

###############################################################################

# Extension #240
OML_subsample enum:
	FORMAT_SUBSAMPLE_24_24_OML			= 0x8982
	FORMAT_SUBSAMPLE_244_244_OML			= 0x8983

###############################################################################

# Extension #241
OML_resample enum:
	PACK_RESAMPLE_OML				= 0x8984
	UNPACK_RESAMPLE_OML				= 0x8985
	RESAMPLE_REPLICATE_OML				= 0x8986
	RESAMPLE_ZERO_FILL_OML				= 0x8987
	RESAMPLE_AVERAGE_OML				= 0x8988
	RESAMPLE_DECIMATE_OML				= 0x8989

###############################################################################

# Extension #242 - WGL_OML_sync_control

###############################################################################

# Extension #243
NV_copy_depth_to_color enum:
	DEPTH_STENCIL_TO_RGBA_NV			= 0x886E
	DEPTH_STENCIL_TO_BGRA_NV			= 0x886F

###############################################################################

# Extension #244
ATI_envmap_bumpmap enum:
	BUMP_ROT_MATRIX_ATI				= 0x8775
	BUMP_ROT_MATRIX_SIZE_ATI			= 0x8776
	BUMP_NUM_TEX_UNITS_ATI				= 0x8777
	BUMP_TEX_UNITS_ATI				= 0x8778
	DUDV_ATI					= 0x8779
	DU8DV8_ATI					= 0x877A
	BUMP_ENVMAP_ATI					= 0x877B
	BUMP_TARGET_ATI					= 0x877C

###############################################################################

# Extension #245
ATI_fragment_shader enum:
	FRAGMENT_SHADER_ATI				= 0x8920
	REG_0_ATI					= 0x8921
	REG_1_ATI					= 0x8922
	REG_2_ATI					= 0x8923
	REG_3_ATI					= 0x8924
	REG_4_ATI					= 0x8925
	REG_5_ATI					= 0x8926
	REG_6_ATI					= 0x8927
	REG_7_ATI					= 0x8928
	REG_8_ATI					= 0x8929
	REG_9_ATI					= 0x892A
	REG_10_ATI					= 0x892B
	REG_11_ATI					= 0x892C
	REG_12_ATI					= 0x892D
	REG_13_ATI					= 0x892E
	REG_14_ATI					= 0x892F
	REG_15_ATI					= 0x8930
	REG_16_ATI					= 0x8931
	REG_17_ATI					= 0x8932
	REG_18_ATI					= 0x8933
	REG_19_ATI					= 0x8934
	REG_20_ATI					= 0x8935
	REG_21_ATI					= 0x8936
	REG_22_ATI					= 0x8937
	REG_23_ATI					= 0x8938
	REG_24_ATI					= 0x8939
	REG_25_ATI					= 0x893A
	REG_26_ATI					= 0x893B
	REG_27_ATI					= 0x893C
	REG_28_ATI					= 0x893D
	REG_29_ATI					= 0x893E
	REG_30_ATI					= 0x893F
	REG_31_ATI					= 0x8940
	CON_0_ATI					= 0x8941
	CON_1_ATI					= 0x8942
	CON_2_ATI					= 0x8943
	CON_3_ATI					= 0x8944
	CON_4_ATI					= 0x8945
	CON_5_ATI					= 0x8946
	CON_6_ATI					= 0x8947
	CON_7_ATI					= 0x8948
	CON_8_ATI					= 0x8949
	CON_9_ATI					= 0x894A
	CON_10_ATI					= 0x894B
	CON_11_ATI					= 0x894C
	CON_12_ATI					= 0x894D
	CON_13_ATI					= 0x894E
	CON_14_ATI					= 0x894F
	CON_15_ATI					= 0x8950
	CON_16_ATI					= 0x8951
	CON_17_ATI					= 0x8952
	CON_18_ATI					= 0x8953
	CON_19_ATI					= 0x8954
	CON_20_ATI					= 0x8955
	CON_21_ATI					= 0x8956
	CON_22_ATI					= 0x8957
	CON_23_ATI					= 0x8958
	CON_24_ATI					= 0x8959
	CON_25_ATI					= 0x895A
	CON_26_ATI					= 0x895B
	CON_27_ATI					= 0x895C
	CON_28_ATI					= 0x895D
	CON_29_ATI					= 0x895E
	CON_30_ATI					= 0x895F
	CON_31_ATI					= 0x8960
	MOV_ATI						= 0x8961
	ADD_ATI						= 0x8963
	MUL_ATI						= 0x8964
	SUB_ATI						= 0x8965
	DOT3_ATI					= 0x8966
	DOT4_ATI					= 0x8967
	MAD_ATI						= 0x8968
	LERP_ATI					= 0x8969
	CND_ATI						= 0x896A
	CND0_ATI					= 0x896B
	DOT2_ADD_ATI					= 0x896C
	SECONDARY_INTERPOLATOR_ATI			= 0x896D
	NUM_FRAGMENT_REGISTERS_ATI			= 0x896E
	NUM_FRAGMENT_CONSTANTS_ATI			= 0x896F
	NUM_PASSES_ATI					= 0x8970
	NUM_INSTRUCTIONS_PER_PASS_ATI			= 0x8971
	NUM_INSTRUCTIONS_TOTAL_ATI			= 0x8972
	NUM_INPUT_INTERPOLATOR_COMPONENTS_ATI		= 0x8973
	NUM_LOOPBACK_COMPONENTS_ATI			= 0x8974
	COLOR_ALPHA_PAIRING_ATI				= 0x8975
	SWIZZLE_STR_ATI					= 0x8976
	SWIZZLE_STQ_ATI					= 0x8977
	SWIZZLE_STR_DR_ATI				= 0x8978
	SWIZZLE_STQ_DQ_ATI				= 0x8979
	SWIZZLE_STRQ_ATI				= 0x897A
	SWIZZLE_STRQ_DQ_ATI				= 0x897B
	RED_BIT_ATI					= 0x00000001
	GREEN_BIT_ATI					= 0x00000002
	BLUE_BIT_ATI					= 0x00000004
	2X_BIT_ATI					= 0x00000001
	4X_BIT_ATI					= 0x00000002
	8X_BIT_ATI					= 0x00000004
	HALF_BIT_ATI					= 0x00000008
	QUARTER_BIT_ATI					= 0x00000010
	EIGHTH_BIT_ATI					= 0x00000020
	SATURATE_BIT_ATI				= 0x00000040
	2X_BIT_ATI					= 0x00000001
	COMP_BIT_ATI					= 0x00000002
	NEGATE_BIT_ATI					= 0x00000004
	BIAS_BIT_ATI					= 0x00000008

###############################################################################

# Extension #246
ATI_pn_triangles enum:
	PN_TRIANGLES_ATI				= 0x87F0
	MAX_PN_TRIANGLES_TESSELATION_LEVEL_ATI		= 0x87F1
	PN_TRIANGLES_POINT_MODE_ATI			= 0x87F2
	PN_TRIANGLES_NORMAL_MODE_ATI			= 0x87F3
	PN_TRIANGLES_TESSELATION_LEVEL_ATI		= 0x87F4
	PN_TRIANGLES_POINT_MODE_LINEAR_ATI		= 0x87F5
	PN_TRIANGLES_POINT_MODE_CUBIC_ATI		= 0x87F6
	PN_TRIANGLES_NORMAL_MODE_LINEAR_ATI		= 0x87F7
	PN_TRIANGLES_NORMAL_MODE_QUADRATIC_ATI		= 0x87F8

###############################################################################

# Extension #247
ATI_vertex_array_object enum:
	STATIC_ATI					= 0x8760
	DYNAMIC_ATI					= 0x8761
	PRESERVE_ATI					= 0x8762
	DISCARD_ATI					= 0x8763
	OBJECT_BUFFER_SIZE_ATI				= 0x8764
	OBJECT_BUFFER_USAGE_ATI				= 0x8765
	ARRAY_OBJECT_BUFFER_ATI				= 0x8766
	ARRAY_OBJECT_OFFSET_ATI				= 0x8767

###############################################################################

# Extension #248
EXT_vertex_shader enum:
	VERTEX_SHADER_EXT				= 0x8780
	VERTEX_SHADER_BINDING_EXT			= 0x8781
	OP_INDEX_EXT					= 0x8782
	OP_NEGATE_EXT					= 0x8783
	OP_DOT3_EXT					= 0x8784
	OP_DOT4_EXT					= 0x8785
	OP_MUL_EXT					= 0x8786
	OP_ADD_EXT					= 0x8787
	OP_MADD_EXT					= 0x8788
	OP_FRAC_EXT					= 0x8789
	OP_MAX_EXT					= 0x878A
	OP_MIN_EXT					= 0x878B
	OP_SET_GE_EXT					= 0x878C
	OP_SET_LT_EXT					= 0x878D
	OP_CLAMP_EXT					= 0x878E
	OP_FLOOR_EXT					= 0x878F
	OP_ROUND_EXT					= 0x8790
	OP_EXP_BASE_2_EXT				= 0x8791
	OP_LOG_BASE_2_EXT				= 0x8792
	OP_POWER_EXT					= 0x8793
	OP_RECIP_EXT					= 0x8794
	OP_RECIP_SQRT_EXT				= 0x8795
	OP_SUB_EXT					= 0x8796
	OP_CROSS_PRODUCT_EXT				= 0x8797
	OP_MULTIPLY_MATRIX_EXT				= 0x8798
	OP_MOV_EXT					= 0x8799
	OUTPUT_VERTEX_EXT				= 0x879A
	OUTPUT_COLOR0_EXT				= 0x879B
	OUTPUT_COLOR1_EXT				= 0x879C
	OUTPUT_TEXTURE_COORD0_EXT			= 0x879D
	OUTPUT_TEXTURE_COORD1_EXT			= 0x879E
	OUTPUT_TEXTURE_COORD2_EXT			= 0x879F
	OUTPUT_TEXTURE_COORD3_EXT			= 0x87A0
	OUTPUT_TEXTURE_COORD4_EXT			= 0x87A1
	OUTPUT_TEXTURE_COORD5_EXT			= 0x87A2
	OUTPUT_TEXTURE_COORD6_EXT			= 0x87A3
	OUTPUT_TEXTURE_COORD7_EXT			= 0x87A4
	OUTPUT_TEXTURE_COORD8_EXT			= 0x87A5
	OUTPUT_TEXTURE_COORD9_EXT			= 0x87A6
	OUTPUT_TEXTURE_COORD10_EXT			= 0x87A7
	OUTPUT_TEXTURE_COORD11_EXT			= 0x87A8
	OUTPUT_TEXTURE_COORD12_EXT			= 0x87A9
	OUTPUT_TEXTURE_COORD13_EXT			= 0x87AA
	OUTPUT_TEXTURE_COORD14_EXT			= 0x87AB
	OUTPUT_TEXTURE_COORD15_EXT			= 0x87AC
	OUTPUT_TEXTURE_COORD16_EXT			= 0x87AD
	OUTPUT_TEXTURE_COORD17_EXT			= 0x87AE
	OUTPUT_TEXTURE_COORD18_EXT			= 0x87AF
	OUTPUT_TEXTURE_COORD19_EXT			= 0x87B0
	OUTPUT_TEXTURE_COORD20_EXT			= 0x87B1
	OUTPUT_TEXTURE_COORD21_EXT			= 0x87B2
	OUTPUT_TEXTURE_COORD22_EXT			= 0x87B3
	OUTPUT_TEXTURE_COORD23_EXT			= 0x87B4
	OUTPUT_TEXTURE_COORD24_EXT			= 0x87B5
	OUTPUT_TEXTURE_COORD25_EXT			= 0x87B6
	OUTPUT_TEXTURE_COORD26_EXT			= 0x87B7
	OUTPUT_TEXTURE_COORD27_EXT			= 0x87B8
	OUTPUT_TEXTURE_COORD28_EXT			= 0x87B9
	OUTPUT_TEXTURE_COORD29_EXT			= 0x87BA
	OUTPUT_TEXTURE_COORD30_EXT			= 0x87BB
	OUTPUT_TEXTURE_COORD31_EXT			= 0x87BC
	OUTPUT_FOG_EXT					= 0x87BD
	SCALAR_EXT					= 0x87BE
	VECTOR_EXT					= 0x87BF
	MATRIX_EXT					= 0x87C0
	VARIANT_EXT					= 0x87C1
	INVARIANT_EXT					= 0x87C2
	LOCAL_CONSTANT_EXT				= 0x87C3
	LOCAL_EXT					= 0x87C4
	MAX_VERTEX_SHADER_INSTRUCTIONS_EXT		= 0x87C5
	MAX_VERTEX_SHADER_VARIANTS_EXT			= 0x87C6
	MAX_VERTEX_SHADER_INVARIANTS_EXT		= 0x87C7
	MAX_VERTEX_SHADER_LOCAL_CONSTANTS_EXT		= 0x87C8
	MAX_VERTEX_SHADER_LOCALS_EXT			= 0x87C9
	MAX_OPTIMIZED_VERTEX_SHADER_INSTRUCTIONS_EXT	= 0x87CA
	MAX_OPTIMIZED_VERTEX_SHADER_VARIANTS_EXT	= 0x87CB
	MAX_OPTIMIZED_VERTEX_SHADER_LOCAL_CONSTANTS_EXT = 0x87CC
	MAX_OPTIMIZED_VERTEX_SHADER_INVARIANTS_EXT	= 0x87CD
	MAX_OPTIMIZED_VERTEX_SHADER_LOCALS_EXT		= 0x87CE
	VERTEX_SHADER_INSTRUCTIONS_EXT			= 0x87CF
	VERTEX_SHADER_VARIANTS_EXT			= 0x87D0
	VERTEX_SHADER_INVARIANTS_EXT			= 0x87D1
	VERTEX_SHADER_LOCAL_CONSTANTS_EXT		= 0x87D2
	VERTEX_SHADER_LOCALS_EXT			= 0x87D3
	VERTEX_SHADER_OPTIMIZED_EXT			= 0x87D4
	X_EXT						= 0x87D5
	Y_EXT						= 0x87D6
	Z_EXT						= 0x87D7
	W_EXT						= 0x87D8
	NEGATIVE_X_EXT					= 0x87D9
	NEGATIVE_Y_EXT					= 0x87DA
	NEGATIVE_Z_EXT					= 0x87DB
	NEGATIVE_W_EXT					= 0x87DC
	ZERO_EXT					= 0x87DD
	ONE_EXT						= 0x87DE
	NEGATIVE_ONE_EXT				= 0x87DF
	NORMALIZED_RANGE_EXT				= 0x87E0
	FULL_RANGE_EXT					= 0x87E1
	CURRENT_VERTEX_EXT				= 0x87E2
	MVP_MATRIX_EXT					= 0x87E3
	VARIANT_VALUE_EXT				= 0x87E4
	VARIANT_DATATYPE_EXT				= 0x87E5
	VARIANT_ARRAY_STRIDE_EXT			= 0x87E6
	VARIANT_ARRAY_TYPE_EXT				= 0x87E7
	VARIANT_ARRAY_EXT				= 0x87E8
	VARIANT_ARRAY_POINTER_EXT			= 0x87E9
	INVARIANT_VALUE_EXT				= 0x87EA
	INVARIANT_DATATYPE_EXT				= 0x87EB
	LOCAL_CONSTANT_VALUE_EXT			= 0x87EC
	LOCAL_CONSTANT_DATATYPE_EXT			= 0x87ED

###############################################################################

# Extension #249
ATI_vertex_streams enum:
	MAX_VERTEX_STREAMS_ATI				= 0x876B
	VERTEX_STREAM0_ATI				= 0x876C
	VERTEX_STREAM1_ATI				= 0x876D
	VERTEX_STREAM2_ATI				= 0x876E
	VERTEX_STREAM3_ATI				= 0x876F
	VERTEX_STREAM4_ATI				= 0x8770
	VERTEX_STREAM5_ATI				= 0x8771
	VERTEX_STREAM6_ATI				= 0x8772
	VERTEX_STREAM7_ATI				= 0x8773
	VERTEX_SOURCE_ATI				= 0x8774

###############################################################################

# Extension #250 - WGL_I3D_digital_video_control
# Extension #251 - WGL_I3D_gamma
# Extension #252 - WGL_I3D_genlock
# Extension #253 - WGL_I3D_image_buffer
# Extension #254 - WGL_I3D_swap_frame_lock
# Extension #255 - WGL_I3D_swap_frame_usage

###############################################################################

# Extension #256
ATI_element_array enum:
	ELEMENT_ARRAY_ATI				= 0x8768
	ELEMENT_ARRAY_TYPE_ATI				= 0x8769
	ELEMENT_ARRAY_POINTER_ATI			= 0x876A

###############################################################################

# Extension #257
SUN_mesh_array enum:
	QUAD_MESH_SUN					= 0x8614
	TRIANGLE_MESH_SUN				= 0x8615

###############################################################################

# Extension #258
SUN_slice_accum enum:
	SLICE_ACCUM_SUN					= 0x85CC

###############################################################################

# Extension #259
NV_multisample_filter_hint enum:
	MULTISAMPLE_FILTER_HINT_NV			= 0x8534

###############################################################################

# Extension #260
NV_depth_clamp enum:
	DEPTH_CLAMP_NV					= 0x864F

###############################################################################

# Extension #261
NV_occlusion_query enum:
	PIXEL_COUNTER_BITS_NV				= 0x8864
	CURRENT_OCCLUSION_QUERY_ID_NV			= 0x8865
	PIXEL_COUNT_NV					= 0x8866
	PIXEL_COUNT_AVAILABLE_NV			= 0x8867

###############################################################################

# Extension #262
NV_point_sprite enum:
	POINT_SPRITE_NV					= 0x8861
	COORD_REPLACE_NV				= 0x8862
	POINT_SPRITE_R_MODE_NV				= 0x8863

###############################################################################

# Extension #263 - WGL_NV_render_depth_texture
# Extension #264 - WGL_NV_render_texture_rectangle

###############################################################################

# Extension #265
NV_texture_shader3 enum:
	OFFSET_PROJECTIVE_TEXTURE_2D_NV			= 0x8850
	OFFSET_PROJECTIVE_TEXTURE_2D_SCALE_NV		= 0x8851
	OFFSET_PROJECTIVE_TEXTURE_RECTANGLE_NV		= 0x8852
	OFFSET_PROJECTIVE_TEXTURE_RECTANGLE_SCALE_NV	= 0x8853
	OFFSET_HILO_TEXTURE_2D_NV			= 0x8854
	OFFSET_HILO_TEXTURE_RECTANGLE_NV		= 0x8855
	OFFSET_HILO_PROJECTIVE_TEXTURE_2D_NV		= 0x8856
	OFFSET_HILO_PROJECTIVE_TEXTURE_RECTANGLE_NV	= 0x8857
	DEPENDENT_HILO_TEXTURE_2D_NV			= 0x8858
	DEPENDENT_RGB_TEXTURE_3D_NV			= 0x8859
	DEPENDENT_RGB_TEXTURE_CUBE_MAP_NV		= 0x885A
	DOT_PRODUCT_PASS_THROUGH_NV			= 0x885B
	DOT_PRODUCT_TEXTURE_1D_NV			= 0x885C
	DOT_PRODUCT_AFFINE_DEPTH_REPLACE_NV		= 0x885D
	HILO8_NV					= 0x885E
	SIGNED_HILO8_NV					= 0x885F
	FORCE_BLUE_TO_ONE_NV				= 0x8860

###############################################################################

# No new tokens
# Extension #266
NV_vertex_program1_1 enum:

###############################################################################

# No new tokens
# Extension #267
EXT_shadow_funcs enum:

###############################################################################

# Extension #268
EXT_stencil_two_side enum:
	STENCIL_TEST_TWO_SIDE_EXT			= 0x8910
	ACTIVE_STENCIL_FACE_EXT				= 0x8911

###############################################################################

# Extension #269
ATI_text_fragment_shader enum:
	TEXT_FRAGMENT_SHADER_ATI			= 0x8200

###############################################################################

# Extension #270
APPLE_client_storage enum:
	UNPACK_CLIENT_STORAGE_APPLE			= 0x85B2

###############################################################################

# Extension #271
APPLE_element_array enum:
	ELEMENT_ARRAY_APPLE				= 0x8A0C
	ELEMENT_ARRAY_TYPE_APPLE			= 0x8A0D
	ELEMENT_ARRAY_POINTER_APPLE			= 0x8A0E

###############################################################################

# Extension #272
# ??? BUFFER_OBJECT_APPLE appears to be part of the shipping extension,
# but is not in the spec in the registry. Also appears in
# APPLE_object_purgeable below.
APPLE_fence enum:
	DRAW_PIXELS_APPLE				= 0x8A0A
	FENCE_APPLE					= 0x8A0B

###############################################################################

# Extension #273
APPLE_vertex_array_object enum:
	VERTEX_ARRAY_BINDING_APPLE			= 0x85B5

###############################################################################

# Extension #274
APPLE_vertex_array_range enum:
	VERTEX_ARRAY_RANGE_APPLE			= 0x851D
	VERTEX_ARRAY_RANGE_LENGTH_APPLE			= 0x851E
	VERTEX_ARRAY_STORAGE_HINT_APPLE			= 0x851F
	VERTEX_ARRAY_RANGE_POINTER_APPLE		= 0x8521
	STORAGE_CLIENT_APPLE				= 0x85B4
	STORAGE_CACHED_APPLE				= 0x85BE
	STORAGE_SHARED_APPLE				= 0x85BF

###############################################################################

# Extension #275
APPLE_ycbcr_422 enum:
	YCBCR_422_APPLE					= 0x85B9
	UNSIGNED_SHORT_8_8_APPLE			= 0x85BA
	UNSIGNED_SHORT_8_8_REV_APPLE			= 0x85BB

###############################################################################

# Extension #276
S3_s3tc enum:
	RGB_S3TC					= 0x83A0
	RGB4_S3TC					= 0x83A1
	RGBA_S3TC					= 0x83A2
	RGBA4_S3TC					= 0x83A3

###############################################################################

# Extension #277
ATI_draw_buffers enum:
	MAX_DRAW_BUFFERS_ATI				= 0x8824
	DRAW_BUFFER0_ATI				= 0x8825
	DRAW_BUFFER1_ATI				= 0x8826
	DRAW_BUFFER2_ATI				= 0x8827
	DRAW_BUFFER3_ATI				= 0x8828
	DRAW_BUFFER4_ATI				= 0x8829
	DRAW_BUFFER5_ATI				= 0x882A
	DRAW_BUFFER6_ATI				= 0x882B
	DRAW_BUFFER7_ATI				= 0x882C
	DRAW_BUFFER8_ATI				= 0x882D
	DRAW_BUFFER9_ATI				= 0x882E
	DRAW_BUFFER10_ATI				= 0x882F
	DRAW_BUFFER11_ATI				= 0x8830
	DRAW_BUFFER12_ATI				= 0x8831
	DRAW_BUFFER13_ATI				= 0x8832
	DRAW_BUFFER14_ATI				= 0x8833
	DRAW_BUFFER15_ATI				= 0x8834

###############################################################################

# Extension #278
# This is really a WGL extension, but if defined there are
# some associated GL enumerants.
ATI_pixel_format_float enum:
	TYPE_RGBA_FLOAT_ATI				= 0x8820
	COLOR_CLEAR_UNCLAMPED_VALUE_ATI			= 0x8835

###############################################################################

# Extension #279
ATI_texture_env_combine3 enum:
	MODULATE_ADD_ATI				= 0x8744
	MODULATE_SIGNED_ADD_ATI				= 0x8745
	MODULATE_SUBTRACT_ATI				= 0x8746

###############################################################################

# Extension #280
ATI_texture_float enum:
	RGBA_FLOAT32_ATI				= 0x8814
	RGB_FLOAT32_ATI					= 0x8815
	ALPHA_FLOAT32_ATI				= 0x8816
	INTENSITY_FLOAT32_ATI				= 0x8817
	LUMINANCE_FLOAT32_ATI				= 0x8818
	LUMINANCE_ALPHA_FLOAT32_ATI			= 0x8819
	RGBA_FLOAT16_ATI				= 0x881A
	RGB_FLOAT16_ATI					= 0x881B
	ALPHA_FLOAT16_ATI				= 0x881C
	INTENSITY_FLOAT16_ATI				= 0x881D
	LUMINANCE_FLOAT16_ATI				= 0x881E
	LUMINANCE_ALPHA_FLOAT16_ATI			= 0x881F

###############################################################################

# Extension #281 (also WGL_NV_float_buffer)
NV_float_buffer enum:
	FLOAT_R_NV					= 0x8880
	FLOAT_RG_NV					= 0x8881
	FLOAT_RGB_NV					= 0x8882
	FLOAT_RGBA_NV					= 0x8883
	FLOAT_R16_NV					= 0x8884
	FLOAT_R32_NV					= 0x8885
	FLOAT_RG16_NV					= 0x8886
	FLOAT_RG32_NV					= 0x8887
	FLOAT_RGB16_NV					= 0x8888
	FLOAT_RGB32_NV					= 0x8889
	FLOAT_RGBA16_NV					= 0x888A
	FLOAT_RGBA32_NV					= 0x888B
	TEXTURE_FLOAT_COMPONENTS_NV			= 0x888C
	FLOAT_CLEAR_COLOR_VALUE_NV			= 0x888D
	FLOAT_RGBA_MODE_NV				= 0x888E

###############################################################################

# Extension #282
NV_fragment_program enum:
	MAX_FRAGMENT_PROGRAM_LOCAL_PARAMETERS_NV	= 0x8868
	FRAGMENT_PROGRAM_NV				= 0x8870
	MAX_TEXTURE_COORDS_NV				= 0x8871
	MAX_TEXTURE_IMAGE_UNITS_NV			= 0x8872
	FRAGMENT_PROGRAM_BINDING_NV			= 0x8873
	PROGRAM_ERROR_STRING_NV				= 0x8874

###############################################################################

# Extension #283
NV_half_float enum:
	HALF_FLOAT_NV					= 0x140B

###############################################################################

# Extension #284
NV_pixel_data_range enum:
	WRITE_PIXEL_DATA_RANGE_NV			= 0x8878
	READ_PIXEL_DATA_RANGE_NV			= 0x8879
	WRITE_PIXEL_DATA_RANGE_LENGTH_NV		= 0x887A
	READ_PIXEL_DATA_RANGE_LENGTH_NV			= 0x887B
	WRITE_PIXEL_DATA_RANGE_POINTER_NV		= 0x887C
	READ_PIXEL_DATA_RANGE_POINTER_NV		= 0x887D

###############################################################################

# Extension #285
NV_primitive_restart enum:
	PRIMITIVE_RESTART_NV				= 0x8558
	PRIMITIVE_RESTART_INDEX_NV			= 0x8559

###############################################################################

# Extension #286
NV_texture_expand_normal enum:
	TEXTURE_UNSIGNED_REMAP_MODE_NV			= 0x888F

###############################################################################

# No new tokens
# Extension #287
NV_vertex_program2 enum:

###############################################################################

# No new tokens
# Extension #288
ATI_map_object_buffer enum:

###############################################################################

# Extension #289
ATI_separate_stencil enum:
	STENCIL_BACK_FUNC_ATI				= 0x8800
	STENCIL_BACK_FAIL_ATI				= 0x8801
	STENCIL_BACK_PASS_DEPTH_FAIL_ATI		= 0x8802
	STENCIL_BACK_PASS_DEPTH_PASS_ATI		= 0x8803

###############################################################################

# No new tokens
# Extension #290
ATI_vertex_attrib_array_object enum:

###############################################################################

# No new tokens
# Extension #291 - OpenGL ES only, not in glext.h
# OES_byte_coordinates enum:

###############################################################################

# Extension #292 - OpenGL ES only, not in glext.h
# OES_fixed_point enum:
#	FIXED_OES					= 0x140C

###############################################################################

# No new tokens
# Extension #293 - OpenGL ES only, not in glext.h
# OES_single_precision enum:

###############################################################################

# Extension #294 - OpenGL ES only, not in glext.h
# OES_compressed_paletted_texture enum:
#	PALETTE4_RGB8_OES				= 0x8B90
#	PALETTE4_RGBA8_OES				= 0x8B91
#	PALETTE4_R5_G6_B5_OES				= 0x8B92
#	PALETTE4_RGBA4_OES				= 0x8B93
#	PALETTE4_RGB5_A1_OES				= 0x8B94
#	PALETTE8_RGB8_OES				= 0x8B95
#	PALETTE8_RGBA8_OES				= 0x8B96
#	PALETTE8_R5_G6_B5_OES				= 0x8B97
#	PALETTE8_RGBA4_OES				= 0x8B98
#	PALETTE8_RGB5_A1_OES				= 0x8B99

###############################################################################

# Extension #295 - This is an OpenGL ES extension, but also implemented in Mesa
OES_read_format enum:
	IMPLEMENTATION_COLOR_READ_TYPE_OES		= 0x8B9A
	IMPLEMENTATION_COLOR_READ_FORMAT_OES		= 0x8B9B

###############################################################################

# No new tokens
# Extension #296 - OpenGL ES only, not in glext.h
# OES_query_matrix enum:

###############################################################################

# Extension #297
EXT_depth_bounds_test enum:
	DEPTH_BOUNDS_TEST_EXT				= 0x8890
	DEPTH_BOUNDS_EXT				= 0x8891

###############################################################################

# Extension #298
EXT_texture_mirror_clamp enum:
	MIRROR_CLAMP_EXT				= 0x8742
	MIRROR_CLAMP_TO_EDGE_EXT			= 0x8743
	MIRROR_CLAMP_TO_BORDER_EXT			= 0x8912

###############################################################################

# Extension #299
EXT_blend_equation_separate enum:
	BLEND_EQUATION_RGB_EXT				= 0x8009    # alias GL_BLEND_EQUATION_EXT
	BLEND_EQUATION_ALPHA_EXT			= 0x883D

###############################################################################

# Extension #300
MESA_pack_invert enum:
	PACK_INVERT_MESA				= 0x8758

###############################################################################

# Extension #301
MESA_ycbcr_texture enum:
	UNSIGNED_SHORT_8_8_MESA				= 0x85BA
	UNSIGNED_SHORT_8_8_REV_MESA			= 0x85BB
	YCBCR_MESA					= 0x8757

###############################################################################

# Extension #302
EXT_pixel_buffer_object enum:
	PIXEL_PACK_BUFFER_EXT				= 0x88EB
	PIXEL_UNPACK_BUFFER_EXT				= 0x88EC
	PIXEL_PACK_BUFFER_BINDING_EXT			= 0x88ED
	PIXEL_UNPACK_BUFFER_BINDING_EXT			= 0x88EF

###############################################################################

# No new tokens
# Extension #303
NV_fragment_program_option enum:

###############################################################################

# Extension #304
NV_fragment_program2 enum:
	MAX_PROGRAM_EXEC_INSTRUCTIONS_NV		= 0x88F4
	MAX_PROGRAM_CALL_DEPTH_NV			= 0x88F5
	MAX_PROGRAM_IF_DEPTH_NV				= 0x88F6
	MAX_PROGRAM_LOOP_DEPTH_NV			= 0x88F7
	MAX_PROGRAM_LOOP_COUNT_NV			= 0x88F8

###############################################################################

# Extension #305
NV_vertex_program2_option enum:
	use NV_fragment_program2	    MAX_PROGRAM_EXEC_INSTRUCTIONS_NV
	use NV_fragment_program2	    MAX_PROGRAM_CALL_DEPTH_NV

###############################################################################

# Extension #306
NV_vertex_program3 enum:
	use ARB_vertex_shader		    MAX_VERTEX_TEXTURE_IMAGE_UNITS_ARB

###############################################################################

# Extension #307 - GLX_SGIX_hyperpipe
# Extension #308 - GLX_MESA_agp_offset

# Extension #309 - GL_EXT_texture_compression_dxt1 (OpenGL ES only, subset of _s3tc version)
#	 use EXT_texture_compression_s3tc    COMPRESSED_RGB_S3TC_DXT1_EXT
#	 use EXT_texture_compression_s3tc    COMPRESSED_RGBA_S3TC_DXT1_EXT

###############################################################################

# Extension #310
EXT_framebuffer_object enum:
	INVALID_FRAMEBUFFER_OPERATION_EXT		= 0x0506
	MAX_RENDERBUFFER_SIZE_EXT			= 0x84E8
	FRAMEBUFFER_BINDING_EXT				= 0x8CA6
	RENDERBUFFER_BINDING_EXT			= 0x8CA7
	FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE_EXT		= 0x8CD0
	FRAMEBUFFER_ATTACHMENT_OBJECT_NAME_EXT		= 0x8CD1
	FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL_EXT	= 0x8CD2
	FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE_EXT = 0x8CD3
	FRAMEBUFFER_ATTACHMENT_TEXTURE_3D_ZOFFSET_EXT	= 0x8CD4
	FRAMEBUFFER_COMPLETE_EXT			= 0x8CD5
	FRAMEBUFFER_INCOMPLETE_ATTACHMENT_EXT		= 0x8CD6
	FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT_EXT	= 0x8CD7
## Removed 2005/09/26 in revision #117 of the extension:
##	  FRAMEBUFFER_INCOMPLETE_DUPLICATE_ATTACHMENT_EXT = 0x8CD8
	FRAMEBUFFER_INCOMPLETE_DIMENSIONS_EXT		= 0x8CD9
	FRAMEBUFFER_INCOMPLETE_FORMATS_EXT		= 0x8CDA
	FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER_EXT		= 0x8CDB
	FRAMEBUFFER_INCOMPLETE_READ_BUFFER_EXT		= 0x8CDC
	FRAMEBUFFER_UNSUPPORTED_EXT			= 0x8CDD
## Removed 2005/05/31 in revision #113 of the extension:
##	  FRAMEBUFFER_STATUS_ERROR_EXT			  = 0x8CDE
	MAX_COLOR_ATTACHMENTS_EXT			= 0x8CDF
	COLOR_ATTACHMENT0_EXT				= 0x8CE0
	COLOR_ATTACHMENT1_EXT				= 0x8CE1
	COLOR_ATTACHMENT2_EXT				= 0x8CE2
	COLOR_ATTACHMENT3_EXT				= 0x8CE3
	COLOR_ATTACHMENT4_EXT				= 0x8CE4
	COLOR_ATTACHMENT5_EXT				= 0x8CE5
	COLOR_ATTACHMENT6_EXT				= 0x8CE6
	COLOR_ATTACHMENT7_EXT				= 0x8CE7
	COLOR_ATTACHMENT8_EXT				= 0x8CE8
	COLOR_ATTACHMENT9_EXT				= 0x8CE9
	COLOR_ATTACHMENT10_EXT				= 0x8CEA
	COLOR_ATTACHMENT11_EXT				= 0x8CEB
	COLOR_ATTACHMENT12_EXT				= 0x8CEC
	COLOR_ATTACHMENT13_EXT				= 0x8CED
	COLOR_ATTACHMENT14_EXT				= 0x8CEE
	COLOR_ATTACHMENT15_EXT				= 0x8CEF
	DEPTH_ATTACHMENT_EXT				= 0x8D00
	STENCIL_ATTACHMENT_EXT				= 0x8D20
	FRAMEBUFFER_EXT					= 0x8D40
	RENDERBUFFER_EXT				= 0x8D41
	RENDERBUFFER_WIDTH_EXT				= 0x8D42
	RENDERBUFFER_HEIGHT_EXT				= 0x8D43
	RENDERBUFFER_INTERNAL_FORMAT_EXT		= 0x8D44
# removed STENCIL_INDEX_EXT = 0x8D45 in rev. #114 of the spec
	STENCIL_INDEX1_EXT				= 0x8D46
	STENCIL_INDEX4_EXT				= 0x8D47
	STENCIL_INDEX8_EXT				= 0x8D48
	STENCIL_INDEX16_EXT				= 0x8D49
	RENDERBUFFER_RED_SIZE_EXT			= 0x8D50
	RENDERBUFFER_GREEN_SIZE_EXT			= 0x8D51
	RENDERBUFFER_BLUE_SIZE_EXT			= 0x8D52
	RENDERBUFFER_ALPHA_SIZE_EXT			= 0x8D53
	RENDERBUFFER_DEPTH_SIZE_EXT			= 0x8D54
	RENDERBUFFER_STENCIL_SIZE_EXT			= 0x8D55

###############################################################################

# No new tokens
# Extension #311
GREMEDY_string_marker enum:

###############################################################################

# Extension #312
EXT_packed_depth_stencil enum:
	DEPTH_STENCIL_EXT				= 0x84F9
	UNSIGNED_INT_24_8_EXT				= 0x84FA
	DEPTH24_STENCIL8_EXT				= 0x88F0
	TEXTURE_STENCIL_SIZE_EXT			= 0x88F1

###############################################################################

# Extension #313 - WGL_3DL_stereo_control

###############################################################################

# Extension #314
EXT_stencil_clear_tag enum:
	STENCIL_TAG_BITS_EXT				= 0x88F2
	STENCIL_CLEAR_TAG_VALUE_EXT			= 0x88F3

###############################################################################

# Extension #315
EXT_texture_sRGB enum:
	SRGB_EXT					= 0x8C40
	SRGB8_EXT					= 0x8C41
	SRGB_ALPHA_EXT					= 0x8C42
	SRGB8_ALPHA8_EXT				= 0x8C43
	SLUMINANCE_ALPHA_EXT				= 0x8C44
	SLUMINANCE8_ALPHA8_EXT				= 0x8C45
	SLUMINANCE_EXT					= 0x8C46
	SLUMINANCE8_EXT					= 0x8C47
	COMPRESSED_SRGB_EXT				= 0x8C48
	COMPRESSED_SRGB_ALPHA_EXT			= 0x8C49
	COMPRESSED_SLUMINANCE_EXT			= 0x8C4A
	COMPRESSED_SLUMINANCE_ALPHA_EXT			= 0x8C4B
	COMPRESSED_SRGB_S3TC_DXT1_EXT			= 0x8C4C
	COMPRESSED_SRGB_ALPHA_S3TC_DXT1_EXT		= 0x8C4D
	COMPRESSED_SRGB_ALPHA_S3TC_DXT3_EXT		= 0x8C4E
	COMPRESSED_SRGB_ALPHA_S3TC_DXT5_EXT		= 0x8C4F

###############################################################################

# Extension #316
EXT_framebuffer_blit enum:
	READ_FRAMEBUFFER_EXT				= 0x8CA8
	DRAW_FRAMEBUFFER_EXT				= 0x8CA9
	DRAW_FRAMEBUFFER_BINDING_EXT			= GL_FRAMEBUFFER_BINDING_EXT
	READ_FRAMEBUFFER_BINDING_EXT			= 0x8CAA

###############################################################################

# Extension #317
EXT_framebuffer_multisample enum:
	RENDERBUFFER_SAMPLES_EXT			= 0x8CAB
	FRAMEBUFFER_INCOMPLETE_MULTISAMPLE_EXT		= 0x8D56
	MAX_SAMPLES_EXT					= 0x8D57

###############################################################################

# Extension #318
MESAX_texture_stack enum:
	TEXTURE_1D_STACK_MESAX				= 0x8759
	TEXTURE_2D_STACK_MESAX				= 0x875A
	PROXY_TEXTURE_1D_STACK_MESAX			= 0x875B
	PROXY_TEXTURE_2D_STACK_MESAX			= 0x875C
	TEXTURE_1D_STACK_BINDING_MESAX			= 0x875D
	TEXTURE_2D_STACK_BINDING_MESAX			= 0x875E

###############################################################################

# Extension #319
EXT_timer_query enum:
	TIME_ELAPSED_EXT				= 0x88BF

###############################################################################

# No new tokens
# Extension #320
EXT_gpu_program_parameters enum:

###############################################################################

# Extension #321
APPLE_flush_buffer_range enum:
	BUFFER_SERIALIZED_MODIFY_APPLE			= 0x8A12
	BUFFER_FLUSHING_UNMAP_APPLE			= 0x8A13

###############################################################################

# Extension #322
NV_gpu_program4 enum:
	MIN_PROGRAM_TEXEL_OFFSET_NV			= 0x8904
	MAX_PROGRAM_TEXEL_OFFSET_NV			= 0x8905
	PROGRAM_ATTRIB_COMPONENTS_NV			= 0x8906
	PROGRAM_RESULT_COMPONENTS_NV			= 0x8907
	MAX_PROGRAM_ATTRIB_COMPONENTS_NV		= 0x8908
	MAX_PROGRAM_RESULT_COMPONENTS_NV		= 0x8909
	MAX_PROGRAM_GENERIC_ATTRIBS_NV			= 0x8DA5
	MAX_PROGRAM_GENERIC_RESULTS_NV			= 0x8DA6

###############################################################################

# Extension #323
NV_geometry_program4 enum:
	LINES_ADJACENCY_EXT				= 0x000A
	LINE_STRIP_ADJACENCY_EXT			= 0x000B
	TRIANGLES_ADJACENCY_EXT				= 0x000C
	TRIANGLE_STRIP_ADJACENCY_EXT			= 0x000D
	GEOMETRY_PROGRAM_NV				= 0x8C26
	MAX_PROGRAM_OUTPUT_VERTICES_NV			= 0x8C27
	MAX_PROGRAM_TOTAL_OUTPUT_COMPONENTS_NV		= 0x8C28
	GEOMETRY_VERTICES_OUT_EXT			= 0x8DDA
	GEOMETRY_INPUT_TYPE_EXT				= 0x8DDB
	GEOMETRY_OUTPUT_TYPE_EXT			= 0x8DDC
	MAX_GEOMETRY_TEXTURE_IMAGE_UNITS_EXT		= 0x8C29
	FRAMEBUFFER_ATTACHMENT_LAYERED_EXT		= 0x8DA7
	FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS_EXT	= 0x8DA8
	FRAMEBUFFER_INCOMPLETE_LAYER_COUNT_EXT		= 0x8DA9
	FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER_EXT	= 0x8CD4
	PROGRAM_POINT_SIZE_EXT				= 0x8642

###############################################################################

# Extension #324
EXT_geometry_shader4 enum:
	GEOMETRY_SHADER_EXT				= 0x8DD9
	use NV_geometry_program4	    GEOMETRY_VERTICES_OUT_EXT
	use NV_geometry_program4	    GEOMETRY_INPUT_TYPE_EXT
	use NV_geometry_program4	    GEOMETRY_OUTPUT_TYPE_EXT
	use NV_geometry_program4	    MAX_GEOMETRY_TEXTURE_IMAGE_UNITS_EXT
	MAX_GEOMETRY_VARYING_COMPONENTS_EXT		= 0x8DDD
	MAX_VERTEX_VARYING_COMPONENTS_EXT		= 0x8DDE
	MAX_VARYING_COMPONENTS_EXT			= 0x8B4B
	MAX_GEOMETRY_UNIFORM_COMPONENTS_EXT		= 0x8DDF
	MAX_GEOMETRY_OUTPUT_VERTICES_EXT		= 0x8DE0
	MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS_EXT	= 0x8DE1
	use NV_geometry_program4	    LINES_ADJACENCY_EXT
	use NV_geometry_program4	    LINE_STRIP_ADJACENCY_EXT
	use NV_geometry_program4	    TRIANGLES_ADJACENCY_EXT
	use NV_geometry_program4	    TRIANGLE_STRIP_ADJACENCY_EXT
	use NV_geometry_program4	    FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS_EXT
	use NV_geometry_program4	    FRAMEBUFFER_INCOMPLETE_LAYER_COUNT_EXT
	use NV_geometry_program4	    FRAMEBUFFER_ATTACHMENT_LAYERED_EXT
	use NV_geometry_program4	    FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER_EXT
	use NV_geometry_program4	    PROGRAM_POINT_SIZE_EXT

###############################################################################

# Extension #325
NV_vertex_program4 enum:
	VERTEX_ATTRIB_ARRAY_INTEGER_NV			= 0x88FD

###############################################################################

# Extension #326
EXT_gpu_shader4 enum:
	SAMPLER_1D_ARRAY_EXT				= 0x8DC0
	SAMPLER_2D_ARRAY_EXT				= 0x8DC1
	SAMPLER_BUFFER_EXT				= 0x8DC2
	SAMPLER_1D_ARRAY_SHADOW_EXT			= 0x8DC3
	SAMPLER_2D_ARRAY_SHADOW_EXT			= 0x8DC4
	SAMPLER_CUBE_SHADOW_EXT				= 0x8DC5
	UNSIGNED_INT_VEC2_EXT				= 0x8DC6
	UNSIGNED_INT_VEC3_EXT				= 0x8DC7
	UNSIGNED_INT_VEC4_EXT				= 0x8DC8
	INT_SAMPLER_1D_EXT				= 0x8DC9
	INT_SAMPLER_2D_EXT				= 0x8DCA
	INT_SAMPLER_3D_EXT				= 0x8DCB
	INT_SAMPLER_CUBE_EXT				= 0x8DCC
	INT_SAMPLER_2D_RECT_EXT				= 0x8DCD
	INT_SAMPLER_1D_ARRAY_EXT			= 0x8DCE
	INT_SAMPLER_2D_ARRAY_EXT			= 0x8DCF
	INT_SAMPLER_BUFFER_EXT				= 0x8DD0
	UNSIGNED_INT_SAMPLER_1D_EXT			= 0x8DD1
	UNSIGNED_INT_SAMPLER_2D_EXT			= 0x8DD2
	UNSIGNED_INT_SAMPLER_3D_EXT			= 0x8DD3
	UNSIGNED_INT_SAMPLER_CUBE_EXT			= 0x8DD4
	UNSIGNED_INT_SAMPLER_2D_RECT_EXT		= 0x8DD5
	UNSIGNED_INT_SAMPLER_1D_ARRAY_EXT		= 0x8DD6
	UNSIGNED_INT_SAMPLER_2D_ARRAY_EXT		= 0x8DD7
	UNSIGNED_INT_SAMPLER_BUFFER_EXT			= 0x8DD8

###############################################################################

# No new tokens
# Extension #327
EXT_draw_instanced enum:

###############################################################################

# Extension #328
EXT_packed_float enum:
	R11F_G11F_B10F_EXT				= 0x8C3A
	UNSIGNED_INT_10F_11F_11F_REV_EXT		= 0x8C3B
	RGBA_SIGNED_COMPONENTS_EXT			= 0x8C3C

###############################################################################

# Extension #329
EXT_texture_array enum:
	TEXTURE_1D_ARRAY_EXT				= 0x8C18
	PROXY_TEXTURE_1D_ARRAY_EXT			= 0x8C19
	TEXTURE_2D_ARRAY_EXT				= 0x8C1A
	PROXY_TEXTURE_2D_ARRAY_EXT			= 0x8C1B
	TEXTURE_BINDING_1D_ARRAY_EXT			= 0x8C1C
	TEXTURE_BINDING_2D_ARRAY_EXT			= 0x8C1D
	MAX_ARRAY_TEXTURE_LAYERS_EXT			= 0x88FF
	COMPARE_REF_DEPTH_TO_TEXTURE_EXT		= 0x884E
	use NV_geometry_program4	    FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER_EXT

###############################################################################

# Extension #330
EXT_texture_buffer_object enum:
	TEXTURE_BUFFER_EXT				= 0x8C2A
	MAX_TEXTURE_BUFFER_SIZE_EXT			= 0x8C2B
	TEXTURE_BINDING_BUFFER_EXT			= 0x8C2C
	TEXTURE_BUFFER_DATA_STORE_BINDING_EXT		= 0x8C2D
	TEXTURE_BUFFER_FORMAT_EXT			= 0x8C2E

###############################################################################

# Extension #331
EXT_texture_compression_latc enum:
	COMPRESSED_LUMINANCE_LATC1_EXT			= 0x8C70
	COMPRESSED_SIGNED_LUMINANCE_LATC1_EXT		= 0x8C71
	COMPRESSED_LUMINANCE_ALPHA_LATC2_EXT		= 0x8C72
	COMPRESSED_SIGNED_LUMINANCE_ALPHA_LATC2_EXT	= 0x8C73

###############################################################################

# Extension #332
EXT_texture_compression_rgtc enum:
	COMPRESSED_RED_RGTC1_EXT			= 0x8DBB
	COMPRESSED_SIGNED_RED_RGTC1_EXT			= 0x8DBC
	COMPRESSED_RED_GREEN_RGTC2_EXT			= 0x8DBD
	COMPRESSED_SIGNED_RED_GREEN_RGTC2_EXT		= 0x8DBE

###############################################################################

# Extension #333
EXT_texture_shared_exponent enum:
	RGB9_E5_EXT					= 0x8C3D
	UNSIGNED_INT_5_9_9_9_REV_EXT			= 0x8C3E
	TEXTURE_SHARED_SIZE_EXT				= 0x8C3F

###############################################################################

# Extension #334
NV_depth_buffer_float enum:
	DEPTH_COMPONENT32F_NV				= 0x8DAB
	DEPTH32F_STENCIL8_NV				= 0x8DAC
	FLOAT_32_UNSIGNED_INT_24_8_REV_NV		= 0x8DAD
	DEPTH_BUFFER_FLOAT_MODE_NV			= 0x8DAF

###############################################################################

# No new tokens
# Extension #335
NV_fragment_program4 enum:

###############################################################################

# Extension #336
NV_framebuffer_multisample_coverage enum:
	RENDERBUFFER_COVERAGE_SAMPLES_NV		= 0x8CAB
	RENDERBUFFER_COLOR_SAMPLES_NV			= 0x8E10
	MAX_MULTISAMPLE_COVERAGE_MODES_NV		= 0x8E11
	MULTISAMPLE_COVERAGE_MODES_NV			= 0x8E12

###############################################################################

# Extension #337
# ??? Also WGL/GLX extensions ???
EXT_framebuffer_sRGB enum:
	FRAMEBUFFER_SRGB_EXT				= 0x8DB9
	FRAMEBUFFER_SRGB_CAPABLE_EXT			= 0x8DBA

###############################################################################

# No new tokens
# Extension #338
NV_geometry_shader4 enum:

###############################################################################

# Extension #339
NV_parameter_buffer_object enum:
	MAX_PROGRAM_PARAMETER_BUFFER_BINDINGS_NV	= 0x8DA0
	MAX_PROGRAM_PARAMETER_BUFFER_SIZE_NV		= 0x8DA1
	VERTEX_PROGRAM_PARAMETER_BUFFER_NV		= 0x8DA2
	GEOMETRY_PROGRAM_PARAMETER_BUFFER_NV		= 0x8DA3
	FRAGMENT_PROGRAM_PARAMETER_BUFFER_NV		= 0x8DA4

###############################################################################

# No new tokens
# Extension #340
EXT_draw_buffers2 enum:

###############################################################################

# Extension #341
NV_transform_feedback enum:
	BACK_PRIMARY_COLOR_NV				= 0x8C77
	BACK_SECONDARY_COLOR_NV				= 0x8C78
	TEXTURE_COORD_NV				= 0x8C79
	CLIP_DISTANCE_NV				= 0x8C7A
	VERTEX_ID_NV					= 0x8C7B
	PRIMITIVE_ID_NV					= 0x8C7C
	GENERIC_ATTRIB_NV				= 0x8C7D
	TRANSFORM_FEEDBACK_ATTRIBS_NV			= 0x8C7E
	TRANSFORM_FEEDBACK_BUFFER_MODE_NV		= 0x8C7F
	MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS_NV	= 0x8C80
	ACTIVE_VARYINGS_NV				= 0x8C81
	ACTIVE_VARYING_MAX_LENGTH_NV			= 0x8C82
	TRANSFORM_FEEDBACK_VARYINGS_NV			= 0x8C83
	TRANSFORM_FEEDBACK_BUFFER_START_NV		= 0x8C84
	TRANSFORM_FEEDBACK_BUFFER_SIZE_NV		= 0x8C85
	TRANSFORM_FEEDBACK_RECORD_NV			= 0x8C86
	PRIMITIVES_GENERATED_NV				= 0x8C87
	TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN_NV	= 0x8C88
	RASTERIZER_DISCARD_NV				= 0x8C89
	MAX_TRANSFORM_FEEDBACK_INTERLEAVED_ATTRIBS_NV	= 0x8C8A
	MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS_NV	= 0x8C8B
	INTERLEAVED_ATTRIBS_NV				= 0x8C8C
	SEPARATE_ATTRIBS_NV				= 0x8C8D
	TRANSFORM_FEEDBACK_BUFFER_NV			= 0x8C8E
	TRANSFORM_FEEDBACK_BUFFER_BINDING_NV		= 0x8C8F
	LAYER_NV					= 0x8DAA
	NEXT_BUFFER_NV					= -2	    # Requires ARB_transform_feedback3
	SKIP_COMPONENTS4_NV				= -3	    # Requires ARB_transform_feedback3
	SKIP_COMPONENTS3_NV				= -4	    # Requires ARB_transform_feedback3
	SKIP_COMPONENTS2_NV				= -5	    # Requires ARB_transform_feedback3
	SKIP_COMPONENTS1_NV				= -6	    # Requires ARB_transform_feedback3

###############################################################################

# Extension #342
EXT_bindable_uniform enum:
	MAX_VERTEX_BINDABLE_UNIFORMS_EXT		= 0x8DE2
	MAX_FRAGMENT_BINDABLE_UNIFORMS_EXT		= 0x8DE3
	MAX_GEOMETRY_BINDABLE_UNIFORMS_EXT		= 0x8DE4
	MAX_BINDABLE_UNIFORM_SIZE_EXT			= 0x8DED
	UNIFORM_BUFFER_EXT				= 0x8DEE
	UNIFORM_BUFFER_BINDING_EXT			= 0x8DEF

###############################################################################

# Extension #343
EXT_texture_integer enum:
	RGBA32UI_EXT					= 0x8D70
	RGB32UI_EXT					= 0x8D71
	ALPHA32UI_EXT					= 0x8D72
	INTENSITY32UI_EXT				= 0x8D73
	LUMINANCE32UI_EXT				= 0x8D74
	LUMINANCE_ALPHA32UI_EXT				= 0x8D75
	RGBA16UI_EXT					= 0x8D76
	RGB16UI_EXT					= 0x8D77
	ALPHA16UI_EXT					= 0x8D78
	INTENSITY16UI_EXT				= 0x8D79
	LUMINANCE16UI_EXT				= 0x8D7A
	LUMINANCE_ALPHA16UI_EXT				= 0x8D7B
	RGBA8UI_EXT					= 0x8D7C
	RGB8UI_EXT					= 0x8D7D
	ALPHA8UI_EXT					= 0x8D7E
	INTENSITY8UI_EXT				= 0x8D7F
	LUMINANCE8UI_EXT				= 0x8D80
	LUMINANCE_ALPHA8UI_EXT				= 0x8D81
	RGBA32I_EXT					= 0x8D82
	RGB32I_EXT					= 0x8D83
	ALPHA32I_EXT					= 0x8D84
	INTENSITY32I_EXT				= 0x8D85
	LUMINANCE32I_EXT				= 0x8D86
	LUMINANCE_ALPHA32I_EXT				= 0x8D87
	RGBA16I_EXT					= 0x8D88
	RGB16I_EXT					= 0x8D89
	ALPHA16I_EXT					= 0x8D8A
	INTENSITY16I_EXT				= 0x8D8B
	LUMINANCE16I_EXT				= 0x8D8C
	LUMINANCE_ALPHA16I_EXT				= 0x8D8D
	RGBA8I_EXT					= 0x8D8E
	RGB8I_EXT					= 0x8D8F
	ALPHA8I_EXT					= 0x8D90
	INTENSITY8I_EXT					= 0x8D91
	LUMINANCE8I_EXT					= 0x8D92
	LUMINANCE_ALPHA8I_EXT				= 0x8D93
	RED_INTEGER_EXT					= 0x8D94
	GREEN_INTEGER_EXT				= 0x8D95
	BLUE_INTEGER_EXT				= 0x8D96
	ALPHA_INTEGER_EXT				= 0x8D97
	RGB_INTEGER_EXT					= 0x8D98
	RGBA_INTEGER_EXT				= 0x8D99
	BGR_INTEGER_EXT					= 0x8D9A
	BGRA_INTEGER_EXT				= 0x8D9B
	LUMINANCE_INTEGER_EXT				= 0x8D9C
	LUMINANCE_ALPHA_INTEGER_EXT			= 0x8D9D
	RGBA_INTEGER_MODE_EXT				= 0x8D9E

###############################################################################

# Extension #344 - GLX_EXT_texture_from_pixmap

###############################################################################

# No new tokens
# Extension #345
GREMEDY_frame_terminator enum:

###############################################################################

# Extension #346
NV_conditional_render enum:
	QUERY_WAIT_NV					= 0x8E13
	QUERY_NO_WAIT_NV				= 0x8E14
	QUERY_BY_REGION_WAIT_NV				= 0x8E15
	QUERY_BY_REGION_NO_WAIT_NV			= 0x8E16

###############################################################################

# Extension #347
NV_present_video enum:
	FRAME_NV					= 0x8E26
	FIELDS_NV					= 0x8E27
	CURRENT_TIME_NV					= 0x8E28
	NUM_FILL_STREAMS_NV				= 0x8E29
	PRESENT_TIME_NV					= 0x8E2A
	PRESENT_DURATION_NV				= 0x8E2B

###############################################################################

# Extension #348 - GLX_NV_video_out
# Extension #349 - WGL_NV_video_out
# Extension #350 - GLX_NV_swap_group
# Extension #351 - WGL_NV_swap_group

###############################################################################

# Extension #352
EXT_transform_feedback enum:
	TRANSFORM_FEEDBACK_BUFFER_EXT			= 0x8C8E
	TRANSFORM_FEEDBACK_BUFFER_START_EXT		= 0x8C84
	TRANSFORM_FEEDBACK_BUFFER_SIZE_EXT		= 0x8C85
	TRANSFORM_FEEDBACK_BUFFER_BINDING_EXT		= 0x8C8F
	INTERLEAVED_ATTRIBS_EXT				= 0x8C8C
	SEPARATE_ATTRIBS_EXT				= 0x8C8D
	PRIMITIVES_GENERATED_EXT			= 0x8C87
	TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN_EXT	= 0x8C88
	RASTERIZER_DISCARD_EXT				= 0x8C89
	MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS_EXT = 0x8C8A
	MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS_EXT	= 0x8C8B
	MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS_EXT	= 0x8C80
	TRANSFORM_FEEDBACK_VARYINGS_EXT			= 0x8C83
	TRANSFORM_FEEDBACK_BUFFER_MODE_EXT		= 0x8C7F
	TRANSFORM_FEEDBACK_VARYING_MAX_LENGTH_EXT	= 0x8C76

###############################################################################

# Extension #353
EXT_direct_state_access enum:
	PROGRAM_MATRIX_EXT				= 0x8E2D
	TRANSPOSE_PROGRAM_MATRIX_EXT			= 0x8E2E
	PROGRAM_MATRIX_STACK_DEPTH_EXT			= 0x8E2F

###############################################################################

# Extension #354
EXT_vertex_array_bgra enum:
	use VERSION_1_2			    BGRA

###############################################################################

# Extension #355 - WGL_NV_gpu_affinity

###############################################################################

# Extension #356
EXT_texture_swizzle enum:
	TEXTURE_SWIZZLE_R_EXT				= 0x8E42
	TEXTURE_SWIZZLE_G_EXT				= 0x8E43
	TEXTURE_SWIZZLE_B_EXT				= 0x8E44
	TEXTURE_SWIZZLE_A_EXT				= 0x8E45
	TEXTURE_SWIZZLE_RGBA_EXT			= 0x8E46

###############################################################################

# Extension #357
NV_explicit_multisample enum:
	SAMPLE_POSITION_NV				= 0x8E50
	SAMPLE_MASK_NV					= 0x8E51
	SAMPLE_MASK_VALUE_NV				= 0x8E52
	TEXTURE_BINDING_RENDERBUFFER_NV			= 0x8E53
	TEXTURE_RENDERBUFFER_DATA_STORE_BINDING_NV	= 0x8E54
	TEXTURE_RENDERBUFFER_NV				= 0x8E55
	SAMPLER_RENDERBUFFER_NV				= 0x8E56
	INT_SAMPLER_RENDERBUFFER_NV			= 0x8E57
	UNSIGNED_INT_SAMPLER_RENDERBUFFER_NV		= 0x8E58
	MAX_SAMPLE_MASK_WORDS_NV			= 0x8E59

###############################################################################

# Extension #358
NV_transform_feedback2 enum:
	TRANSFORM_FEEDBACK_NV				= 0x8E22
	TRANSFORM_FEEDBACK_BUFFER_PAUSED_NV		= 0x8E23
	TRANSFORM_FEEDBACK_BUFFER_ACTIVE_NV		= 0x8E24
	TRANSFORM_FEEDBACK_BINDING_NV			= 0x8E25

###############################################################################

# Extension #359
ATI_meminfo enum:
	VBO_FREE_MEMORY_ATI				= 0x87FB
	TEXTURE_FREE_MEMORY_ATI				= 0x87FC
	RENDERBUFFER_FREE_MEMORY_ATI			= 0x87FD

###############################################################################

# Extension #360
AMD_performance_monitor enum:
	COUNTER_TYPE_AMD				= 0x8BC0
	COUNTER_RANGE_AMD				= 0x8BC1
	UNSIGNED_INT64_AMD				= 0x8BC2
	PERCENTAGE_AMD					= 0x8BC3
	PERFMON_RESULT_AVAILABLE_AMD			= 0x8BC4
	PERFMON_RESULT_SIZE_AMD				= 0x8BC5
	PERFMON_RESULT_AMD				= 0x8BC6

###############################################################################

# Extension #361 - WGL_AMD_gpu_association

###############################################################################

# No new tokens
# Extension #362
AMD_texture_texture4 enum:

###############################################################################

# Extension #363
AMD_vertex_shader_tesselator enum:
	SAMPLER_BUFFER_AMD				= 0x9001
	INT_SAMPLER_BUFFER_AMD				= 0x9002
	UNSIGNED_INT_SAMPLER_BUFFER_AMD			= 0x9003
	TESSELLATION_MODE_AMD				= 0x9004
	TESSELLATION_FACTOR_AMD				= 0x9005
	DISCRETE_AMD					= 0x9006
	CONTINUOUS_AMD					= 0x9007

###############################################################################

# Extension #364
EXT_provoking_vertex enum:
	QUADS_FOLLOW_PROVOKING_VERTEX_CONVENTION_EXT	= 0x8E4C
	FIRST_VERTEX_CONVENTION_EXT			= 0x8E4D
	LAST_VERTEX_CONVENTION_EXT			= 0x8E4E
	PROVOKING_VERTEX_EXT				= 0x8E4F

###############################################################################

# Extension #365
EXT_texture_snorm enum:
	ALPHA_SNORM					= 0x9010
	LUMINANCE_SNORM					= 0x9011
	LUMINANCE_ALPHA_SNORM				= 0x9012
	INTENSITY_SNORM					= 0x9013
	ALPHA8_SNORM					= 0x9014
	LUMINANCE8_SNORM				= 0x9015
	LUMINANCE8_ALPHA8_SNORM				= 0x9016
	INTENSITY8_SNORM				= 0x9017
	ALPHA16_SNORM					= 0x9018
	LUMINANCE16_SNORM				= 0x9019
	LUMINANCE16_ALPHA16_SNORM			= 0x901A
	INTENSITY16_SNORM				= 0x901B
	use VERSION_3_1			    RED_SNORM
	use VERSION_3_1			    RG_SNORM
	use VERSION_3_1			    RGB_SNORM
	use VERSION_3_1			    RGBA_SNORM
	use VERSION_3_1			    R8_SNORM
	use VERSION_3_1			    RG8_SNORM
	use VERSION_3_1			    RGB8_SNORM
	use VERSION_3_1			    RGBA8_SNORM
	use VERSION_3_1			    R16_SNORM
	use VERSION_3_1			    RG16_SNORM
	use VERSION_3_1			    RGB16_SNORM
	use VERSION_3_1			    RGBA16_SNORM
	use VERSION_3_1			    SIGNED_NORMALIZED

###############################################################################

# No new tokens
# Extension #366
AMD_draw_buffers_blend enum:

###############################################################################

# Extension #367
APPLE_texture_range enum:
	TEXTURE_RANGE_LENGTH_APPLE			= 0x85B7
	TEXTURE_RANGE_POINTER_APPLE			= 0x85B8
	TEXTURE_STORAGE_HINT_APPLE			= 0x85BC
	STORAGE_PRIVATE_APPLE				= 0x85BD
	use APPLE_vertex_array_range	    STORAGE_CACHED_APPLE
	use APPLE_vertex_array_range	    STORAGE_SHARED_APPLE

###############################################################################

# Extension #368
APPLE_float_pixels enum:
	HALF_APPLE					= 0x140B
	RGBA_FLOAT32_APPLE				= 0x8814
	RGB_FLOAT32_APPLE				= 0x8815
	ALPHA_FLOAT32_APPLE				= 0x8816
	INTENSITY_FLOAT32_APPLE				= 0x8817
	LUMINANCE_FLOAT32_APPLE				= 0x8818
	LUMINANCE_ALPHA_FLOAT32_APPLE			= 0x8819
	RGBA_FLOAT16_APPLE				= 0x881A
	RGB_FLOAT16_APPLE				= 0x881B
	ALPHA_FLOAT16_APPLE				= 0x881C
	INTENSITY_FLOAT16_APPLE				= 0x881D
	LUMINANCE_FLOAT16_APPLE				= 0x881E
	LUMINANCE_ALPHA_FLOAT16_APPLE			= 0x881F
	COLOR_FLOAT_APPLE				= 0x8A0F

###############################################################################

# Extension #369
APPLE_vertex_program_evaluators enum:
	VERTEX_ATTRIB_MAP1_APPLE			= 0x8A00
	VERTEX_ATTRIB_MAP2_APPLE			= 0x8A01
	VERTEX_ATTRIB_MAP1_SIZE_APPLE			= 0x8A02
	VERTEX_ATTRIB_MAP1_COEFF_APPLE			= 0x8A03
	VERTEX_ATTRIB_MAP1_ORDER_APPLE			= 0x8A04
	VERTEX_ATTRIB_MAP1_DOMAIN_APPLE			= 0x8A05
	VERTEX_ATTRIB_MAP2_SIZE_APPLE			= 0x8A06
	VERTEX_ATTRIB_MAP2_COEFF_APPLE			= 0x8A07
	VERTEX_ATTRIB_MAP2_ORDER_APPLE			= 0x8A08
	VERTEX_ATTRIB_MAP2_DOMAIN_APPLE			= 0x8A09

###############################################################################

# Extension #370
APPLE_aux_depth_stencil enum:
	AUX_DEPTH_STENCIL_APPLE				= 0x8A14

###############################################################################

# Extension #371
APPLE_object_purgeable enum:
	BUFFER_OBJECT_APPLE				= 0x85B3
	RELEASED_APPLE					= 0x8A19
	VOLATILE_APPLE					= 0x8A1A
	RETAINED_APPLE					= 0x8A1B
	UNDEFINED_APPLE					= 0x8A1C
	PURGEABLE_APPLE					= 0x8A1D

###############################################################################

# Extension #372
APPLE_row_bytes enum:
	PACK_ROW_BYTES_APPLE				= 0x8A15
	UNPACK_ROW_BYTES_APPLE				= 0x8A16

###############################################################################

# Extension #373
APPLE_rgb_422 enum:
	RGB_422_APPLE					= 0x8A1F
	use APPLE_ycbcr_422		    UNSIGNED_SHORT_8_8_APPLE
	use APPLE_ycbcr_422		    UNSIGNED_SHORT_8_8_REV_APPLE

###############################################################################

# Extension #374

NV_video_capture enum:
	VIDEO_BUFFER_NV					= 0x9020
	VIDEO_BUFFER_BINDING_NV				= 0x9021
	FIELD_UPPER_NV					= 0x9022
	FIELD_LOWER_NV					= 0x9023
	NUM_VIDEO_CAPTURE_STREAMS_NV			= 0x9024
	NEXT_VIDEO_CAPTURE_BUFFER_STATUS_NV		= 0x9025
	VIDEO_CAPTURE_TO_422_SUPPORTED_NV		= 0x9026
	LAST_VIDEO_CAPTURE_STATUS_NV			= 0x9027
	VIDEO_BUFFER_PITCH_NV				= 0x9028
	VIDEO_COLOR_CONVERSION_MATRIX_NV		= 0x9029
	VIDEO_COLOR_CONVERSION_MAX_NV			= 0x902A
	VIDEO_COLOR_CONVERSION_MIN_NV			= 0x902B
	VIDEO_COLOR_CONVERSION_OFFSET_NV		= 0x902C
	VIDEO_BUFFER_INTERNAL_FORMAT_NV			= 0x902D
	PARTIAL_SUCCESS_NV				= 0x902E
	SUCCESS_NV					= 0x902F
	FAILURE_NV					= 0x9030
	YCBYCR8_422_NV					= 0x9031
	YCBAYCR8A_4224_NV				= 0x9032
	Z6Y10Z6CB10Z6Y10Z6CR10_422_NV			= 0x9033
	Z6Y10Z6CB10Z6A10Z6Y10Z6CR10Z6A10_4224_NV	= 0x9034
	Z4Y12Z4CB12Z4Y12Z4CR12_422_NV			= 0x9035
	Z4Y12Z4CB12Z4A12Z4Y12Z4CR12Z4A12_4224_NV	= 0x9036
	Z4Y12Z4CB12Z4CR12_444_NV			= 0x9037
	VIDEO_CAPTURE_FRAME_WIDTH_NV			= 0x9038
	VIDEO_CAPTURE_FRAME_HEIGHT_NV			= 0x9039
	VIDEO_CAPTURE_FIELD_UPPER_HEIGHT_NV		= 0x903A
	VIDEO_CAPTURE_FIELD_LOWER_HEIGHT_NV		= 0x903B
	VIDEO_CAPTURE_SURFACE_ORIGIN_NV			= 0x903C

###############################################################################

# Extension #375 - GLX_EXT_swap_control

###############################################################################

# No new tokens
# Extension #376 - also GLX_NV_copy_image, WGL_NV_copy_image
NV_copy_image enum:

###############################################################################

# Extension #377
EXT_separate_shader_objects enum:
	ACTIVE_PROGRAM_EXT				= 0x8B8D

###############################################################################

# No new tokens
# Extension #378
NV_parameter_buffer_object2 enum:

###############################################################################

# Extension #379
NV_shader_buffer_load enum:
	BUFFER_GPU_ADDRESS_NV				= 0x8F1D
	GPU_ADDRESS_NV					= 0x8F34
	MAX_SHADER_BUFFER_ADDRESS_NV			= 0x8F35

###############################################################################

# Extension #380
NV_vertex_buffer_unified_memory enum:
	VERTEX_ATTRIB_ARRAY_UNIFIED_NV			= 0x8F1E
	ELEMENT_ARRAY_UNIFIED_NV			= 0x8F1F
	VERTEX_ATTRIB_ARRAY_ADDRESS_NV			= 0x8F20
	VERTEX_ARRAY_ADDRESS_NV				= 0x8F21
	NORMAL_ARRAY_ADDRESS_NV				= 0x8F22
	COLOR_ARRAY_ADDRESS_NV				= 0x8F23
	INDEX_ARRAY_ADDRESS_NV				= 0x8F24
	TEXTURE_COORD_ARRAY_ADDRESS_NV			= 0x8F25
	EDGE_FLAG_ARRAY_ADDRESS_NV			= 0x8F26
	SECONDARY_COLOR_ARRAY_ADDRESS_NV		= 0x8F27
	FOG_COORD_ARRAY_ADDRESS_NV			= 0x8F28
	ELEMENT_ARRAY_ADDRESS_NV			= 0x8F29
	VERTEX_ATTRIB_ARRAY_LENGTH_NV			= 0x8F2A
	VERTEX_ARRAY_LENGTH_NV				= 0x8F2B
	NORMAL_ARRAY_LENGTH_NV				= 0x8F2C
	COLOR_ARRAY_LENGTH_NV				= 0x8F2D
	INDEX_ARRAY_LENGTH_NV				= 0x8F2E
	TEXTURE_COORD_ARRAY_LENGTH_NV			= 0x8F2F
	EDGE_FLAG_ARRAY_LENGTH_NV			= 0x8F30
	SECONDARY_COLOR_ARRAY_LENGTH_NV			= 0x8F31
	FOG_COORD_ARRAY_LENGTH_NV			= 0x8F32
	ELEMENT_ARRAY_LENGTH_NV				= 0x8F33
	DRAW_INDIRECT_UNIFIED_NV			= 0x8F40    # Requires ARB_draw_indirect
	DRAW_INDIRECT_ADDRESS_NV			= 0x8F41    # Requires ARB_draw_indirect
	DRAW_INDIRECT_LENGTH_NV				= 0x8F42    # Requires ARB_draw_indirect

###############################################################################

# No new tokens
# Extension #381
NV_texture_barrier enum:

###############################################################################

# No new tokens
# Extension #382
AMD_shader_stencil_export enum:

###############################################################################

# Extension #383
AMD_seamless_cubemap_per_texture enum:
    use ARB_seamless_cube_map		    TEXTURE_CUBE_MAP_SEAMLESS

###############################################################################

# Extension #384 - GLX_INTEL_swap_event

###############################################################################

# No new tokens
# Extension #385
AMD_conservative_depth enum:

###############################################################################

# Extension #386
EXT_shader_image_load_store enum:
	MAX_IMAGE_UNITS_EXT				= 0x8F38
	MAX_COMBINED_IMAGE_UNITS_AND_FRAGMENT_OUTPUTS_EXT = 0x8F39
	IMAGE_BINDING_NAME_EXT				= 0x8F3A
	IMAGE_BINDING_LEVEL_EXT				= 0x8F3B
	IMAGE_BINDING_LAYERED_EXT			= 0x8F3C
	IMAGE_BINDING_LAYER_EXT				= 0x8F3D
	IMAGE_BINDING_ACCESS_EXT			= 0x8F3E
	IMAGE_1D_EXT					= 0x904C
	IMAGE_2D_EXT					= 0x904D
	IMAGE_3D_EXT					= 0x904E
	IMAGE_2D_RECT_EXT				= 0x904F
	IMAGE_CUBE_EXT					= 0x9050
	IMAGE_BUFFER_EXT				= 0x9051
	IMAGE_1D_ARRAY_EXT				= 0x9052
	IMAGE_2D_ARRAY_EXT				= 0x9053
	IMAGE_CUBE_MAP_ARRAY_EXT			= 0x9054
	IMAGE_2D_MULTISAMPLE_EXT			= 0x9055
	IMAGE_2D_MULTISAMPLE_ARRAY_EXT			= 0x9056
	INT_IMAGE_1D_EXT				= 0x9057
	INT_IMAGE_2D_EXT				= 0x9058
	INT_IMAGE_3D_EXT				= 0x9059
	INT_IMAGE_2D_RECT_EXT				= 0x905A
	INT_IMAGE_CUBE_EXT				= 0x905B
	INT_IMAGE_BUFFER_EXT				= 0x905C
	INT_IMAGE_1D_ARRAY_EXT				= 0x905D
	INT_IMAGE_2D_ARRAY_EXT				= 0x905E
	INT_IMAGE_CUBE_MAP_ARRAY_EXT			= 0x905F
	INT_IMAGE_2D_MULTISAMPLE_EXT			= 0x9060
	INT_IMAGE_2D_MULTISAMPLE_ARRAY_EXT		= 0x9061
	UNSIGNED_INT_IMAGE_1D_EXT			= 0x9062
	UNSIGNED_INT_IMAGE_2D_EXT			= 0x9063
	UNSIGNED_INT_IMAGE_3D_EXT			= 0x9064
	UNSIGNED_INT_IMAGE_2D_RECT_EXT			= 0x9065
	UNSIGNED_INT_IMAGE_CUBE_EXT			= 0x9066
	UNSIGNED_INT_IMAGE_BUFFER_EXT			= 0x9067
	UNSIGNED_INT_IMAGE_1D_ARRAY_EXT			= 0x9068
	UNSIGNED_INT_IMAGE_2D_ARRAY_EXT			= 0x9069
	UNSIGNED_INT_IMAGE_CUBE_MAP_ARRAY_EXT		= 0x906A
	UNSIGNED_INT_IMAGE_2D_MULTISAMPLE_EXT		= 0x906B
	UNSIGNED_INT_IMAGE_2D_MULTISAMPLE_ARRAY_EXT	= 0x906C
	MAX_IMAGE_SAMPLES_EXT				= 0x906D
	IMAGE_BINDING_FORMAT_EXT			= 0x906E
# ??? Not clear where to put new types of mask bits yet
	VERTEX_ATTRIB_ARRAY_BARRIER_BIT_EXT		= 0x00000001
	ELEMENT_ARRAY_BARRIER_BIT_EXT			= 0x00000002
	UNIFORM_BARRIER_BIT_EXT				= 0x00000004
	TEXTURE_FETCH_BARRIER_BIT_EXT			= 0x00000008
	SHADER_IMAGE_ACCESS_BARRIER_BIT_EXT		= 0x00000020
	COMMAND_BARRIER_BIT_EXT				= 0x00000040
	PIXEL_BUFFER_BARRIER_BIT_EXT			= 0x00000080
	TEXTURE_UPDATE_BARRIER_BIT_EXT			= 0x00000100
	BUFFER_UPDATE_BARRIER_BIT_EXT			= 0x00000200
	FRAMEBUFFER_BARRIER_BIT_EXT			= 0x00000400
	TRANSFORM_FEEDBACK_BARRIER_BIT_EXT		= 0x00000800
	ATOMIC_COUNTER_BARRIER_BIT_EXT			= 0x00001000
	ALL_BARRIER_BITS_EXT				= 0xFFFFFFFF

###############################################################################

# Extension #387
EXT_vertex_attrib_64bit enum:
	use VERSION_1_1			    DOUBLE
	DOUBLE_VEC2_EXT					= 0x8FFC
	DOUBLE_VEC3_EXT					= 0x8FFD
	DOUBLE_VEC4_EXT					= 0x8FFE
	DOUBLE_MAT2_EXT					= 0x8F46
	DOUBLE_MAT3_EXT					= 0x8F47
	DOUBLE_MAT4_EXT					= 0x8F48
	DOUBLE_MAT2x3_EXT				= 0x8F49
	DOUBLE_MAT2x4_EXT				= 0x8F4A
	DOUBLE_MAT3x2_EXT				= 0x8F4B
	DOUBLE_MAT3x4_EXT				= 0x8F4C
	DOUBLE_MAT4x2_EXT				= 0x8F4D
	DOUBLE_MAT4x3_EXT				= 0x8F4E

###############################################################################

# Extension #388
NV_gpu_program5 enum:
	MAX_GEOMETRY_PROGRAM_INVOCATIONS_NV		= 0x8E5A
	MIN_FRAGMENT_INTERPOLATION_OFFSET_NV		= 0x8E5B
	MAX_FRAGMENT_INTERPOLATION_OFFSET_NV		= 0x8E5C
	FRAGMENT_PROGRAM_INTERPOLATION_OFFSET_BITS_NV	= 0x8E5D
	MIN_PROGRAM_TEXTURE_GATHER_OFFSET_NV		= 0x8E5E
	MAX_PROGRAM_TEXTURE_GATHER_OFFSET_NV		= 0x8E5F
	MAX_PROGRAM_SUBROUTINE_PARAMETERS_NV		= 0x8F44    # Requires ARB_shader_subroutine
	MAX_PROGRAM_SUBROUTINE_NUM_NV			= 0x8F45    # Requires ARB_shader_subroutine

###############################################################################

# Extension #389
NV_gpu_shader5 enum:
	INT64_NV					= 0x140E
	UNSIGNED_INT64_NV				= 0x140F
	INT8_NV						= 0x8FE0
	INT8_VEC2_NV					= 0x8FE1
	INT8_VEC3_NV					= 0x8FE2
	INT8_VEC4_NV					= 0x8FE3
	INT16_NV					= 0x8FE4
	INT16_VEC2_NV					= 0x8FE5
	INT16_VEC3_NV					= 0x8FE6
	INT16_VEC4_NV					= 0x8FE7
	INT64_VEC2_NV					= 0x8FE9
	INT64_VEC3_NV					= 0x8FEA
	INT64_VEC4_NV					= 0x8FEB
	UNSIGNED_INT8_NV				= 0x8FEC
	UNSIGNED_INT8_VEC2_NV				= 0x8FED
	UNSIGNED_INT8_VEC3_NV				= 0x8FEE
	UNSIGNED_INT8_VEC4_NV				= 0x8FEF
	UNSIGNED_INT16_NV				= 0x8FF0
	UNSIGNED_INT16_VEC2_NV				= 0x8FF1
	UNSIGNED_INT16_VEC3_NV				= 0x8FF2
	UNSIGNED_INT16_VEC4_NV				= 0x8FF3
	UNSIGNED_INT64_VEC2_NV				= 0x8FF5
	UNSIGNED_INT64_VEC3_NV				= 0x8FF6
	UNSIGNED_INT64_VEC4_NV				= 0x8FF7
	FLOAT16_NV					= 0x8FF8
	FLOAT16_VEC2_NV					= 0x8FF9
	FLOAT16_VEC3_NV					= 0x8FFA
	FLOAT16_VEC4_NV					= 0x8FFB
	use ARB_tessellation_shader	    PATCHES

###############################################################################

# Extension #390
NV_shader_buffer_store enum:
	SHADER_GLOBAL_ACCESS_BARRIER_BIT_NV		= 0x00000010
	use VERSION_1_5			    READ_WRITE
	use VERSION_1_5			    WRITE_ONLY

###############################################################################

# Extension #391
NV_tessellation_program5 enum:
	MAX_PROGRAM_PATCH_ATTRIBS_NV			= 0x86D8
	TESS_CONTROL_PROGRAM_NV				= 0x891E
	TESS_EVALUATION_PROGRAM_NV			= 0x891F
	TESS_CONTROL_PROGRAM_PARAMETER_BUFFER_NV	= 0x8C74
	TESS_EVALUATION_PROGRAM_PARAMETER_BUFFER_NV	= 0x8C75

###############################################################################

# Extension #392
NV_vertex_attrib_integer_64bit enum:
	use NV_gpu_shader5		    INT64_NV
	use NV_gpu_shader5		    UNSIGNED_INT64_NV

###############################################################################

# Extension #393
# Reuses SAMPLES enum as COVERAGE_SAMPLES
NV_multisample_coverage enum:
	COVERAGE_SAMPLES_NV				= 0x80A9
	COLOR_SAMPLES_NV				= 0x8E20

###############################################################################

# Extension #394
AMD_name_gen_delete enum:
	DATA_BUFFER_AMD					= 0x9151
	PERFORMANCE_MONITOR_AMD				= 0x9152
	QUERY_OBJECT_AMD				= 0x9153
	VERTEX_ARRAY_OBJECT_AMD				= 0x9154
	SAMPLER_OBJECT_AMD				= 0x9155

###############################################################################

# Extension #395
AMD_debug_output enum:
	MAX_DEBUG_LOGGED_MESSAGES_AMD			= 0x9144
	DEBUG_LOGGED_MESSAGES_AMD			= 0x9145
	DEBUG_SEVERITY_HIGH_AMD				= 0x9146
	DEBUG_SEVERITY_MEDIUM_AMD			= 0x9147
	DEBUG_SEVERITY_LOW_AMD				= 0x9148
	DEBUG_CATEGORY_API_ERROR_AMD			= 0x9149
	DEBUG_CATEGORY_WINDOW_SYSTEM_AMD		= 0x914A
	DEBUG_CATEGORY_DEPRECATION_AMD			= 0x914B
	DEBUG_CATEGORY_UNDEFINED_BEHAVIOR_AMD		= 0x914C
	DEBUG_CATEGORY_PERFORMANCE_AMD			= 0x914D
	DEBUG_CATEGORY_SHADER_COMPILER_AMD		= 0x914E
	DEBUG_CATEGORY_APPLICATION_AMD			= 0x914F
	DEBUG_CATEGORY_OTHER_AMD			= 0x9150

###############################################################################

# Extension #396
NV_vdpau_interop enum:
	SURFACE_STATE_NV				= 0x86EB
	SURFACE_REGISTERED_NV				= 0x86FD
	SURFACE_MAPPED_NV				= 0x8700
	WRITE_DISCARD_NV				= 0x88BE

###############################################################################

# No new tokens
# Extension #397
AMD_transform_feedback3_lines_triangles enum:

###############################################################################

# Extension #398 - GLX_AMD_gpu_association
# Extension #399 - GLX_EXT_create_context_es2_profile
# Extension #400 - WGL_EXT_create_context_es2_profile

###############################################################################

# Extension #401
AMD_depth_clamp_separate enum:
	DEPTH_CLAMP_NEAR_AMD				= 0x901E
	DEPTH_CLAMP_FAR_AMD				= 0x901F

###############################################################################

# Extension #402
EXT_texture_sRGB_decode enum:
	TEXTURE_SRGB_DECODE_EXT				= 0x8A48
	DECODE_EXT					= 0x8A49
	SKIP_DECODE_EXT					= 0x8A4A

###############################################################################

# Extension #403
NV_texture_multisample enum:
	TEXTURE_COVERAGE_SAMPLES_NV			= 0x9045
	TEXTURE_COLOR_SAMPLES_NV			= 0x9046

###############################################################################

# Extension #404
AMD_blend_minmax_factor enum:
	FACTOR_MIN_AMD					= 0x901C
	FACTOR_MAX_AMD					= 0x901D

###############################################################################

# Extension #405
AMD_sample_positions enum:
	SUBSAMPLE_DISTANCE_AMD				= 0x883F

###############################################################################

# Extension #406
EXT_x11_sync_object enum:
	SYNC_X11_FENCE_EXT				= 0x90E1

###############################################################################

# Extension #407 - WGL_NV_DX_interop

###############################################################################

# No new tokens
# Extension #408
AMD_multi_draw_indirect enum:

###############################################################################

# Extension #409
EXT_framebuffer_multisample_blit_scaled enum:
	SCALED_RESOLVE_FASTEST_EXT			= 0x90BA
	SCALED_RESOLVE_NICEST_EXT			= 0x90BB

###############################################################################

# Extension #410
NV_path_rendering enum:
	PATH_FORMAT_SVG_NV				= 0x9070
	PATH_FORMAT_PS_NV				= 0x9071
	STANDARD_FONT_NAME_NV				= 0x9072
	SYSTEM_FONT_NAME_NV				= 0x9073
	FILE_NAME_NV					= 0x9074
	PATH_STROKE_WIDTH_NV				= 0x9075
	PATH_END_CAPS_NV				= 0x9076
	PATH_INITIAL_END_CAP_NV				= 0x9077
	PATH_TERMINAL_END_CAP_NV			= 0x9078
	PATH_JOIN_STYLE_NV				= 0x9079
	PATH_MITER_LIMIT_NV				= 0x907A
	PATH_DASH_CAPS_NV				= 0x907B
	PATH_INITIAL_DASH_CAP_NV			= 0x907C
	PATH_TERMINAL_DASH_CAP_NV			= 0x907D
	PATH_DASH_OFFSET_NV				= 0x907E
	PATH_CLIENT_LENGTH_NV				= 0x907F
	PATH_FILL_MODE_NV				= 0x9080
	PATH_FILL_MASK_NV				= 0x9081
	PATH_FILL_COVER_MODE_NV				= 0x9082
	PATH_STROKE_COVER_MODE_NV			= 0x9083
	PATH_STROKE_MASK_NV				= 0x9084
	PATH_SAMPLE_QUALITY_NV				= 0x9085
	PATH_STROKE_BOUND_NV				= 0x9086
	PATH_STROKE_OVERSAMPLE_COUNT_NV			= 0x9087
	COUNT_UP_NV					= 0x9088
	COUNT_DOWN_NV					= 0x9089
	PATH_OBJECT_BOUNDING_BOX_NV			= 0x908A
	CONVEX_HULL_NV					= 0x908B
	MULTI_HULLS_NV					= 0x908C
	BOUNDING_BOX_NV					= 0x908D
	TRANSLATE_X_NV					= 0x908E
	TRANSLATE_Y_NV					= 0x908F
	TRANSLATE_2D_NV					= 0x9090
	TRANSLATE_3D_NV					= 0x9091
	AFFINE_2D_NV					= 0x9092
	PROJECTIVE_2D_NV				= 0x9093
	AFFINE_3D_NV					= 0x9094
	PROJECTIVE_3D_NV				= 0x9095
	TRANSPOSE_AFFINE_2D_NV				= 0x9096
	TRANSPOSE_PROJECTIVE_2D_NV			= 0x9097
	TRANSPOSE_AFFINE_3D_NV				= 0x9098
	TRANSPOSE_PROJECTIVE_3D_NV			= 0x9099
	UTF8_NV						= 0x909A
	UTF16_NV					= 0x909B
	BOUNDING_BOX_OF_BOUNDING_BOXES_NV		= 0x909C
	PATH_COMMAND_COUNT_NV				= 0x909D
	PATH_COORD_COUNT_NV				= 0x909E
	PATH_DASH_ARRAY_COUNT_NV			= 0x909F
	PATH_COMPUTED_LENGTH_NV				= 0x90A0
	PATH_FILL_BOUNDING_BOX_NV			= 0x90A1
	PATH_STROKE_BOUNDING_BOX_NV			= 0x90A2
	SQUARE_NV					= 0x90A3
	ROUND_NV					= 0x90A4
	TRIANGULAR_NV					= 0x90A5
	BEVEL_NV					= 0x90A6
	MITER_REVERT_NV					= 0x90A7
	MITER_TRUNCATE_NV				= 0x90A8
	SKIP_MISSING_GLYPH_NV				= 0x90A9
	USE_MISSING_GLYPH_NV				= 0x90AA
	PATH_ERROR_POSITION_NV				= 0x90AB
	PATH_FOG_GEN_MODE_NV				= 0x90AC
	ACCUM_ADJACENT_PAIRS_NV				= 0x90AD
	ADJACENT_PAIRS_NV				= 0x90AE
	FIRST_TO_REST_NV				= 0x90AF
	PATH_GEN_MODE_NV				= 0x90B0
	PATH_GEN_COEFF_NV				= 0x90B1
	PATH_GEN_COLOR_FORMAT_NV			= 0x90B2
	PATH_GEN_COMPONENTS_NV				= 0x90B3
	PATH_STENCIL_FUNC_NV				= 0x90B7
	PATH_STENCIL_REF_NV				= 0x90B8
	PATH_STENCIL_VALUE_MASK_NV			= 0x90B9
	PATH_STENCIL_DEPTH_OFFSET_FACTOR_NV		= 0x90BD
	PATH_STENCIL_DEPTH_OFFSET_UNITS_NV		= 0x90BE
	PATH_COVER_DEPTH_FUNC_NV			= 0x90BF
	PATH_DASH_OFFSET_RESET_NV			= 0x90B4
	MOVE_TO_RESETS_NV				= 0x90B5
	MOVE_TO_CONTINUES_NV				= 0x90B6
	CLOSE_PATH_NV					= 0x00
	MOVE_TO_NV					= 0x02
	RELATIVE_MOVE_TO_NV				= 0x03
	LINE_TO_NV					= 0x04
	RELATIVE_LINE_TO_NV				= 0x05
	HORIZONTAL_LINE_TO_NV				= 0x06
	RELATIVE_HORIZONTAL_LINE_TO_NV			= 0x07
	VERTICAL_LINE_TO_NV				= 0x08
	RELATIVE_VERTICAL_LINE_TO_NV			= 0x09
	QUADRATIC_CURVE_TO_NV				= 0x0A
	RELATIVE_QUADRATIC_CURVE_TO_NV			= 0x0B
	CUBIC_CURVE_TO_NV				= 0x0C
	RELATIVE_CUBIC_CURVE_TO_NV			= 0x0D
	SMOOTH_QUADRATIC_CURVE_TO_NV			= 0x0E
	RELATIVE_SMOOTH_QUADRATIC_CURVE_TO_NV		= 0x0F
	SMOOTH_CUBIC_CURVE_TO_NV			= 0x10
	RELATIVE_SMOOTH_CUBIC_CURVE_TO_NV		= 0x11
	SMALL_CCW_ARC_TO_NV				= 0x12
	RELATIVE_SMALL_CCW_ARC_TO_NV			= 0x13
	SMALL_CW_ARC_TO_NV				= 0x14
	RELATIVE_SMALL_CW_ARC_TO_NV			= 0x15
	LARGE_CCW_ARC_TO_NV				= 0x16
	RELATIVE_LARGE_CCW_ARC_TO_NV			= 0x17
	LARGE_CW_ARC_TO_NV				= 0x18
	RELATIVE_LARGE_CW_ARC_TO_NV			= 0x19
	RESTART_PATH_NV					= 0xF0
	DUP_FIRST_CUBIC_CURVE_TO_NV			= 0xF2
	DUP_LAST_CUBIC_CURVE_TO_NV			= 0xF4
	RECT_NV						= 0xF6
	CIRCULAR_CCW_ARC_TO_NV				= 0xF8
	CIRCULAR_CW_ARC_TO_NV				= 0xFA
	CIRCULAR_TANGENT_ARC_TO_NV			= 0xFC
	ARC_TO_NV					= 0xFE
	RELATIVE_ARC_TO_NV				= 0xFF
	BOLD_BIT_NV					= 0x01
	ITALIC_BIT_NV					= 0x02
	GLYPH_WIDTH_BIT_NV				= 0x01
	GLYPH_HEIGHT_BIT_NV				= 0x02
	GLYPH_HORIZONTAL_BEARING_X_BIT_NV		= 0x04
	GLYPH_HORIZONTAL_BEARING_Y_BIT_NV		= 0x08
	GLYPH_HORIZONTAL_BEARING_ADVANCE_BIT_NV		= 0x10
	GLYPH_VERTICAL_BEARING_X_BIT_NV			= 0x20
	GLYPH_VERTICAL_BEARING_Y_BIT_NV			= 0x40
	GLYPH_VERTICAL_BEARING_ADVANCE_BIT_NV		= 0x80
	GLYPH_HAS_KERNING_NV				= 0x100
	FONT_X_MIN_BOUNDS_NV				= 0x00010000
	FONT_Y_MIN_BOUNDS_NV				= 0x00020000
	FONT_X_MAX_BOUNDS_NV				= 0x00040000
	FONT_Y_MAX_BOUNDS_NV				= 0x00080000
	FONT_UNITS_PER_EM_NV				= 0x00100000
	FONT_ASCENDER_NV				= 0x00200000
	FONT_DESCENDER_NV				= 0x00400000
	FONT_HEIGHT_NV					= 0x00800000
	FONT_MAX_ADVANCE_WIDTH_NV			= 0x01000000
	FONT_MAX_ADVANCE_HEIGHT_NV			= 0x02000000
	FONT_UNDERLINE_POSITION_NV			= 0x04000000
	FONT_UNDERLINE_THICKNESS_NV			= 0x08000000
	FONT_HAS_KERNING_NV				= 0x10000000

###############################################################################

# Extension #411
AMD_pinned_memory enum:
	EXTERNAL_VIRTUAL_MEMORY_BUFFER_AMD		= 0x9160

###############################################################################

# Extension #412 - WGL_NV_DX_interop2

###############################################################################

# Extension #413
AMD_stencil_operation_extended enum:
	SET_AMD						= 0x874A
	REPLACE_VALUE_AMD				= 0x874B
	STENCIL_OP_VALUE_AMD				= 0x874C
	STENCIL_BACK_OP_VALUE_AMD			= 0x874D

###############################################################################

# Extension #414 - GLX_EXT_swap_control_tear
# Extension #415 - WGL_EXT_swap_control_tear

###############################################################################

# No new tokens
# Extension #416
AMD_vertex_shader_viewport_index enum:

###############################################################################

# No new tokens
# Extension #417
AMD_vertex_shader_layer enum:

###############################################################################

# No new tokens
# Extension #418
NV_bindless_texture enum:

###############################################################################

# No new tokens
# Extension #419
NV_shader_atomic_float enum:

###############################################################################

# Extension #420
AMD_query_buffer_object enum:
	QUERY_BUFFER_AMD				= 0x9192
	QUERY_BUFFER_BINDING_AMD			= 0x9193
	QUERY_RESULT_NO_WAIT_AMD			= 0x9194
