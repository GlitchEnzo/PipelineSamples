struct PSInput
{
	float4 position : SV_POSITION;
	float4 color : COLOR;
};

[outputtopology("triangle")]
[numthreads(1, 1, 1)]
void MSMain(
	in uint3 groupID : SV_GroupID,
	in uint3 threadInGroup : SV_GroupThreadID,
	out vertices PSInput verts[3],
	out indices uint3 idx[1])
{
	const uint numVertices = 3;
	const uint numPrimitives = 1;
	SetMeshOutputCounts(numVertices, numPrimitives);

	// TODO: Pass in an SRV with the verts instead of hard-coded positions
	verts[0].position = float4(0.0f, 0.25f, 0.0f, 1.0f);
	verts[0].color = float4(1.0f, 0.0f, 0.0f, 1.0f);

	verts[1].position = float4(0.25f, -0.25f, 0.0f, 1.0f);
	verts[1].color = float4(0.0f, 1.0f, 0.0f, 1.0f);

	verts[2].position = float4(-0.25f, -0.25f, 0.0f, 1.0f);
	verts[2].color = float4(0.0f, 0.0f, 1.0f, 0.0f);

	idx[0] = uint3(0, 1, 2);	
}
