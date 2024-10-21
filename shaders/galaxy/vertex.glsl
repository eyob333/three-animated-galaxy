
attribute float scale;
uniform float uSize;

void main(){
    vec4 modelPosition = modelMatrix * vec4( position, 1.);
    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 porjectedPosition = projectionMatrix * viewPosition;
    gl_Position = porjectedPosition;
    gl_PointSize = uSize;
}