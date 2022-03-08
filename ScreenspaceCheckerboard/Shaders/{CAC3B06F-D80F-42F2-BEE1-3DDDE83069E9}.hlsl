struct PSInput
{
	float4 position : SV_POSITION;
	float2 uvs : TEXCOORD;
};

float4 PSMain(PSInput input) : SV_TARGET
{	
	float Size = 10.0;
    float2 Pos = floor(input.uvs * Size);
    float PatternMask = (Pos.x + Pos.y) % 2.0;
   //float3 PatternColor = PatternMask * float3(1.0, 1.0, 1.0);
   float3 LowColor = float3(0.0, 0.0, 1.0);
   float3 HighColor = float3(1.0, 1.0, 0.0);
   float3 PatternColor = lerp(LowColor, HighColor, PatternMask);
   return float4(PatternColor, 1.0);
}

