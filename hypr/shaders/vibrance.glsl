#version 320 es
precision highp float;

in vec2 v_texcoord;
uniform sampler2D tex;
out vec4 fragColor;

void main() {
    vec4 pixColor = texture(tex, v_texcoord);

    vec3 colorBalance = vec3(1.0, 1.0, 0.93); 
    pixColor.rgb = pixColor.rgb * colorBalance;

    vec3 luminance = vec3(0.299, 0.587, 0.114);
    float gray = dot(pixColor.rgb, luminance);
    vec3 satColor = mix(vec3(gray), pixColor.rgb, 1.33);

    // 1.0 = Normal
    // 1.1 = Pekat dikit
    // 1.2 = Pekat banget
    float contrast = 1.06; 
    
    vec3 finalColor = (satColor - 0.5) * contrast + 0.5;

    fragColor = vec4(finalColor, pixColor.a);
}
