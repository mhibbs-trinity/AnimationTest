Shader "Custom/FragVertDiffuseShader" {
	Properties {
		_Color ("Diffuse Color", Color) = (1,0,0,1)
	}
	SubShader {
	
		Pass {
			Tags { "LightMode" = "ForwardBase" }
			Cull Off
		
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			
			#include "UnityCG.cginc"
			
			uniform float4 _LightColor0;
			uniform fixed4 _Color;
			
			struct vertexInput {
				float4 vertex : POSITION;
				float3 normal : NORMAL;
			};
			struct vertexOutput {
				float4 pos : SV_POSITION;
				float4 col : COLOR;
			};
			
			vertexOutput vert(vertexInput IN) {
				vertexOutput OUT;
				float4x4 modelMatrix = _Object2World;
				float4x4 modelMatrixInverse = _World2Object;
				
				float3 normDir = normalize(mul(float4(IN.normal, 0.0), modelMatrixInverse).xyz);
				float3 lightDir = normalize(_WorldSpaceLightPos0.xyz);
				float3 diffuseCol = _LightColor0.rgb * _Color.rgb * max(0.0, dot(normDir, lightDir));
				
				OUT.col = float4(diffuseCol, 1.0);
				OUT.pos = mul(UNITY_MATRIX_MVP, IN.vertex);
				return OUT;
			}
			
			float4 frag(vertexOutput IN) : COLOR {
				return IN.col;
			}

			ENDCG
		}
	}
	//FallBack "Diffuse"
}
