#version 330 core

struct Material {
    vec3 ambient;// 环境光照
    vec3 diffuse;// 漫反射光照
    vec3 specular;// 镜面光照
    float shininess;//反光度
};

struct Light {
    vec3 position;

    vec3 ambient;
    vec3 diffuse;
    vec3 specular;
};

in vec3 Normal;// 当前片段的法向量
in vec3 FragPos;// 世界空间中的顶点位置
out vec4 FragColor;

uniform vec3 lightPos;// 光源的位置向量
uniform vec3 viewPos;// 观察者的坐标

uniform Material material;
uniform Light light;

void main()
{
    // 环境光
    vec3 ambient =  light.ambient * material.ambient;

    // 漫反射
    vec3 norm = normalize(Normal);// 法线转换为单位向量
    vec3 lightDir = normalize(lightPos - FragPos);// 光源和片段之间的方向向量
    float diff = max(dot(norm, lightDir), 0.0);// 点乘计算当前片段实际的漫反射影响。结果值再乘以光的颜色，得到漫反射分量。
    vec3 diffuse = light.diffuse * (diff * material.diffuse);

    // 镜面光
    vec3 viewDir = normalize(viewPos - FragPos);
    vec3 reflectDir = reflect(-lightDir, norm);
    float spec = pow(max(dot(viewDir, reflectDir), 0.0), material.shininess);
    vec3 specular = light.specular * (spec * material.specular);

    vec3 result = ambient + diffuse + specular;
    FragColor = vec4(result, 1.0);
}