
varying vec3 vColor;

void main(){
    // // disc
    // float strenth = step(0.5, 1. - distance( gl_PointCoord, vec2( 0.5)));

    // // difuse point pattern
    // float strength = distance( gl_PointCoord, vec2( .5, .5) );
    // strength  *=  2.;
    // // strength -= 1.;
    // strength = 1.- strength;

    // light point pattern ( exponetial diffuse )
    float strength = distance( gl_PointCoord, vec2( .5) );
    strength = 1. - strength ;
    strength = pow(strength, 10.);
    vec3 color = mix( vec3(0.0),vColor, strength);
    gl_FragColor = vec4(color, 1.0);

}