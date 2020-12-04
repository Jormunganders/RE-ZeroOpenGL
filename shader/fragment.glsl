#version 330 core
in vec3 Normal;// 当前片段的法向量
in vec3 FragPos;// 世界空间中的顶点位置
out vec4 FragColor;

uniform vec3 objectColor;
uniform vec3 lightColor;
uniform vec3 lightPos;// 光源的位置向量
uniform vec3 viewPos;// 观察者的坐标

void main()
{
    float ambientStrength = 0.5;// 环境光强度
    vec3 ambient = ambientStrength * lightColor;

    vec3 norm = normalize(Normal);// 法线转换为单位向量
    vec3 lightDir = normalize(lightPos - FragPos);// 光源和片段之间的方向向量
    float diff = max(dot(norm, lightDir), 0.0);// 点乘计算当前片段实际的漫反射影响。结果值再乘以光的颜色，得到漫反射分量。
    vec3 diffuse = diff * lightColor;

    float specularStrength = 0.5;//    镜面强度
    vec3 viewDir = normalize(viewPos - FragPos);
    vec3 reflectDir = reflect(-lightDir, norm);
    float spec = pow(max(dot(viewDir, reflectDir), 0.0), 32);
    vec3 specular = specularStrength * spec * lightColor;

    vec3 result = (ambient + diffuse + specular) * objectColor;
    FragColor = vec4(result, 1.0);
}