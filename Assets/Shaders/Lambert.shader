Shader "custom/lambert"
{
    Properties
    {
        _MainColor("Albedo", Color)=(1, 1, 1, 1)
        _FalloffDifusse("Falloff Diffuse", Range(0.0,0.5))=0.5
    }
    Subshader
    {
        Tags
        {
            "RenderType" = "Opaque"
            "Queue" = "Geometry"
        }

        CGPROGRAM
        #pragma surface surf Duffese

        float _FalloffDifusse;

        half4 LightingDuffese(SurfaceOutput s, half3 lightDir, half atten) 
        {
            half4 c=half4(0,0,0,0);
            half Ndotl = dot (s.Normal,lightDir)* _FalloffDifusse + _FalloffDifusse;

            c.rgb = s.Albedo * _LightColor0.rgb * Ndotl * atten;
            c.a= s.Albedo;
            return c;
        }
        fixed4 _MainColor;

        struct Input
        {
            fixed3 color;
        };

        void surf(Input IN,inout SurfaceOutput o)
        {
            o.Albedo = _MainColor.rgb;

        }

        ENDCG
    }
}
