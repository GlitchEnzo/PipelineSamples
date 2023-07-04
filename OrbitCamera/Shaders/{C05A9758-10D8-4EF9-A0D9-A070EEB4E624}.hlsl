struct PSInput
{
	float4 position : SV_POSITION;
	float3 uv :  TEXCOORD0;
	float3 normal : NORMAL0;
};

float4 PSMain(PSInput input) : SV_TARGET
{
	float3 normal = input.normal * 0.5 + 0.5;
	//float3 normal = (input.normal + 1.0f) * 0.5f;
	return float4(normal, 1.0f);
}
