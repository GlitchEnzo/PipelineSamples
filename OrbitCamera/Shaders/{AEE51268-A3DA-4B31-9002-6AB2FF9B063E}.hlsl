// CONSTANT BUFFERS

struct TimeConstants
{
	float timeSinceStart;
    float deltaTime;
    float padding[62];
}; // 256 bytes

struct InputConstants
{
	int4 keyboardInput[256];
	
	// 1024 floats. 256 byte boundary. no padding needed
    
    int LeftButtonIsPressed;
	int LeftButtonWasPressedThisFrame;
	int LeftButtonWasReleasedThisFrame;
	int RightButtonIsPressed;
	int RightButtonWasPressedThisFrame;
	int RightButtonWasReleasedThisFrame;
	int MiddleButtonIsPressed;
	int MiddleButtonWasPressedThisFrame;
	int MiddleButtonWasReleasedThisFrame;
	int PositionX;
	int PositionY;
	int WheelX;
	int WheelY;
	int DeltaPositionX;
	int DeltaPositionY;
	int DeltaWheelX;
	int DeltaWheelY;
	
	// 1041 floats. Next 256 byte boundary is at 1088 floats. Need 47 floats of padding.
	
	float _padding2[47];
}; // 4352 bytes (256 * 17)

struct TimeAndInputConstants
{
    float timeSinceStart;
    float deltaTime;
    float2 _padding1;
    
    // need to start an array at a 16 byte (float4) boundary start
    int4 keyboardInput[256];
    
    //float _padding2[60];
    
    int LeftButtonIsPressed;
	int LeftButtonWasPressedThisFrame;
	int LeftButtonWasReleasedThisFrame;
	int RightButtonIsPressed;
	int RightButtonWasPressedThisFrame;
	int RightButtonWasReleasedThisFrame;
	int MiddleButtonIsPressed;
	int MiddleButtonWasPressedThisFrame;
	int MiddleButtonWasReleasedThisFrame;
	int PositionX;
	int PositionY;
	int WheelX;
	int WheelY;
	
	float _padding2[47];
}; // 4352 bytes (256 * 17) (1088 floats) (272 float4s)

// INPUT

// https://learn.microsoft.com/en-us/windows/win32/inputdev/virtual-key-codes

#define VK_BACK			0x08	//BACKSPACE key
#define VK_TAB			0x09	//TAB key
#define VK_RETURN		0x0D	//ENTER key
#define VK_SHIFT		0x10	//SHIFT key
#define VK_CONTROL		0x11	//CTRL key
#define VK_MENU			0x12	//ALT key
#define VK_PAUSE		0x13	//PAUSE key
#define VK_CAPITAL		0x14	//CAPS LOCK key
#define VK_ESCAPE		0x1B	//ESC key
#define VK_SPACE		0x20	//SPACEBAR
#define VK_PRIOR		0x21	//PAGE UP key
#define VK_NEXT			0x22	//PAGE DOWN key
#define VK_END			0x23	//END key
#define VK_HOME			0x24	//HOME key
#define VK_LEFT			0x25	//LEFT ARROW key
#define VK_UP			0x26	//UP ARROW key
#define VK_RIGHT		0x27	//RIGHT ARROW key
#define VK_DOWN			0x28	//DOWN ARROW key
#define VK_SNAPSHOT		0x2C	//PRINT SCREEN key
#define VK_INSERT		0x2D	//INS key
#define VK_DELETE		0x2E	//DEL key
#define VK_0			0x30	//0 key
#define VK_1			0x31	//1 key
#define VK_2			0x32	//2 key
#define VK_3			0x33	//3 key
#define VK_4			0x34	//4 key
#define VK_5			0x35	//5 key
#define VK_6			0x36	//6 key
#define VK_7			0x37	//7 key
#define VK_8			0x38	//8 key
#define VK_9			0x39	//9 key
#define VK_A			0x41	//A key
#define VK_B			0x42	//B key
#define VK_C			0x43	//C key
#define VK_D			0x44	//D key
#define VK_E			0x45	//E key
#define VK_F			0x46	//F key
#define VK_G			0x47	//G key
#define VK_H			0x48	//H key
#define VK_I			0x49	//I key
#define VK_J			0x4A	//J key
#define VK_K			0x4B	//K key
#define VK_L			0x4C	//L key
#define VK_M			0x4D	//M key
#define VK_N			0x4E	//N key
#define VK_O			0x4F	//O key
#define VK_P			0x50	//P key
#define VK_Q			0x51	//Q key
#define VK_R			0x52	//R key
#define VK_S			0x53	//S key
#define VK_T			0x54	//T key
#define VK_U			0x55	//U key
#define VK_V			0x56	//V key
#define VK_W			0x57	//W key
#define VK_X			0x58	//X key
#define VK_Y			0x59	//Y key
#define VK_Z			0x5A	//Z key
#define VK_LWIN			0x5B	//Left Windows key (Natural keyboard)
#define VK_RWIN			0x5C	//Right Windows key (Natural keyboard)
#define VK_NUMPAD0		0x60	//Numeric keypad 0 key
#define VK_NUMPAD1		0x61	//Numeric keypad 1 key
#define VK_NUMPAD2		0x62	//Numeric keypad 2 key
#define VK_NUMPAD3		0x63	//Numeric keypad 3 key
#define VK_NUMPAD4		0x64	//Numeric keypad 4 key
#define VK_NUMPAD5		0x65	//Numeric keypad 5 key
#define VK_NUMPAD6		0x66	//Numeric keypad 6 key
#define VK_NUMPAD7		0x67	//Numeric keypad 7 key
#define VK_NUMPAD8		0x68	//Numeric keypad 8 key
#define VK_NUMPAD9		0x69	//Numeric keypad 9 key
#define VK_MULTIPLY		0x6A	//Multiply key
#define VK_ADD			0x6B	//Add key
#define VK_SEPARATOR	0x6C	//Separator key
#define VK_SUBTRACT		0x6D	//Subtract key
#define VK_DECIMAL		0x6E	//Decimal key
#define VK_DIVIDE		0x6F	//Divide key
#define VK_F1			0x70	//F1 key
#define VK_F2			0x71	//F2 key
#define VK_F3			0x72	//F3 key
#define VK_F4			0x73	//F4 key
#define VK_F5			0x74	//F5 key
#define VK_F6			0x75	//F6 key
#define VK_F7			0x76	//F7 key
#define VK_F8			0x77	//F8 key
#define VK_F9			0x78	//F9 key
#define VK_F10			0x79	//F10 key
#define VK_F11			0x7A	//F11 key
#define VK_F12			0x7B	//F12 key
#define VK_F13			0x7C	//F13 key
#define VK_F14			0x7D	//F14 key
#define VK_F15			0x7E	//F15 key
#define VK_F16			0x7F	//F16 key
#define VK_F17			0x80	//F17 key
#define VK_F18			0x81	//F18 key
#define VK_F19			0x82	//F19 key
#define VK_F20			0x83	//F20 key
#define VK_F21			0x84	//F21 key
#define VK_F22			0x85	//F22 key
#define VK_F23			0x86	//F23 key
#define VK_F24			0x87	//F24 key
#define VK_NUMLOCK		0x90	//NUM LOCK key
#define VK_SCROLL		0x91	//SCROLL LOCK key
#define VK_LSHIFT		0xA0	//Left SHIFT key
#define VK_RSHIFT		0xA1	//Right SHIFT key
#define VK_LCONTROL		0xA2	//Left CONTROL key
#define VK_RCONTROL		0xA3	//Right CONTROL key
#define VK_LMENU		0xA4	//Left ALT key
#define VK_RMENU		0xA5	//Right ALT key
#define VK_OEM_1		0xBA	//Used for miscellaneous characters; it can vary by keyboard. For the US standard keyboard, the ';:' key
#define VK_OEM_PLUS		0xBB	//For any country/region, the '+' key
#define VK_OEM_COMMA	0xBC	//For any country/region, the ',' key
#define VK_OEM_MINUS	0xBD	//For any country/region, the '-' key
#define VK_OEM_PERIOD	0xBE	//For any country/region, the '.' key
#define VK_OEM_2		0xBF	//Used for miscellaneous characters; it can vary by keyboard. For the US standard keyboard, the '/?' key
#define VK_OEM_3		0xC0	//Used for miscellaneous characters; it can vary by keyboard. For the US standard keyboard, the '`~' key
#define VK_OEM_4		0xDB	//Used for miscellaneous characters; it can vary by keyboard. For the US standard keyboard, the '[{' key
#define VK_OEM_5		0xDC	//Used for miscellaneous characters; it can vary by keyboard. For the US standard keyboard, the '\|' key
#define VK_OEM_6		0xDD	//Used for miscellaneous characters; it can vary by keyboard. For the US standard keyboard, the ']}' key
#define VK_OEM_7		0xDE	//Used for miscellaneous characters; it can vary by keyboard. For the US standard keyboard, the 'single-quote/double-quote' key
#define VK_OEM_8		0xDF	//Used for miscellaneous characters; it can vary by keyboard.
#define VK_OEM_102		0xE2	//The <> keys on the US standard keyboard, or the \\| key on the non-US 102-key keyboard

// MATRIX MATH

// See here: https://github.com/microsoft/DirectXMath/blob/main/Inc/DirectXMathMatrix.inl
// Helpful: https://www.braynzarsoft.net/viewtutorial/q16390-transformations-and-world-view-projection-space-matrices
// And: https://gist.github.com/mattatz/86fff4b32d198d0928d0fa4ff32cf6fa

#define IDENTITY_MATRIX float4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1)

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

float4x4 XMMatrixRotationX(float angle)
{
	float fSinAngle = sin(angle);
	float fCosAngle = cos(angle);
	
	return float4x4(
		1.0f,  0.0f,      0.0f,      0.0f,
		0.0f,  fCosAngle, fSinAngle, 0.0f, 
		0.0f, -fSinAngle, fCosAngle, 0.0,
		0.0f,  0.0f,      0.0f,      1.0f
	);
}

float4x4 XMMatrixRotationY(float angle)
{
	float fSinAngle = sin(angle);
	float fCosAngle = cos(angle);
	
	return float4x4(
		fCosAngle,  0.0f, -fSinAngle, 0.0f,
		0.0f,       1.0f,  0.0f,      0.0f, 
		fSinAngle,  0.0f,  fCosAngle, 0.0,
		0.0f,       0.0f,  0.0f,      1.0f
	);
}

float4x4 XMMatrixRotationRollPitchYaw(float Pitch, float Yaw, float Roll)
{
    float cp = cos(Pitch);
    float sp = sin(Pitch);

    float cy = cos(Yaw);
    float sy = sin(Yaw);

    float cr = cos(Roll);
    float sr = sin(Roll);

    return float4x4(
    cr * cy + sr * sp * sy,
    sr * cp,
    sr * sp * cy - cr * sy,
    0.0f,
	
    cr * sp * sy - sr * cy,
    cr * cp,
    sr * sy + cr * sp * cy,
    0.0f,
	
    cp * sy,
    -sp,
    cp * cy,
    0.0f,
	
    0.0f,
    0.0f,
    0.0f,
    1.0f
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
