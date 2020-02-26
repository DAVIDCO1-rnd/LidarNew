Shader "LidarSensor/Depth"
{
	SubShader
	{
		Pass
		{
			CGPROGRAM

			#pragma vertex vert  
			#pragma fragment frag

			struct vertexInput
			{
				float4 vertex : POSITION;
			};

			struct vertexOutput
			{
				float4 pos : SV_POSITION;
				float4 position_in_world_space : TEXCOORD0;
			};

			vertexOutput vert(vertexInput input)
			{
				vertexOutput output;

				output.pos = UnityObjectToClipPos(input.vertex);
				output.position_in_world_space = mul(unity_ObjectToWorld, input.vertex);
				return output;
			}

			float visualizeDepth(float depthVal)
			{
				float maxVal = 6.8f;
				float minVal = 2.0f;
				float visualizeDepthVal = (depthVal - minVal) / (maxVal - minVal);
				return visualizeDepthVal;
			}

			float4 frag(vertexOutput input) : COLOR
			{
				float dist = length(input.position_in_world_space.xyz);
			// computes the distance between the fragment position 
			// and the origin (the 4th coordinate should always be 
			// 1 for points).
			//if (dist < 7)
			//{
			//	return float4(1.0, 0.0, 0.0, 1.0);
			//}
			//else
			//{
			//	return float4(0.0, 1.0, 0.0, 1.0);
			//}
			float visualizeDepthVal = visualizeDepth(dist);
			return float4(visualizeDepthVal, visualizeDepthVal, visualizeDepthVal, 1.0);

			}

		ENDCG
	}
	}
}
