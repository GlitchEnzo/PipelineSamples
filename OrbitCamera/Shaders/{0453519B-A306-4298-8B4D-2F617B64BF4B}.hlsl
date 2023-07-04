#include "CommonShader"

cbuffer SceneConstantBuffer0 : register(b0)
{
    TimeConstants timeConstants;
};

cbuffer SceneConstantBuffer1 : register(b1)
{
    InputConstants inputConstants;
}

struct VSInput
{
	float4 position : POSITION;
	float3 uv :  TEXCOORD0;
	float3 normal : NORMAL0;
	uint vertexid: SV_VertexID;
};

struct PSInput
{
	float4 position : SV_POSITION;
	float3 uv :  TEXCOORD0;
	float3 normal : NORMAL0;
};

// 64 floats of data to use for whatever
// [0] = camera yaw in radians
// [1] = camera pitch in radians
// [2] = camera distance in world units
RWStructuredBuffer<float> PersistentStorage : register(u0);

PSInput VSMain(VSInput input)
{
	//float4x4 world = XMMatrixRotationY(timeSinceStart % 6.28f);
	//float4x4 world = XMMatrixRotationY(0.0f);
	float4x4 world = IDENTITY_MATRIX;

	// TODO: Handle a non-origin lookat/circle/center point

	float cameraYaw = PersistentStorage[0];
	float cameraPitch = PersistentStorage[1];
	float cameraDistance = PersistentStorage[2];

/*
	// only read the input and update values for the first vertex
	if (input.vertexid == 0)
	{
		if (inputConstants.keyboardInput[VK_Z].x)
		{
			cameraDistance += (timeConstants.deltaTime * -8.0f);
		}
		if (inputConstants.keyboardInput[VK_X].x)
		{
			cameraDistance += (timeConstants.deltaTime * 8.0f);
		}
		cameraDistance += (inputConstants.DeltaWheelY * timeConstants.deltaTime * -0.2f);
		cameraDistance = clamp(cameraDistance, 2.0f, 99999.0f);
		
		// only read mouse inputs and adjust values when one of the mouse buttons is pressed
		if (inputConstants.LeftButtonIsPressed || inputConstants.RightButtonIsPressed)
		{
			cameraYaw += (inputConstants.DeltaPositionX * timeConstants.deltaTime * 0.2f);
			cameraPitch += (inputConstants.DeltaPositionY * timeConstants.deltaTime * -0.2f);
			
			//cameraYaw = clamp(cameraYaw, -6.28f, 6.28f);
			cameraPitch = clamp(cameraPitch, -0.785f, 0.785f);
		}

		PersistentStorage[0] = cameraYaw;
		PersistentStorage[1] = cameraPitch;
		PersistentStorage[2] = cameraDistance;
	}
*/
	
	float4x4 cameraMatrixYawPitchRoll = XMMatrixRotationRollPitchYaw(cameraPitch, cameraYaw, 0.0f);
	float4 cameraPos = float4(0, 0, cameraDistance, 1.0f);
	cameraPos = mul(cameraPos, cameraMatrixYawPitchRoll);
	
	float3 lookAtPos = float3(0, 0, 0);
	float3 upVector = float3(0, 1, 0);
	float4x4 view = XMMatrixLookAtLH(cameraPos.xyz, lookAtPos, upVector);
	
	float4x4 projection = XMMatrixPerspectiveFovLH(0.25 * 3.14, 1280.0f / 720.0f, 1.0f, 100000.0f);
	
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