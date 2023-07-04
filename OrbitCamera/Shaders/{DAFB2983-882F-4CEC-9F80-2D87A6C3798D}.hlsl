#include "CommonShader"

cbuffer SceneConstantBuffer0 : register(b0)
{
    TimeConstants timeConstants;
};

cbuffer SceneConstantBuffer1 : register(b1)
{
    InputConstants inputConstants;
};

// 64 floats of data to use for whatever
// [0] = camera yaw in radians
// [1] = camera pitch in radians
// [2] = camera distance in world units
RWStructuredBuffer<float> PersistentStorage : register(u0);

[numthreads(1, 1, 1)]
void CSMain(int3 dispatchThreadId : SV_DispatchThreadID)
{
	float cameraYaw = PersistentStorage[0];
	float cameraPitch = PersistentStorage[1];
	float cameraDistance = PersistentStorage[2];

	// only read the input and update values for the first thread
	//if (dispatchThreadId == int3(0, 0, 0))
	{
		// Camera Distance
		if (inputConstants.keyboardInput[VK_Z].x)
		{
			cameraDistance += (timeConstants.deltaTime * -64.0f);
		}
		if (inputConstants.keyboardInput[VK_X].x)
		{
			cameraDistance += (timeConstants.deltaTime * 64.0f);
		}
		cameraDistance += (inputConstants.DeltaWheelY * timeConstants.deltaTime * -0.6f);
		cameraDistance = clamp(cameraDistance, 2.0f, 99999.0f);
		
		// Camera Yaw and Pitch
		if (inputConstants.keyboardInput[VK_LEFT].x)
		{
			cameraYaw += (timeConstants.deltaTime * 2.2f);
		}
		if (inputConstants.keyboardInput[VK_RIGHT].x)
		{
			cameraYaw += (timeConstants.deltaTime * -2.2f);
		}
		
		if(inputConstants.keyboardInput[VK_UP].x)
		{
			cameraPitch += (timeConstants.deltaTime * -2.2f);
		}
		if (inputConstants.keyboardInput[VK_DOWN].x)
		{
			cameraPitch += (timeConstants.deltaTime * 2.2f);
		}
		
		// only read mouse inputs and adjust values when one of the mouse buttons is pressed
		if (inputConstants.LeftButtonIsPressed || inputConstants.RightButtonIsPressed)
		{
			cameraYaw += (inputConstants.DeltaPositionX * timeConstants.deltaTime * 0.2f);
			cameraPitch += (inputConstants.DeltaPositionY * timeConstants.deltaTime * -0.2f);
		}

		//cameraYaw = clamp(cameraYaw, -6.28f, 6.28f);
		cameraPitch = clamp(cameraPitch, -0.785f, 0.785f);

		PersistentStorage[0] = cameraYaw;
		PersistentStorage[1] = cameraPitch;
		PersistentStorage[2] = cameraDistance;
	}
}