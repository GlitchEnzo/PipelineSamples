cbuffer SceneConstantBuffer : register(b0)
{
    float timeSinceStart;
    float padding[63];
};

struct VSInput
{
	float4 position : POSITION;
	float3 uv :  TEXCOORD0;
	float3 normal : NORMAL0;
};

struct PSInput
{
	float4 position : SV_POSITION;
	float3 uv :  TEXCOORD0;
	float3 normal : NORMAL0;
};

// Helpful: https://www.braynzarsoft.net/viewtutorial/q16390-transformations-and-world-view-projection-space-matrices

float4x4 XMMatrixLookAtLH(float3 EyePosition, float3 FocusPosition, float3 UpDirection)
{
	float3 R2 = normalize(FocusPosition - EyePosition);
    float3 R0 = normalize(cross(UpDirection, R2));
    float3 R1 = cross(R2, R0);

    float3 NegEyePosition = -EyePosition;
    float3 D0 = dot(R0, NegEyePosition);
    float3 D1 = dot(R1, NegEyePosition);
    float3 D2 = dot(R2, NegEyePosition);

    return float4x4(
    R0.x, R1.x, R2.x, 0.0f,
	R0.y, R1.y, R2.y, 0.0f, 
	R0.z, R1.z, R2.z, 0.0f,
	D0.x, D1.x, D2.x, 1.0f
    );
}

float4x4 XMMatrixRotationY(float angle)
{
	float fSinAngle = sin(angle);
	float fCosAngle = cos(angle);
	
	return float4x4(
	fCosAngle,  0.0f, -fSinAngle, 0.0f,
	0.0f,       1.0,  0.0f,      0.0f, 
	fSinAngle, 0.0f, fCosAngle, 0.0,
	0.0f,       0.0f, 0.0f,      1.0f
	);
}

float4x4 XMMatrixPerspectiveFovLH(float FovAngleY, float AspectRatio, float NearZ, float FarZ)
{
	float h = 1 / tan(FovAngleY * 0.5);
	float w = h / AspectRatio;
	float a = FarZ / (FarZ - NearZ);
	float b = (-NearZ * FarZ) / (FarZ - NearZ);
	
	return float4x4(
	w,     0.0f, 0.0f, 0.0f,
	0.0f,  h,    0.0f, 0.0f, 
	0.0f,  0.0f, a,    1.0,
	0.0f,  0.0f, b,    0.0f
	);
}

PSInput VSMain(VSInput input)
{
	float4x4 world = XMMatrixRotationY(timeSinceStart % 6.28f);
	float4x4 view = XMMatrixLookAtLH(float3(2, 2, 2), float3(0, 0, 0), float3(0, 1, 0));
	float4x4 projection = XMMatrixPerspectiveFovLH(0.25 * 3.14, 1280.0f / 720.0f, 0.01f, 100.0f);
	
	// https://gamedev.net/forums/topic/603245-multiplying-world-view-projection-in-shader/4817908/
	float4 modelSpacePos = float4(input.position.xyz, 1.0f);
	float4 worldSpacePos = mul(modelSpacePos, world);
	float4 viewSpacePos = mul(worldSpacePos, view);
	float4 projectionSpacePos = mul(viewSpacePos, projection);
	
	PSInput output;
	output.position = projectionSpacePos;
	output.uv = input.uv;
	output.normal = input.normal;
	return output;
}
