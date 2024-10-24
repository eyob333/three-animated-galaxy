
attribute float aScale;
attribute vec3 aRandomness;

uniform float uSize;
uniform float uTime;

varying vec3 vColor;

void main(){
    vec4 modelPosition = modelMatrix * vec4( position, 1.);
    float angle = atan( modelPosition.x, modelPosition.z );
    float distanceToCenter = length( modelPosition.xz );
    float angleOffSet = ( 1./ distanceToCenter) * uTime * 0.2;
    angle += angleOffSet;
    modelPosition.x = cos( angle) * distanceToCenter;
    modelPosition.z = sin( angle) * distanceToCenter;

    modelPosition.xyz += aRandomness;

    vec4 viewPosition = viewMatrix * modelPosition; 
    vec4 porjectedPosition = projectionMatrix * viewPosition;
    gl_Position = porjectedPosition;
    gl_PointSize = uSize * aScale ;
    gl_PointSize *= (1.0 / - viewPosition.z);

    vColor = color;
}