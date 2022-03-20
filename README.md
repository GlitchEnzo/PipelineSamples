# Pipeline Samples
Sample projects for [Pipeline](http://pipeline.graphics/)

### ComputeAdder

A compute shader that takes two input buffers of floats, adds them together, and stores them in a result buffer. The result buffer is read-back every frame, so the results are updated in real-time with any changes to the input buffers.

![](/ComputeAdder/ComputeAdder.png)

### MovingTriangle

A single triangle that uses a constant buffer with time to move from the left of the screen to the right and then warp back.

![](/MovingTriangle/MovingTriangle.png)

Based on [HelloConstBuffers](https://github.com/microsoft/DirectX-Graphics-Samples/tree/master/Samples/Desktop/D3D12HelloWorld/src/HelloConstBuffers)

### ScreenspaceCheckerboard

A screenspace quad mesh that renders out a checkerboard pattern using a pixel shader.

![](/ScreenspaceCheckerboard/ScreenspaceCheckerboard.png)

### SimpleMeshShader

A single static triangle rendered using a Mesh Shader instead of a Vertex Shader.

![](/SimpleMeshShader/SimpleMeshShader.png)

### SimpleTriangle

The traditional "Hello World" for computer graphics programmers. A single non-moving triangle with Red, Green, and Blue vertices.

![](/SimpleTriangle/SimpleTriangle.png)

Based on [HelloTriangle](https://github.com/microsoft/DirectX-Graphics-Samples/tree/master/Samples/Desktop/D3D12HelloWorld/src/HelloTriangle)

### SobelTexture

A screenspace quad mesh that applies a Sobel edge detection pixel shader to a texture.

![](/SobelTexture/SobelTexture.png)

Based on [EdgeDetectPixelShader.hlsl](https://github.com/microsoft/DirectX-Graphics-Samples/blob/master/Samples/Desktop/D3D12PipelineStateCache/src/EdgeDetectPixelShader.hlsl)

### SpinningCube

A single unit cube spinning around the Y axis. This demonstrates setting up World, View, & Projection matrices entirely in HLSL.

![](/SpinningCube/SpinningCube.png)
