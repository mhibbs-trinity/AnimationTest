Shader "Custom/SurfaceColorShader" {
	Properties {
		_Color ("Main Color", Color) = (1,.5,.5,1)
		_Texture ("Texture for Mapping", 2D) = "white" {}
		_Float ("Some Float", Float) = 0.5
	}

	SubShader {
		Tags { "RenderType"="Opaque" }
		
		CGPROGRAM
		#pragma surface surf Lambert

		struct Input {
			float4 color : COLOR;
		};

		fixed4 _Color;
		sampler2D _Texture;
		float _Float;

		void surf (Input IN, inout SurfaceOutput o) {
			o.Albedo = _Color;
		}
		ENDCG
	} 
	FallBack "Diffuse"
}
