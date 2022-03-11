struct PSInput
{
	float4 position : SV_POSITION;
	float2 uvs : TEXCOORD;
};

Texture2D g_texture : register(t0);
SamplerState g_sampler : register(s0);

//static const float threshold = 0.015f;    // What do we consider an edge?
static const float threshold = 0.09f;    // What do we consider an edge?
static const float edgeSize = 0.001f;    // The offest to look for neighboring pixels.

static const float2 samplePoints[9] = {
    float2(-edgeSize, edgeSize),
    float2(0.0f, edgeSize),
    float2(edgeSize, edgeSize),
    float2(-edgeSize, 0.0f),
    float2(0.0f, 0.0f),
    float2(edgeSize, edgeSize),
    float2(-edgeSize, -edgeSize),
    float2(0.0f, -edgeSize),
    float2(edgeSize, -edgeSize),
};

float4 EdgeDetect(float2 uv)
{
    //Sobel Kernels
    float xKernel[] = { -1, 0, 1,
        -2, 0, 2,
        -1, 0, 1 };

    float yKernel[] = { 1, 2, 1,
        0, 0, 0,
        -1, -2, -1 };

    float x = 0;
    float y = 0;

    for (int i = 0; i < 9; i++)
    {
        float4 color = g_texture.Sample(g_sampler, uv + samplePoints[i]);
        x += color.x * xKernel[i];
        y += color.x * yKernel[i];
    }

    if ((x * x + y * y) < threshold)
    {
        // If it's not an edge return original color.
        return g_texture.Sample(g_sampler, uv + samplePoints[4]);
    }
    else
    {
        // Make the edge white.
        return float4(0.0f, 0.0f, 0.0f, 1.0f);
    }
}

float4 PSMain(PSInput input) : SV_TARGET
{
// comment
   //return float4(1.0, 1.0, 1.0, 1.0);
   //return g_texture.Sample(g_sampler, input.uvs);
   return EdgeDetect(input.uvs);
}
