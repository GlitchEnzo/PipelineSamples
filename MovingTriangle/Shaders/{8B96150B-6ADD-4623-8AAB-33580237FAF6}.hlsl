cbuffer SceneConstantBuffer : register(b0)
{
    float timeSinceStart;
    float padding[63];
};

struct PSInput
{
	float4 position : SV_POSITION;
	float4 color : COLOR;
};

PSInput VSMain(float4 position : POSITION, float4 color : COLOR)
{
	PSInput result;

	position.x += -1.5f + (timeSinceStart % 2.75f);
	result.position = position;
	result.color = color;

	return result;
}
