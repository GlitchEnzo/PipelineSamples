struct PSInput
{
	float4 position : SV_POSITION;
	float2 uvs : TEXCOORD;
};

PSInput VSMain(float4 position : POSITION, float2 uvs : TEXCOORD)
{
	PSInput result;

	result.position = position;
	result.uvs = uvs;

	return result;
}

