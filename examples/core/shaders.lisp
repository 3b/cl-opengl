(in-package #:cl-opengl-examples/core)

(defvar *vertex-format/lit*
  (let ((stride (* 4 6)))
    ;; vec3 pos, vec3 normal
   `((0 3 :float nil ,stride 0)
     (1 3 :float nil ,stride ,(* 4 3)))))

(defvar *vertex-format/tex*
  (let ((stride (* 4 9)))
    ;; vec2 pos, vec2 UV, vec4 color
    `((0 3 :float nil ,stride 0)
      (1 2 :float nil ,stride ,(* 4 3))
      (2 4 :float nil ,stride ,(* 4 5)))))

;;; todo: figure out which version of normal GLSL these shaders would
;;; work with, and separate out the version/precision code (or at
;;; least verify we can use version 300 es when using desktop GL)

(defvar *vertex/lit*
  "#version 300 es
layout (location = 0) in vec4 vPosition;
layout (location = 1) in vec3 vNormal;
layout (location = 2) in vec4 vColor;

uniform mat4 projectionMatrix;
uniform mat4 viewMatrix;
//uniform vec4 eyePos;

uniform mat4 modelMatrix;
uniform mat3 normalMatrix;

smooth out vec3 position;
smooth out vec3 normal;
smooth out vec4 color;

void main() {
  mat4 mv =  viewMatrix * modelMatrix;

  vec4 mvPos = mv * vPosition;
  vec3 eyeDir = -vec3(mvPos);
  vec4 mvpPos = projectionMatrix * mvPos;

  normal = normalMatrix * vNormal;
  position = vec3(mvPos);
  color = vColor;
  gl_Position = mvpPos;
}
")

(defvar *fragment/lit*
  "#version 300 es

precision highp float;

smooth in vec3 position;
smooth in vec3 normal;
smooth in vec4 color;

out vec4 outColor;

// todo: this should probably be a UBO or array
uniform vec3 sceneAmbient;
uniform vec4 light0Pos;
uniform vec3 light0Ambient;
uniform vec3 light0Diffuse;
uniform vec3 light0Speculat;
uniform vec3 light0Emission;
uniform vec3 light0Attenuation;
uniform vec3 light0SpotDirection;
uniform float light0SpotExponent;
uniform float light0SpotCutoff;
uniform float light0Shininess;

//todo (just using color-material for now, with no specular/emission)
//  vec4 matAmbient;
//  vec3 matDiffuse;
//  vec3 matSpecular;
//  vec3 matEmission;
//  float matShininess;

void main() {
  vec4 lightPos = light0Pos;
  vec3 lightAmbient = light0Ambient;
  vec3 lightDiffuse = light0Diffuse;
  float lightSpecular = light0Shininess;
  vec3 lightAttenuation = light0Attenuation;
 // vec3 lightSpotDirection = light0SpotDirection;
 // float lightSpotExponent = light0SpotExponent;
 // float lightSpotCutoff = light0SpotCutoff;
  float lightShininess = light0Shininess;

  vec3 n = normalize(normal);
  vec3 acm = vec3(color); // matAmbient
  vec3 dcm = vec3(color); // matDiffuse
  vec3 scm = vec3(1); // matSpecular
  vec3 ecm = vec3(0); // matEmission
  // eye is at origin, so -position is direction from fragment to eye
  vec3 eye = normalize(-position);

  vec3 v = (lightPos.w==0.0)?normalize(lightPos.xyz):normalize(lightPos.xyz-position);
  float nDotV = max(0.0,dot(n,v));
  vec3 h = normalize (eye + lightPos.xyz);
  float att = 1.0;
  vec3 spec = vec3(0.0);
  float specExponent = 10.0; // matShininess

  if (lightPos.w != 0.0) {
    float d = distance (position.xyz, lightPos.xyz);
    // att = 1.0/dot(vec3(1.0,d,d*d),lightAttenuation);
  }
  // todo: spot

  if (nDotV != 0.0) {
    spec = pow(max(0.0,dot(n,h)),specExponent) * scm * lightSpecular;
  }
  outColor = vec4((ecm
                   + (acm * sceneAmbient)
                   + (att * ((acm * lightAmbient)
                             + (nDotV * dcm * lightDiffuse)
                             + spec)))
                  , color.a);
}
")


(defvar *vertex/tex*
  "#version 300 es
layout (location = 0) in vec4 position;
layout (location = 1) in vec2 texcoord;
layout (location = 2) in vec4 vcolor;

uniform mat4 projectionMatrix;
uniform mat4 viewMatrix;
uniform mat4 modelMatrix;

smooth out vec2 uv;
smooth out vec4 color;

void main() {
  uv = texcoord;
  color = vcolor;
  gl_Position = projectionMatrix * viewMatrix * modelMatrix
              * position;
}
")

(defvar *fragment/tex*
  "#version 300 es

precision highp float;

out vec4 outColor;
smooth in vec2 uv;
smooth in vec4 color;

uniform sampler2D tex;

void main() {
  outColor = color*texture(tex,uv);
}
")
