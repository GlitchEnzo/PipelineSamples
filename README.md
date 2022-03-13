# Pipeline Samples
Sample projects for [Pipeline](http://pipeline.graphics/)

### ComputeAdder

A compute shader that takes two input buffers of floats, adds them together, and stores them in a result buffer. The result buffer is read-back every frame, so the results are updated in real-time with any changes to the input buffers.

### MovingTriangle

A single triangle that uses a constant buffer with time to move from the left of the screen to the right and then warp back.

Based on [HelloConstBuffers](https://github.com/microsoft/DirectX-Graphics-Samples/tree/master/Samples/Desktop/D3D12HelloWorld/src/HelloConstBuffers)

### ScreenspaceCheckerboard

A screenspace quad mesh that renders out a checkerboard pattern using a pixel shader.

### SimpleMeshShader

A single static triangle rendered using a Mesh Shader instead of a Vertex Shader.

### SimpleTriangle

The traditional "Hello World" for computer graphics programmers. A single non-moving triangle with Red, Green, and Blue vertices.

Based on [HelloTriangle](https://github.com/microsoft/DirectX-Graphics-Samples/tree/master/Samples/Desktop/D3D12HelloWorld/src/HelloTriangle)

### SobelTexture

A screenspace quad mesh that applies a Sobel edge detection pixel shader to a texture.

Based on [EdgeDetectPixelShader.hlsl](https://github.com/microsoft/DirectX-Graphics-Samples/blob/master/Samples/Desktop/D3D12PipelineStateCache/src/EdgeDetectPixelShader.hlsl)