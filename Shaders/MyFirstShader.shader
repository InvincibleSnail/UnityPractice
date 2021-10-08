Shader "TA/MyFirstShader"
{
    Properties
    {
//        [Header(This is Header)][HDR]_Color("MyColor", Color) = (1, 1, 0, 1) // HDR 调节颜色亮度值超过1，该值可配合Bloom效果做出物体泛光的视觉效果
//        _Int("MyInt", Int) = 1 // 伪整型
//        [PowerSlider(3)]_Float_1("MyFloat_1", Range(0, 1))= 0.5 // 基本类型，可用Float代替Int, Range(Min, Max)代替Float变成滑动条
//        [IntRange]_Float_2("MyFloat_2", Range(0, 1)) = 1 // IntRange 只能生成整数
//        [Toggle]_Float_3("MyFloat_3", Range(0, 1)) = 1 // Toggle 0代表关，1代表开
//        [Enum(UnityEngine.Rendering.CullMode)]_Float_4("My_Float_4", Float) = 1 // 枚举类型（下拉列表）
//        _Vector("MyVector", Vector) = (0, 0, 0, 0) // Vector 四维向量 对应 XYZW/RGBA（坐标/颜色）
//        // 2D默认纹理值: white--纯白色, black--纯黑色, gray--灰色图, bump--法线图
//        [NoScaleOffset]_MainTex("2DTexture", 2D) = "white" {} // 2D纹理
//        [Normal]_MainTex_2("2DTexture_2", 2D) = "white" {} // 接收法线贴图
//        _MainTex_3D("3DTexture", 3D) = "" {} // 3D纹理
//        [HideInInspector]_MainTex_CUBE("CUBETexture", CUBE) = ""{} // CUBE纹理
        _Color("Color", Color) = (1, 1, 1, 1)
    }
    SubShader // 可以有多个
    {
        Tags { "TagName1" = "Value1" "TagName2" = "Value2" } // "Queue" = "Background"/"Geometry"/"AlphaTest"/"Transparent"/"Overlay"
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma  fragment frag

            fixed4 _Color;

            struct appdata
            {
                float4 vertex : POSITION;		//顶点
		        float4 tangent : TANGENT;		//切线
		        float3 normal : NORMAL;			//法线
		        float4 texcoord : TEXCOORD0;	//UV1
		        float4 texcoord1 : TEXCOORD1;	//UV2
		        float4 texcoord2 : TEXCOORD2;	//UV3
		        float4 texcoord3 : TEXCOORD3;	//UV4
		        fixed4 color : COLOR;			//顶点色
            };

            struct v2f
            {
                float4 pos:SV_POSITION;
                float2 uv:TEXCOORD;
            };

            v2f vert(appdata v)
            {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                return o;
            }

            // 自定义checker
            fixed checker (float2 uv)
            {
                float2 repeatUV = uv*10;
                float2 c = floor(repeatUV) / 2;
                float checker = frac(c.x + c.y) * 2;
                return checker;
            }

            // float4 vert (float4 vertex : POSITION) : SV_POSITION
            // {
            //     return UnityObjectToClipPos(vertex);
            // }

            float4 frag(v2f i) : SV_Target
            {
                fixed col = checker(i.uv);
                return _Color;
            }

            ENDCG
        }
    }
    FallBack "Diffuse" // 备胎，防止机器不支持此shader的备用shader
    CustomEditor "EditorName" // 自定义properties面板
}