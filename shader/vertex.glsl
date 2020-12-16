#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;// 法向量
layout (location = 2) in vec2 aTexCoords;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;
out vec3 Normal;
out vec3 FragPos;
out vec2 TexCoords;

void main()
{
    gl_Position = projection * view * model * vec4(aPos, 1.0);
    Normal = mat3(transpose(inverse(model))) * aNormal;// 生成法线矩阵
    FragPos = vec3(model * vec4(aPos, 1.0));// 顶点位置 * 模型矩阵可以转换为世界空间中的顶点位置。
    TexCoords = aTexCoords;
}