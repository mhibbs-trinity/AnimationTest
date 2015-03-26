Shader "Custom/FragVertColorShader" {
	Properties {
		_Color ("Diffuse Color", Color) = (1,0,0,1)
	}
	SubShader {
		Pass {
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			fixed4 _Color;
			
			float4 vert(float4 vertexPos:POSITION):SV_POSITION {
				return mul(UNITY_MATRIX_MVP, vertexPos);
			}
			
			float4 frag(void) : COLOR {
				return float4(1, 1, 0, 1);
			}

			ENDCG
		}
	}
	FallBack "Diffuse"
}
