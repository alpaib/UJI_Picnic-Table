// Made with Amplify Shader Editor v1.9.3.3
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "ALP/Billboard Cross Wind"
{
	Properties
	{
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[DE_DrawerCategory(ALPHA CLIPPING,true,_GlancingClipMode,0,0)]_CATEGORY_ALPHACLIPPING("CATEGORY_ALPHACLIPPING", Float) = 0
		[DE_DrawerToggleLeft]_GlancingClipMode("Enable Clip Glancing Angle", Float) = 0
		[DE_DrawerSliderSimple(_AlphaRemapMin, _AlphaRemapMax,0, 1)]_AlphaRemap("Alpha Remapping", Vector) = (0,1,0,0)
		[HideInInspector]_AlphaRemapMin("AlphaRemapMin", Float) = 0
		[HideInInspector]_AlphaRemapMax("AlphaRemapMax", Float) = 1
		[HideInInspector]_Cutoff("Cutoff", Float) = 0
		[HideInInspector]_AlphaCutoffShadow("_AlphaCutoffShadow", Range( 0 , 1)) = 0.5
		[DE_DrawerSpace(10)]_SPACE_ALPHACLIP("SPACE_ALPHACLIP", Float) = 0
		[DE_DrawerCategory(SURFACE INPUTS,true,_MainTex,0,0)]_CATEGORY_SURFACEINPUTS("CATEGORY_SURFACE INPUTS", Float) = 1
		_BaseColor("Base Color", Color) = (1,1,1,0)
		_Brightness("Brightness", Range( 0 , 2)) = 1
		[DE_DrawerTextureSingleLine]_MainTex("Base Map", 2D) = "white" {}
		[DE_DrawerFloatEnum(UV0 _UV1 _UV2 _UV3)]_UVMode("UV Mode", Float) = 0
		[DE_DrawerTilingOffset]_MainUVs("Main UVs", Vector) = (1,1,0,0)
		[Space(10)]_MetallicStrength("Metallic Strength", Range( 0 , 1)) = 0
		_SmoothnessStrength("Smoothness Strength", Range( 0 , 1)) = 0
		[DE_DrawerToggleNoKeyword]_SmoothnessFresnelEnable("Enable Fresnel", Float) = 0
		_SmoothnessFresnelScale("Fresnel Scale", Range( 0 , 3)) = 1.1
		_SmoothnessFresnelPower("Fresnel Power", Range( 0 , 20)) = 10
		_OcclusionStrengthAO("Occlusion Strength", Range( 0 , 1)) = 0
		[Normal][DE_DrawerTextureSingleLine]_BumpMap("Normal Map", 2D) = "bump" {}
		_NormalStrength("Normal Strength", Float) = 1
		[DE_DrawerSpace(10)]_SPACE_SURFACEINPUTS("SPACE_SURFACE INPUTS", Float) = 0
		[DE_DrawerCategory(WIND,true,_WindEnable,0,0)]_CATEGORY_WIND("CATEGORY_WIND", Float) = 0
		[DE_DrawerToggleLeft]_WindEnable("ENABLE WIND", Float) = 0
		[DE_DrawerFloatEnum(Global _Local)]_WindEnableMode("Enable Wind Mode", Float) = 0
		[Header(WIND GLOBAL)]_WindGlobalIntensity("Wind Intensity", Float) = 1
		[Header(WIND LOCAL)]_WindLocalIntensity("Local Wind Intensity", Float) = 1
		_WindLocalPulseFrequency("Local Wind Pulse Frequency", Float) = 0.1
		_WindLocalRandomOffset("Local Random Offset", Float) = 0.2
		_WindLocalDirection("Local Wind Direction", Range( 0 , 360)) = 0
		[DE_DrawerSpace(10)]_SPACE_WIND("SPACE_WIND", Float) = 0

		[HideInInspector] _RenderQueueType("Render Queue Type", Float) = 1
		[HideInInspector][ToggleUI] _AddPrecomputedVelocity("Add Precomputed Velocity", Float) = 1
		[HideInInspector][ToggleUI] _SupportDecals("Support Decals", Float) = 1.0
		[HideInInspector] _StencilRef("Stencil Ref", Int) = 0 // StencilUsage.Clear
		[HideInInspector] _StencilWriteMask("Stencil Write Mask", Int) = 3 // StencilUsage.RequiresDeferredLighting | StencilUsage.SubsurfaceScattering
		[HideInInspector] _StencilRefDepth("Stencil Ref Depth", Int) = 0 // Nothing
		[HideInInspector] _StencilWriteMaskDepth("Stencil Write Mask Depth", Int) = 8 // StencilUsage.TraceReflectionRay
		[HideInInspector] _StencilRefMV("Stencil Ref MV", Int) = 32 // StencilUsage.ObjectMotionVector
		[HideInInspector] _StencilWriteMaskMV("Stencil Write Mask MV", Int) = 32 // StencilUsage.ObjectMotionVector
		[HideInInspector] _StencilRefDistortionVec("Stencil Ref Distortion Vec", Int) = 4 				// DEPRECATED
		[HideInInspector] _StencilWriteMaskDistortionVec("Stencil Write Mask Distortion Vec", Int) = 4	// DEPRECATED
		[HideInInspector] _StencilWriteMaskGBuffer("Stencil Write Mask GBuffer", Int) = 3 // StencilUsage.RequiresDeferredLighting | StencilUsage.SubsurfaceScattering
		[HideInInspector] _StencilRefGBuffer("Stencil Ref GBuffer", Int) = 2 // StencilUsage.RequiresDeferredLighting
		[HideInInspector] _ZTestGBuffer("ZTest GBuffer", Int) = 4
		[HideInInspector][ToggleUI] _RequireSplitLighting("Require Split Lighting", Float) = 0
		[HideInInspector][ToggleUI] _ReceivesSSR("Receives SSR", Float) = 1
		[HideInInspector][ToggleUI] _ReceivesSSRTransparent("Receives SSR Transparent", Float) = 0
		[HideInInspector] _SurfaceType("Surface Type", Float) = 0
		[HideInInspector] _BlendMode("Blend Mode", Float) = 0
		[HideInInspector] _SrcBlend("Src Blend", Float) = 1
		[HideInInspector] _DstBlend("Dst Blend", Float) = 0
		[HideInInspector] _DstBlend2("__dst2", Float) = 0
		[HideInInspector] _AlphaSrcBlend("Alpha Src Blend", Float) = 1
		[HideInInspector] _AlphaDstBlend("Alpha Dst Blend", Float) = 0
		[HideInInspector][ToggleUI] _ZWrite("ZWrite", Float) = 1
		[HideInInspector][ToggleUI] _TransparentZWrite("Transparent ZWrite", Float) = 0
		[HideInInspector] _CullMode("Cull Mode", Float) = 2
		[HideInInspector] _TransparentSortPriority("Transparent Sort Priority", Float) = 0
		[HideInInspector][ToggleUI] _EnableFogOnTransparent("Enable Fog", Float) = 1
		[HideInInspector] _CullModeForward("Cull Mode Forward", Float) = 2 // This mode is dedicated to Forward to correctly handle backface then front face rendering thin transparent
		[HideInInspector][Enum(UnityEngine.Rendering.HighDefinition.TransparentCullMode)] _TransparentCullMode("Transparent Cull Mode", Int) = 2 // Back culling by default
		[HideInInspector] _ZTestDepthEqualForOpaque("ZTest Depth Equal For Opaque", Int) = 4 // Less equal
		[HideInInspector][Enum(UnityEngine.Rendering.CompareFunction)] _ZTestTransparent("ZTest Transparent", Int) = 4 // Less equal
		[HideInInspector][ToggleUI] _TransparentBackfaceEnable("Transparent Backface Enable", Float) = 0
		[HideInInspector][ToggleUI] _AlphaCutoffEnable("Alpha Cutoff Enable", Float) = 0
		[HideInInspector][ToggleUI] _UseShadowThreshold("Use Shadow Threshold", Float) = 1
		[HideInInspector][ToggleUI] _DoubleSidedEnable("Double Sided Enable", Float) = 1
		[HideInInspector][Enum(Flip, 0, Mirror, 1, None, 2)] _DoubleSidedNormalMode("Double Sided Normal Mode", Float) = 2
		[HideInInspector] _DoubleSidedConstants("DoubleSidedConstants", Vector) = (1,1,-1,0)

		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25

		[HideInInspector][ToggleUI] _TransparentWritingMotionVec("Transparent Writing MotionVec", Float) = 0
		[HideInInspector][ToggleUI] _PerPixelSorting("_PerPixelSorting", Float) = 0.0
		[HideInInspector][Enum(UnityEngine.Rendering.HighDefinition.OpaqueCullMode)] _OpaqueCullMode("Opaque Cull Mode", Int) = 2 // Back culling by default
		[HideInInspector][ToggleUI] _EnableBlendModePreserveSpecularLighting("Enable Blend Mode Preserve Specular Lighting", Float) = 1
		[HideInInspector] _EmissionColor("Color", Color) = (1, 1, 1)

		[HideInInspector][NoScaleOffset] unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}

		[HideInInspector][Enum(Auto, 0, On, 1, Off, 2)] _DoubleSidedGIMode("Double sided GI mode", Float) = 0

		[HideInInspector][ToggleUI] _AlphaToMaskInspectorValue("_AlphaToMaskInspectorValue", Float) = 0 // Property used to save the alpha to mask state in the inspector
        [HideInInspector][ToggleUI] _AlphaToMask("__alphaToMask", Float) = 0

		//_Refrac ( "Refraction Model", Float) = 0
        [HideInInspector][ToggleUI]_DepthOffsetEnable("Boolean", Float) = 1
        [HideInInspector][ToggleUI]_ConservativeDepthOffsetEnable("Boolean", Float) = 1
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="HDRenderPipeline" "RenderType"="Opaque" "Queue"="Geometry" }

		HLSLINCLUDE
		#pragma target 4.5
		#pragma exclude_renderers glcore gles gles3 ps4 ps5 

		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Filtering.hlsl"

		struct GlobalSurfaceDescription // GBuffer Forward META TransparentBackface
		{
			float3 BaseColor;
			float3 Normal;
			float3 BentNormal;
			float3 Specular;
			float CoatMask;
			float Metallic;
			float3 Emission;
			float Smoothness;
			float Occlusion;
			float Alpha;
			float AlphaClipThreshold;
			float AlphaClipThresholdShadow;
			float AlphaClipThresholdDepthPrepass;
			float AlphaClipThresholdDepthPostpass;
			float SpecularOcclusion;
			float SpecularAAScreenSpaceVariance;
			float SpecularAAThreshold;
			float RefractionIndex;
			float3 RefractionColor;
			float RefractionDistance;
			float DiffusionProfile;
			float TransmissionMask;
			float Thickness;
			float SubsurfaceMask;
			float Anisotropy;
			float3 Tangent;
			float IridescenceMask;
			float IridescenceThickness;
			float3 BakedGI;
			float3 BakedBackGI;
			float DepthOffset;
			float4 VTPackedFeedback;
		};

		struct AlphaSurfaceDescription // ShadowCaster
		{
			float3 Emission;
			float Alpha;
			float AlphaClipThreshold;
			float AlphaClipThresholdShadow;
			float3 BakedGI;
			float3 BakedBackGI;
			float DepthOffset;
			float4 VTPackedFeedback;
		};

		struct SceneSurfaceDescription // SceneSelection
		{
		    float3 Emission;
			float Alpha;
			float AlphaClipThreshold;
			float AlphaClipThresholdShadow;
			float RefractionIndex;
			float3 RefractionColor;
			float RefractionDistance;
			float3 BakedGI;
			float3 BakedBackGI;
			float DepthOffset;
			float4 VTPackedFeedback;
		};

		struct PrePassSurfaceDescription // DepthPrePass
		{
			float3 Normal;
			float3 Emission;
			float Smoothness;
			float Alpha;
			float AlphaClipThreshold;
			float AlphaClipThresholdShadow;
			float AlphaClipThresholdDepthPrepass;
			float3 BakedGI;
			float3 BakedBackGI;
			float DepthOffset;
			float4 VTPackedFeedback;
		};

		struct PostPassSurfaceDescription //DepthPostPass
		{
			float3 Emission;
			float Alpha;
			float AlphaClipThreshold;
			float AlphaClipThresholdShadow;
			float AlphaClipThresholdDepthPostpass;
			float3 BakedGI;
			float3 BakedBackGI;
			float DepthOffset;
			float4 VTPackedFeedback;
		};

		struct SmoothSurfaceDescription // MotionVectors DepthOnly
		{
			float3 Normal;
			float3 Emission;
			float Smoothness;
			float Alpha;
			float AlphaClipThreshold;
			float AlphaClipThresholdShadow;
			float3 BakedGI;
			float3 BakedBackGI;
			float DepthOffset;
			float4 VTPackedFeedback;
		};

        struct PickingSurfaceDescription //Picking
		{
            float3 BentNormal;
			float3 Emission;
			float Alpha;
			float AlphaClipThreshold;
			float AlphaClipThresholdShadow;
			float3 BakedGI;
			float3 BakedBackGI;
			float DepthOffset;
			float4 VTPackedFeedback;

			float3 ObjectSpaceNormal;
			float3 WorldSpaceNormal;
			float3 TangentSpaceNormal;
			float3 ObjectSpaceViewDirection;
			float3 WorldSpaceViewDirection;
			float3 ObjectSpacePosition;
		};

		#ifndef ASE_TESS_FUNCS
		#define ASE_TESS_FUNCS
		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}

		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlaneASE (float3 pos, float4 plane)
		{
			return dot (float4(pos,1.0f), plane);
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlaneASE(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlaneASE(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlaneASE(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlaneASE(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		#endif //ASE_TESS_FUNCS
		ENDHLSL

		
		Pass
		{
			
			Name "GBuffer"
			Tags { "LightMode"="GBuffer" }

			Cull [_CullMode]
			ZTest [_ZTestGBuffer]

			Stencil
			{
				Ref [_StencilRefGBuffer]
				WriteMask [_StencilWriteMaskGBuffer]
				Comp Always
				Pass Replace
			}


			HLSLPROGRAM
            #define ASE_NEED_CULLFACE 1
            #pragma shader_feature_local _ _DOUBLESIDED_ON
            #pragma shader_feature_local_fragment _ _DISABLE_DECALS
            #define _SPECULAR_OCCLUSION_FROM_AO 1
            #pragma multi_compile_instancing
            #pragma instancing_options renderinglayer
            #pragma shader_feature_local _ _ALPHATEST_ON
            #define _ALPHATEST_SHADOW_ON 1
            #pragma multi_compile _ LOD_FADE_CROSSFADE
            #define _AMBIENT_OCCLUSION 1
            #define HAVE_MESH_MODIFICATION
            #define ASE_SRP_VERSION 170002
            #define ASE_USING_SAMPLING_MACROS 1

            #pragma multi_compile _ DOTS_INSTANCING_ON

            #pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
            #pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC _TRANSPARENT_REFRACTIVE_SORT
            #pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT

			#pragma multi_compile_fragment _ RENDERING_LAYERS
            #pragma multi_compile_fragment _ SHADOWS_SHADOWMASK
            #pragma multi_compile _ DEBUG_DISPLAY
            #pragma multi_compile _ LIGHTMAP_ON
            #pragma multi_compile _ DIRLIGHTMAP_COMBINED
            #pragma multi_compile_fragment _ PROBE_VOLUMES_L1 PROBE_VOLUMES_L2
            #pragma multi_compile _ DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fragment DECALS_OFF DECALS_3RT DECALS_4RT
            #pragma multi_compile_fragment _ DECAL_SURFACE_GRADIENT
            #pragma multi_compile _ USE_LEGACY_LIGHTMAPS

			#pragma vertex Vert
			#pragma fragment Frag

			#define SHADERPASS SHADERPASS_GBUFFER

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

            //#if !defined(SHADER_STAGE_RAY_TRACING) && SHADERPASS != SHADERPASS_RAYTRACING_GBUFFER && SHADERPASS != SHADERPASS_FULL_SCREEN_DEBUG
            //#define FRAG_INPUTS_ENABLE_STRIPPING
            //#endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
                #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif

            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
                #define RAYTRACING_SHADER_GRAPH_LOW
            #endif

            #ifndef SHADER_UNLIT
            #if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
                #define VARYINGS_NEED_CULLFACE
            #endif
            #endif

			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			    #define ASE_NEED_CULLFACE 1
			#endif

            #if _MATERIAL_FEATURE_COLORED_TRANSMISSION
            #undef _MATERIAL_FEATURE_CLEAR_COAT
            #endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

		    #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
			#undef  _REFRACTION_PLANE
			#undef  _REFRACTION_SPHERE
			#define _REFRACTION_THIN
		    #endif

            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
            #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                #define WRITE_NORMAL_BUFFER
            #endif
            #endif

            #if SHADERPASS == SHADERPASS_MOTION_VECTORS && defined(WRITE_DECAL_BUFFER_AND_RENDERING_LAYER)
                #define WRITE_DECAL_BUFFER
            #endif

            #ifndef DEBUG_DISPLAY
                #if !defined(_SURFACE_TYPE_TRANSPARENT)
                    #if SHADERPASS == SHADERPASS_FORWARD
                    #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                    #elif SHADERPASS == SHADERPASS_GBUFFER
                    #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                    #endif
                #endif
            #endif

            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif
        
			#if (defined(_TRANSPARENT_WRITES_MOTION_VEC) || defined(_TRANSPARENT_REFRACTIVE_SORT)) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
			#endif

			CBUFFER_START( UnityPerMaterial )
			float4 _AlphaRemap;
			half4 _BaseColor;
			float4 _MainUVs;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_ALPHACLIP;
			float _CATEGORY_ALPHACLIPPING;
			half _GlancingClipMode;
			float _AlphaRemapMax;
			float _AlphaRemapMin;
			half _OcclusionStrengthAO;
			half _SmoothnessFresnelEnable;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelScale;
			half _SmoothnessStrength;
			float _MetallicStrength;
			half _Brightness;
			float _Cutoff;
			float _UVMode;
			float _SPACE_WIND;
			float _CATEGORY_WIND;
			half _WindEnable;
			half _WindLocalDirection;
			half _WindLocalPulseFrequency;
			half _WindLocalRandomOffset;
			half _WindEnableMode;
			half _WindLocalIntensity;
			half _WindGlobalIntensity;
			float _SPACE_SURFACEINPUTS;
			half _NormalStrength;
			half _AlphaCutoffShadow;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			    float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			    float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _DstBlend2;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			    float _TessPhongStrength;
			    float _TessValue;
			    float _TessMin;
			    float _TessMax;
			    float _TessEdgeLength;
			    float _TessMaxDisp;
			#endif
			UNITY_TEXTURE_STREAMING_DEBUG_VARS;
			CBUFFER_END

            #ifdef SCENEPICKINGPASS
			float4 _SelectionID;
            #endif

            #ifdef SCENESELECTIONPASS
			int _ObjectId;
			int _PassValue;
            #endif

			float _GlobalWindBillboardIntensity;
			float _GlobalWindIntensity;
			float _GlobalWindRandomOffset;
			float _GlobalWindPulse;
			float _GlobalWindDirection;
			float _GlobalWindBillboardEnabled;
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS


			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float3 normalWS : TEXCOORD1;
				float4 tangentWS : TEXCOORD2;
				float4 uv1 : TEXCOORD3;
				float4 uv2 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};


			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float2 float2switchUVMode80_g57778( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
			{
				if(m_switch ==0)
					return m_UV0;
				else if(m_switch ==1)
					return m_UV1;
				else if(m_switch ==2)
					return m_UV2;
				else if(m_switch ==3)
					return m_UV3;
				else
				return float2(0,0);
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout GlobalSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;
				surfaceData.thickness = 0.0;

				surfaceData.baseColor =					surfaceDescription.BaseColor;
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;
				surfaceData.ambientOcclusion =			surfaceDescription.Occlusion;
				surfaceData.metallic =					surfaceDescription.Metallic;
				surfaceData.coatMask =					surfaceDescription.CoatMask;

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceData.specularOcclusion =			surfaceDescription.SpecularOcclusion;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.subsurfaceMask =			surfaceDescription.SubsurfaceMask;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceData.thickness =					surfaceDescription.Thickness;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.transmissionMask =			surfaceDescription.TransmissionMask;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceData.diffusionProfileHash =		asuint(surfaceDescription.DiffusionProfile);
				#endif

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.specularColor =				surfaceDescription.Specular;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.anisotropy =				surfaceDescription.Anisotropy;
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.iridescenceMask =			surfaceDescription.IridescenceMask;
				surfaceData.iridescenceThickness =		surfaceDescription.IridescenceThickness;
				#endif

				// refraction
                #if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
                    if (_EnableSSRefraction)
                    {
                        surfaceData.ior =                       surfaceDescription.RefractionIndex;
                        surfaceData.transmittanceColor =        surfaceDescription.RefractionColor;
                        surfaceData.atDistance =                surfaceDescription.RefractionDistance;
        
                        surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
                        surfaceDescription.Alpha = 1.0;
                    }
                    else
                    {
                        surfaceData.ior = 1.0;
                        surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                        surfaceData.atDistance = 1.0;
                        surfaceData.transmittanceMask = 0.0;
                        surfaceDescription.Alpha = 1.0;
                    }
                #else
                    surfaceData.ior = 1.0;
                    surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                    surfaceData.atDistance = 1.0;
                    surfaceData.transmittanceMask = 0.0;
                #endif

				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif

				#ifdef _MATERIAL_FEATURE_COLORED_TRANSMISSION
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_COLORED_TRANSMISSION;
				#endif

                #ifdef _MATERIAL_FEATURE_ANISOTROPY
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
                    surfaceData.normalWS = float3(0, 1, 0);
                #endif

				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
                    surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif

				#ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
                    float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;

                #ifdef DECAL_NORMAL_BLENDING
					normalTS = SurfaceGradientFromTangentSpaceNormalAndFromTBN(normalTS, fragInputs.tangentToWorld[0], fragInputs.tangentToWorld[1]);

                    #if HAVE_DECALS
                    if (_EnableDecals)
                    {
                        float alpha = 1.0;
                        alpha = surfaceDescription.Alpha;

                        DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, alpha);
                        ApplyDecalToSurfaceNormal(decalSurfaceData, fragInputs.tangentToWorld[2], normalTS);
                        ApplyDecalToSurfaceDataNoNormal(decalSurfaceData, surfaceData);
                     }
                    #endif

                    GetNormalWS_SG(fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants);
                #else
					GetNormalWS(fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants);

                    #if HAVE_DECALS
                    if (_EnableDecals)
                    {
                        float alpha = 1.0;
                        alpha = surfaceDescription.Alpha;
        
                        DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, alpha);
                        ApplyDecalToSurfaceNormal(decalSurfaceData, surfaceData.normalWS.xyz);
                        ApplyDecalToSurfaceDataNoNormal(decalSurfaceData, surfaceData);
                    }
                    #endif
                #endif

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
                surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz );
                surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

				bentNormalWS = surfaceData.normalWS;

				#ifdef ASE_BENT_NORMAL
                    GetNormalWS( fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants );
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
                    surfaceData.tangentWS = TransformTangentToWorld(surfaceDescription.Tangent, fragInputs.tangentToWorld);
				#endif

				#if defined(DEBUG_DISPLAY)
				    #if !defined(SHADER_STAGE_RAY_TRACING)
				    if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				    {
					   #ifdef FRAG_INPUTS_USE_TEXCOORD0
                           surfaceData.baseColor = GET_TEXTURE_STREAMING_DEBUG(posInput.positionSS, fragInputs.texCoord0);
                       #else
                           surfaceData.baseColor = GET_TEXTURE_STREAMING_DEBUG_NO_UV(posInput.positionSS);
                       #endif
					   surfaceData.metallic = 0;
				    }
					#endif
				    ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData); 
				#endif

                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
                    surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
                    surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif

                #ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
                    surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
                #endif
			}

			// Get Surface And BuiltinData
			void GetSurfaceAndBuiltinData(GlobalSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
                    LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

                #ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
                    float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif  
                ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants);

				#ifdef _ALPHATEST_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThresholdShadow);
				#endif

				#ifdef _DEPTHOFFSET_ON
                    ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
				#endif

				float3 bentNormalWS;
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);
                InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

				#ifdef _DEPTHOFFSET_ON
                    builtinData.depthOffset = surfaceDescription.DepthOffset;
				#endif

                #ifdef _ALPHATEST_ON
                    builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

                #ifdef UNITY_VIRTUAL_TEXTURING
                    builtinData.vtPackedFeedback = surfaceDescription.VTPackedFeedback;
                #endif

				#ifdef ASE_BAKEDGI
                    builtinData.bakeDiffuseLighting = surfaceDescription.BakedGI;
				#endif

				#ifdef ASE_BAKEDBACKGI
                    builtinData.backBakeDiffuseLighting = surfaceDescription.BakedBackGI;
				#endif

                builtinData.emissiveColor = surfaceDescription.Emission;

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				//Calculate new billboard vertex position and normal;
				float3 upCamVec = float3( 0, 1, 0 );
				float3 forwardCamVec = -normalize ( UNITY_MATRIX_V._m20_m21_m22 );
				float3 rightCamVec = normalize( UNITY_MATRIX_V._m00_m01_m02 );
				float4x4 rotationCamMatrix = float4x4( rightCamVec, 0, upCamVec, 0, forwardCamVec, 0, 0, 0, 0, 1 );
				inputMesh.normalOS = normalize( mul( float4( inputMesh.normalOS , 0 ), rotationCamMatrix )).xyz;
				inputMesh.tangentOS.xyz = normalize( mul( float4( inputMesh.tangentOS.xyz , 0 ), rotationCamMatrix )).xyz;
				//This unfortunately must be made to take non-uniform scaling into account;
				//Transform to world coords, apply rotation and transform back to local;
				inputMesh.positionOS = mul( float4(inputMesh.positionOS,0) , GetObjectToWorldMatrix() ).xyz;
				inputMesh.positionOS = mul( float4(inputMesh.positionOS,0) , rotationCamMatrix ).xyz;
				inputMesh.positionOS = mul( float4(inputMesh.positionOS,0) , GetWorldToObjectMatrix() ).xyz;
				float3 VERTEX_POSITION_MATRIX2352_g57765 = mul( GetObjectToWorldMatrix(), float4( inputMesh.positionOS , 0.0 ) ).xyz;
				float3 break2265_g57765 = VERTEX_POSITION_MATRIX2352_g57765;
				float GlobalWindBillboardIntensity3181_g57765 = _GlobalWindBillboardIntensity;
				float GlobalWindIntensity3173_g57765 = _GlobalWindIntensity;
				float WIND_MODE2462_g57765 = _WindEnableMode;
				float lerpResult3148_g57765 = lerp( ( ( _WindGlobalIntensity * GlobalWindBillboardIntensity3181_g57765 ) * GlobalWindIntensity3173_g57765 ) , _WindLocalIntensity , WIND_MODE2462_g57765);
				float _WIND_STRENGHT2400_g57765 = lerpResult3148_g57765;
				float GlobalWindRandomOffset3174_g57765 = _GlobalWindRandomOffset;
				float lerpResult3149_g57765 = lerp( GlobalWindRandomOffset3174_g57765 , _WindLocalRandomOffset , WIND_MODE2462_g57765);
				float4 transform3073_g57765 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				transform3073_g57765.xyz = GetAbsolutePositionWS((transform3073_g57765).xyz);
				float2 appendResult2307_g57765 = (float2(transform3073_g57765.x , transform3073_g57765.z));
				float dotResult2341_g57765 = dot( appendResult2307_g57765 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g57765 = lerp( 0.8 , ( ( lerpResult3149_g57765 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g57765 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g57765 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g57765 );
				float _WIND_TUBULENCE_RANDOM2274_g57765 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g57765 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g57765.z / 15.0 ) ) ) * 0.5 );
				float GlobalWindPulse3177_g57765 = _GlobalWindPulse;
				float lerpResult3152_g57765 = lerp( GlobalWindPulse3177_g57765 , _WindLocalPulseFrequency , WIND_MODE2462_g57765);
				float _WIND_PULSE2421_g57765 = lerpResult3152_g57765;
				float FUNC_Angle2470_g57765 = ( _WIND_STRENGHT2400_g57765 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g57765 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g57765 ) - ( VERTEX_POSITION_MATRIX2352_g57765.z / 50.0 ) ) - ( inputMesh.ase_color.r / 20.0 ) ) ) ) * sqrt( inputMesh.ase_color.r ) * _WIND_PULSE2421_g57765 );
				float FUNC_Angle_SinA2424_g57765 = sin( FUNC_Angle2470_g57765 );
				float FUNC_Angle_CosA2362_g57765 = cos( FUNC_Angle2470_g57765 );
				float GlobalWindDirection3175_g57765 = _GlobalWindDirection;
				float lerpResult3150_g57765 = lerp( GlobalWindDirection3175_g57765 , _WindLocalDirection , WIND_MODE2462_g57765);
				float _WindDirection2249_g57765 = lerpResult3150_g57765;
				float2 localDirectionalEquation2249_g57765 = DirectionalEquation( _WindDirection2249_g57765 );
				float2 break2469_g57765 = localDirectionalEquation2249_g57765;
				float _WIND_DIRECTION_X2418_g57765 = break2469_g57765.x;
				float lerpResult2258_g57765 = lerp( break2265_g57765.x , ( ( break2265_g57765.y * FUNC_Angle_SinA2424_g57765 ) + ( break2265_g57765.x * FUNC_Angle_CosA2362_g57765 ) ) , _WIND_DIRECTION_X2418_g57765);
				float3 break2340_g57765 = VERTEX_POSITION_MATRIX2352_g57765;
				float3 break2233_g57765 = VERTEX_POSITION_MATRIX2352_g57765;
				float _WIND_DIRECTION_Y2416_g57765 = break2469_g57765.y;
				float lerpResult2275_g57765 = lerp( break2233_g57765.z , ( ( break2233_g57765.y * FUNC_Angle_SinA2424_g57765 ) + ( break2233_g57765.z * FUNC_Angle_CosA2362_g57765 ) ) , _WIND_DIRECTION_Y2416_g57765);
				float3 appendResult2235_g57765 = (float3(lerpResult2258_g57765 , ( ( break2340_g57765.y * FUNC_Angle_CosA2362_g57765 ) - ( break2340_g57765.z * FUNC_Angle_SinA2424_g57765 ) ) , lerpResult2275_g57765));
				float3 VERTEX_POSITION_Neg3006_g57765 = appendResult2235_g57765;
				float GlobalWindBillboardEnabled3180_g57765 = _GlobalWindBillboardEnabled;
				float3 lerpResult3153_g57765 = lerp( float3(0,0,0) , ( VERTEX_POSITION_Neg3006_g57765 - VERTEX_POSITION_MATRIX2352_g57765 ) , GlobalWindBillboardEnabled3180_g57765);
				float3 VERTEX_POSITION2282_g57765 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g57765 , 0.0 ) ).xyz - inputMesh.positionOS );
				float3 lerpResult3146_g57765 = lerp( lerpResult3153_g57765 , VERTEX_POSITION2282_g57765 , _WindEnableMode);
				float WindEnable3144_g57765 = _WindEnable;
				float3 lerpResult3143_g57765 = lerp( VERTEX_POSITION_MATRIX2352_g57765 , lerpResult3146_g57765 , WindEnable3144_g57765);
				float3 lerpResult3142_g57765 = lerp( float3(0,0,0) , lerpResult3143_g57765 , ( _WindEnable + ( ( _CATEGORY_WIND + _SPACE_WIND ) * 0.0 ) ));
				float3 temp_output_18_0_g57786 = lerpResult3142_g57765;
				float3 temp_output_17_0_g57786 = 0;
				
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult982_g57768 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult989_g57768 = lerp( inputMesh.normalOS , -inputMesh.normalOS , step( dotResult982_g57768 , -1.0 ));
				
				float4 appendResult986_g57768 = (float4(cross( inputMesh.normalOS , float3(0,0,1) ) , -1.0));
				
				float m_switch80_g57778 = _UVMode;
				float2 m_UV080_g57778 = inputMesh.ase_texcoord.xy;
				float2 m_UV180_g57778 = inputMesh.uv1.xy;
				float2 m_UV280_g57778 = inputMesh.uv2.xy;
				float2 m_UV380_g57778 = inputMesh.ase_texcoord3.xy;
				float2 localfloat2switchUVMode80_g57778 = float2switchUVMode80_g57778( m_switch80_g57778 , m_UV080_g57778 , m_UV180_g57778 , m_UV280_g57778 , m_UV380_g57778 );
				float2 Offset235_g57778 = (_MainUVs).zw;
				float2 temp_output_41_0_g57778 = ( ( localfloat2switchUVMode80_g57778 * (_MainUVs).xy ) + Offset235_g57778 );
				float2 vertexToFrag70_g57778 = temp_output_41_0_g57778;
				outputPackedVaryingsMeshToPS.ase_texcoord5.xy = vertexToFrag70_g57778;
				
				float3 ase_worldTangent = TransformObjectToWorldDir(inputMesh.tangentOS.xyz);
				float ase_vertexTangentSign = inputMesh.tangentOS.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				outputPackedVaryingsMeshToPS.ase_texcoord6.xyz = ase_worldBitangent;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord5.zw = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord6.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = ( temp_output_18_0_g57786 + temp_output_17_0_g57786 );

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS = lerpResult989_g57768;
				inputMesh.tangentOS = appendResult986_g57768;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.positionRWS.xyz = positionRWS;
				outputPackedVaryingsMeshToPS.normalWS.xyz = normalWS;
				outputPackedVaryingsMeshToPS.tangentWS.xyzw = tangentWS;
				outputPackedVaryingsMeshToPS.uv1.xyzw = inputMesh.uv1;
				outputPackedVaryingsMeshToPS.uv2.xyzw = inputMesh.uv2;
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.uv1 = v.uv1;
				o.uv2 = v.uv2;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord3 = v.ase_texcoord3;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.uv1 = patch[0].uv1 * bary.x + patch[1].uv1 * bary.y + patch[2].uv1 * bary.z;
				o.uv2 = patch[0].uv2 * bary.x + patch[1].uv2 * bary.y + patch[2].uv2 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput,
						OUTPUT_GBUFFER(outGBuffer)
						#ifdef _DEPTHOFFSET_ON
						, out float outputDepth : DEPTH_OFFSET_SEMANTIC
						#endif
						
						)
			{

				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				float3 positionRWS = packedInput.positionRWS.xyz;
				float3 normalWS = packedInput.normalWS.xyz;
				float4 tangentWS = packedInput.tangentWS.xyzw;

				input.positionSS = packedInput.positionCS;
				input.positionRWS = positionRWS;
				input.tangentToWorld = BuildTangentToWorld(tangentWS, normalWS);
				input.texCoord1 = packedInput.uv1.xyzw;
				input.texCoord2 = packedInput.uv2.xyzw;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false );
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);
				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);
				SurfaceData surfaceData;
				BuiltinData builtinData;

				GlobalSurfaceDescription surfaceDescription = (GlobalSurfaceDescription)0;
				float2 vertexToFrag70_g57778 = packedInput.ase_texcoord5.xy;
				float4 tex2DNode3_g57768 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, vertexToFrag70_g57778 );
				float3 temp_output_28_0_g57768 = ( (_BaseColor).rgb * (tex2DNode3_g57768).rgb * _Brightness );
				
				float3 unpack748_g57768 = UnpackNormalScale( SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, vertexToFrag70_g57778 ), _NormalStrength );
				unpack748_g57768.z = lerp( 1, unpack748_g57768.z, saturate(_NormalStrength) );
				float3 temp_output_24_0_g57782 = unpack748_g57768;
				
				float2 appendResult899_g57768 = (float2(V.xy));
				float3 appendResult898_g57768 = (float3(appendResult899_g57768 , ( V.z / 1.06 )));
				float3 break928_g57768 = unpack748_g57768;
				float3 ase_worldBitangent = packedInput.ase_texcoord6.xyz;
				float3 normalizeResult934_g57768 = normalize( ( ( tangentWS.xyz * break928_g57768.x ) + ( ase_worldBitangent * break928_g57768.y ) + ( normalWS * break928_g57768.z ) ) );
				float3 Normal_Per_Pixel937_g57768 = normalizeResult934_g57768;
				float fresnelNdotV896_g57768 = dot( normalize( Normal_Per_Pixel937_g57768 ), appendResult898_g57768 );
				float fresnelNode896_g57768 = ( 0.0 + ( 1.0 - _SmoothnessFresnelScale ) * pow( max( 1.0 - fresnelNdotV896_g57768 , 0.0001 ), _SmoothnessFresnelPower ) );
				float lerpResult895_g57768 = lerp( _SmoothnessStrength , ( _SmoothnessStrength - fresnelNode896_g57768 ) , _SmoothnessFresnelEnable);
				
				float temp_output_22_0_g57769 = tex2DNode3_g57768.a;
				float temp_output_22_0_g57771 = temp_output_22_0_g57769;
				float3 ase_worldPos = GetAbsolutePositionWS( positionRWS );
				float3 temp_output_95_0_g57773 = cross( ddy( ase_worldPos ) , ddx( ase_worldPos ) );
				float3 normalizeResult96_g57773 = normalize( temp_output_95_0_g57773 );
				float dotResult74_g57769 = dot( normalizeResult96_g57773 , V );
				float temp_output_76_0_g57769 = ( 1.0 - abs( dotResult74_g57769 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g57769 = 1.0;
				#else
				float staticSwitch281_g57769 = ( 1.0 - ( temp_output_76_0_g57769 * temp_output_76_0_g57769 ) );
				#endif
				float lerpResult80_g57769 = lerp( 1.0 , staticSwitch281_g57769 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g57769 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g57771 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g57771 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g57769 );
				
				surfaceDescription.BaseColor = temp_output_28_0_g57768;
				surfaceDescription.Normal = temp_output_24_0_g57782;
				surfaceDescription.BentNormal = float3( 0, 0, 1 );
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = _MetallicStrength;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = 0;
				#endif

				surfaceDescription.Emission = 0;
				surfaceDescription.Smoothness = saturate( lerpResult895_g57768 );
				surfaceDescription.Occlusion = saturate( ( 1.0 - _OcclusionStrengthAO ) );
				surfaceDescription.Alpha = temp_output_98_0_g57769;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _Cutoff;
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
				surfaceDescription.AlphaClipThresholdShadow = _AlphaCutoffShadow;
				#endif

				surfaceDescription.AlphaClipThresholdDepthPrepass = 0.5;
				surfaceDescription.AlphaClipThresholdDepthPostpass = 0.5;

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = 0;
				surfaceDescription.SpecularAAThreshold = 0;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = 0;
				#endif

				#ifdef _HAS_REFRACTION
				surfaceDescription.RefractionIndex = 1;
				surfaceDescription.RefractionColor = float3( 1, 1, 1 );
				surfaceDescription.RefractionDistance = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceDescription.SubsurfaceMask = 1;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceDescription.TransmissionMask = 1;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceDescription.DiffusionProfile = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceDescription.Anisotropy = 1;
				surfaceDescription.Tangent = float3( 1, 0, 0 );
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceDescription.IridescenceMask = 0;
				surfaceDescription.IridescenceThickness = 0;
				#endif

				#ifdef ASE_BAKEDGI
				surfaceDescription.BakedGI = 0;
				#endif
				#ifdef ASE_BAKEDBACKGI
				surfaceDescription.BakedBackGI = 0;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				#ifdef UNITY_VIRTUAL_TEXTURING
				surfaceDescription.VTPackedFeedback = float4(1.0f,1.0f,1.0f,1.0f);
				#endif

				GetSurfaceAndBuiltinData( surfaceDescription, input, V, posInput, surfaceData, builtinData );
				ENCODE_INTO_GBUFFER( surfaceData, builtinData, posInput.positionSS, outGBuffer );
				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "META"
			Tags { "LightMode"="Meta" }

			Cull Off

			HLSLPROGRAM
			#define ASE_NEED_CULLFACE 1
			#pragma shader_feature_local _ _DOUBLESIDED_ON
			#pragma shader_feature_local_fragment _ _DISABLE_DECALS
			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma shader_feature_local _ _ALPHATEST_ON
			#define _ALPHATEST_SHADOW_ON 1
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define _AMBIENT_OCCLUSION 1
			#define HAVE_MESH_MODIFICATION
			#define ASE_SRP_VERSION 170002
			#define ASE_USING_SAMPLING_MACROS 1

			#pragma shader_feature _ EDITOR_VISUALIZATION
			#pragma multi_compile _ DOTS_INSTANCING_ON

            #pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
            #pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC _TRANSPARENT_REFRACTIVE_SORT
            #pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT

			#pragma vertex Vert
			#pragma fragment Frag

            #define SHADERPASS SHADERPASS_LIGHT_TRANSPORT
            #define SCENEPICKINGPASS 1

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

            //#if !defined(SHADER_STAGE_RAY_TRACING) && SHADERPASS != SHADERPASS_RAYTRACING_GBUFFER && SHADERPASS != SHADERPASS_FULL_SCREEN_DEBUG
            //#define FRAG_INPUTS_ENABLE_STRIPPING
            //#endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/PickingSpaceTransforms.hlsl"

            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
                #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif
        
            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
                #define RAYTRACING_SHADER_GRAPH_LOW
            #endif

            #ifndef SHADER_UNLIT
            #if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
                #define VARYINGS_NEED_CULLFACE
            #endif
            #endif

			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			    #define ASE_NEED_CULLFACE 1
			#endif

            #if _MATERIAL_FEATURE_COLORED_TRANSMISSION
            #undef _MATERIAL_FEATURE_CLEAR_COAT
            #endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

            #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
            #undef  _REFRACTION_PLANE
            #undef  _REFRACTION_SPHERE
            #define _REFRACTION_THIN
            #endif

            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
            #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                #define WRITE_NORMAL_BUFFER
            #endif
            #endif

            #if SHADERPASS == SHADERPASS_MOTION_VECTORS && defined(WRITE_DECAL_BUFFER_AND_RENDERING_LAYER)
                #define WRITE_DECAL_BUFFER
            #endif

            #ifndef DEBUG_DISPLAY
                #if !defined(_SURFACE_TYPE_TRANSPARENT)
                    #if SHADERPASS == SHADERPASS_FORWARD
                    #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                    #elif SHADERPASS == SHADERPASS_GBUFFER
                    #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                    #endif
                #endif
            #endif

            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif
        
			#if (defined(_TRANSPARENT_WRITES_MOTION_VEC) || defined(_TRANSPARENT_REFRACTIVE_SORT)) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
			#endif

			CBUFFER_START( UnityPerMaterial )
			float4 _AlphaRemap;
			half4 _BaseColor;
			float4 _MainUVs;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_ALPHACLIP;
			float _CATEGORY_ALPHACLIPPING;
			half _GlancingClipMode;
			float _AlphaRemapMax;
			float _AlphaRemapMin;
			half _OcclusionStrengthAO;
			half _SmoothnessFresnelEnable;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelScale;
			half _SmoothnessStrength;
			float _MetallicStrength;
			half _Brightness;
			float _Cutoff;
			float _UVMode;
			float _SPACE_WIND;
			float _CATEGORY_WIND;
			half _WindEnable;
			half _WindLocalDirection;
			half _WindLocalPulseFrequency;
			half _WindLocalRandomOffset;
			half _WindEnableMode;
			half _WindLocalIntensity;
			half _WindGlobalIntensity;
			float _SPACE_SURFACEINPUTS;
			half _NormalStrength;
			half _AlphaCutoffShadow;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			    float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			    float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _DstBlend2;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			    float _TessPhongStrength;
			    float _TessValue;
			    float _TessMin;
			    float _TessMax;
			    float _TessEdgeLength;
			    float _TessMaxDisp;
			#endif
			UNITY_TEXTURE_STREAMING_DEBUG_VARS;
			CBUFFER_END

            #ifdef SCENEPICKINGPASS
			float4 _SelectionID;
            #endif

            #ifdef SCENESELECTIONPASS
			int _ObjectId;
			int _PassValue;
            #endif

			float _GlobalWindBillboardIntensity;
			float _GlobalWindIntensity;
			float _GlobalWindRandomOffset;
			float _GlobalWindPulse;
			float _GlobalWindDirection;
			float _GlobalWindBillboardEnabled;
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

			#if SHADERPASS == SHADERPASS_LIGHT_TRANSPORT
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/PickingSpaceTransforms.hlsl"
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/MetaPass.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

        	#ifdef HAVE_VFX_MODIFICATION
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
        	#endif

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT


			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv0 : TEXCOORD0;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 uv3 : TEXCOORD3;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_Position;
				#ifdef EDITOR_VISUALIZATION
				float2 VizUV : TEXCOORD0;
				float4 LightCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float2 float2switchUVMode80_g57778( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
			{
				if(m_switch ==0)
					return m_UV0;
				else if(m_switch ==1)
					return m_UV1;
				else if(m_switch ==2)
					return m_UV2;
				else if(m_switch ==3)
					return m_UV3;
				else
				return float2(0,0);
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout GlobalSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;
				surfaceData.thickness = 0.0;

				surfaceData.baseColor =					surfaceDescription.BaseColor;
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;
				surfaceData.ambientOcclusion =			surfaceDescription.Occlusion;
				surfaceData.metallic =					surfaceDescription.Metallic;
				surfaceData.coatMask =					surfaceDescription.CoatMask;

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceData.specularOcclusion =			surfaceDescription.SpecularOcclusion;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.subsurfaceMask =			surfaceDescription.SubsurfaceMask;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceData.thickness = 				surfaceDescription.Thickness;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.transmissionMask =			surfaceDescription.TransmissionMask;
				#endif

				#ifdef _MATERIAL_FEATURE_COLORED_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_COLORED_TRANSMISSION;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceData.diffusionProfileHash =		asuint(surfaceDescription.DiffusionProfile);
				#endif

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.specularColor =				surfaceDescription.Specular;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.anisotropy =				surfaceDescription.Anisotropy;
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.iridescenceMask =			surfaceDescription.IridescenceMask;
				surfaceData.iridescenceThickness =		surfaceDescription.IridescenceThickness;
				#endif

				// refraction
                #if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
                    if (_EnableSSRefraction)
                    {
                        surfaceData.ior =                       surfaceDescription.RefractionIndex;
                        surfaceData.transmittanceColor =        surfaceDescription.RefractionColor;
                        surfaceData.atDistance =                surfaceDescription.RefractionDistance;
        
                        surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
                        surfaceDescription.Alpha = 1.0;
                    }
                    else
                    {
                        surfaceData.ior = 1.0;
                        surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                        surfaceData.atDistance = 1.0;
                        surfaceData.transmittanceMask = 0.0;
                        surfaceDescription.Alpha = 1.0;
                    }
                #else
                    surfaceData.ior = 1.0;
                    surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                    surfaceData.atDistance = 1.0;
                    surfaceData.transmittanceMask = 0.0;
                #endif

				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;

                #ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif

				#ifdef _MATERIAL_FEATURE_COLORED_TRANSMISSION
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_COLORED_TRANSMISSION;
				#endif

                #ifdef _MATERIAL_FEATURE_ANISOTROPY
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
                    surfaceData.normalWS = float3(0, 1, 0);
                #endif

				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif

                #ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
                #endif

				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
                    surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;

                #ifdef DECAL_NORMAL_BLENDING
					normalTS = SurfaceGradientFromTangentSpaceNormalAndFromTBN(normalTS, fragInputs.tangentToWorld[0], fragInputs.tangentToWorld[1]);

                    #if HAVE_DECALS
                    if (_EnableDecals)
                    {
                        float alpha = 1.0;
                        alpha = surfaceDescription.Alpha;

                        DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, alpha);
                        ApplyDecalToSurfaceNormal(decalSurfaceData, fragInputs.tangentToWorld[2], normalTS);
                        ApplyDecalToSurfaceDataNoNormal(decalSurfaceData, surfaceData);
                     }
                    #endif

                    GetNormalWS_SG(fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants);
                #else
					GetNormalWS(fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants);

                    #if HAVE_DECALS
                    if (_EnableDecals)
                    {
                        float alpha = 1.0;
                        alpha = surfaceDescription.Alpha;
        
                        DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, alpha);
                        ApplyDecalToSurfaceNormal(decalSurfaceData, surfaceData.normalWS.xyz);
                        ApplyDecalToSurfaceDataNoNormal(decalSurfaceData, surfaceData);
                    }
                    #endif
                #endif

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
                surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz );
                surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

				bentNormalWS = surfaceData.normalWS;

				#ifdef ASE_BENT_NORMAL
                    GetNormalWS( fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants );
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
                    surfaceData.tangentWS = TransformTangentToWorld(surfaceDescription.Tangent, fragInputs.tangentToWorld);
				#endif

				#if defined(DEBUG_DISPLAY)
				    #if !defined(SHADER_STAGE_RAY_TRACING)
				    if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				    {
					   #ifdef FRAG_INPUTS_USE_TEXCOORD0
                           surfaceData.baseColor = GET_TEXTURE_STREAMING_DEBUG(posInput.positionSS, fragInputs.texCoord0);
                       #else
                           surfaceData.baseColor = GET_TEXTURE_STREAMING_DEBUG_NO_UV(posInput.positionSS);
                       #endif
					   surfaceData.metallic = 0;
				    }
					#endif
				    ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData); 
				#endif

                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
                    surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
                    surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif

                #ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
                    surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
                #endif
			}

			// Get Surface And BuiltinData
			void GetSurfaceAndBuiltinData(GlobalSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
                    LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

                #ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
                    float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif
                ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants);

				#ifdef _ALPHATEST_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThresholdShadow);
				#endif

				#ifdef _DEPTHOFFSET_ON
                    ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
				#endif

                float3 bentNormalWS;
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);
                InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

				#ifdef _DEPTHOFFSET_ON
                    builtinData.depthOffset = surfaceDescription.DepthOffset;
				#endif

                #ifdef _ALPHATEST_ON
                    builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

                #ifdef UNITY_VIRTUAL_TEXTURING
                    builtinData.vtPackedFeedback = surfaceDescription.VTPackedFeedback;
                #endif

				#ifdef ASE_BAKEDGI
                    builtinData.bakeDiffuseLighting = surfaceDescription.BakedGI;
				#endif

				#ifdef ASE_BAKEDBACKGI
                    builtinData.backBakeDiffuseLighting = surfaceDescription.BakedBackGI;
				#endif

                builtinData.emissiveColor = surfaceDescription.Emission;

                PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh  )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);

				//Calculate new billboard vertex position and normal;
				float3 upCamVec = float3( 0, 1, 0 );
				float3 forwardCamVec = -normalize ( UNITY_MATRIX_V._m20_m21_m22 );
				float3 rightCamVec = normalize( UNITY_MATRIX_V._m00_m01_m02 );
				float4x4 rotationCamMatrix = float4x4( rightCamVec, 0, upCamVec, 0, forwardCamVec, 0, 0, 0, 0, 1 );
				inputMesh.normalOS = normalize( mul( float4( inputMesh.normalOS , 0 ), rotationCamMatrix )).xyz;
				inputMesh.tangentOS.xyz = normalize( mul( float4( inputMesh.tangentOS.xyz , 0 ), rotationCamMatrix )).xyz;
				//This unfortunately must be made to take non-uniform scaling into account;
				//Transform to world coords, apply rotation and transform back to local;
				inputMesh.positionOS = mul( float4(inputMesh.positionOS,0) , GetObjectToWorldMatrix() ).xyz;
				inputMesh.positionOS = mul( float4(inputMesh.positionOS,0) , rotationCamMatrix ).xyz;
				inputMesh.positionOS = mul( float4(inputMesh.positionOS,0) , GetWorldToObjectMatrix() ).xyz;
				float3 VERTEX_POSITION_MATRIX2352_g57765 = mul( GetObjectToWorldMatrix(), float4( inputMesh.positionOS , 0.0 ) ).xyz;
				float3 break2265_g57765 = VERTEX_POSITION_MATRIX2352_g57765;
				float GlobalWindBillboardIntensity3181_g57765 = _GlobalWindBillboardIntensity;
				float GlobalWindIntensity3173_g57765 = _GlobalWindIntensity;
				float WIND_MODE2462_g57765 = _WindEnableMode;
				float lerpResult3148_g57765 = lerp( ( ( _WindGlobalIntensity * GlobalWindBillboardIntensity3181_g57765 ) * GlobalWindIntensity3173_g57765 ) , _WindLocalIntensity , WIND_MODE2462_g57765);
				float _WIND_STRENGHT2400_g57765 = lerpResult3148_g57765;
				float GlobalWindRandomOffset3174_g57765 = _GlobalWindRandomOffset;
				float lerpResult3149_g57765 = lerp( GlobalWindRandomOffset3174_g57765 , _WindLocalRandomOffset , WIND_MODE2462_g57765);
				float4 transform3073_g57765 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				transform3073_g57765.xyz = GetAbsolutePositionWS((transform3073_g57765).xyz);
				float2 appendResult2307_g57765 = (float2(transform3073_g57765.x , transform3073_g57765.z));
				float dotResult2341_g57765 = dot( appendResult2307_g57765 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g57765 = lerp( 0.8 , ( ( lerpResult3149_g57765 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g57765 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g57765 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g57765 );
				float _WIND_TUBULENCE_RANDOM2274_g57765 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g57765 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g57765.z / 15.0 ) ) ) * 0.5 );
				float GlobalWindPulse3177_g57765 = _GlobalWindPulse;
				float lerpResult3152_g57765 = lerp( GlobalWindPulse3177_g57765 , _WindLocalPulseFrequency , WIND_MODE2462_g57765);
				float _WIND_PULSE2421_g57765 = lerpResult3152_g57765;
				float FUNC_Angle2470_g57765 = ( _WIND_STRENGHT2400_g57765 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g57765 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g57765 ) - ( VERTEX_POSITION_MATRIX2352_g57765.z / 50.0 ) ) - ( inputMesh.ase_color.r / 20.0 ) ) ) ) * sqrt( inputMesh.ase_color.r ) * _WIND_PULSE2421_g57765 );
				float FUNC_Angle_SinA2424_g57765 = sin( FUNC_Angle2470_g57765 );
				float FUNC_Angle_CosA2362_g57765 = cos( FUNC_Angle2470_g57765 );
				float GlobalWindDirection3175_g57765 = _GlobalWindDirection;
				float lerpResult3150_g57765 = lerp( GlobalWindDirection3175_g57765 , _WindLocalDirection , WIND_MODE2462_g57765);
				float _WindDirection2249_g57765 = lerpResult3150_g57765;
				float2 localDirectionalEquation2249_g57765 = DirectionalEquation( _WindDirection2249_g57765 );
				float2 break2469_g57765 = localDirectionalEquation2249_g57765;
				float _WIND_DIRECTION_X2418_g57765 = break2469_g57765.x;
				float lerpResult2258_g57765 = lerp( break2265_g57765.x , ( ( break2265_g57765.y * FUNC_Angle_SinA2424_g57765 ) + ( break2265_g57765.x * FUNC_Angle_CosA2362_g57765 ) ) , _WIND_DIRECTION_X2418_g57765);
				float3 break2340_g57765 = VERTEX_POSITION_MATRIX2352_g57765;
				float3 break2233_g57765 = VERTEX_POSITION_MATRIX2352_g57765;
				float _WIND_DIRECTION_Y2416_g57765 = break2469_g57765.y;
				float lerpResult2275_g57765 = lerp( break2233_g57765.z , ( ( break2233_g57765.y * FUNC_Angle_SinA2424_g57765 ) + ( break2233_g57765.z * FUNC_Angle_CosA2362_g57765 ) ) , _WIND_DIRECTION_Y2416_g57765);
				float3 appendResult2235_g57765 = (float3(lerpResult2258_g57765 , ( ( break2340_g57765.y * FUNC_Angle_CosA2362_g57765 ) - ( break2340_g57765.z * FUNC_Angle_SinA2424_g57765 ) ) , lerpResult2275_g57765));
				float3 VERTEX_POSITION_Neg3006_g57765 = appendResult2235_g57765;
				float GlobalWindBillboardEnabled3180_g57765 = _GlobalWindBillboardEnabled;
				float3 lerpResult3153_g57765 = lerp( float3(0,0,0) , ( VERTEX_POSITION_Neg3006_g57765 - VERTEX_POSITION_MATRIX2352_g57765 ) , GlobalWindBillboardEnabled3180_g57765);
				float3 VERTEX_POSITION2282_g57765 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g57765 , 0.0 ) ).xyz - inputMesh.positionOS );
				float3 lerpResult3146_g57765 = lerp( lerpResult3153_g57765 , VERTEX_POSITION2282_g57765 , _WindEnableMode);
				float WindEnable3144_g57765 = _WindEnable;
				float3 lerpResult3143_g57765 = lerp( VERTEX_POSITION_MATRIX2352_g57765 , lerpResult3146_g57765 , WindEnable3144_g57765);
				float3 lerpResult3142_g57765 = lerp( float3(0,0,0) , lerpResult3143_g57765 , ( _WindEnable + ( ( _CATEGORY_WIND + _SPACE_WIND ) * 0.0 ) ));
				float3 temp_output_18_0_g57786 = lerpResult3142_g57765;
				float3 temp_output_17_0_g57786 = 0;
				
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult982_g57768 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult989_g57768 = lerp( inputMesh.normalOS , -inputMesh.normalOS , step( dotResult982_g57768 , -1.0 ));
				
				float4 appendResult986_g57768 = (float4(cross( inputMesh.normalOS , float3(0,0,1) ) , -1.0));
				
				float m_switch80_g57778 = _UVMode;
				float2 m_UV080_g57778 = inputMesh.uv0.xy;
				float2 m_UV180_g57778 = inputMesh.uv1.xy;
				float2 m_UV280_g57778 = inputMesh.uv2.xy;
				float2 m_UV380_g57778 = inputMesh.uv3.xy;
				float2 localfloat2switchUVMode80_g57778 = float2switchUVMode80_g57778( m_switch80_g57778 , m_UV080_g57778 , m_UV180_g57778 , m_UV280_g57778 , m_UV380_g57778 );
				float2 Offset235_g57778 = (_MainUVs).zw;
				float2 temp_output_41_0_g57778 = ( ( localfloat2switchUVMode80_g57778 * (_MainUVs).xy ) + Offset235_g57778 );
				float2 vertexToFrag70_g57778 = temp_output_41_0_g57778;
				outputPackedVaryingsMeshToPS.ase_texcoord2.xy = vertexToFrag70_g57778;
				
				outputPackedVaryingsMeshToPS.ase_texcoord3.xyz = ase_worldPos;
				float3 ase_worldTangent = TransformObjectToWorldDir(inputMesh.tangentOS.xyz);
				outputPackedVaryingsMeshToPS.ase_texcoord4.xyz = ase_worldTangent;
				float ase_vertexTangentSign = inputMesh.tangentOS.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				outputPackedVaryingsMeshToPS.ase_texcoord5.xyz = ase_worldBitangent;
				outputPackedVaryingsMeshToPS.ase_texcoord6.xyz = ase_worldNormal;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord2.zw = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord3.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord4.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord5.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord6.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = ( temp_output_18_0_g57786 + temp_output_17_0_g57786 );

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS = lerpResult989_g57768;
				inputMesh.tangentOS = appendResult986_g57768;

				outputPackedVaryingsMeshToPS.positionCS = UnityMetaVertexPosition(inputMesh.positionOS, inputMesh.uv1.xy, inputMesh.uv2.xy, unity_LightmapST, unity_DynamicLightmapST);

				#ifdef EDITOR_VISUALIZATION
					float2 vizUV = 0;
					float4 lightCoord = 0;
					UnityEditorVizData(inputMesh.positionOS.xyz, inputMesh.uv0.xy, inputMesh.uv1.xy, inputMesh.uv2.xy, vizUV, lightCoord);

					outputPackedVaryingsMeshToPS.VizUV.xy = vizUV;
					outputPackedVaryingsMeshToPS.LightCoord = lightCoord;
				#endif

				return outputPackedVaryingsMeshToPS;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv0 : TEXCOORD0;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 uv3 : TEXCOORD3;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.uv0 = v.uv0;
				o.uv1 = v.uv1;
				o.uv2 = v.uv2;
				o.uv3 = v.uv3;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.uv0 = patch[0].uv0 * bary.x + patch[1].uv0 * bary.y + patch[2].uv0 * bary.z;
				o.uv1 = patch[0].uv1 * bary.x + patch[1].uv1 * bary.y + patch[2].uv1 * bary.z;
				o.uv2 = patch[0].uv2 * bary.x + patch[1].uv2 * bary.y + patch[2].uv2 * bary.z;
				o.uv3 = patch[0].uv3 * bary.x + patch[1].uv3 * bary.y + patch[2].uv3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			float4 Frag(PackedVaryingsMeshToPS packedInput  ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);
				float3 V = float3(1.0, 1.0, 1.0);

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GlobalSurfaceDescription surfaceDescription = (GlobalSurfaceDescription)0;
				float2 vertexToFrag70_g57778 = packedInput.ase_texcoord2.xy;
				float4 tex2DNode3_g57768 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, vertexToFrag70_g57778 );
				float3 temp_output_28_0_g57768 = ( (_BaseColor).rgb * (tex2DNode3_g57768).rgb * _Brightness );
				
				float3 unpack748_g57768 = UnpackNormalScale( SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, vertexToFrag70_g57778 ), _NormalStrength );
				unpack748_g57768.z = lerp( 1, unpack748_g57768.z, saturate(_NormalStrength) );
				float3 temp_output_24_0_g57782 = unpack748_g57768;
				
				float3 ase_worldPos = packedInput.ase_texcoord3.xyz;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float2 appendResult899_g57768 = (float2(ase_worldViewDir.xy));
				float3 appendResult898_g57768 = (float3(appendResult899_g57768 , ( ase_worldViewDir.z / 1.06 )));
				float3 ase_worldTangent = packedInput.ase_texcoord4.xyz;
				float3 break928_g57768 = unpack748_g57768;
				float3 ase_worldBitangent = packedInput.ase_texcoord5.xyz;
				float3 ase_worldNormal = packedInput.ase_texcoord6.xyz;
				float3 normalizeResult934_g57768 = normalize( ( ( ase_worldTangent * break928_g57768.x ) + ( ase_worldBitangent * break928_g57768.y ) + ( ase_worldNormal * break928_g57768.z ) ) );
				float3 Normal_Per_Pixel937_g57768 = normalizeResult934_g57768;
				float fresnelNdotV896_g57768 = dot( normalize( Normal_Per_Pixel937_g57768 ), appendResult898_g57768 );
				float fresnelNode896_g57768 = ( 0.0 + ( 1.0 - _SmoothnessFresnelScale ) * pow( max( 1.0 - fresnelNdotV896_g57768 , 0.0001 ), _SmoothnessFresnelPower ) );
				float lerpResult895_g57768 = lerp( _SmoothnessStrength , ( _SmoothnessStrength - fresnelNode896_g57768 ) , _SmoothnessFresnelEnable);
				
				float temp_output_22_0_g57769 = tex2DNode3_g57768.a;
				float temp_output_22_0_g57771 = temp_output_22_0_g57769;
				float3 temp_output_95_0_g57773 = cross( ddy( ase_worldPos ) , ddx( ase_worldPos ) );
				float3 normalizeResult96_g57773 = normalize( temp_output_95_0_g57773 );
				float dotResult74_g57769 = dot( normalizeResult96_g57773 , ase_worldViewDir );
				float temp_output_76_0_g57769 = ( 1.0 - abs( dotResult74_g57769 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g57769 = 1.0;
				#else
				float staticSwitch281_g57769 = ( 1.0 - ( temp_output_76_0_g57769 * temp_output_76_0_g57769 ) );
				#endif
				float lerpResult80_g57769 = lerp( 1.0 , staticSwitch281_g57769 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g57769 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g57771 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g57771 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g57769 );
				
				surfaceDescription.BaseColor = temp_output_28_0_g57768;
				surfaceDescription.Normal = temp_output_24_0_g57782;
				surfaceDescription.BentNormal = float3( 0, 0, 1 );
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = _MetallicStrength;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = 0;
				#endif

				surfaceDescription.Emission = 0;
				surfaceDescription.Smoothness = saturate( lerpResult895_g57768 );
				surfaceDescription.Occlusion = saturate( ( 1.0 - _OcclusionStrengthAO ) );
				surfaceDescription.Alpha = temp_output_98_0_g57769;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _Cutoff;
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = 0;
				surfaceDescription.SpecularAAThreshold = 0;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = 1;
				#endif

				#ifdef _HAS_REFRACTION
				surfaceDescription.RefractionIndex = 1;
				surfaceDescription.RefractionColor = float3( 1, 1, 1 );
				surfaceDescription.RefractionDistance = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceDescription.SubsurfaceMask = 1;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceDescription.TransmissionMask = 1;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceDescription.DiffusionProfile = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceDescription.Anisotropy = 1;
				surfaceDescription.Tangent = float3( 1, 0, 0 );
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceDescription.IridescenceMask = 0;
				surfaceDescription.IridescenceThickness = 0;
				#endif

				GetSurfaceAndBuiltinData(surfaceDescription,input, V, posInput, surfaceData, builtinData);
				BSDFData bsdfData = ConvertSurfaceDataToBSDFData(input.positionSS.xy, surfaceData);
				LightTransportData lightTransportData = GetLightTransportData(surfaceData, builtinData, bsdfData);

				float4 res = float4( 0.0, 0.0, 0.0, 1.0 );
				UnityMetaInput metaInput;
				metaInput.Albedo = lightTransportData.diffuseColor.rgb;
				metaInput.Emission = lightTransportData.emissiveColor;

			#ifdef EDITOR_VISUALIZATION
				metaInput.VizUV = packedInput.VizUV;
				metaInput.LightCoord = packedInput.LightCoord;
			#endif
				res = UnityMetaFragment(metaInput);

				return res;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }

			Cull [_CullMode]
			ZWrite On
			ZClip [_ZClip]
			ZTest LEqual
			ColorMask 0

			HLSLPROGRAM
			#define ASE_NEED_CULLFACE 1
			#pragma shader_feature_local _ _DOUBLESIDED_ON
			#pragma shader_feature_local_fragment _ _DISABLE_DECALS
			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma shader_feature_local _ _ALPHATEST_ON
			#define _ALPHATEST_SHADOW_ON 1
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define _AMBIENT_OCCLUSION 1
			#define HAVE_MESH_MODIFICATION
			#define ASE_SRP_VERSION 170002
			#define ASE_USING_SAMPLING_MACROS 1

			#pragma multi_compile _ DOTS_INSTANCING_ON

            #pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
            #pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC _TRANSPARENT_REFRACTIVE_SORT
            #pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT

			#pragma multi_compile_fragment _ SHADOWS_SHADOWMASK

			#pragma vertex Vert
			#pragma fragment Frag

			#define SHADERPASS SHADERPASS_SHADOWS

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

            //#if !defined(SHADER_STAGE_RAY_TRACING) && SHADERPASS != SHADERPASS_RAYTRACING_GBUFFER && SHADERPASS != SHADERPASS_FULL_SCREEN_DEBUG
            //#define FRAG_INPUTS_ENABLE_STRIPPING
            //#endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
                #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif
        
            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
                #define RAYTRACING_SHADER_GRAPH_LOW
            #endif

            #ifndef SHADER_UNLIT
            #if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
                #define VARYINGS_NEED_CULLFACE
            #endif
            #endif

			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			    #define ASE_NEED_CULLFACE 1
			#endif

            #if _MATERIAL_FEATURE_COLORED_TRANSMISSION
            #undef _MATERIAL_FEATURE_CLEAR_COAT
            #endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

		    #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
			#undef  _REFRACTION_PLANE
			#undef  _REFRACTION_SPHERE
			#define _REFRACTION_THIN
		    #endif

            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
            #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                #define WRITE_NORMAL_BUFFER
            #endif
            #endif

            #if SHADERPASS == SHADERPASS_MOTION_VECTORS && defined(WRITE_DECAL_BUFFER_AND_RENDERING_LAYER)
                #define WRITE_DECAL_BUFFER
            #endif

            #ifndef DEBUG_DISPLAY
                #if !defined(_SURFACE_TYPE_TRANSPARENT)
                    #if SHADERPASS == SHADERPASS_FORWARD
                    #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                    #elif SHADERPASS == SHADERPASS_GBUFFER
                    #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                    #endif
                #endif
            #endif

            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif
        
			#if (defined(_TRANSPARENT_WRITES_MOTION_VEC) || defined(_TRANSPARENT_REFRACTIVE_SORT)) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
			#endif

			CBUFFER_START( UnityPerMaterial )
			float4 _AlphaRemap;
			half4 _BaseColor;
			float4 _MainUVs;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_ALPHACLIP;
			float _CATEGORY_ALPHACLIPPING;
			half _GlancingClipMode;
			float _AlphaRemapMax;
			float _AlphaRemapMin;
			half _OcclusionStrengthAO;
			half _SmoothnessFresnelEnable;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelScale;
			half _SmoothnessStrength;
			float _MetallicStrength;
			half _Brightness;
			float _Cutoff;
			float _UVMode;
			float _SPACE_WIND;
			float _CATEGORY_WIND;
			half _WindEnable;
			half _WindLocalDirection;
			half _WindLocalPulseFrequency;
			half _WindLocalRandomOffset;
			half _WindEnableMode;
			half _WindLocalIntensity;
			half _WindGlobalIntensity;
			float _SPACE_SURFACEINPUTS;
			half _NormalStrength;
			half _AlphaCutoffShadow;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			    float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			    float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _DstBlend2;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			    float _TessPhongStrength;
			    float _TessValue;
			    float _TessMin;
			    float _TessMax;
			    float _TessEdgeLength;
			    float _TessMaxDisp;
			#endif
			UNITY_TEXTURE_STREAMING_DEBUG_VARS;
			CBUFFER_END

            #ifdef SCENEPICKINGPASS
			float4 _SelectionID;
            #endif

            #ifdef SCENESELECTIONPASS
			int _ObjectId;
			int _PassValue;
            #endif

			float _GlobalWindBillboardIntensity;
			float _GlobalWindIntensity;
			float _GlobalWindRandomOffset;
			float _GlobalWindPulse;
			float _GlobalWindDirection;
			float _GlobalWindBillboardEnabled;
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

        	#ifdef HAVE_VFX_MODIFICATION
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
        	#endif

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR


			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float2 float2switchUVMode80_g57778( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
			{
				if(m_switch ==0)
					return m_UV0;
				else if(m_switch ==1)
					return m_UV1;
				else if(m_switch ==2)
					return m_UV2;
				else if(m_switch ==3)
					return m_UV3;
				else
				return float2(0,0);
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout AlphaSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;
				surfaceData.thickness = 0.0;

				// refraction ShadowCaster
                #if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
                    if (_EnableSSRefraction)
                    {
        
                        surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
                        surfaceDescription.Alpha = 1.0;
                    }
                    else
                    {
                        surfaceData.ior = 1.0;
                        surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                        surfaceData.atDistance = 1.0;
                        surfaceData.transmittanceMask = 0.0;
                        surfaceDescription.Alpha = 1.0;
                    }
                    #else
                    surfaceData.ior = 1.0;
                    surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                    surfaceData.atDistance = 1.0;
                    surfaceData.transmittanceMask = 0.0;
                #endif

				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif

				#ifdef _MATERIAL_FEATURE_COLORED_TRANSMISSION
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_COLORED_TRANSMISSION;
				#endif

                #ifdef _MATERIAL_FEATURE_ANISOTROPY
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
                    surfaceData.normalWS = float3(0, 1, 0);
                #endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif

				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
                    surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				float3 normalTS = float3(0.0f, 0.0f, 1.0f);

                #ifdef DECAL_NORMAL_BLENDING
					normalTS = SurfaceGradientFromTangentSpaceNormalAndFromTBN(normalTS, fragInputs.tangentToWorld[0], fragInputs.tangentToWorld[1]);

                    #if HAVE_DECALS
                    if (_EnableDecals)
                    {
                        float alpha = 1.0;
                        alpha = surfaceDescription.Alpha;

                        DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, alpha);
                        ApplyDecalToSurfaceNormal(decalSurfaceData, fragInputs.tangentToWorld[2], normalTS);
                        ApplyDecalToSurfaceDataNoNormal(decalSurfaceData, surfaceData);
                     }
                    #endif

                    GetNormalWS_SG(fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants);
                #else
					GetNormalWS(fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants);

                    #if HAVE_DECALS
                    if (_EnableDecals)
                    {
                        float alpha = 1.0;
                        alpha = surfaceDescription.Alpha;
        
                        DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, alpha);
                        ApplyDecalToSurfaceNormal(decalSurfaceData, surfaceData.normalWS.xyz);
                        ApplyDecalToSurfaceDataNoNormal(decalSurfaceData, surfaceData);
                    }
                    #endif
                #endif

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
                surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz );
                surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

				bentNormalWS = surfaceData.normalWS;

				#if defined(DEBUG_DISPLAY)
				    #if !defined(SHADER_STAGE_RAY_TRACING)
				    if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				    {
					   #ifdef FRAG_INPUTS_USE_TEXCOORD0
                           surfaceData.baseColor = GET_TEXTURE_STREAMING_DEBUG(posInput.positionSS, fragInputs.texCoord0);
                       #else
                           surfaceData.baseColor = GET_TEXTURE_STREAMING_DEBUG_NO_UV(posInput.positionSS);
                       #endif
					   surfaceData.metallic = 0;
				    }
					#endif
				    ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData); 
				#endif

                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
                    surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
                    surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif

                #ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
                    surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
                #endif
			}

			// Get Surface And BuiltinData
			void GetSurfaceAndBuiltinData(AlphaSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
                    LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

                #ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
                    float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif
                ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants);

				#ifdef _ALPHATEST_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThresholdShadow);
				#endif

				#ifdef _DEPTHOFFSET_ON
                    ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
				#endif

                float3 bentNormalWS;
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);
                InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

				#ifdef _DEPTHOFFSET_ON
                    builtinData.depthOffset = surfaceDescription.DepthOffset;
				#endif

                #ifdef _ALPHATEST_ON
                    builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

                #ifdef UNITY_VIRTUAL_TEXTURING
                    builtinData.vtPackedFeedback = surfaceDescription.VTPackedFeedback;
                #endif

				#ifdef ASE_BAKEDGI
                    builtinData.bakeDiffuseLighting = surfaceDescription.BakedGI;
				#endif

				#ifdef ASE_BAKEDBACKGI
                    builtinData.backBakeDiffuseLighting = surfaceDescription.BakedBackGI;
				#endif

                builtinData.emissiveColor = surfaceDescription.Emission;

                PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;
				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				//Calculate new billboard vertex position and normal;
				float3 upCamVec = float3( 0, 1, 0 );
				float3 forwardCamVec = -normalize ( UNITY_MATRIX_V._m20_m21_m22 );
				float3 rightCamVec = normalize( UNITY_MATRIX_V._m00_m01_m02 );
				float4x4 rotationCamMatrix = float4x4( rightCamVec, 0, upCamVec, 0, forwardCamVec, 0, 0, 0, 0, 1 );
				inputMesh.normalOS = normalize( mul( float4( inputMesh.normalOS , 0 ), rotationCamMatrix )).xyz;
				inputMesh.tangentOS.xyz = normalize( mul( float4( inputMesh.tangentOS.xyz , 0 ), rotationCamMatrix )).xyz;
				//This unfortunately must be made to take non-uniform scaling into account;
				//Transform to world coords, apply rotation and transform back to local;
				inputMesh.positionOS = mul( float4(inputMesh.positionOS,0) , GetObjectToWorldMatrix() ).xyz;
				inputMesh.positionOS = mul( float4(inputMesh.positionOS,0) , rotationCamMatrix ).xyz;
				inputMesh.positionOS = mul( float4(inputMesh.positionOS,0) , GetWorldToObjectMatrix() ).xyz;
				float3 VERTEX_POSITION_MATRIX2352_g57765 = mul( GetObjectToWorldMatrix(), float4( inputMesh.positionOS , 0.0 ) ).xyz;
				float3 break2265_g57765 = VERTEX_POSITION_MATRIX2352_g57765;
				float GlobalWindBillboardIntensity3181_g57765 = _GlobalWindBillboardIntensity;
				float GlobalWindIntensity3173_g57765 = _GlobalWindIntensity;
				float WIND_MODE2462_g57765 = _WindEnableMode;
				float lerpResult3148_g57765 = lerp( ( ( _WindGlobalIntensity * GlobalWindBillboardIntensity3181_g57765 ) * GlobalWindIntensity3173_g57765 ) , _WindLocalIntensity , WIND_MODE2462_g57765);
				float _WIND_STRENGHT2400_g57765 = lerpResult3148_g57765;
				float GlobalWindRandomOffset3174_g57765 = _GlobalWindRandomOffset;
				float lerpResult3149_g57765 = lerp( GlobalWindRandomOffset3174_g57765 , _WindLocalRandomOffset , WIND_MODE2462_g57765);
				float4 transform3073_g57765 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				transform3073_g57765.xyz = GetAbsolutePositionWS((transform3073_g57765).xyz);
				float2 appendResult2307_g57765 = (float2(transform3073_g57765.x , transform3073_g57765.z));
				float dotResult2341_g57765 = dot( appendResult2307_g57765 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g57765 = lerp( 0.8 , ( ( lerpResult3149_g57765 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g57765 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g57765 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g57765 );
				float _WIND_TUBULENCE_RANDOM2274_g57765 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g57765 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g57765.z / 15.0 ) ) ) * 0.5 );
				float GlobalWindPulse3177_g57765 = _GlobalWindPulse;
				float lerpResult3152_g57765 = lerp( GlobalWindPulse3177_g57765 , _WindLocalPulseFrequency , WIND_MODE2462_g57765);
				float _WIND_PULSE2421_g57765 = lerpResult3152_g57765;
				float FUNC_Angle2470_g57765 = ( _WIND_STRENGHT2400_g57765 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g57765 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g57765 ) - ( VERTEX_POSITION_MATRIX2352_g57765.z / 50.0 ) ) - ( inputMesh.ase_color.r / 20.0 ) ) ) ) * sqrt( inputMesh.ase_color.r ) * _WIND_PULSE2421_g57765 );
				float FUNC_Angle_SinA2424_g57765 = sin( FUNC_Angle2470_g57765 );
				float FUNC_Angle_CosA2362_g57765 = cos( FUNC_Angle2470_g57765 );
				float GlobalWindDirection3175_g57765 = _GlobalWindDirection;
				float lerpResult3150_g57765 = lerp( GlobalWindDirection3175_g57765 , _WindLocalDirection , WIND_MODE2462_g57765);
				float _WindDirection2249_g57765 = lerpResult3150_g57765;
				float2 localDirectionalEquation2249_g57765 = DirectionalEquation( _WindDirection2249_g57765 );
				float2 break2469_g57765 = localDirectionalEquation2249_g57765;
				float _WIND_DIRECTION_X2418_g57765 = break2469_g57765.x;
				float lerpResult2258_g57765 = lerp( break2265_g57765.x , ( ( break2265_g57765.y * FUNC_Angle_SinA2424_g57765 ) + ( break2265_g57765.x * FUNC_Angle_CosA2362_g57765 ) ) , _WIND_DIRECTION_X2418_g57765);
				float3 break2340_g57765 = VERTEX_POSITION_MATRIX2352_g57765;
				float3 break2233_g57765 = VERTEX_POSITION_MATRIX2352_g57765;
				float _WIND_DIRECTION_Y2416_g57765 = break2469_g57765.y;
				float lerpResult2275_g57765 = lerp( break2233_g57765.z , ( ( break2233_g57765.y * FUNC_Angle_SinA2424_g57765 ) + ( break2233_g57765.z * FUNC_Angle_CosA2362_g57765 ) ) , _WIND_DIRECTION_Y2416_g57765);
				float3 appendResult2235_g57765 = (float3(lerpResult2258_g57765 , ( ( break2340_g57765.y * FUNC_Angle_CosA2362_g57765 ) - ( break2340_g57765.z * FUNC_Angle_SinA2424_g57765 ) ) , lerpResult2275_g57765));
				float3 VERTEX_POSITION_Neg3006_g57765 = appendResult2235_g57765;
				float GlobalWindBillboardEnabled3180_g57765 = _GlobalWindBillboardEnabled;
				float3 lerpResult3153_g57765 = lerp( float3(0,0,0) , ( VERTEX_POSITION_Neg3006_g57765 - VERTEX_POSITION_MATRIX2352_g57765 ) , GlobalWindBillboardEnabled3180_g57765);
				float3 VERTEX_POSITION2282_g57765 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g57765 , 0.0 ) ).xyz - inputMesh.positionOS );
				float3 lerpResult3146_g57765 = lerp( lerpResult3153_g57765 , VERTEX_POSITION2282_g57765 , _WindEnableMode);
				float WindEnable3144_g57765 = _WindEnable;
				float3 lerpResult3143_g57765 = lerp( VERTEX_POSITION_MATRIX2352_g57765 , lerpResult3146_g57765 , WindEnable3144_g57765);
				float3 lerpResult3142_g57765 = lerp( float3(0,0,0) , lerpResult3143_g57765 , ( _WindEnable + ( ( _CATEGORY_WIND + _SPACE_WIND ) * 0.0 ) ));
				float3 temp_output_18_0_g57786 = lerpResult3142_g57765;
				float3 temp_output_17_0_g57786 = 0;
				
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult982_g57768 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult989_g57768 = lerp( inputMesh.normalOS , -inputMesh.normalOS , step( dotResult982_g57768 , -1.0 ));
				
				float4 appendResult986_g57768 = (float4(cross( inputMesh.normalOS , float3(0,0,1) ) , -1.0));
				
				float m_switch80_g57778 = _UVMode;
				float2 m_UV080_g57778 = inputMesh.ase_texcoord.xy;
				float2 m_UV180_g57778 = inputMesh.ase_texcoord1.xy;
				float2 m_UV280_g57778 = inputMesh.ase_texcoord2.xy;
				float2 m_UV380_g57778 = inputMesh.ase_texcoord3.xy;
				float2 localfloat2switchUVMode80_g57778 = float2switchUVMode80_g57778( m_switch80_g57778 , m_UV080_g57778 , m_UV180_g57778 , m_UV280_g57778 , m_UV380_g57778 );
				float2 Offset235_g57778 = (_MainUVs).zw;
				float2 temp_output_41_0_g57778 = ( ( localfloat2switchUVMode80_g57778 * (_MainUVs).xy ) + Offset235_g57778 );
				float2 vertexToFrag70_g57778 = temp_output_41_0_g57778;
				outputPackedVaryingsMeshToPS.ase_texcoord1.xy = vertexToFrag70_g57778;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord1.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = ( temp_output_18_0_g57786 + temp_output_17_0_g57786 );

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS = lerpResult989_g57768;
				inputMesh.tangentOS = appendResult986_g57768;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.positionRWS.xyz = positionRWS;
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_texcoord2 = v.ase_texcoord2;
				o.ase_texcoord3 = v.ase_texcoord3;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(WRITE_NORMAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target2
			#elif defined(WRITE_NORMAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target1
			#else
			#define SV_TARGET_DECAL SV_Target0
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
						#if defined(SCENESELECTIONPASS) || defined(SCENEPICKINGPASS)
						, out float4 outColor : SV_Target0
						#else
							#ifdef WRITE_MSAA_DEPTH
							, out float4 depthColor : SV_Target0
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target1
								#endif
							#else
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target0
								#endif
							#endif

							#if (defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)) || defined(WRITE_RENDERING_LAYER)
							, out float4 outDecalBuffer : SV_TARGET_DECAL
							#endif
						#endif

						#if defined(_DEPTHOFFSET_ON) && !defined(SCENEPICKINGPASS)
						, out float outputDepth : DEPTH_OFFSET_SEMANTIC
						#endif
						
					)
			{
			UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(packedInput);
			UNITY_SETUP_INSTANCE_ID(packedInput);

				float3 positionRWS = packedInput.positionRWS.xyz;

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);

				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				input.positionRWS = positionRWS;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false );
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				AlphaSurfaceDescription surfaceDescription = (AlphaSurfaceDescription)0;
				float2 vertexToFrag70_g57778 = packedInput.ase_texcoord1.xy;
				float4 tex2DNode3_g57768 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, vertexToFrag70_g57778 );
				float temp_output_22_0_g57769 = tex2DNode3_g57768.a;
				float temp_output_22_0_g57771 = temp_output_22_0_g57769;
				float3 ase_worldPos = GetAbsolutePositionWS( positionRWS );
				float3 temp_output_95_0_g57773 = cross( ddy( ase_worldPos ) , ddx( ase_worldPos ) );
				float3 normalizeResult96_g57773 = normalize( temp_output_95_0_g57773 );
				float dotResult74_g57769 = dot( normalizeResult96_g57773 , V );
				float temp_output_76_0_g57769 = ( 1.0 - abs( dotResult74_g57769 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g57769 = 1.0;
				#else
				float staticSwitch281_g57769 = ( 1.0 - ( temp_output_76_0_g57769 * temp_output_76_0_g57769 ) );
				#endif
				float lerpResult80_g57769 = lerp( 1.0 , staticSwitch281_g57769 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g57769 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g57771 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g57771 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g57769 );
				
				surfaceDescription.Alpha = temp_output_98_0_g57769;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _Cutoff;
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
				surfaceDescription.AlphaClipThresholdShadow = _AlphaCutoffShadow;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				float bias = max(abs(ddx(posInput.deviceDepth)), abs(ddy(posInput.deviceDepth))) * _SlopeScaleDepthBias;
				outputDepth += bias;
				#endif

				#ifdef WRITE_MSAA_DEPTH
				depthColor = packedInput.vmesh.positionCS.z;

				#ifdef _ALPHATOMASK_ON
				depthColor.a = SharpenAlpha(builtinData.opacity, builtinData.alphaClipTreshold);
				#endif
				#endif

				#if defined(WRITE_NORMAL_BUFFER)
				EncodeIntoNormalBuffer(ConvertSurfaceDataToNormalData(surfaceData), outNormalBuffer);
				#endif

                #if (defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)) || defined(WRITE_RENDERING_LAYER)
				    DecalPrepassData decalPrepassData;
                    #ifdef _DISABLE_DECALS
				    ZERO_INITIALIZE(DecalPrepassData, decalPrepassData);
                    #else
				    decalPrepassData.geomNormalWS = surfaceData.geomNormalWS;
                    #endif
				    decalPrepassData.renderingLayerMask = GetMeshRenderingLayerMask();
				    EncodeIntoDecalPrepassBuffer(decalPrepassData, outDecalBuffer);
				#endif
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }

			Cull Off

			HLSLPROGRAM
			#define ASE_NEED_CULLFACE 1
			#pragma shader_feature_local _ _DOUBLESIDED_ON
			#pragma shader_feature_local_fragment _ _DISABLE_DECALS
			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma shader_feature_local _ _ALPHATEST_ON
			#define _ALPHATEST_SHADOW_ON 1
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define _AMBIENT_OCCLUSION 1
			#define HAVE_MESH_MODIFICATION
			#define ASE_SRP_VERSION 170002
			#define ASE_USING_SAMPLING_MACROS 1

			#pragma editor_sync_compilation
            #pragma multi_compile _ DOTS_INSTANCING_ON

            #pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
            #pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC _TRANSPARENT_REFRACTIVE_SORT
            #pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT

			#pragma vertex Vert
			#pragma fragment Frag

			#define SHADERPASS SHADERPASS_DEPTH_ONLY
		    #define SCENESELECTIONPASS 1

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"


            //#if !defined(SHADER_STAGE_RAY_TRACING) && SHADERPASS != SHADERPASS_RAYTRACING_GBUFFER && SHADERPASS != SHADERPASS_FULL_SCREEN_DEBUG
            //#define FRAG_INPUTS_ENABLE_STRIPPING
            //#endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
                #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif

            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
                #define RAYTRACING_SHADER_GRAPH_LOW
            #endif

            #ifndef SHADER_UNLIT
            #if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
                #define VARYINGS_NEED_CULLFACE
            #endif
            #endif

			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			    #define ASE_NEED_CULLFACE 1
			#endif

            #if _MATERIAL_FEATURE_COLORED_TRANSMISSION
            #undef _MATERIAL_FEATURE_CLEAR_COAT
            #endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

		    #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
			#undef  _REFRACTION_PLANE
			#undef  _REFRACTION_SPHERE
			#define _REFRACTION_THIN
		    #endif

            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
            #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                #define WRITE_NORMAL_BUFFER
            #endif
            #endif

            #if SHADERPASS == SHADERPASS_MOTION_VECTORS && defined(WRITE_DECAL_BUFFER_AND_RENDERING_LAYER)
                #define WRITE_DECAL_BUFFER
            #endif

            #ifndef DEBUG_DISPLAY
                #if !defined(_SURFACE_TYPE_TRANSPARENT)
                    #if SHADERPASS == SHADERPASS_FORWARD
                    #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                    #elif SHADERPASS == SHADERPASS_GBUFFER
                    #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                    #endif
                #endif
            #endif

            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif

			#if (defined(_TRANSPARENT_WRITES_MOTION_VEC) || defined(_TRANSPARENT_REFRACTIVE_SORT)) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
			#endif

			CBUFFER_START( UnityPerMaterial )
			float4 _AlphaRemap;
			half4 _BaseColor;
			float4 _MainUVs;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_ALPHACLIP;
			float _CATEGORY_ALPHACLIPPING;
			half _GlancingClipMode;
			float _AlphaRemapMax;
			float _AlphaRemapMin;
			half _OcclusionStrengthAO;
			half _SmoothnessFresnelEnable;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelScale;
			half _SmoothnessStrength;
			float _MetallicStrength;
			half _Brightness;
			float _Cutoff;
			float _UVMode;
			float _SPACE_WIND;
			float _CATEGORY_WIND;
			half _WindEnable;
			half _WindLocalDirection;
			half _WindLocalPulseFrequency;
			half _WindLocalRandomOffset;
			half _WindEnableMode;
			half _WindLocalIntensity;
			half _WindGlobalIntensity;
			float _SPACE_SURFACEINPUTS;
			half _NormalStrength;
			half _AlphaCutoffShadow;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			    float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			    float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _DstBlend2;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			    float _TessPhongStrength;
			    float _TessValue;
			    float _TessMin;
			    float _TessMax;
			    float _TessEdgeLength;
			    float _TessMaxDisp;
			#endif
			UNITY_TEXTURE_STREAMING_DEBUG_VARS;
			CBUFFER_END

            #ifdef SCENEPICKINGPASS
			float4 _SelectionID;
            #endif

            #ifdef SCENESELECTIONPASS
			int _ObjectId;
			int _PassValue;
            #endif

			float _GlobalWindBillboardIntensity;
			float _GlobalWindIntensity;
			float _GlobalWindRandomOffset;
			float _GlobalWindPulse;
			float _GlobalWindDirection;
			float _GlobalWindBillboardEnabled;
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/PickingSpaceTransforms.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

        	#ifdef HAVE_VFX_MODIFICATION
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
        	#endif

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR


			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float2 float2switchUVMode80_g57778( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
			{
				if(m_switch ==0)
					return m_UV0;
				else if(m_switch ==1)
					return m_UV1;
				else if(m_switch ==2)
					return m_UV2;
				else if(m_switch ==3)
					return m_UV3;
				else
				return float2(0,0);
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout SceneSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;
				surfaceData.thickness = 0.0;

				//refraction SceneSelectionPass
                #if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
                    if (_EnableSSRefraction)
                    {
                        surfaceData.ior =                       surfaceDescription.RefractionIndex;
                        surfaceData.transmittanceColor =        surfaceDescription.RefractionColor;
                        surfaceData.atDistance =                surfaceDescription.RefractionDistance;
        
                        surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
                        surfaceDescription.Alpha = 1.0;
                    }
                    else
                    {
                        surfaceData.ior = 1.0;
                        surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                        surfaceData.atDistance = 1.0;
                        surfaceData.transmittanceMask = 0.0;
                        surfaceDescription.Alpha = 1.0;
                    }
                #else
                    surfaceData.ior = 1.0;
                    surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                    surfaceData.atDistance = 1.0;
                    surfaceData.transmittanceMask = 0.0;
                #endif

				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif

				#ifdef _MATERIAL_FEATURE_COLORED_TRANSMISSION
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_COLORED_TRANSMISSION;
				#endif

                #ifdef _MATERIAL_FEATURE_ANISOTROPY
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
                    surfaceData.normalWS = float3(0, 1, 0);
                #endif

				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
                    surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif

				#ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
                    float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				float3 normalTS = float3(0.0f, 0.0f, 1.0f);

                #ifdef DECAL_NORMAL_BLENDING
					normalTS = SurfaceGradientFromTangentSpaceNormalAndFromTBN(normalTS, fragInputs.tangentToWorld[0], fragInputs.tangentToWorld[1]);

                    #if HAVE_DECALS
                    if (_EnableDecals)
                    {
                        float alpha = 1.0;
                        alpha = surfaceDescription.Alpha;

                        DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, alpha);
                        ApplyDecalToSurfaceNormal(decalSurfaceData, fragInputs.tangentToWorld[2], normalTS);
                        ApplyDecalToSurfaceDataNoNormal(decalSurfaceData, surfaceData);
                     }
                    #endif

                    GetNormalWS_SG(fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants);
                #else
					GetNormalWS(fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants);

                    #if HAVE_DECALS
                    if (_EnableDecals)
                    {
                        float alpha = 1.0;
                        alpha = surfaceDescription.Alpha;
        
                        DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, alpha);
                        ApplyDecalToSurfaceNormal(decalSurfaceData, surfaceData.normalWS.xyz);
                        ApplyDecalToSurfaceDataNoNormal(decalSurfaceData, surfaceData);
                    }
                    #endif
                #endif

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
                surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz );
                surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

				bentNormalWS = surfaceData.normalWS;

				#if defined(DEBUG_DISPLAY)
				    #if !defined(SHADER_STAGE_RAY_TRACING)
				    if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				    {
					   #ifdef FRAG_INPUTS_USE_TEXCOORD0
                           surfaceData.baseColor = GET_TEXTURE_STREAMING_DEBUG(posInput.positionSS, fragInputs.texCoord0);
                       #else
                           surfaceData.baseColor = GET_TEXTURE_STREAMING_DEBUG_NO_UV(posInput.positionSS);
                       #endif
					   surfaceData.metallic = 0;
				    }
					#endif
				    ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData); 
				#endif

                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
                    surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
                    surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif

                #ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
                    surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
                #endif
			}

			// Get Surface And BuiltinData
			void GetSurfaceAndBuiltinData(SceneSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
                    LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

                #ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
                    float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif
                ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants);

				#ifdef _ALPHATEST_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThresholdShadow);
				#endif

				#ifdef _DEPTHOFFSET_ON
                    ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
				#endif

                float3 bentNormalWS;
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);
                InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

				#ifdef _DEPTHOFFSET_ON
                    builtinData.depthOffset = surfaceDescription.DepthOffset;
				#endif

                #ifdef _ALPHATEST_ON
                    builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

                #ifdef UNITY_VIRTUAL_TEXTURING
                    builtinData.vtPackedFeedback = surfaceDescription.VTPackedFeedback;
                #endif

				#ifdef ASE_BAKEDGI
                    builtinData.bakeDiffuseLighting = surfaceDescription.BakedGI;
				#endif

				#ifdef ASE_BAKEDBACKGI
                    builtinData.backBakeDiffuseLighting = surfaceDescription.BakedBackGI;
				#endif

                builtinData.emissiveColor = surfaceDescription.Emission;

                PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;
				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				//Calculate new billboard vertex position and normal;
				float3 upCamVec = float3( 0, 1, 0 );
				float3 forwardCamVec = -normalize ( UNITY_MATRIX_V._m20_m21_m22 );
				float3 rightCamVec = normalize( UNITY_MATRIX_V._m00_m01_m02 );
				float4x4 rotationCamMatrix = float4x4( rightCamVec, 0, upCamVec, 0, forwardCamVec, 0, 0, 0, 0, 1 );
				inputMesh.normalOS = normalize( mul( float4( inputMesh.normalOS , 0 ), rotationCamMatrix )).xyz;
				inputMesh.tangentOS.xyz = normalize( mul( float4( inputMesh.tangentOS.xyz , 0 ), rotationCamMatrix )).xyz;
				//This unfortunately must be made to take non-uniform scaling into account;
				//Transform to world coords, apply rotation and transform back to local;
				inputMesh.positionOS = mul( float4(inputMesh.positionOS,0) , GetObjectToWorldMatrix() ).xyz;
				inputMesh.positionOS = mul( float4(inputMesh.positionOS,0) , rotationCamMatrix ).xyz;
				inputMesh.positionOS = mul( float4(inputMesh.positionOS,0) , GetWorldToObjectMatrix() ).xyz;
				float3 VERTEX_POSITION_MATRIX2352_g57765 = mul( GetObjectToWorldMatrix(), float4( inputMesh.positionOS , 0.0 ) ).xyz;
				float3 break2265_g57765 = VERTEX_POSITION_MATRIX2352_g57765;
				float GlobalWindBillboardIntensity3181_g57765 = _GlobalWindBillboardIntensity;
				float GlobalWindIntensity3173_g57765 = _GlobalWindIntensity;
				float WIND_MODE2462_g57765 = _WindEnableMode;
				float lerpResult3148_g57765 = lerp( ( ( _WindGlobalIntensity * GlobalWindBillboardIntensity3181_g57765 ) * GlobalWindIntensity3173_g57765 ) , _WindLocalIntensity , WIND_MODE2462_g57765);
				float _WIND_STRENGHT2400_g57765 = lerpResult3148_g57765;
				float GlobalWindRandomOffset3174_g57765 = _GlobalWindRandomOffset;
				float lerpResult3149_g57765 = lerp( GlobalWindRandomOffset3174_g57765 , _WindLocalRandomOffset , WIND_MODE2462_g57765);
				float4 transform3073_g57765 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				transform3073_g57765.xyz = GetAbsolutePositionWS((transform3073_g57765).xyz);
				float2 appendResult2307_g57765 = (float2(transform3073_g57765.x , transform3073_g57765.z));
				float dotResult2341_g57765 = dot( appendResult2307_g57765 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g57765 = lerp( 0.8 , ( ( lerpResult3149_g57765 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g57765 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g57765 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g57765 );
				float _WIND_TUBULENCE_RANDOM2274_g57765 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g57765 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g57765.z / 15.0 ) ) ) * 0.5 );
				float GlobalWindPulse3177_g57765 = _GlobalWindPulse;
				float lerpResult3152_g57765 = lerp( GlobalWindPulse3177_g57765 , _WindLocalPulseFrequency , WIND_MODE2462_g57765);
				float _WIND_PULSE2421_g57765 = lerpResult3152_g57765;
				float FUNC_Angle2470_g57765 = ( _WIND_STRENGHT2400_g57765 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g57765 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g57765 ) - ( VERTEX_POSITION_MATRIX2352_g57765.z / 50.0 ) ) - ( inputMesh.ase_color.r / 20.0 ) ) ) ) * sqrt( inputMesh.ase_color.r ) * _WIND_PULSE2421_g57765 );
				float FUNC_Angle_SinA2424_g57765 = sin( FUNC_Angle2470_g57765 );
				float FUNC_Angle_CosA2362_g57765 = cos( FUNC_Angle2470_g57765 );
				float GlobalWindDirection3175_g57765 = _GlobalWindDirection;
				float lerpResult3150_g57765 = lerp( GlobalWindDirection3175_g57765 , _WindLocalDirection , WIND_MODE2462_g57765);
				float _WindDirection2249_g57765 = lerpResult3150_g57765;
				float2 localDirectionalEquation2249_g57765 = DirectionalEquation( _WindDirection2249_g57765 );
				float2 break2469_g57765 = localDirectionalEquation2249_g57765;
				float _WIND_DIRECTION_X2418_g57765 = break2469_g57765.x;
				float lerpResult2258_g57765 = lerp( break2265_g57765.x , ( ( break2265_g57765.y * FUNC_Angle_SinA2424_g57765 ) + ( break2265_g57765.x * FUNC_Angle_CosA2362_g57765 ) ) , _WIND_DIRECTION_X2418_g57765);
				float3 break2340_g57765 = VERTEX_POSITION_MATRIX2352_g57765;
				float3 break2233_g57765 = VERTEX_POSITION_MATRIX2352_g57765;
				float _WIND_DIRECTION_Y2416_g57765 = break2469_g57765.y;
				float lerpResult2275_g57765 = lerp( break2233_g57765.z , ( ( break2233_g57765.y * FUNC_Angle_SinA2424_g57765 ) + ( break2233_g57765.z * FUNC_Angle_CosA2362_g57765 ) ) , _WIND_DIRECTION_Y2416_g57765);
				float3 appendResult2235_g57765 = (float3(lerpResult2258_g57765 , ( ( break2340_g57765.y * FUNC_Angle_CosA2362_g57765 ) - ( break2340_g57765.z * FUNC_Angle_SinA2424_g57765 ) ) , lerpResult2275_g57765));
				float3 VERTEX_POSITION_Neg3006_g57765 = appendResult2235_g57765;
				float GlobalWindBillboardEnabled3180_g57765 = _GlobalWindBillboardEnabled;
				float3 lerpResult3153_g57765 = lerp( float3(0,0,0) , ( VERTEX_POSITION_Neg3006_g57765 - VERTEX_POSITION_MATRIX2352_g57765 ) , GlobalWindBillboardEnabled3180_g57765);
				float3 VERTEX_POSITION2282_g57765 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g57765 , 0.0 ) ).xyz - inputMesh.positionOS );
				float3 lerpResult3146_g57765 = lerp( lerpResult3153_g57765 , VERTEX_POSITION2282_g57765 , _WindEnableMode);
				float WindEnable3144_g57765 = _WindEnable;
				float3 lerpResult3143_g57765 = lerp( VERTEX_POSITION_MATRIX2352_g57765 , lerpResult3146_g57765 , WindEnable3144_g57765);
				float3 lerpResult3142_g57765 = lerp( float3(0,0,0) , lerpResult3143_g57765 , ( _WindEnable + ( ( _CATEGORY_WIND + _SPACE_WIND ) * 0.0 ) ));
				float3 temp_output_18_0_g57786 = lerpResult3142_g57765;
				float3 temp_output_17_0_g57786 = 0;
				
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult982_g57768 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult989_g57768 = lerp( inputMesh.normalOS , -inputMesh.normalOS , step( dotResult982_g57768 , -1.0 ));
				
				float4 appendResult986_g57768 = (float4(cross( inputMesh.normalOS , float3(0,0,1) ) , -1.0));
				
				float m_switch80_g57778 = _UVMode;
				float2 m_UV080_g57778 = inputMesh.ase_texcoord.xy;
				float2 m_UV180_g57778 = inputMesh.ase_texcoord1.xy;
				float2 m_UV280_g57778 = inputMesh.ase_texcoord2.xy;
				float2 m_UV380_g57778 = inputMesh.ase_texcoord3.xy;
				float2 localfloat2switchUVMode80_g57778 = float2switchUVMode80_g57778( m_switch80_g57778 , m_UV080_g57778 , m_UV180_g57778 , m_UV280_g57778 , m_UV380_g57778 );
				float2 Offset235_g57778 = (_MainUVs).zw;
				float2 temp_output_41_0_g57778 = ( ( localfloat2switchUVMode80_g57778 * (_MainUVs).xy ) + Offset235_g57778 );
				float2 vertexToFrag70_g57778 = temp_output_41_0_g57778;
				outputPackedVaryingsMeshToPS.ase_texcoord1.xy = vertexToFrag70_g57778;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord1.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = ( temp_output_18_0_g57786 + temp_output_17_0_g57786 );

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS = lerpResult989_g57768;
				inputMesh.tangentOS = appendResult986_g57768;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.positionRWS.xyz = positionRWS;
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_texcoord2 = v.ase_texcoord2;
				o.ase_texcoord3 = v.ase_texcoord3;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(WRITE_NORMAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target2
			#elif defined(WRITE_NORMAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target1
			#else
			#define SV_TARGET_DECAL SV_Target0
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
						, out float4 outColor : SV_Target0
						#if defined(_DEPTHOFFSET_ON) && !defined(SCENEPICKINGPASS)
						, out float outputDepth : DEPTH_OFFSET_SEMANTIC
						#endif
						
					)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );

				float3 positionRWS = packedInput.positionRWS.xyz;

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);

				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				input.positionRWS = positionRWS;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false );
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				SceneSurfaceDescription surfaceDescription = (SceneSurfaceDescription)0;
				float2 vertexToFrag70_g57778 = packedInput.ase_texcoord1.xy;
				float4 tex2DNode3_g57768 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, vertexToFrag70_g57778 );
				float temp_output_22_0_g57769 = tex2DNode3_g57768.a;
				float temp_output_22_0_g57771 = temp_output_22_0_g57769;
				float3 ase_worldPos = GetAbsolutePositionWS( positionRWS );
				float3 temp_output_95_0_g57773 = cross( ddy( ase_worldPos ) , ddx( ase_worldPos ) );
				float3 normalizeResult96_g57773 = normalize( temp_output_95_0_g57773 );
				float dotResult74_g57769 = dot( normalizeResult96_g57773 , V );
				float temp_output_76_0_g57769 = ( 1.0 - abs( dotResult74_g57769 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g57769 = 1.0;
				#else
				float staticSwitch281_g57769 = ( 1.0 - ( temp_output_76_0_g57769 * temp_output_76_0_g57769 ) );
				#endif
				float lerpResult80_g57769 = lerp( 1.0 , staticSwitch281_g57769 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g57769 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g57771 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g57771 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g57769 );
				
				surfaceDescription.Alpha = temp_output_98_0_g57769;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _Cutoff;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif

				outColor = float4( _ObjectId, _PassValue, 1.0, 1.0 );
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			Cull [_CullMode]
			ZWrite On

			Stencil
			{
				Ref [_StencilRefDepth]
				WriteMask [_StencilWriteMaskDepth]
				Comp Always
				Pass Replace
			}


			HLSLPROGRAM
			#define ASE_NEED_CULLFACE 1
			#pragma shader_feature_local _ _DOUBLESIDED_ON
			#pragma shader_feature_local_fragment _ _DISABLE_DECALS
			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma shader_feature_local _ _ALPHATEST_ON
			#define _ALPHATEST_SHADOW_ON 1
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define _AMBIENT_OCCLUSION 1
			#define HAVE_MESH_MODIFICATION
			#define ASE_SRP_VERSION 170002
			#define ASE_USING_SAMPLING_MACROS 1

			#pragma multi_compile _ DOTS_INSTANCING_ON

            #pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
            #pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC _TRANSPARENT_REFRACTIVE_SORT
            #pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT

            #pragma multi_compile _ WRITE_NORMAL_BUFFER
            #pragma multi_compile_fragment _ WRITE_MSAA_DEPTH
            #pragma multi_compile_fragment _ WRITE_DECAL_BUFFER WRITE_RENDERING_LAYER

			#pragma vertex Vert
			#pragma fragment Frag

            #define SHADERPASS SHADERPASS_DEPTH_ONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"


            //#if !defined(SHADER_STAGE_RAY_TRACING) && SHADERPASS != SHADERPASS_RAYTRACING_GBUFFER && SHADERPASS != SHADERPASS_FULL_SCREEN_DEBUG
            //#define FRAG_INPUTS_ENABLE_STRIPPING
            //#endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
                #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif
        
            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
                #define RAYTRACING_SHADER_GRAPH_LOW
            #endif

            #ifndef SHADER_UNLIT
            #if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
                #define VARYINGS_NEED_CULLFACE
            #endif
            #endif

			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			    #define ASE_NEED_CULLFACE 1
			#endif

            #if _MATERIAL_FEATURE_COLORED_TRANSMISSION
            #undef _MATERIAL_FEATURE_CLEAR_COAT
            #endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

		    #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
			#undef  _REFRACTION_PLANE
			#undef  _REFRACTION_SPHERE
			#define _REFRACTION_THIN
		    #endif

            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
            #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                #define WRITE_NORMAL_BUFFER
            #endif
            #endif

            #if SHADERPASS == SHADERPASS_MOTION_VECTORS && defined(WRITE_DECAL_BUFFER_AND_RENDERING_LAYER)
                #define WRITE_DECAL_BUFFER
            #endif

            #ifndef DEBUG_DISPLAY
                #if !defined(_SURFACE_TYPE_TRANSPARENT)
                    #if SHADERPASS == SHADERPASS_FORWARD
                    #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                    #elif SHADERPASS == SHADERPASS_GBUFFER
                    #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                    #endif
                #endif
            #endif

            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif

			#if (defined(_TRANSPARENT_WRITES_MOTION_VEC) || defined(_TRANSPARENT_REFRACTIVE_SORT)) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
			#endif

			CBUFFER_START( UnityPerMaterial )
			float4 _AlphaRemap;
			half4 _BaseColor;
			float4 _MainUVs;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_ALPHACLIP;
			float _CATEGORY_ALPHACLIPPING;
			half _GlancingClipMode;
			float _AlphaRemapMax;
			float _AlphaRemapMin;
			half _OcclusionStrengthAO;
			half _SmoothnessFresnelEnable;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelScale;
			half _SmoothnessStrength;
			float _MetallicStrength;
			half _Brightness;
			float _Cutoff;
			float _UVMode;
			float _SPACE_WIND;
			float _CATEGORY_WIND;
			half _WindEnable;
			half _WindLocalDirection;
			half _WindLocalPulseFrequency;
			half _WindLocalRandomOffset;
			half _WindEnableMode;
			half _WindLocalIntensity;
			half _WindGlobalIntensity;
			float _SPACE_SURFACEINPUTS;
			half _NormalStrength;
			half _AlphaCutoffShadow;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			    float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			    float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _DstBlend2;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			    float _TessPhongStrength;
			    float _TessValue;
			    float _TessMin;
			    float _TessMax;
			    float _TessEdgeLength;
			    float _TessMaxDisp;
			#endif
			UNITY_TEXTURE_STREAMING_DEBUG_VARS;
			CBUFFER_END

            #ifdef SCENEPICKINGPASS
			float4 _SelectionID;
            #endif

            #ifdef SCENESELECTIONPASS
			int _ObjectId;
			int _PassValue;
            #endif

			float _GlobalWindBillboardIntensity;
			float _GlobalWindIntensity;
			float _GlobalWindRandomOffset;
			float _GlobalWindPulse;
			float _GlobalWindDirection;
			float _GlobalWindBillboardEnabled;
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

        	#ifdef HAVE_VFX_MODIFICATION
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
        	#endif

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS


			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float3 normalWS : TEXCOORD1;
				float4 tangentWS : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float2 float2switchUVMode80_g57778( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
			{
				if(m_switch ==0)
					return m_UV0;
				else if(m_switch ==1)
					return m_UV1;
				else if(m_switch ==2)
					return m_UV2;
				else if(m_switch ==3)
					return m_UV3;
				else
				return float2(0,0);
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout SmoothSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;
				surfaceData.thickness = 0.0;

				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;

				// refraction
                #if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
                    if (_EnableSSRefraction)
                    {
                        surfaceData.ior =                       surfaceDescription.RefractionIndex;
                        surfaceData.transmittanceColor =        surfaceDescription.RefractionColor;
                        surfaceData.atDistance =                surfaceDescription.RefractionDistance;
        
                        surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
                        surfaceDescription.Alpha = 1.0;
                    }
                    else
                    {
                        surfaceData.ior = 1.0;
                        surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                        surfaceData.atDistance = 1.0;
                        surfaceData.transmittanceMask = 0.0;
                        surfaceDescription.Alpha = 1.0;
                    }
                #else
                    surfaceData.ior = 1.0;
                    surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                    surfaceData.atDistance = 1.0;
                    surfaceData.transmittanceMask = 0.0;
                #endif

				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif

				#ifdef _MATERIAL_FEATURE_COLORED_TRANSMISSION
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_COLORED_TRANSMISSION;
				#endif

                #ifdef _MATERIAL_FEATURE_ANISOTROPY
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
                    surfaceData.normalWS = float3(0, 1, 0);
                #endif

				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
                    surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif

				#ifdef _DOUBLESIDED_ON
				    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				    float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;

                #ifdef DECAL_NORMAL_BLENDING
					normalTS = SurfaceGradientFromTangentSpaceNormalAndFromTBN(normalTS, fragInputs.tangentToWorld[0], fragInputs.tangentToWorld[1]);

                    #if HAVE_DECALS
                    if (_EnableDecals)
                    {
                        float alpha = 1.0;
                        alpha = surfaceDescription.Alpha;

                        DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, alpha);
                        ApplyDecalToSurfaceNormal(decalSurfaceData, fragInputs.tangentToWorld[2], normalTS);
                        ApplyDecalToSurfaceDataNoNormal(decalSurfaceData, surfaceData);
                     }
                    #endif

                    GetNormalWS_SG(fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants);
                #else
					GetNormalWS(fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants);

                    #if HAVE_DECALS
                    if (_EnableDecals)
                    {
                        float alpha = 1.0;
                        alpha = surfaceDescription.Alpha;

                        DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, alpha);
                        ApplyDecalToSurfaceNormal(decalSurfaceData, surfaceData.normalWS.xyz);
                        ApplyDecalToSurfaceDataNoNormal(decalSurfaceData, surfaceData);
                    }
                    #endif
                #endif

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
                surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz );
                surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

				bentNormalWS = surfaceData.normalWS;

				#if defined(DEBUG_DISPLAY)
				    #if !defined(SHADER_STAGE_RAY_TRACING)
				    if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				    {
					   #ifdef FRAG_INPUTS_USE_TEXCOORD0
                           surfaceData.baseColor = GET_TEXTURE_STREAMING_DEBUG(posInput.positionSS, fragInputs.texCoord0);
                       #else
                           surfaceData.baseColor = GET_TEXTURE_STREAMING_DEBUG_NO_UV(posInput.positionSS);
                       #endif
					   surfaceData.metallic = 0;
				    }
					#endif
				    ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData); 
				#endif

                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
                    surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
                    surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif

                #ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
                    surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
                #endif
			}

			// Get Surface And BuiltinData
			void GetSurfaceAndBuiltinData(SmoothSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
                    LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

                #ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
                    float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif
                ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants);

				#ifdef _ALPHATEST_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThresholdShadow);
				#endif

				#ifdef _DEPTHOFFSET_ON
                    ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
				#endif

                float3 bentNormalWS;
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);
                InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

				#ifdef _DEPTHOFFSET_ON
                    builtinData.depthOffset = surfaceDescription.DepthOffset;
				#endif

                #ifdef _ALPHATEST_ON
                    builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

                #ifdef UNITY_VIRTUAL_TEXTURING
                    builtinData.vtPackedFeedback = surfaceDescription.VTPackedFeedback;
                #endif

				#ifdef ASE_BAKEDGI
                    builtinData.bakeDiffuseLighting = surfaceDescription.BakedGI;
				#endif

				#ifdef ASE_BAKEDBACKGI
                    builtinData.backBakeDiffuseLighting = surfaceDescription.BakedBackGI;
				#endif

                builtinData.emissiveColor = surfaceDescription.Emission;

                PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			#if (defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)) || defined(WRITE_RENDERING_LAYER)
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalPrepassBuffer.hlsl"
			#endif

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				//Calculate new billboard vertex position and normal;
				float3 upCamVec = float3( 0, 1, 0 );
				float3 forwardCamVec = -normalize ( UNITY_MATRIX_V._m20_m21_m22 );
				float3 rightCamVec = normalize( UNITY_MATRIX_V._m00_m01_m02 );
				float4x4 rotationCamMatrix = float4x4( rightCamVec, 0, upCamVec, 0, forwardCamVec, 0, 0, 0, 0, 1 );
				inputMesh.normalOS = normalize( mul( float4( inputMesh.normalOS , 0 ), rotationCamMatrix )).xyz;
				inputMesh.tangentOS.xyz = normalize( mul( float4( inputMesh.tangentOS.xyz , 0 ), rotationCamMatrix )).xyz;
				//This unfortunately must be made to take non-uniform scaling into account;
				//Transform to world coords, apply rotation and transform back to local;
				inputMesh.positionOS = mul( float4(inputMesh.positionOS,0) , GetObjectToWorldMatrix() ).xyz;
				inputMesh.positionOS = mul( float4(inputMesh.positionOS,0) , rotationCamMatrix ).xyz;
				inputMesh.positionOS = mul( float4(inputMesh.positionOS,0) , GetWorldToObjectMatrix() ).xyz;
				float3 VERTEX_POSITION_MATRIX2352_g57765 = mul( GetObjectToWorldMatrix(), float4( inputMesh.positionOS , 0.0 ) ).xyz;
				float3 break2265_g57765 = VERTEX_POSITION_MATRIX2352_g57765;
				float GlobalWindBillboardIntensity3181_g57765 = _GlobalWindBillboardIntensity;
				float GlobalWindIntensity3173_g57765 = _GlobalWindIntensity;
				float WIND_MODE2462_g57765 = _WindEnableMode;
				float lerpResult3148_g57765 = lerp( ( ( _WindGlobalIntensity * GlobalWindBillboardIntensity3181_g57765 ) * GlobalWindIntensity3173_g57765 ) , _WindLocalIntensity , WIND_MODE2462_g57765);
				float _WIND_STRENGHT2400_g57765 = lerpResult3148_g57765;
				float GlobalWindRandomOffset3174_g57765 = _GlobalWindRandomOffset;
				float lerpResult3149_g57765 = lerp( GlobalWindRandomOffset3174_g57765 , _WindLocalRandomOffset , WIND_MODE2462_g57765);
				float4 transform3073_g57765 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				transform3073_g57765.xyz = GetAbsolutePositionWS((transform3073_g57765).xyz);
				float2 appendResult2307_g57765 = (float2(transform3073_g57765.x , transform3073_g57765.z));
				float dotResult2341_g57765 = dot( appendResult2307_g57765 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g57765 = lerp( 0.8 , ( ( lerpResult3149_g57765 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g57765 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g57765 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g57765 );
				float _WIND_TUBULENCE_RANDOM2274_g57765 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g57765 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g57765.z / 15.0 ) ) ) * 0.5 );
				float GlobalWindPulse3177_g57765 = _GlobalWindPulse;
				float lerpResult3152_g57765 = lerp( GlobalWindPulse3177_g57765 , _WindLocalPulseFrequency , WIND_MODE2462_g57765);
				float _WIND_PULSE2421_g57765 = lerpResult3152_g57765;
				float FUNC_Angle2470_g57765 = ( _WIND_STRENGHT2400_g57765 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g57765 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g57765 ) - ( VERTEX_POSITION_MATRIX2352_g57765.z / 50.0 ) ) - ( inputMesh.ase_color.r / 20.0 ) ) ) ) * sqrt( inputMesh.ase_color.r ) * _WIND_PULSE2421_g57765 );
				float FUNC_Angle_SinA2424_g57765 = sin( FUNC_Angle2470_g57765 );
				float FUNC_Angle_CosA2362_g57765 = cos( FUNC_Angle2470_g57765 );
				float GlobalWindDirection3175_g57765 = _GlobalWindDirection;
				float lerpResult3150_g57765 = lerp( GlobalWindDirection3175_g57765 , _WindLocalDirection , WIND_MODE2462_g57765);
				float _WindDirection2249_g57765 = lerpResult3150_g57765;
				float2 localDirectionalEquation2249_g57765 = DirectionalEquation( _WindDirection2249_g57765 );
				float2 break2469_g57765 = localDirectionalEquation2249_g57765;
				float _WIND_DIRECTION_X2418_g57765 = break2469_g57765.x;
				float lerpResult2258_g57765 = lerp( break2265_g57765.x , ( ( break2265_g57765.y * FUNC_Angle_SinA2424_g57765 ) + ( break2265_g57765.x * FUNC_Angle_CosA2362_g57765 ) ) , _WIND_DIRECTION_X2418_g57765);
				float3 break2340_g57765 = VERTEX_POSITION_MATRIX2352_g57765;
				float3 break2233_g57765 = VERTEX_POSITION_MATRIX2352_g57765;
				float _WIND_DIRECTION_Y2416_g57765 = break2469_g57765.y;
				float lerpResult2275_g57765 = lerp( break2233_g57765.z , ( ( break2233_g57765.y * FUNC_Angle_SinA2424_g57765 ) + ( break2233_g57765.z * FUNC_Angle_CosA2362_g57765 ) ) , _WIND_DIRECTION_Y2416_g57765);
				float3 appendResult2235_g57765 = (float3(lerpResult2258_g57765 , ( ( break2340_g57765.y * FUNC_Angle_CosA2362_g57765 ) - ( break2340_g57765.z * FUNC_Angle_SinA2424_g57765 ) ) , lerpResult2275_g57765));
				float3 VERTEX_POSITION_Neg3006_g57765 = appendResult2235_g57765;
				float GlobalWindBillboardEnabled3180_g57765 = _GlobalWindBillboardEnabled;
				float3 lerpResult3153_g57765 = lerp( float3(0,0,0) , ( VERTEX_POSITION_Neg3006_g57765 - VERTEX_POSITION_MATRIX2352_g57765 ) , GlobalWindBillboardEnabled3180_g57765);
				float3 VERTEX_POSITION2282_g57765 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g57765 , 0.0 ) ).xyz - inputMesh.positionOS );
				float3 lerpResult3146_g57765 = lerp( lerpResult3153_g57765 , VERTEX_POSITION2282_g57765 , _WindEnableMode);
				float WindEnable3144_g57765 = _WindEnable;
				float3 lerpResult3143_g57765 = lerp( VERTEX_POSITION_MATRIX2352_g57765 , lerpResult3146_g57765 , WindEnable3144_g57765);
				float3 lerpResult3142_g57765 = lerp( float3(0,0,0) , lerpResult3143_g57765 , ( _WindEnable + ( ( _CATEGORY_WIND + _SPACE_WIND ) * 0.0 ) ));
				float3 temp_output_18_0_g57786 = lerpResult3142_g57765;
				float3 temp_output_17_0_g57786 = 0;
				
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult982_g57768 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult989_g57768 = lerp( inputMesh.normalOS , -inputMesh.normalOS , step( dotResult982_g57768 , -1.0 ));
				
				float4 appendResult986_g57768 = (float4(cross( inputMesh.normalOS , float3(0,0,1) ) , -1.0));
				
				float m_switch80_g57778 = _UVMode;
				float2 m_UV080_g57778 = inputMesh.ase_texcoord.xy;
				float2 m_UV180_g57778 = inputMesh.ase_texcoord1.xy;
				float2 m_UV280_g57778 = inputMesh.ase_texcoord2.xy;
				float2 m_UV380_g57778 = inputMesh.ase_texcoord3.xy;
				float2 localfloat2switchUVMode80_g57778 = float2switchUVMode80_g57778( m_switch80_g57778 , m_UV080_g57778 , m_UV180_g57778 , m_UV280_g57778 , m_UV380_g57778 );
				float2 Offset235_g57778 = (_MainUVs).zw;
				float2 temp_output_41_0_g57778 = ( ( localfloat2switchUVMode80_g57778 * (_MainUVs).xy ) + Offset235_g57778 );
				float2 vertexToFrag70_g57778 = temp_output_41_0_g57778;
				outputPackedVaryingsMeshToPS.ase_texcoord3.xy = vertexToFrag70_g57778;
				
				float3 ase_worldTangent = TransformObjectToWorldDir(inputMesh.tangentOS.xyz);
				float ase_vertexTangentSign = inputMesh.tangentOS.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				outputPackedVaryingsMeshToPS.ase_texcoord4.xyz = ase_worldBitangent;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord3.zw = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord4.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = ( temp_output_18_0_g57786 + temp_output_17_0_g57786 );

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS = lerpResult989_g57768;
				inputMesh.tangentOS = appendResult986_g57768;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.positionRWS.xyz = positionRWS;
				outputPackedVaryingsMeshToPS.normalWS.xyz = normalWS;
				outputPackedVaryingsMeshToPS.tangentWS.xyzw = tangentWS;
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_texcoord2 = v.ase_texcoord2;
				o.ase_texcoord3 = v.ase_texcoord3;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(WRITE_NORMAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target2
			#elif defined(WRITE_NORMAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target1
			#else
			#define SV_TARGET_DECAL SV_Target0
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
						#if defined(SCENESELECTIONPASS) || defined(SCENEPICKINGPASS)
						, out float4 outColor : SV_Target0
						#else
							#ifdef WRITE_MSAA_DEPTH
							, out float4 depthColor : SV_Target0
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target1
								#endif
							#else
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target0
								#endif
							#endif

							#if (defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)) || defined(WRITE_RENDERING_LAYER)
							, out float4 outDecalBuffer : SV_TARGET_DECAL
							#endif
						#endif

						#if defined(_DEPTHOFFSET_ON) && !defined(SCENEPICKINGPASS)
						, out float outputDepth : DEPTH_OFFSET_SEMANTIC
						#endif
						
					)
			{
			UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(packedInput);
			UNITY_SETUP_INSTANCE_ID(packedInput);

				float3 positionRWS = packedInput.positionRWS.xyz;
				float3 normalWS = packedInput.normalWS.xyz;
				float4 tangentWS = packedInput.tangentWS.xyzw;

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);

				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				input.positionRWS = positionRWS;
				input.tangentToWorld = BuildTangentToWorld(tangentWS, normalWS);

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false );
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				SmoothSurfaceDescription surfaceDescription = (SmoothSurfaceDescription)0;
				float2 vertexToFrag70_g57778 = packedInput.ase_texcoord3.xy;
				float3 unpack748_g57768 = UnpackNormalScale( SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, vertexToFrag70_g57778 ), _NormalStrength );
				unpack748_g57768.z = lerp( 1, unpack748_g57768.z, saturate(_NormalStrength) );
				float3 temp_output_24_0_g57782 = unpack748_g57768;
				
				float2 appendResult899_g57768 = (float2(V.xy));
				float3 appendResult898_g57768 = (float3(appendResult899_g57768 , ( V.z / 1.06 )));
				float3 break928_g57768 = unpack748_g57768;
				float3 ase_worldBitangent = packedInput.ase_texcoord4.xyz;
				float3 normalizeResult934_g57768 = normalize( ( ( tangentWS.xyz * break928_g57768.x ) + ( ase_worldBitangent * break928_g57768.y ) + ( normalWS * break928_g57768.z ) ) );
				float3 Normal_Per_Pixel937_g57768 = normalizeResult934_g57768;
				float fresnelNdotV896_g57768 = dot( normalize( Normal_Per_Pixel937_g57768 ), appendResult898_g57768 );
				float fresnelNode896_g57768 = ( 0.0 + ( 1.0 - _SmoothnessFresnelScale ) * pow( max( 1.0 - fresnelNdotV896_g57768 , 0.0001 ), _SmoothnessFresnelPower ) );
				float lerpResult895_g57768 = lerp( _SmoothnessStrength , ( _SmoothnessStrength - fresnelNode896_g57768 ) , _SmoothnessFresnelEnable);
				
				float4 tex2DNode3_g57768 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, vertexToFrag70_g57778 );
				float temp_output_22_0_g57769 = tex2DNode3_g57768.a;
				float temp_output_22_0_g57771 = temp_output_22_0_g57769;
				float3 ase_worldPos = GetAbsolutePositionWS( positionRWS );
				float3 temp_output_95_0_g57773 = cross( ddy( ase_worldPos ) , ddx( ase_worldPos ) );
				float3 normalizeResult96_g57773 = normalize( temp_output_95_0_g57773 );
				float dotResult74_g57769 = dot( normalizeResult96_g57773 , V );
				float temp_output_76_0_g57769 = ( 1.0 - abs( dotResult74_g57769 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g57769 = 1.0;
				#else
				float staticSwitch281_g57769 = ( 1.0 - ( temp_output_76_0_g57769 * temp_output_76_0_g57769 ) );
				#endif
				float lerpResult80_g57769 = lerp( 1.0 , staticSwitch281_g57769 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g57769 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g57771 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g57771 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g57769 );
				
				surfaceDescription.Normal = temp_output_24_0_g57782;
				surfaceDescription.Smoothness = saturate( lerpResult895_g57768 );
				surfaceDescription.Alpha = temp_output_98_0_g57769;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _Cutoff;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

                #if defined(_DEPTHOFFSET_ON) && !defined(SCENEPICKINGPASS)
				outputDepth = posInput.deviceDepth;
				#endif

                #if SHADERPASS == SHADERPASS_SHADOWS
                float bias = max(abs(ddx(posInput.deviceDepth)), abs(ddy(posInput.deviceDepth))) * _SlopeScaleDepthBias;
                outputDepth += bias;
                #endif

                #ifdef SCENESELECTIONPASS
                outColor = float4(_ObjectId, _PassValue, 1.0, 1.0);
                #elif defined(SCENEPICKINGPASS)
                outColor = unity_SelectionID;
                #else
                #ifdef WRITE_MSAA_DEPTH
                depthColor = packedInput.vmesh.positionCS.z;
                depthColor.a = SharpenAlpha(builtinData.opacity, builtinData.alphaClipTreshold);
				#endif
                #endif

                #if defined(WRITE_NORMAL_BUFFER)
                EncodeIntoNormalBuffer(ConvertSurfaceDataToNormalData(surfaceData), outNormalBuffer);
                #endif

                #if (defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)) || defined(WRITE_RENDERING_LAYER)
				    DecalPrepassData decalPrepassData;
                    #ifdef _DISABLE_DECALS
				    ZERO_INITIALIZE(DecalPrepassData, decalPrepassData);
                    #else
				    decalPrepassData.geomNormalWS = surfaceData.geomNormalWS;
                    #endif
				    decalPrepassData.renderingLayerMask = GetMeshRenderingLayerMask();
				    EncodeIntoDecalPrepassBuffer(decalPrepassData, outDecalBuffer);
				#endif

			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "MotionVectors"
			Tags { "LightMode"="MotionVectors" }

			Cull [_CullMode]

			ZWrite On

			Stencil
			{
				Ref [_StencilRefMV]
				WriteMask [_StencilWriteMaskMV]
				Comp Always
				Pass Replace
			}


			HLSLPROGRAM
			#define ASE_NEED_CULLFACE 1
			#pragma shader_feature_local _ _DOUBLESIDED_ON
			#pragma shader_feature_local_fragment _ _DISABLE_DECALS
			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma shader_feature_local _ _ALPHATEST_ON
			#define _ALPHATEST_SHADOW_ON 1
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define _AMBIENT_OCCLUSION 1
			#define HAVE_MESH_MODIFICATION
			#define ASE_SRP_VERSION 170002
			#define ASE_USING_SAMPLING_MACROS 1

			#pragma multi_compile _ DOTS_INSTANCING_ON

            #pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
            #pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC _TRANSPARENT_REFRACTIVE_SORT
            #pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT

            #pragma multi_compile _ WRITE_NORMAL_BUFFER
            #pragma multi_compile_fragment _ WRITE_MSAA_DEPTH
            #pragma multi_compile_fragment _ WRITE_DECAL_BUFFER_AND_RENDERING_LAYER

			#ifdef WRITE_DECAL_BUFFER_AND_RENDERING_LAYER
			#define WRITE_DECAL_BUFFER
			#endif

			#pragma vertex Vert
			#pragma fragment Frag

            #define SHADERPASS SHADERPASS_MOTION_VECTORS

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

            //#if !defined(SHADER_STAGE_RAY_TRACING) && SHADERPASS != SHADERPASS_RAYTRACING_GBUFFER && SHADERPASS != SHADERPASS_FULL_SCREEN_DEBUG
            //#define FRAG_INPUTS_ENABLE_STRIPPING
            //#endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
                #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif
        
            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
               #define RAYTRACING_SHADER_GRAPH_LOW
            #endif

            #ifndef SHADER_UNLIT
            #if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
                #define VARYINGS_NEED_CULLFACE
            #endif
            #endif

			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			     #define ASE_NEED_CULLFACE 1
			#endif

            #if _MATERIAL_FEATURE_COLORED_TRANSMISSION
            #undef _MATERIAL_FEATURE_CLEAR_COAT
            #endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

		    #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
			#undef  _REFRACTION_PLANE
			#undef  _REFRACTION_SPHERE
			#define _REFRACTION_THIN
		    #endif

            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
            #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                #define WRITE_NORMAL_BUFFER
            #endif
            #endif

            #if SHADERPASS == SHADERPASS_MOTION_VECTORS && defined(WRITE_DECAL_BUFFER_AND_RENDERING_LAYER)
                #define WRITE_DECAL_BUFFER
            #endif

            #ifndef DEBUG_DISPLAY
                #if !defined(_SURFACE_TYPE_TRANSPARENT)
                    #if SHADERPASS == SHADERPASS_FORWARD
                    #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                    #elif SHADERPASS == SHADERPASS_GBUFFER
                    #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                    #endif
                #endif
            #endif

            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif
        
			#if (defined(_TRANSPARENT_WRITES_MOTION_VEC) || defined(_TRANSPARENT_REFRACTIVE_SORT)) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
			#endif

			CBUFFER_START( UnityPerMaterial )
			float4 _AlphaRemap;
			half4 _BaseColor;
			float4 _MainUVs;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_ALPHACLIP;
			float _CATEGORY_ALPHACLIPPING;
			half _GlancingClipMode;
			float _AlphaRemapMax;
			float _AlphaRemapMin;
			half _OcclusionStrengthAO;
			half _SmoothnessFresnelEnable;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelScale;
			half _SmoothnessStrength;
			float _MetallicStrength;
			half _Brightness;
			float _Cutoff;
			float _UVMode;
			float _SPACE_WIND;
			float _CATEGORY_WIND;
			half _WindEnable;
			half _WindLocalDirection;
			half _WindLocalPulseFrequency;
			half _WindLocalRandomOffset;
			half _WindEnableMode;
			half _WindLocalIntensity;
			half _WindGlobalIntensity;
			float _SPACE_SURFACEINPUTS;
			half _NormalStrength;
			half _AlphaCutoffShadow;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			    float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			    float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _DstBlend2;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			    float _TessPhongStrength;
			    float _TessValue;
			    float _TessMin;
			    float _TessMax;
			    float _TessEdgeLength;
			    float _TessMaxDisp;
			#endif
			UNITY_TEXTURE_STREAMING_DEBUG_VARS;
			CBUFFER_END

            #ifdef SCENEPICKINGPASS
			float4 _SelectionID;
            #endif

            #ifdef SCENESELECTIONPASS
			int _ObjectId;
			int _PassValue;
            #endif

			float _GlobalWindBillboardIntensity;
			float _GlobalWindIntensity;
			float _GlobalWindRandomOffset;
			float _GlobalWindPulse;
			float _GlobalWindDirection;
			float _GlobalWindBillboardEnabled;
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

        	#ifdef HAVE_VFX_MODIFICATION
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
        	#endif

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR


			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float3 previousPositionOS : TEXCOORD4;
				float3 precomputedVelocity : TEXCOORD5;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 vmeshPositionCS : SV_Position;
				float3 vmeshInterp00 : TEXCOORD0;
				float3 vpassInterpolators0 : TEXCOORD1; //interpolators0
				float3 vpassInterpolators1 : TEXCOORD2; //interpolators1
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float2 float2switchUVMode80_g57778( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
			{
				if(m_switch ==0)
					return m_UV0;
				else if(m_switch ==1)
					return m_UV1;
				else if(m_switch ==2)
					return m_UV2;
				else if(m_switch ==3)
					return m_UV3;
				else
				return float2(0,0);
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout SmoothSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;
				surfaceData.thickness = 0.0;
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;

				// refraction
                #if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
                    if (_EnableSSRefraction)
                    {
                        surfaceData.ior =                       surfaceDescription.RefractionIndex;
                        surfaceData.transmittanceColor =        surfaceDescription.RefractionColor;
                        surfaceData.atDistance =                surfaceDescription.RefractionDistance;
        
                        surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
                        surfaceDescription.Alpha = 1.0;
                    }
                    else
                    {
                        surfaceData.ior = 1.0;
                        surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                        surfaceData.atDistance = 1.0;
                        surfaceData.transmittanceMask = 0.0;
                        surfaceDescription.Alpha = 1.0;
                    }
                #else
                    surfaceData.ior = 1.0;
                    surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                    surfaceData.atDistance = 1.0;
                    surfaceData.transmittanceMask = 0.0;
                #endif

				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif

				#ifdef _MATERIAL_FEATURE_COLORED_TRANSMISSION
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_COLORED_TRANSMISSION;
				#endif

                #ifdef _MATERIAL_FEATURE_ANISOTROPY
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
                    surfaceData.normalWS = float3(0, 1, 0);
                #endif

				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
                    surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif

				#ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
                    float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;

                #ifdef DECAL_NORMAL_BLENDING
					normalTS = SurfaceGradientFromTangentSpaceNormalAndFromTBN(normalTS, fragInputs.tangentToWorld[0], fragInputs.tangentToWorld[1]);

                    #if HAVE_DECALS
                    if (_EnableDecals)
                    {
                        float alpha = 1.0;
                        alpha = surfaceDescription.Alpha;

                        DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, alpha);
                        ApplyDecalToSurfaceNormal(decalSurfaceData, fragInputs.tangentToWorld[2], normalTS);
                        ApplyDecalToSurfaceDataNoNormal(decalSurfaceData, surfaceData);
                     }
                    #endif

                    GetNormalWS_SG(fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants);
                #else
					GetNormalWS(fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants);

                    #if HAVE_DECALS
                    if (_EnableDecals)
                    {
                        float alpha = 1.0;
                        alpha = surfaceDescription.Alpha;

                        DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, alpha);
                        ApplyDecalToSurfaceNormal(decalSurfaceData, surfaceData.normalWS.xyz);
                        ApplyDecalToSurfaceDataNoNormal(decalSurfaceData, surfaceData);
                    }
                    #endif
                #endif

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
                surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz );
                surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

				bentNormalWS = surfaceData.normalWS;

				#if defined(DEBUG_DISPLAY)
				    #if !defined(SHADER_STAGE_RAY_TRACING)
				    if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				    {
					   #ifdef FRAG_INPUTS_USE_TEXCOORD0
                           surfaceData.baseColor = GET_TEXTURE_STREAMING_DEBUG(posInput.positionSS, fragInputs.texCoord0);
                       #else
                           surfaceData.baseColor = GET_TEXTURE_STREAMING_DEBUG_NO_UV(posInput.positionSS);
                       #endif
					   surfaceData.metallic = 0;
				    }
					#endif
				    ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData); 
				#endif

                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
                    surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
                    surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif

                #ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
                    surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
                #endif
			}

			// Get Surface And BuiltinData
			void GetSurfaceAndBuiltinData(SmoothSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
                    LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

                #ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
                    float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif
                ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants);

				#ifdef _ALPHATEST_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThresholdShadow);
				#endif

				#ifdef _DEPTHOFFSET_ON
                    ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
				#endif

                float3 bentNormalWS;
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);
                InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

				#ifdef _DEPTHOFFSET_ON
                    builtinData.depthOffset = surfaceDescription.DepthOffset;
				#endif

                #ifdef _ALPHATEST_ON
                    builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

                #ifdef UNITY_VIRTUAL_TEXTURING
                    builtinData.vtPackedFeedback = surfaceDescription.VTPackedFeedback;
                #endif

				#ifdef ASE_BAKEDGI
                    builtinData.bakeDiffuseLighting = surfaceDescription.BakedGI;
				#endif

				#ifdef ASE_BAKEDBACKGI
                    builtinData.backBakeDiffuseLighting = surfaceDescription.BakedBackGI;
				#endif

                builtinData.emissiveColor = surfaceDescription.Emission;

                PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			AttributesMesh ApplyMeshModification(AttributesMesh inputMesh, float3 timeParameters, inout PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS )
			{
				_TimeParameters.xyz = timeParameters;
				//Calculate new billboard vertex position and normal;
				float3 upCamVec = float3( 0, 1, 0 );
				float3 forwardCamVec = -normalize ( UNITY_MATRIX_V._m20_m21_m22 );
				float3 rightCamVec = normalize( UNITY_MATRIX_V._m00_m01_m02 );
				float4x4 rotationCamMatrix = float4x4( rightCamVec, 0, upCamVec, 0, forwardCamVec, 0, 0, 0, 0, 1 );
				inputMesh.normalOS = normalize( mul( float4( inputMesh.normalOS , 0 ), rotationCamMatrix )).xyz;
				inputMesh.tangentOS.xyz = normalize( mul( float4( inputMesh.tangentOS.xyz , 0 ), rotationCamMatrix )).xyz;
				//This unfortunately must be made to take non-uniform scaling into account;
				//Transform to world coords, apply rotation and transform back to local;
				inputMesh.positionOS = mul( float4(inputMesh.positionOS,0) , GetObjectToWorldMatrix() ).xyz;
				inputMesh.positionOS = mul( float4(inputMesh.positionOS,0) , rotationCamMatrix ).xyz;
				inputMesh.positionOS = mul( float4(inputMesh.positionOS,0) , GetWorldToObjectMatrix() ).xyz;
				float3 VERTEX_POSITION_MATRIX2352_g57765 = mul( GetObjectToWorldMatrix(), float4( inputMesh.positionOS , 0.0 ) ).xyz;
				float3 break2265_g57765 = VERTEX_POSITION_MATRIX2352_g57765;
				float GlobalWindBillboardIntensity3181_g57765 = _GlobalWindBillboardIntensity;
				float GlobalWindIntensity3173_g57765 = _GlobalWindIntensity;
				float WIND_MODE2462_g57765 = _WindEnableMode;
				float lerpResult3148_g57765 = lerp( ( ( _WindGlobalIntensity * GlobalWindBillboardIntensity3181_g57765 ) * GlobalWindIntensity3173_g57765 ) , _WindLocalIntensity , WIND_MODE2462_g57765);
				float _WIND_STRENGHT2400_g57765 = lerpResult3148_g57765;
				float GlobalWindRandomOffset3174_g57765 = _GlobalWindRandomOffset;
				float lerpResult3149_g57765 = lerp( GlobalWindRandomOffset3174_g57765 , _WindLocalRandomOffset , WIND_MODE2462_g57765);
				float4 transform3073_g57765 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				transform3073_g57765.xyz = GetAbsolutePositionWS((transform3073_g57765).xyz);
				float2 appendResult2307_g57765 = (float2(transform3073_g57765.x , transform3073_g57765.z));
				float dotResult2341_g57765 = dot( appendResult2307_g57765 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g57765 = lerp( 0.8 , ( ( lerpResult3149_g57765 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g57765 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g57765 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g57765 );
				float _WIND_TUBULENCE_RANDOM2274_g57765 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g57765 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g57765.z / 15.0 ) ) ) * 0.5 );
				float GlobalWindPulse3177_g57765 = _GlobalWindPulse;
				float lerpResult3152_g57765 = lerp( GlobalWindPulse3177_g57765 , _WindLocalPulseFrequency , WIND_MODE2462_g57765);
				float _WIND_PULSE2421_g57765 = lerpResult3152_g57765;
				float FUNC_Angle2470_g57765 = ( _WIND_STRENGHT2400_g57765 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g57765 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g57765 ) - ( VERTEX_POSITION_MATRIX2352_g57765.z / 50.0 ) ) - ( inputMesh.ase_color.r / 20.0 ) ) ) ) * sqrt( inputMesh.ase_color.r ) * _WIND_PULSE2421_g57765 );
				float FUNC_Angle_SinA2424_g57765 = sin( FUNC_Angle2470_g57765 );
				float FUNC_Angle_CosA2362_g57765 = cos( FUNC_Angle2470_g57765 );
				float GlobalWindDirection3175_g57765 = _GlobalWindDirection;
				float lerpResult3150_g57765 = lerp( GlobalWindDirection3175_g57765 , _WindLocalDirection , WIND_MODE2462_g57765);
				float _WindDirection2249_g57765 = lerpResult3150_g57765;
				float2 localDirectionalEquation2249_g57765 = DirectionalEquation( _WindDirection2249_g57765 );
				float2 break2469_g57765 = localDirectionalEquation2249_g57765;
				float _WIND_DIRECTION_X2418_g57765 = break2469_g57765.x;
				float lerpResult2258_g57765 = lerp( break2265_g57765.x , ( ( break2265_g57765.y * FUNC_Angle_SinA2424_g57765 ) + ( break2265_g57765.x * FUNC_Angle_CosA2362_g57765 ) ) , _WIND_DIRECTION_X2418_g57765);
				float3 break2340_g57765 = VERTEX_POSITION_MATRIX2352_g57765;
				float3 break2233_g57765 = VERTEX_POSITION_MATRIX2352_g57765;
				float _WIND_DIRECTION_Y2416_g57765 = break2469_g57765.y;
				float lerpResult2275_g57765 = lerp( break2233_g57765.z , ( ( break2233_g57765.y * FUNC_Angle_SinA2424_g57765 ) + ( break2233_g57765.z * FUNC_Angle_CosA2362_g57765 ) ) , _WIND_DIRECTION_Y2416_g57765);
				float3 appendResult2235_g57765 = (float3(lerpResult2258_g57765 , ( ( break2340_g57765.y * FUNC_Angle_CosA2362_g57765 ) - ( break2340_g57765.z * FUNC_Angle_SinA2424_g57765 ) ) , lerpResult2275_g57765));
				float3 VERTEX_POSITION_Neg3006_g57765 = appendResult2235_g57765;
				float GlobalWindBillboardEnabled3180_g57765 = _GlobalWindBillboardEnabled;
				float3 lerpResult3153_g57765 = lerp( float3(0,0,0) , ( VERTEX_POSITION_Neg3006_g57765 - VERTEX_POSITION_MATRIX2352_g57765 ) , GlobalWindBillboardEnabled3180_g57765);
				float3 VERTEX_POSITION2282_g57765 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g57765 , 0.0 ) ).xyz - inputMesh.positionOS );
				float3 lerpResult3146_g57765 = lerp( lerpResult3153_g57765 , VERTEX_POSITION2282_g57765 , _WindEnableMode);
				float WindEnable3144_g57765 = _WindEnable;
				float3 lerpResult3143_g57765 = lerp( VERTEX_POSITION_MATRIX2352_g57765 , lerpResult3146_g57765 , WindEnable3144_g57765);
				float3 lerpResult3142_g57765 = lerp( float3(0,0,0) , lerpResult3143_g57765 , ( _WindEnable + ( ( _CATEGORY_WIND + _SPACE_WIND ) * 0.0 ) ));
				float3 temp_output_18_0_g57786 = lerpResult3142_g57765;
				float3 temp_output_17_0_g57786 = 0;
				
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult982_g57768 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult989_g57768 = lerp( inputMesh.normalOS , -inputMesh.normalOS , step( dotResult982_g57768 , -1.0 ));
				
				float4 appendResult986_g57768 = (float4(cross( inputMesh.normalOS , float3(0,0,1) ) , -1.0));
				
				float m_switch80_g57778 = _UVMode;
				float2 m_UV080_g57778 = inputMesh.ase_texcoord.xy;
				float2 m_UV180_g57778 = inputMesh.ase_texcoord1.xy;
				float2 m_UV280_g57778 = inputMesh.ase_texcoord2.xy;
				float2 m_UV380_g57778 = inputMesh.ase_texcoord3.xy;
				float2 localfloat2switchUVMode80_g57778 = float2switchUVMode80_g57778( m_switch80_g57778 , m_UV080_g57778 , m_UV180_g57778 , m_UV280_g57778 , m_UV380_g57778 );
				float2 Offset235_g57778 = (_MainUVs).zw;
				float2 temp_output_41_0_g57778 = ( ( localfloat2switchUVMode80_g57778 * (_MainUVs).xy ) + Offset235_g57778 );
				float2 vertexToFrag70_g57778 = temp_output_41_0_g57778;
				outputPackedVaryingsMeshToPS.ase_texcoord3.xy = vertexToFrag70_g57778;
				
				float3 ase_worldTangent = TransformObjectToWorldDir(inputMesh.tangentOS.xyz);
				outputPackedVaryingsMeshToPS.ase_texcoord4.xyz = ase_worldTangent;
				float ase_vertexTangentSign = inputMesh.tangentOS.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				outputPackedVaryingsMeshToPS.ase_texcoord5.xyz = ase_worldBitangent;
				outputPackedVaryingsMeshToPS.ase_texcoord6.xyz = ase_worldNormal;
				
				outputPackedVaryingsMeshToPS.ase_texcoord7.xyz = ase_worldPos;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord3.zw = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord4.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord5.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord6.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord7.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = ( temp_output_18_0_g57786 + temp_output_17_0_g57786 );

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif
				inputMesh.normalOS = lerpResult989_g57768;
				inputMesh.tangentOS = appendResult986_g57768;
				return inputMesh;
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh)
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS = (PackedVaryingsMeshToPS)0;
				AttributesMesh defaultMesh = inputMesh;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				inputMesh = ApplyMeshModification( inputMesh, _TimeParameters.xyz, outputPackedVaryingsMeshToPS);

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);

				float3 VMESHpositionRWS = positionRWS;
				float4 VMESHpositionCS = TransformWorldToHClip(positionRWS);

				float4 VPASSpreviousPositionCS;
				float4 VPASSpositionCS = mul(UNITY_MATRIX_UNJITTERED_VP, float4(VMESHpositionRWS, 1.0));

				bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
				if (forceNoMotion)
				{
					VPASSpreviousPositionCS = float4(0.0, 0.0, 0.0, 1.0);
				}
				else
				{
					bool hasDeformation = unity_MotionVectorsParams.x > 0.0;
					float3 effectivePositionOS = (hasDeformation ? inputMesh.previousPositionOS : defaultMesh.positionOS);
					#if defined(_ADD_PRECOMPUTED_VELOCITY)
					effectivePositionOS -= inputMesh.precomputedVelocity;
					#endif

					#if defined(HAVE_MESH_MODIFICATION)
						AttributesMesh previousMesh = defaultMesh;
						previousMesh.positionOS = effectivePositionOS ;
						PackedVaryingsMeshToPS test = (PackedVaryingsMeshToPS)0;
						float3 curTime = _TimeParameters.xyz;
						previousMesh = ApplyMeshModification(previousMesh, _LastTimeParameters.xyz, test);
						_TimeParameters.xyz = curTime;
						float3 previousPositionRWS = TransformPreviousObjectToWorld(previousMesh.positionOS);
					#else
						float3 previousPositionRWS = TransformPreviousObjectToWorld(effectivePositionOS);
					#endif

					#ifdef ATTRIBUTES_NEED_NORMAL
						float3 normalWS = TransformPreviousObjectToWorldNormal(defaultMesh.normalOS);
					#else
						float3 normalWS = float3(0.0, 0.0, 0.0);
					#endif

					#if defined(HAVE_VERTEX_MODIFICATION)
						ApplyVertexModification(inputMesh, normalWS, previousPositionRWS, _LastTimeParameters.xyz);
					#endif

					#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
						if (_TransparentCameraOnlyMotionVectors > 0)
						{
							previousPositionRWS = VMESHpositionRWS.xyz;
						}
					#endif

					VPASSpreviousPositionCS = mul(UNITY_MATRIX_PREV_VP, float4(previousPositionRWS, 1.0));
				}

				outputPackedVaryingsMeshToPS.vmeshPositionCS = VMESHpositionCS;
				outputPackedVaryingsMeshToPS.vmeshInterp00.xyz = VMESHpositionRWS;

				outputPackedVaryingsMeshToPS.vpassInterpolators0 = float3(VPASSpositionCS.xyw);
				outputPackedVaryingsMeshToPS.vpassInterpolators1 = float3(VPASSpreviousPositionCS.xyw);
				return outputPackedVaryingsMeshToPS;
			}

			#if (defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)) || defined(WRITE_RENDERING_LAYER)
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalPrepassBuffer.hlsl"
			#endif

			#if ( 0 ) // TEMPORARY: defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float3 previousPositionOS : TEXCOORD4;
				float3 precomputedVelocity : TEXCOORD5;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.previousPositionOS = v.previousPositionOS;
				#if defined (_ADD_PRECOMPUTED_VELOCITY)
				o.precomputedVelocity = v.precomputedVelocity;
				#endif
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_texcoord2 = v.ase_texcoord2;
				o.ase_texcoord3 = v.ase_texcoord3;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.previousPositionOS = patch[0].previousPositionOS * bary.x + patch[1].previousPositionOS * bary.y + patch[2].previousPositionOS * bary.z;
				#if defined (_ADD_PRECOMPUTED_VELOCITY)
					o.precomputedVelocity = patch[0].precomputedVelocity * bary.x + patch[1].precomputedVelocity * bary.y + patch[2].precomputedVelocity * bary.z;
				#endif
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(WRITE_DECAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_NORMAL SV_Target3
			#elif defined(WRITE_DECAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_NORMAL SV_Target2
			#else
			#define SV_TARGET_NORMAL SV_Target1
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
				#ifdef WRITE_MSAA_DEPTH
					, out float4 depthColor : SV_Target0
					, out float4 outMotionVector : SV_Target1
						#ifdef WRITE_DECAL_BUFFER
						, out float4 outDecalBuffer : SV_Target2
						#endif
					#else
					, out float4 outMotionVector : SV_Target0
						#ifdef WRITE_DECAL_BUFFER
						, out float4 outDecalBuffer : SV_Target1
						#endif
					#endif

					#ifdef WRITE_NORMAL_BUFFER
					, out float4 outNormalBuffer : SV_TARGET_NORMAL
					#endif

					#ifdef _DEPTHOFFSET_ON
					, out float outputDepth : DEPTH_OFFSET_SEMANTIC
					#endif
				
				)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.vmeshPositionCS;
				input.positionRWS = packedInput.vmeshInterp00.xyz;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				SurfaceData surfaceData;
				BuiltinData builtinData;

				SmoothSurfaceDescription surfaceDescription = (SmoothSurfaceDescription)0;
				float2 vertexToFrag70_g57778 = packedInput.ase_texcoord3.xy;
				float3 unpack748_g57768 = UnpackNormalScale( SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, vertexToFrag70_g57778 ), _NormalStrength );
				unpack748_g57768.z = lerp( 1, unpack748_g57768.z, saturate(_NormalStrength) );
				float3 temp_output_24_0_g57782 = unpack748_g57768;
				
				float2 appendResult899_g57768 = (float2(V.xy));
				float3 appendResult898_g57768 = (float3(appendResult899_g57768 , ( V.z / 1.06 )));
				float3 ase_worldTangent = packedInput.ase_texcoord4.xyz;
				float3 break928_g57768 = unpack748_g57768;
				float3 ase_worldBitangent = packedInput.ase_texcoord5.xyz;
				float3 ase_worldNormal = packedInput.ase_texcoord6.xyz;
				float3 normalizeResult934_g57768 = normalize( ( ( ase_worldTangent * break928_g57768.x ) + ( ase_worldBitangent * break928_g57768.y ) + ( ase_worldNormal * break928_g57768.z ) ) );
				float3 Normal_Per_Pixel937_g57768 = normalizeResult934_g57768;
				float fresnelNdotV896_g57768 = dot( normalize( Normal_Per_Pixel937_g57768 ), appendResult898_g57768 );
				float fresnelNode896_g57768 = ( 0.0 + ( 1.0 - _SmoothnessFresnelScale ) * pow( max( 1.0 - fresnelNdotV896_g57768 , 0.0001 ), _SmoothnessFresnelPower ) );
				float lerpResult895_g57768 = lerp( _SmoothnessStrength , ( _SmoothnessStrength - fresnelNode896_g57768 ) , _SmoothnessFresnelEnable);
				
				float4 tex2DNode3_g57768 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, vertexToFrag70_g57778 );
				float temp_output_22_0_g57769 = tex2DNode3_g57768.a;
				float temp_output_22_0_g57771 = temp_output_22_0_g57769;
				float3 ase_worldPos = packedInput.ase_texcoord7.xyz;
				float3 temp_output_95_0_g57773 = cross( ddy( ase_worldPos ) , ddx( ase_worldPos ) );
				float3 normalizeResult96_g57773 = normalize( temp_output_95_0_g57773 );
				float dotResult74_g57769 = dot( normalizeResult96_g57773 , V );
				float temp_output_76_0_g57769 = ( 1.0 - abs( dotResult74_g57769 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g57769 = 1.0;
				#else
				float staticSwitch281_g57769 = ( 1.0 - ( temp_output_76_0_g57769 * temp_output_76_0_g57769 ) );
				#endif
				float lerpResult80_g57769 = lerp( 1.0 , staticSwitch281_g57769 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g57769 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g57771 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g57771 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g57769 );
				
				surfaceDescription.Normal = temp_output_24_0_g57782;
				surfaceDescription.Smoothness = saturate( lerpResult895_g57768 );
				surfaceDescription.Alpha = temp_output_98_0_g57769;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _Cutoff;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				float4 VPASSpositionCS = float4(packedInput.vpassInterpolators0.xy, 0.0, packedInput.vpassInterpolators0.z);
				float4 VPASSpreviousPositionCS = float4(packedInput.vpassInterpolators1.xy, 0.0, packedInput.vpassInterpolators1.z);

				#ifdef _DEPTHOFFSET_ON
				VPASSpositionCS.w += builtinData.depthOffset;
				VPASSpreviousPositionCS.w += builtinData.depthOffset;
				#endif

				float2 motionVector = CalculateMotionVector( VPASSpositionCS, VPASSpreviousPositionCS );
				EncodeMotionVector( motionVector * 0.5, outMotionVector );

				bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
				if( forceNoMotion )
					outMotionVector = float4( 2.0, 0.0, 0.0, 0.0 );

				#ifdef WRITE_MSAA_DEPTH
					depthColor = packedInput.vmeshPositionCS.z;

					depthColor.a = SharpenAlpha(builtinData.opacity, builtinData.alphaClipTreshold);
				#endif

                #if defined(WRITE_NORMAL_BUFFER)
                EncodeIntoNormalBuffer(ConvertSurfaceDataToNormalData(surfaceData), outNormalBuffer);
                #endif

				#if defined(WRITE_DECAL_BUFFER)
					DecalPrepassData decalPrepassData;
					#ifdef _DISABLE_DECALS
					ZERO_INITIALIZE(DecalPrepassData, decalPrepassData);
					#else
					decalPrepassData.geomNormalWS = surfaceData.geomNormalWS;
					#endif
					decalPrepassData.renderingLayerMask = GetMeshRenderingLayerMask();
					EncodeIntoDecalPrepassBuffer(decalPrepassData, outDecalBuffer);
				#endif

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="Forward" }

			Blend [_SrcBlend] [_DstBlend], [_AlphaSrcBlend] [_AlphaDstBlend]
			Blend 1 SrcAlpha OneMinusSrcAlpha
			Blend 2 One [_DstBlend2]
			Blend 3 One [_DstBlend2]
			Blend 4 One OneMinusSrcAlpha

			Cull [_CullModeForward]
			ZTest [_ZTestDepthEqualForOpaque]
			ZWrite [_ZWrite]

			Stencil
			{
				Ref [_StencilRef]
				WriteMask [_StencilWriteMask]
				Comp Always
				Pass Replace
			}


            ColorMask [_ColorMaskTransparentVelOne] 1
            ColorMask [_ColorMaskTransparentVelTwo] 2

			HLSLPROGRAM
			#define ASE_NEED_CULLFACE 1
			#pragma shader_feature_local _ _DOUBLESIDED_ON
			#pragma shader_feature_local_fragment _ _DISABLE_DECALS
			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma shader_feature_local _ _ALPHATEST_ON
			#define _ALPHATEST_SHADOW_ON 1
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define _AMBIENT_OCCLUSION 1
			#define HAVE_MESH_MODIFICATION
			#define ASE_SRP_VERSION 170002
			#define ASE_USING_SAMPLING_MACROS 1

			#pragma multi_compile _ DOTS_INSTANCING_ON

            #pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
            #pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC _TRANSPARENT_REFRACTIVE_SORT
            #pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT

            #pragma multi_compile_fragment _ SHADOWS_SHADOWMASK
            #pragma multi_compile_fragment PUNCTUAL_SHADOW_LOW PUNCTUAL_SHADOW_MEDIUM PUNCTUAL_SHADOW_HIGH
            #pragma multi_compile_fragment DIRECTIONAL_SHADOW_LOW DIRECTIONAL_SHADOW_MEDIUM DIRECTIONAL_SHADOW_HIGH
            #pragma multi_compile_fragment AREA_SHADOW_MEDIUM AREA_SHADOW_HIGH
            #pragma multi_compile_fragment _ PROBE_VOLUMES_L1 PROBE_VOLUMES_L2
            #pragma multi_compile_fragment SCREEN_SPACE_SHADOWS_OFF SCREEN_SPACE_SHADOWS_ON
            #pragma multi_compile_fragment USE_FPTL_LIGHTLIST USE_CLUSTERED_LIGHTLIST

            #pragma multi_compile _ DEBUG_DISPLAY
            #pragma multi_compile _ LIGHTMAP_ON
            #pragma multi_compile _ DIRLIGHTMAP_COMBINED
            #pragma multi_compile _ DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fragment DECALS_OFF DECALS_3RT DECALS_4RT
            #pragma multi_compile_fragment _ DECAL_SURFACE_GRADIENT
            #pragma multi_compile _ USE_LEGACY_LIGHTMAPS

			#ifndef SHADER_STAGE_FRAGMENT
			#define SHADOW_LOW
			#define USE_FPTL_LIGHTLIST
			#endif

			#pragma vertex Vert
			#pragma fragment Frag

			#define SHADERPASS SHADERPASS_FORWARD
		    #define HAS_LIGHTLOOP 1

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

            //#if !defined(SHADER_STAGE_RAY_TRACING) && SHADERPASS != SHADERPASS_RAYTRACING_GBUFFER && SHADERPASS != SHADERPASS_FULL_SCREEN_DEBUG
            //#define FRAG_INPUTS_ENABLE_STRIPPING
            //#endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
                #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif

            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
                #define RAYTRACING_SHADER_GRAPH_LOW
            #endif

            #ifndef SHADER_UNLIT
            #if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
                #define VARYINGS_NEED_CULLFACE
            #endif
            #endif

			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			    #define ASE_NEED_CULLFACE 1
			#endif

            #if _MATERIAL_FEATURE_COLORED_TRANSMISSION
            #undef _MATERIAL_FEATURE_CLEAR_COAT
            #endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

		    #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
			#undef  _REFRACTION_PLANE
			#undef  _REFRACTION_SPHERE
			#define _REFRACTION_THIN
		    #endif

            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
            #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                #define WRITE_NORMAL_BUFFER
            #endif
            #endif

            #if SHADERPASS == SHADERPASS_MOTION_VECTORS && defined(WRITE_DECAL_BUFFER_AND_RENDERING_LAYER)
                #define WRITE_DECAL_BUFFER
            #endif

            #ifndef DEBUG_DISPLAY
                #if !defined(_SURFACE_TYPE_TRANSPARENT)
                    #if SHADERPASS == SHADERPASS_FORWARD
                    #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                    #elif SHADERPASS == SHADERPASS_GBUFFER
                    #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                    #endif
                #endif
            #endif

            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif
        
			#if (defined(_TRANSPARENT_WRITES_MOTION_VEC) || defined(_TRANSPARENT_REFRACTIVE_SORT)) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
			#endif

			CBUFFER_START( UnityPerMaterial )
			float4 _AlphaRemap;
			half4 _BaseColor;
			float4 _MainUVs;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_ALPHACLIP;
			float _CATEGORY_ALPHACLIPPING;
			half _GlancingClipMode;
			float _AlphaRemapMax;
			float _AlphaRemapMin;
			half _OcclusionStrengthAO;
			half _SmoothnessFresnelEnable;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelScale;
			half _SmoothnessStrength;
			float _MetallicStrength;
			half _Brightness;
			float _Cutoff;
			float _UVMode;
			float _SPACE_WIND;
			float _CATEGORY_WIND;
			half _WindEnable;
			half _WindLocalDirection;
			half _WindLocalPulseFrequency;
			half _WindLocalRandomOffset;
			half _WindEnableMode;
			half _WindLocalIntensity;
			half _WindGlobalIntensity;
			float _SPACE_SURFACEINPUTS;
			half _NormalStrength;
			half _AlphaCutoffShadow;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			    float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			    float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _DstBlend2;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			    float _TessPhongStrength;
			    float _TessValue;
			    float _TessMin;
			    float _TessMax;
			    float _TessEdgeLength;
			    float _TessMaxDisp;
			#endif
			UNITY_TEXTURE_STREAMING_DEBUG_VARS;
			CBUFFER_END

            #ifdef SCENEPICKINGPASS
			float4 _SelectionID;
            #endif

            #ifdef SCENESELECTIONPASS
			int _ObjectId;
			int _PassValue;
            #endif

			float _GlobalWindBillboardIntensity;
			float _GlobalWindIntensity;
			float _GlobalWindRandomOffset;
			float _GlobalWindPulse;
			float _GlobalWindDirection;
			float _GlobalWindBillboardEnabled;
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/Lighting.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/LightLoopDef.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/LightLoop.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

        	#ifdef HAVE_VFX_MODIFICATION
        	#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
        	#endif

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS


			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float3 previousPositionOS : TEXCOORD4;
				float3 precomputedVelocity : TEXCOORD5;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float3 normalWS : TEXCOORD1;
				float4 tangentWS : TEXCOORD2;
				float4 uv1 : TEXCOORD3;
				float4 uv2 : TEXCOORD4;
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					float3 vpassPositionCS : TEXCOORD5;
					float3 vpassPreviousPositionCS : TEXCOORD6;
				#endif
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float2 float2switchUVMode80_g57778( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
			{
				if(m_switch ==0)
					return m_UV0;
				else if(m_switch ==1)
					return m_UV1;
				else if(m_switch ==2)
					return m_UV2;
				else if(m_switch ==3)
					return m_UV3;
				else
				return float2(0,0);
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout GlobalSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);
				surfaceData.specularOcclusion = 1.0;
				surfaceData.thickness = 0.0;

				surfaceData.baseColor =                 surfaceDescription.BaseColor;
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;
				surfaceData.ambientOcclusion =			surfaceDescription.Occlusion;
				surfaceData.metallic =					surfaceDescription.Metallic;
				surfaceData.coatMask =					surfaceDescription.CoatMask;

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceData.specularOcclusion =			surfaceDescription.SpecularOcclusion;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.subsurfaceMask =			surfaceDescription.SubsurfaceMask;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceData.thickness = 				surfaceDescription.Thickness;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.transmissionMask =			surfaceDescription.TransmissionMask;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceData.diffusionProfileHash =		asuint(surfaceDescription.DiffusionProfile);
				#endif

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.specularColor =				surfaceDescription.Specular;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.anisotropy =				surfaceDescription.Anisotropy;
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.iridescenceMask =			surfaceDescription.IridescenceMask;
				surfaceData.iridescenceThickness =		surfaceDescription.IridescenceThickness;
				#endif

				// refraction
                #if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
                    if (_EnableSSRefraction)
                    {
                        surfaceData.ior =                       surfaceDescription.RefractionIndex;
                        surfaceData.transmittanceColor =        surfaceDescription.RefractionColor;
                        surfaceData.atDistance =                surfaceDescription.RefractionDistance;
        
                        surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
                        surfaceDescription.Alpha = 1.0;
                    }
                    else
                    {
                        surfaceData.ior = 1.0;
                        surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                        surfaceData.atDistance = 1.0;
                        surfaceData.transmittanceMask = 0.0;
                        surfaceDescription.Alpha = 1.0;
                    }
                #else
                    surfaceData.ior = 1.0;
                    surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                    surfaceData.atDistance = 1.0;
                    surfaceData.transmittanceMask = 0.0;
                #endif

				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif

				#ifdef _MATERIAL_FEATURE_COLORED_TRANSMISSION
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_COLORED_TRANSMISSION;
				#endif

                #ifdef _MATERIAL_FEATURE_ANISOTROPY
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
                    surfaceData.normalWS = float3(0, 1, 0);
                #endif

				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
                    surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
                    surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif

				#ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
                    float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;

                #ifdef DECAL_NORMAL_BLENDING
					normalTS = SurfaceGradientFromTangentSpaceNormalAndFromTBN(normalTS, fragInputs.tangentToWorld[0], fragInputs.tangentToWorld[1]);

                    #if HAVE_DECALS
                    if (_EnableDecals)
                    {
                        float alpha = 1.0;
                        alpha = surfaceDescription.Alpha;

                        DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, alpha);
                        ApplyDecalToSurfaceNormal(decalSurfaceData, fragInputs.tangentToWorld[2], normalTS);
                        ApplyDecalToSurfaceDataNoNormal(decalSurfaceData, surfaceData);
                     }
                    #endif

                    GetNormalWS_SG(fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants);
                #else
					GetNormalWS(fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants);

                    #if HAVE_DECALS
                    if (_EnableDecals)
                    {
                        float alpha = 1.0;
                        alpha = surfaceDescription.Alpha;
        
                        DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, alpha);
                        ApplyDecalToSurfaceNormal(decalSurfaceData, surfaceData.normalWS.xyz);
                        ApplyDecalToSurfaceDataNoNormal(decalSurfaceData, surfaceData);
                    }
                    #endif
                #endif

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
                surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz );
                surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

				bentNormalWS = surfaceData.normalWS;

				#ifdef ASE_BENT_NORMAL
                    GetNormalWS( fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants );
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
                    surfaceData.tangentWS = TransformTangentToWorld(surfaceDescription.Tangent, fragInputs.tangentToWorld);
				#endif

				#if defined(DEBUG_DISPLAY)
				    #if !defined(SHADER_STAGE_RAY_TRACING)
				    if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				    {
					   #ifdef FRAG_INPUTS_USE_TEXCOORD0
                           surfaceData.baseColor = GET_TEXTURE_STREAMING_DEBUG(posInput.positionSS, fragInputs.texCoord0);
                       #else
                           surfaceData.baseColor = GET_TEXTURE_STREAMING_DEBUG_NO_UV(posInput.positionSS);
                       #endif
					   surfaceData.metallic = 0;
				    }
					#endif
				    ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData); 
				#endif

                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
                    surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
                    surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif

                #ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
                    surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
                #endif
			}

			// Get Surface And BuiltinData
			void GetSurfaceAndBuiltinData(GlobalSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
                    LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

                #ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
                    float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif  
                ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants);

				#ifdef _ALPHATEST_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThresholdShadow);
				#endif

				#ifdef _DEPTHOFFSET_ON
                    ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
				#endif

				float3 bentNormalWS;
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);
                InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

				#ifdef _DEPTHOFFSET_ON
                    builtinData.depthOffset = surfaceDescription.DepthOffset;
				#endif

                #ifdef _ALPHATEST_ON
                    builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

                #ifdef UNITY_VIRTUAL_TEXTURING
                    builtinData.vtPackedFeedback = surfaceDescription.VTPackedFeedback;
                #endif

				#ifdef ASE_BAKEDGI
                    builtinData.bakeDiffuseLighting = surfaceDescription.BakedGI;
				#endif

				#ifdef ASE_BAKEDBACKGI
                    builtinData.backBakeDiffuseLighting = surfaceDescription.BakedBackGI;
				#endif

                builtinData.emissiveColor = surfaceDescription.Emission;

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			AttributesMesh ApplyMeshModification(AttributesMesh inputMesh, float3 timeParameters, inout PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS )
			{
				_TimeParameters.xyz = timeParameters;
				//Calculate new billboard vertex position and normal;
				float3 upCamVec = float3( 0, 1, 0 );
				float3 forwardCamVec = -normalize ( UNITY_MATRIX_V._m20_m21_m22 );
				float3 rightCamVec = normalize( UNITY_MATRIX_V._m00_m01_m02 );
				float4x4 rotationCamMatrix = float4x4( rightCamVec, 0, upCamVec, 0, forwardCamVec, 0, 0, 0, 0, 1 );
				inputMesh.normalOS = normalize( mul( float4( inputMesh.normalOS , 0 ), rotationCamMatrix )).xyz;
				inputMesh.tangentOS.xyz = normalize( mul( float4( inputMesh.tangentOS.xyz , 0 ), rotationCamMatrix )).xyz;
				//This unfortunately must be made to take non-uniform scaling into account;
				//Transform to world coords, apply rotation and transform back to local;
				inputMesh.positionOS = mul( float4(inputMesh.positionOS,0) , GetObjectToWorldMatrix() ).xyz;
				inputMesh.positionOS = mul( float4(inputMesh.positionOS,0) , rotationCamMatrix ).xyz;
				inputMesh.positionOS = mul( float4(inputMesh.positionOS,0) , GetWorldToObjectMatrix() ).xyz;
				float3 VERTEX_POSITION_MATRIX2352_g57765 = mul( GetObjectToWorldMatrix(), float4( inputMesh.positionOS , 0.0 ) ).xyz;
				float3 break2265_g57765 = VERTEX_POSITION_MATRIX2352_g57765;
				float GlobalWindBillboardIntensity3181_g57765 = _GlobalWindBillboardIntensity;
				float GlobalWindIntensity3173_g57765 = _GlobalWindIntensity;
				float WIND_MODE2462_g57765 = _WindEnableMode;
				float lerpResult3148_g57765 = lerp( ( ( _WindGlobalIntensity * GlobalWindBillboardIntensity3181_g57765 ) * GlobalWindIntensity3173_g57765 ) , _WindLocalIntensity , WIND_MODE2462_g57765);
				float _WIND_STRENGHT2400_g57765 = lerpResult3148_g57765;
				float GlobalWindRandomOffset3174_g57765 = _GlobalWindRandomOffset;
				float lerpResult3149_g57765 = lerp( GlobalWindRandomOffset3174_g57765 , _WindLocalRandomOffset , WIND_MODE2462_g57765);
				float4 transform3073_g57765 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				transform3073_g57765.xyz = GetAbsolutePositionWS((transform3073_g57765).xyz);
				float2 appendResult2307_g57765 = (float2(transform3073_g57765.x , transform3073_g57765.z));
				float dotResult2341_g57765 = dot( appendResult2307_g57765 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g57765 = lerp( 0.8 , ( ( lerpResult3149_g57765 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g57765 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g57765 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g57765 );
				float _WIND_TUBULENCE_RANDOM2274_g57765 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g57765 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g57765.z / 15.0 ) ) ) * 0.5 );
				float GlobalWindPulse3177_g57765 = _GlobalWindPulse;
				float lerpResult3152_g57765 = lerp( GlobalWindPulse3177_g57765 , _WindLocalPulseFrequency , WIND_MODE2462_g57765);
				float _WIND_PULSE2421_g57765 = lerpResult3152_g57765;
				float FUNC_Angle2470_g57765 = ( _WIND_STRENGHT2400_g57765 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g57765 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g57765 ) - ( VERTEX_POSITION_MATRIX2352_g57765.z / 50.0 ) ) - ( inputMesh.ase_color.r / 20.0 ) ) ) ) * sqrt( inputMesh.ase_color.r ) * _WIND_PULSE2421_g57765 );
				float FUNC_Angle_SinA2424_g57765 = sin( FUNC_Angle2470_g57765 );
				float FUNC_Angle_CosA2362_g57765 = cos( FUNC_Angle2470_g57765 );
				float GlobalWindDirection3175_g57765 = _GlobalWindDirection;
				float lerpResult3150_g57765 = lerp( GlobalWindDirection3175_g57765 , _WindLocalDirection , WIND_MODE2462_g57765);
				float _WindDirection2249_g57765 = lerpResult3150_g57765;
				float2 localDirectionalEquation2249_g57765 = DirectionalEquation( _WindDirection2249_g57765 );
				float2 break2469_g57765 = localDirectionalEquation2249_g57765;
				float _WIND_DIRECTION_X2418_g57765 = break2469_g57765.x;
				float lerpResult2258_g57765 = lerp( break2265_g57765.x , ( ( break2265_g57765.y * FUNC_Angle_SinA2424_g57765 ) + ( break2265_g57765.x * FUNC_Angle_CosA2362_g57765 ) ) , _WIND_DIRECTION_X2418_g57765);
				float3 break2340_g57765 = VERTEX_POSITION_MATRIX2352_g57765;
				float3 break2233_g57765 = VERTEX_POSITION_MATRIX2352_g57765;
				float _WIND_DIRECTION_Y2416_g57765 = break2469_g57765.y;
				float lerpResult2275_g57765 = lerp( break2233_g57765.z , ( ( break2233_g57765.y * FUNC_Angle_SinA2424_g57765 ) + ( break2233_g57765.z * FUNC_Angle_CosA2362_g57765 ) ) , _WIND_DIRECTION_Y2416_g57765);
				float3 appendResult2235_g57765 = (float3(lerpResult2258_g57765 , ( ( break2340_g57765.y * FUNC_Angle_CosA2362_g57765 ) - ( break2340_g57765.z * FUNC_Angle_SinA2424_g57765 ) ) , lerpResult2275_g57765));
				float3 VERTEX_POSITION_Neg3006_g57765 = appendResult2235_g57765;
				float GlobalWindBillboardEnabled3180_g57765 = _GlobalWindBillboardEnabled;
				float3 lerpResult3153_g57765 = lerp( float3(0,0,0) , ( VERTEX_POSITION_Neg3006_g57765 - VERTEX_POSITION_MATRIX2352_g57765 ) , GlobalWindBillboardEnabled3180_g57765);
				float3 VERTEX_POSITION2282_g57765 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g57765 , 0.0 ) ).xyz - inputMesh.positionOS );
				float3 lerpResult3146_g57765 = lerp( lerpResult3153_g57765 , VERTEX_POSITION2282_g57765 , _WindEnableMode);
				float WindEnable3144_g57765 = _WindEnable;
				float3 lerpResult3143_g57765 = lerp( VERTEX_POSITION_MATRIX2352_g57765 , lerpResult3146_g57765 , WindEnable3144_g57765);
				float3 lerpResult3142_g57765 = lerp( float3(0,0,0) , lerpResult3143_g57765 , ( _WindEnable + ( ( _CATEGORY_WIND + _SPACE_WIND ) * 0.0 ) ));
				float3 temp_output_18_0_g57786 = lerpResult3142_g57765;
				float3 temp_output_17_0_g57786 = 0;
				
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult982_g57768 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult989_g57768 = lerp( inputMesh.normalOS , -inputMesh.normalOS , step( dotResult982_g57768 , -1.0 ));
				
				float4 appendResult986_g57768 = (float4(cross( inputMesh.normalOS , float3(0,0,1) ) , -1.0));
				
				float m_switch80_g57778 = _UVMode;
				float2 m_UV080_g57778 = inputMesh.ase_texcoord.xy;
				float2 m_UV180_g57778 = inputMesh.uv1.xy;
				float2 m_UV280_g57778 = inputMesh.uv2.xy;
				float2 m_UV380_g57778 = inputMesh.ase_texcoord3.xy;
				float2 localfloat2switchUVMode80_g57778 = float2switchUVMode80_g57778( m_switch80_g57778 , m_UV080_g57778 , m_UV180_g57778 , m_UV280_g57778 , m_UV380_g57778 );
				float2 Offset235_g57778 = (_MainUVs).zw;
				float2 temp_output_41_0_g57778 = ( ( localfloat2switchUVMode80_g57778 * (_MainUVs).xy ) + Offset235_g57778 );
				float2 vertexToFrag70_g57778 = temp_output_41_0_g57778;
				outputPackedVaryingsMeshToPS.ase_texcoord7.xy = vertexToFrag70_g57778;
				
				float3 ase_worldTangent = TransformObjectToWorldDir(inputMesh.tangentOS.xyz);
				float ase_vertexTangentSign = inputMesh.tangentOS.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				outputPackedVaryingsMeshToPS.ase_texcoord8.xyz = ase_worldBitangent;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord7.zw = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord8.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = ( temp_output_18_0_g57786 + temp_output_17_0_g57786 );

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif
				inputMesh.normalOS = lerpResult989_g57768;
				inputMesh.tangentOS = appendResult986_g57768;
				return inputMesh;
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh)
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS = (PackedVaryingsMeshToPS)0;
				AttributesMesh defaultMesh = inputMesh;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				inputMesh = ApplyMeshModification( inputMesh, _TimeParameters.xyz, outputPackedVaryingsMeshToPS);

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
				float4 VPASSpreviousPositionCS;
				float4 VPASSpositionCS = mul(UNITY_MATRIX_UNJITTERED_VP, float4(positionRWS, 1.0));

				bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
				if (forceNoMotion)
				{
					VPASSpreviousPositionCS = float4(0.0, 0.0, 0.0, 1.0);
				}
				else
				{
					bool hasDeformation = unity_MotionVectorsParams.x > 0.0;
					float3 effectivePositionOS = (hasDeformation ? inputMesh.previousPositionOS : defaultMesh.positionOS);
					#if defined(_ADD_PRECOMPUTED_VELOCITY)
					effectivePositionOS -= inputMesh.precomputedVelocity;
					#endif

					#if defined(HAVE_MESH_MODIFICATION)
						AttributesMesh previousMesh = defaultMesh;
						previousMesh.positionOS = effectivePositionOS ;
						PackedVaryingsMeshToPS test = (PackedVaryingsMeshToPS)0;
						float3 curTime = _TimeParameters.xyz;
						previousMesh = ApplyMeshModification(previousMesh, _LastTimeParameters.xyz, test);
						_TimeParameters.xyz = curTime;
						float3 previousPositionRWS = TransformPreviousObjectToWorld(previousMesh.positionOS);
					#else
						float3 previousPositionRWS = TransformPreviousObjectToWorld(effectivePositionOS);
					#endif

					#ifdef ATTRIBUTES_NEED_NORMAL
						float3 normalWS = TransformPreviousObjectToWorldNormal(defaultMesh.normalOS);
					#else
						float3 normalWS = float3(0.0, 0.0, 0.0);
					#endif

					#if defined(HAVE_VERTEX_MODIFICATION)
						ApplyVertexModification(inputMesh, normalWS, previousPositionRWS, _LastTimeParameters.xyz);
					#endif

					VPASSpreviousPositionCS = mul(UNITY_MATRIX_PREV_VP, float4(previousPositionRWS, 1.0));
				}
				#endif

				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.positionRWS.xyz = positionRWS;
				outputPackedVaryingsMeshToPS.normalWS.xyz = normalWS;
				outputPackedVaryingsMeshToPS.tangentWS.xyzw = tangentWS;
				outputPackedVaryingsMeshToPS.uv1.xyzw = inputMesh.uv1;
				outputPackedVaryingsMeshToPS.uv2.xyzw = inputMesh.uv2;

				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					outputPackedVaryingsMeshToPS.vpassPositionCS = float3(VPASSpositionCS.xyw);
					outputPackedVaryingsMeshToPS.vpassPreviousPositionCS = float3(VPASSpreviousPositionCS.xyw);
				#endif
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.uv1 = v.uv1;
				o.uv2 = v.uv2;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord3 = v.ase_texcoord3;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.uv1 = patch[0].uv1 * bary.x + patch[1].uv1 * bary.y + patch[2].uv1 * bary.z;
				o.uv2 = patch[0].uv2 * bary.x + patch[1].uv2 * bary.y + patch[2].uv2 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplayMaterial.hlsl"

            #if defined(_TRANSPARENT_REFRACTIVE_SORT) || defined(_ENABLE_FOG_ON_TRANSPARENT)
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Water/Shaders/UnderWaterUtilities.hlsl"
            #endif

            #ifdef UNITY_VIRTUAL_TEXTURING
                #ifdef OUTPUT_SPLIT_LIGHTING
                   #define DIFFUSE_LIGHTING_TARGET SV_Target2
                   #define SSS_BUFFER_TARGET SV_Target3
                #elif defined(_WRITE_TRANSPARENT_MOTION_VECTOR)
                   #define MOTION_VECTOR_TARGET SV_Target2
                    #ifdef _TRANSPARENT_REFRACTIVE_SORT
                        #define BEFORE_REFRACTION_TARGET SV_Target3
                        #define BEFORE_REFRACTION_ALPHA_TARGET SV_Target4
                #endif
            	#endif
            #if defined(SHADER_API_PSSL)
            	#pragma PSSL_target_output_format(target 1 FMT_32_ABGR)
            #endif
            #else
                #ifdef OUTPUT_SPLIT_LIGHTING
                #define DIFFUSE_LIGHTING_TARGET SV_Target1
                #define SSS_BUFFER_TARGET SV_Target2
                #elif defined(_WRITE_TRANSPARENT_MOTION_VECTOR)
                #define MOTION_VECTOR_TARGET SV_Target1
                #ifdef _TRANSPARENT_REFRACTIVE_SORT
                     #define BEFORE_REFRACTION_TARGET SV_Target2
                     #define BEFORE_REFRACTION_ALPHA_TARGET SV_Target3
                #endif
            #endif
            #endif

			void Frag(PackedVaryingsMeshToPS packedInput
				, out float4 outColor:SV_Target0
            #ifdef UNITY_VIRTUAL_TEXTURING
				, out float4 outVTFeedback : SV_Target1
            #endif
            #ifdef OUTPUT_SPLIT_LIGHTING
				, out float4 outDiffuseLighting : DIFFUSE_LIGHTING_TARGET
				, OUTPUT_SSSBUFFER(outSSSBuffer) : SSS_BUFFER_TARGET
            #elif defined(_WRITE_TRANSPARENT_MOTION_VECTOR)
				, out float4 outMotionVec : MOTION_VECTOR_TARGET
                #ifdef _TRANSPARENT_REFRACTIVE_SORT
                , out float4 outBeforeRefractionColor : BEFORE_REFRACTION_TARGET
                , out float4 outBeforeRefractionAlpha : BEFORE_REFRACTION_ALPHA_TARGET
                #endif
            #endif
            #ifdef _DEPTHOFFSET_ON
				, out float outputDepth : DEPTH_OFFSET_SEMANTIC
            #endif
		    
						)
			{
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					outMotionVec = float4(2.0, 0.0, 0.0, 1.0);
				#endif

				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );
				float3 positionRWS = packedInput.positionRWS.xyz;
				float3 normalWS = packedInput.normalWS.xyz;
				float4 tangentWS = packedInput.tangentWS.xyzw;

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;
				input.positionRWS = positionRWS;
				input.tangentToWorld = BuildTangentToWorld(tangentWS, normalWS);
				input.texCoord1 = packedInput.uv1.xyzw;
				input.texCoord2 = packedInput.uv2.xyzw;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				AdjustFragInputsToOffScreenRendering(input, _OffScreenRendering > 0, _OffScreenDownsampleFactor);
				uint2 tileIndex = uint2(input.positionSS.xy) / GetTileSize ();

				PositionInputs posInput = GetPositionInput( input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS.xyz, tileIndex );

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				GlobalSurfaceDescription surfaceDescription = (GlobalSurfaceDescription)0;
				float2 vertexToFrag70_g57778 = packedInput.ase_texcoord7.xy;
				float4 tex2DNode3_g57768 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, vertexToFrag70_g57778 );
				float3 temp_output_28_0_g57768 = ( (_BaseColor).rgb * (tex2DNode3_g57768).rgb * _Brightness );
				
				float3 unpack748_g57768 = UnpackNormalScale( SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, vertexToFrag70_g57778 ), _NormalStrength );
				unpack748_g57768.z = lerp( 1, unpack748_g57768.z, saturate(_NormalStrength) );
				float3 temp_output_24_0_g57782 = unpack748_g57768;
				
				float2 appendResult899_g57768 = (float2(V.xy));
				float3 appendResult898_g57768 = (float3(appendResult899_g57768 , ( V.z / 1.06 )));
				float3 break928_g57768 = unpack748_g57768;
				float3 ase_worldBitangent = packedInput.ase_texcoord8.xyz;
				float3 normalizeResult934_g57768 = normalize( ( ( tangentWS.xyz * break928_g57768.x ) + ( ase_worldBitangent * break928_g57768.y ) + ( normalWS * break928_g57768.z ) ) );
				float3 Normal_Per_Pixel937_g57768 = normalizeResult934_g57768;
				float fresnelNdotV896_g57768 = dot( normalize( Normal_Per_Pixel937_g57768 ), appendResult898_g57768 );
				float fresnelNode896_g57768 = ( 0.0 + ( 1.0 - _SmoothnessFresnelScale ) * pow( max( 1.0 - fresnelNdotV896_g57768 , 0.0001 ), _SmoothnessFresnelPower ) );
				float lerpResult895_g57768 = lerp( _SmoothnessStrength , ( _SmoothnessStrength - fresnelNode896_g57768 ) , _SmoothnessFresnelEnable);
				
				float temp_output_22_0_g57769 = tex2DNode3_g57768.a;
				float temp_output_22_0_g57771 = temp_output_22_0_g57769;
				float3 ase_worldPos = GetAbsolutePositionWS( positionRWS );
				float3 temp_output_95_0_g57773 = cross( ddy( ase_worldPos ) , ddx( ase_worldPos ) );
				float3 normalizeResult96_g57773 = normalize( temp_output_95_0_g57773 );
				float dotResult74_g57769 = dot( normalizeResult96_g57773 , V );
				float temp_output_76_0_g57769 = ( 1.0 - abs( dotResult74_g57769 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g57769 = 1.0;
				#else
				float staticSwitch281_g57769 = ( 1.0 - ( temp_output_76_0_g57769 * temp_output_76_0_g57769 ) );
				#endif
				float lerpResult80_g57769 = lerp( 1.0 , staticSwitch281_g57769 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g57769 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g57771 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g57771 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g57769 );
				
				surfaceDescription.BaseColor = temp_output_28_0_g57768;
				surfaceDescription.Normal = temp_output_24_0_g57782;
				surfaceDescription.BentNormal = float3( 0, 0, 1 );
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = _MetallicStrength;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = 0;
				#endif

				surfaceDescription.Emission = 0;
				surfaceDescription.Smoothness = saturate( lerpResult895_g57768 );
				surfaceDescription.Occlusion = saturate( ( 1.0 - _OcclusionStrengthAO ) );
				surfaceDescription.Alpha = temp_output_98_0_g57769;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _Cutoff;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = 0;
				surfaceDescription.SpecularAAThreshold = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = 1;
				#endif

				#ifdef _HAS_REFRACTION
				surfaceDescription.RefractionIndex = 1;
				surfaceDescription.RefractionColor = float3( 1, 1, 1 );
				surfaceDescription.RefractionDistance = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceDescription.SubsurfaceMask = 1;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceDescription.TransmissionMask = 1;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceDescription.DiffusionProfile = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceDescription.Anisotropy = 1;
				surfaceDescription.Tangent = float3( 1, 0, 0 );
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceDescription.IridescenceMask = 0;
				surfaceDescription.IridescenceThickness = 0;
				#endif

				#ifdef ASE_BAKEDGI
				surfaceDescription.BakedGI = 0;
				#endif

				#ifdef ASE_BAKEDBACKGI
				surfaceDescription.BakedBackGI = 0;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				#ifdef UNITY_VIRTUAL_TEXTURING
				surfaceDescription.VTPackedFeedback = float4(1.0f,1.0f,1.0f,1.0f);
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription,input, V, posInput, surfaceData, builtinData);

				BSDFData bsdfData = ConvertSurfaceDataToBSDFData(input.positionSS.xy, surfaceData);

				PreLightData preLightData = GetPreLightData(V, posInput, bsdfData);

				outColor = float4(0.0, 0.0, 0.0, 0.0);

				#ifdef DEBUG_DISPLAY
				#ifdef OUTPUT_SPLIT_LIGHTING
					outDiffuseLighting = float4(0, 0, 0, 1);
					ENCODE_INTO_SSSBUFFER(surfaceData, posInput.positionSS, outSSSBuffer);
				#endif

			    bool viewMaterial = GetMaterialDebugColor(outColor, input, builtinData, posInput, surfaceData, bsdfData);

				if (!viewMaterial)
				{
					if (_DebugFullScreenMode == FULLSCREENDEBUGMODE_VALIDATE_DIFFUSE_COLOR || _DebugFullScreenMode == FULLSCREENDEBUGMODE_VALIDATE_SPECULAR_COLOR)
					{
						float3 result = float3(0.0, 0.0, 0.0);
						GetPBRValidatorDebug(surfaceData, result);
						outColor = float4(result, 1.0f);
					}
					else if (_DebugFullScreenMode == FULLSCREENDEBUGMODE_TRANSPARENCY_OVERDRAW)
					{
						float4 result = _DebugTransparencyOverdrawWeight * float4(TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_A);
						outColor = result;
					}
					else
                #endif
					{
                #ifdef _SURFACE_TYPE_TRANSPARENT
						uint featureFlags = LIGHT_FEATURE_MASK_FLAGS_TRANSPARENT;
                #else
						uint featureFlags = LIGHT_FEATURE_MASK_FLAGS_OPAQUE;
                #endif
						LightLoopOutput lightLoopOutput;
						LightLoop(V, posInput, preLightData, bsdfData, builtinData, featureFlags, lightLoopOutput);

						// Alias
						float3 diffuseLighting = lightLoopOutput.diffuseLighting;
						float3 specularLighting = lightLoopOutput.specularLighting;

						diffuseLighting *= GetCurrentExposureMultiplier();
						specularLighting *= GetCurrentExposureMultiplier();

                #ifdef OUTPUT_SPLIT_LIGHTING
						if (_EnableSubsurfaceScattering != 0 && ShouldOutputSplitLighting(bsdfData))
						{
							outColor = float4(specularLighting, 1.0);
							outDiffuseLighting = float4(TagLightingForSSS(diffuseLighting), 1.0);
						}
						else
						{
							outColor = float4(diffuseLighting + specularLighting, 1.0);
							outDiffuseLighting = float4(0, 0, 0, 1);
						}
						ENCODE_INTO_SSSBUFFER(surfaceData, posInput.positionSS, outSSSBuffer);
                #else
						outColor = ApplyBlendMode(diffuseLighting, specularLighting, builtinData.opacity);

						#ifdef _ENABLE_FOG_ON_TRANSPARENT
                        outColor = EvaluateAtmosphericScattering(posInput, V, outColor);
                        #endif

                        #ifdef _TRANSPARENT_REFRACTIVE_SORT
                        ComputeRefractionSplitColor(posInput, outColor, outBeforeRefractionColor, outBeforeRefractionAlpha);
                        #endif
                #endif

				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
						float4 VPASSpositionCS = float4(packedInput.vpassPositionCS.xy, 0.0, packedInput.vpassPositionCS.z);
						float4 VPASSpreviousPositionCS = float4(packedInput.vpassPreviousPositionCS.xy, 0.0, packedInput.vpassPreviousPositionCS.z);
						bool forceNoMotion = any(unity_MotionVectorsParams.yw == 0.0);
                #if defined(HAVE_VFX_MODIFICATION) && !VFX_FEATURE_MOTION_VECTORS
                        forceNoMotion = true;
                #endif
				        if (!forceNoMotion)
						{
							float2 motionVec = CalculateMotionVector(VPASSpositionCS, VPASSpreviousPositionCS);
							EncodeMotionVector(motionVec * 0.5, outMotionVec);
							outMotionVec.zw = 1.0;
						}
				#endif
				}

				#ifdef DEBUG_DISPLAY
				}
				#endif

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif

                #ifdef UNITY_VIRTUAL_TEXTURING
				    float vtAlphaValue = builtinData.opacity;
                    #if defined(HAS_REFRACTION) && HAS_REFRACTION
					vtAlphaValue = 1.0f - bsdfData.transmittanceMask;
                #endif
				outVTFeedback = PackVTFeedbackWithAlpha(builtinData.vtPackedFeedback, input.positionSS.xy, vtAlphaValue);
				outVTFeedback.rgb *= outVTFeedback.a; // premuliplied alpha
                #endif

			}
			ENDHLSL
		}

		
		Pass
        {
			
            Name "ScenePickingPass"
            Tags { "LightMode"="Picking" }

            Cull [_CullMode]

            HLSLPROGRAM
			#define ASE_NEED_CULLFACE 1
			#pragma shader_feature_local _ _DOUBLESIDED_ON
			#pragma shader_feature_local_fragment _ _DISABLE_DECALS
			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma shader_feature_local _ _ALPHATEST_ON
			#define _ALPHATEST_SHADOW_ON 1
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define _AMBIENT_OCCLUSION 1
			#define HAVE_MESH_MODIFICATION
			#define ASE_SRP_VERSION 170002
			#define ASE_USING_SAMPLING_MACROS 1

			#pragma editor_sync_compilation
            #pragma multi_compile _ DOTS_INSTANCING_ON

            #pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
            #pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC _TRANSPARENT_REFRACTIVE_SORT
            #pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT

			#pragma vertex Vert
			#pragma fragment Frag

			#define SHADERPASS SHADERPASS_DEPTH_ONLY
			#define SCENEPICKINGPASS 1

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define VARYINGS_NEED_TANGENT_TO_WORLD

            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

            //#if !defined(SHADER_STAGE_RAY_TRACING) && SHADERPASS != SHADERPASS_RAYTRACING_GBUFFER && SHADERPASS != SHADERPASS_FULL_SCREEN_DEBUG
            //#define FRAG_INPUTS_ENABLE_STRIPPING
            //#endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
                #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif

            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
                #define RAYTRACING_SHADER_GRAPH_LOW
            #endif

            #ifndef SHADER_UNLIT
            #if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
                #define VARYINGS_NEED_CULLFACE
            #endif
            #endif

			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			    #define ASE_NEED_CULLFACE 1
			#endif

            #if _MATERIAL_FEATURE_COLORED_TRANSMISSION
            #undef _MATERIAL_FEATURE_CLEAR_COAT
            #endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

            #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
            #undef  _REFRACTION_PLANE
            #undef  _REFRACTION_SPHERE
            #define _REFRACTION_THIN
            #endif

            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
            #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                #define WRITE_NORMAL_BUFFER
            #endif
            #endif

            #if SHADERPASS == SHADERPASS_MOTION_VECTORS && defined(WRITE_DECAL_BUFFER_AND_RENDERING_LAYER)
                #define WRITE_DECAL_BUFFER
            #endif

            #ifndef DEBUG_DISPLAY
                #if !defined(_SURFACE_TYPE_TRANSPARENT)
                    #if SHADERPASS == SHADERPASS_FORWARD
                    #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                    #elif SHADERPASS == SHADERPASS_GBUFFER
                    #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                    #endif
                #endif
            #endif

            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif
        
			#if (defined(_TRANSPARENT_WRITES_MOTION_VEC) || defined(_TRANSPARENT_REFRACTIVE_SORT)) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
			#endif
	
            CBUFFER_START( UnityPerMaterial )
			float4 _AlphaRemap;
			half4 _BaseColor;
			float4 _MainUVs;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_ALPHACLIP;
			float _CATEGORY_ALPHACLIPPING;
			half _GlancingClipMode;
			float _AlphaRemapMax;
			float _AlphaRemapMin;
			half _OcclusionStrengthAO;
			half _SmoothnessFresnelEnable;
			half _SmoothnessFresnelPower;
			half _SmoothnessFresnelScale;
			half _SmoothnessStrength;
			float _MetallicStrength;
			half _Brightness;
			float _Cutoff;
			float _UVMode;
			float _SPACE_WIND;
			float _CATEGORY_WIND;
			half _WindEnable;
			half _WindLocalDirection;
			half _WindLocalPulseFrequency;
			half _WindLocalRandomOffset;
			half _WindEnableMode;
			half _WindLocalIntensity;
			half _WindGlobalIntensity;
			float _SPACE_SURFACEINPUTS;
			half _NormalStrength;
			half _AlphaCutoffShadow;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			    float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			    float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _DstBlend2;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			    float _TessPhongStrength;
			    float _TessValue;
			    float _TessMin;
			    float _TessMax;
			    float _TessEdgeLength;
			    float _TessMaxDisp;
			#endif
			UNITY_TEXTURE_STREAMING_DEBUG_VARS;
			CBUFFER_END

            #ifdef SCENEPICKINGPASS
            float4 _SelectionID;
            #endif

            #ifdef SCENESELECTIONPASS
            int _ObjectId;
            int _PassValue;
            #endif

			float _GlobalWindBillboardIntensity;
			float _GlobalWindIntensity;
			float _GlobalWindRandomOffset;
			float _GlobalWindPulse;
			float _GlobalWindDirection;
			float _GlobalWindBillboardEnabled;
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/PickingSpaceTransforms.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR


			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float3 previousPositionOS : TEXCOORD4;
				float3 precomputedVelocity : TEXCOORD5;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float3 normalWS : TEXCOORD1;
				float4 tangentWS : TEXCOORD2;
				float4 uv1 : TEXCOORD3;
				float4 uv2 : TEXCOORD4;
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					float3 vpassPositionCS : TEXCOORD5;
					float3 vpassPreviousPositionCS : TEXCOORD6;
				#endif
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float2 float2switchUVMode80_g57778( float m_switch, float2 m_UV0, float2 m_UV1, float2 m_UV2, float2 m_UV3 )
			{
				if(m_switch ==0)
					return m_UV0;
				else if(m_switch ==1)
					return m_UV1;
				else if(m_switch ==2)
					return m_UV2;
				else if(m_switch ==3)
					return m_UV3;
				else
				return float2(0,0);
			}
			

			// Get Surface And BuiltinData
			void GetSurfaceAndBuiltinData(PickingSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
                    LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

                #ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
                    float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif  
                ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants);

                #ifdef DEBUG_DISPLAY
                if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
                {
                    surfaceDescription.Alpha = 1.0f;
                }
                #endif

				#ifdef _ALPHATEST_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
                    DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThresholdShadow);
				#endif

				#ifdef _DEPTHOFFSET_ON
                    ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
				#endif

				float3 bentNormalWS;
                //BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);
                InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

				#ifdef _DEPTHOFFSET_ON
                    builtinData.depthOffset = surfaceDescription.DepthOffset;
				#endif

                #ifdef _ALPHATEST_ON
                    builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

                #ifdef UNITY_VIRTUAL_TEXTURING
                    builtinData.vtPackedFeedback = surfaceDescription.VTPackedFeedback;
                #endif

				#ifdef ASE_BAKEDGI
                    builtinData.bakeDiffuseLighting = surfaceDescription.BakedGI;
				#endif

				#ifdef ASE_BAKEDBACKGI
                    builtinData.backBakeDiffuseLighting = surfaceDescription.BakedBackGI;
				#endif

                builtinData.emissiveColor = surfaceDescription.Emission;

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);

            }

			AttributesMesh ApplyMeshModification(AttributesMesh inputMesh, float3 timeParameters, inout PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS )
			{
				_TimeParameters.xyz = timeParameters;
				//Calculate new billboard vertex position and normal;
				float3 upCamVec = float3( 0, 1, 0 );
				float3 forwardCamVec = -normalize ( UNITY_MATRIX_V._m20_m21_m22 );
				float3 rightCamVec = normalize( UNITY_MATRIX_V._m00_m01_m02 );
				float4x4 rotationCamMatrix = float4x4( rightCamVec, 0, upCamVec, 0, forwardCamVec, 0, 0, 0, 0, 1 );
				inputMesh.normalOS = normalize( mul( float4( inputMesh.normalOS , 0 ), rotationCamMatrix )).xyz;
				inputMesh.tangentOS.xyz = normalize( mul( float4( inputMesh.tangentOS.xyz , 0 ), rotationCamMatrix )).xyz;
				//This unfortunately must be made to take non-uniform scaling into account;
				//Transform to world coords, apply rotation and transform back to local;
				inputMesh.positionOS = mul( float4(inputMesh.positionOS,0) , GetObjectToWorldMatrix() ).xyz;
				inputMesh.positionOS = mul( float4(inputMesh.positionOS,0) , rotationCamMatrix ).xyz;
				inputMesh.positionOS = mul( float4(inputMesh.positionOS,0) , GetWorldToObjectMatrix() ).xyz;
				float3 VERTEX_POSITION_MATRIX2352_g57765 = mul( GetObjectToWorldMatrix(), float4( inputMesh.positionOS , 0.0 ) ).xyz;
				float3 break2265_g57765 = VERTEX_POSITION_MATRIX2352_g57765;
				float GlobalWindBillboardIntensity3181_g57765 = _GlobalWindBillboardIntensity;
				float GlobalWindIntensity3173_g57765 = _GlobalWindIntensity;
				float WIND_MODE2462_g57765 = _WindEnableMode;
				float lerpResult3148_g57765 = lerp( ( ( _WindGlobalIntensity * GlobalWindBillboardIntensity3181_g57765 ) * GlobalWindIntensity3173_g57765 ) , _WindLocalIntensity , WIND_MODE2462_g57765);
				float _WIND_STRENGHT2400_g57765 = lerpResult3148_g57765;
				float GlobalWindRandomOffset3174_g57765 = _GlobalWindRandomOffset;
				float lerpResult3149_g57765 = lerp( GlobalWindRandomOffset3174_g57765 , _WindLocalRandomOffset , WIND_MODE2462_g57765);
				float4 transform3073_g57765 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				transform3073_g57765.xyz = GetAbsolutePositionWS((transform3073_g57765).xyz);
				float2 appendResult2307_g57765 = (float2(transform3073_g57765.x , transform3073_g57765.z));
				float dotResult2341_g57765 = dot( appendResult2307_g57765 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g57765 = lerp( 0.8 , ( ( lerpResult3149_g57765 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g57765 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g57765 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g57765 );
				float _WIND_TUBULENCE_RANDOM2274_g57765 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g57765 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g57765.z / 15.0 ) ) ) * 0.5 );
				float GlobalWindPulse3177_g57765 = _GlobalWindPulse;
				float lerpResult3152_g57765 = lerp( GlobalWindPulse3177_g57765 , _WindLocalPulseFrequency , WIND_MODE2462_g57765);
				float _WIND_PULSE2421_g57765 = lerpResult3152_g57765;
				float FUNC_Angle2470_g57765 = ( _WIND_STRENGHT2400_g57765 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g57765 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g57765 ) - ( VERTEX_POSITION_MATRIX2352_g57765.z / 50.0 ) ) - ( inputMesh.ase_color.r / 20.0 ) ) ) ) * sqrt( inputMesh.ase_color.r ) * _WIND_PULSE2421_g57765 );
				float FUNC_Angle_SinA2424_g57765 = sin( FUNC_Angle2470_g57765 );
				float FUNC_Angle_CosA2362_g57765 = cos( FUNC_Angle2470_g57765 );
				float GlobalWindDirection3175_g57765 = _GlobalWindDirection;
				float lerpResult3150_g57765 = lerp( GlobalWindDirection3175_g57765 , _WindLocalDirection , WIND_MODE2462_g57765);
				float _WindDirection2249_g57765 = lerpResult3150_g57765;
				float2 localDirectionalEquation2249_g57765 = DirectionalEquation( _WindDirection2249_g57765 );
				float2 break2469_g57765 = localDirectionalEquation2249_g57765;
				float _WIND_DIRECTION_X2418_g57765 = break2469_g57765.x;
				float lerpResult2258_g57765 = lerp( break2265_g57765.x , ( ( break2265_g57765.y * FUNC_Angle_SinA2424_g57765 ) + ( break2265_g57765.x * FUNC_Angle_CosA2362_g57765 ) ) , _WIND_DIRECTION_X2418_g57765);
				float3 break2340_g57765 = VERTEX_POSITION_MATRIX2352_g57765;
				float3 break2233_g57765 = VERTEX_POSITION_MATRIX2352_g57765;
				float _WIND_DIRECTION_Y2416_g57765 = break2469_g57765.y;
				float lerpResult2275_g57765 = lerp( break2233_g57765.z , ( ( break2233_g57765.y * FUNC_Angle_SinA2424_g57765 ) + ( break2233_g57765.z * FUNC_Angle_CosA2362_g57765 ) ) , _WIND_DIRECTION_Y2416_g57765);
				float3 appendResult2235_g57765 = (float3(lerpResult2258_g57765 , ( ( break2340_g57765.y * FUNC_Angle_CosA2362_g57765 ) - ( break2340_g57765.z * FUNC_Angle_SinA2424_g57765 ) ) , lerpResult2275_g57765));
				float3 VERTEX_POSITION_Neg3006_g57765 = appendResult2235_g57765;
				float GlobalWindBillboardEnabled3180_g57765 = _GlobalWindBillboardEnabled;
				float3 lerpResult3153_g57765 = lerp( float3(0,0,0) , ( VERTEX_POSITION_Neg3006_g57765 - VERTEX_POSITION_MATRIX2352_g57765 ) , GlobalWindBillboardEnabled3180_g57765);
				float3 VERTEX_POSITION2282_g57765 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g57765 , 0.0 ) ).xyz - inputMesh.positionOS );
				float3 lerpResult3146_g57765 = lerp( lerpResult3153_g57765 , VERTEX_POSITION2282_g57765 , _WindEnableMode);
				float WindEnable3144_g57765 = _WindEnable;
				float3 lerpResult3143_g57765 = lerp( VERTEX_POSITION_MATRIX2352_g57765 , lerpResult3146_g57765 , WindEnable3144_g57765);
				float3 lerpResult3142_g57765 = lerp( float3(0,0,0) , lerpResult3143_g57765 , ( _WindEnable + ( ( _CATEGORY_WIND + _SPACE_WIND ) * 0.0 ) ));
				float3 temp_output_18_0_g57786 = lerpResult3142_g57765;
				float3 temp_output_17_0_g57786 = 0;
				
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult982_g57768 = dot( normalizedWorldNormal , ase_worldViewDir );
				float3 lerpResult989_g57768 = lerp( inputMesh.normalOS , -inputMesh.normalOS , step( dotResult982_g57768 , -1.0 ));
				
				float4 appendResult986_g57768 = (float4(cross( inputMesh.normalOS , float3(0,0,1) ) , -1.0));
				
				float m_switch80_g57778 = _UVMode;
				float2 m_UV080_g57778 = inputMesh.ase_texcoord.xy;
				float2 m_UV180_g57778 = inputMesh.uv1.xy;
				float2 m_UV280_g57778 = inputMesh.uv2.xy;
				float2 m_UV380_g57778 = inputMesh.ase_texcoord3.xy;
				float2 localfloat2switchUVMode80_g57778 = float2switchUVMode80_g57778( m_switch80_g57778 , m_UV080_g57778 , m_UV180_g57778 , m_UV280_g57778 , m_UV380_g57778 );
				float2 Offset235_g57778 = (_MainUVs).zw;
				float2 temp_output_41_0_g57778 = ( ( localfloat2switchUVMode80_g57778 * (_MainUVs).xy ) + Offset235_g57778 );
				float2 vertexToFrag70_g57778 = temp_output_41_0_g57778;
				outputPackedVaryingsMeshToPS.ase_texcoord7.xy = vertexToFrag70_g57778;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord7.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue =  ( temp_output_18_0_g57786 + temp_output_17_0_g57786 );

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif
				inputMesh.normalOS = lerpResult989_g57768;
				inputMesh.tangentOS = appendResult986_g57768;
				return inputMesh;
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh)
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS = (PackedVaryingsMeshToPS)0;
				AttributesMesh defaultMesh = inputMesh;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				inputMesh = ApplyMeshModification( inputMesh, _TimeParameters.xyz, outputPackedVaryingsMeshToPS);

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
				float4 VPASSpreviousPositionCS;
				float4 VPASSpositionCS = mul(UNITY_MATRIX_UNJITTERED_VP, float4(positionRWS, 1.0));

				bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
				if (forceNoMotion)
				{
					VPASSpreviousPositionCS = float4(0.0, 0.0, 0.0, 1.0);
				}
				else
				{
					bool hasDeformation = unity_MotionVectorsParams.x > 0.0;
					float3 effectivePositionOS = (hasDeformation ? inputMesh.previousPositionOS : defaultMesh.positionOS);
					#if defined(_ADD_PRECOMPUTED_VELOCITY)
					effectivePositionOS -= inputMesh.precomputedVelocity;
					#endif

					#if defined(HAVE_MESH_MODIFICATION)
						AttributesMesh previousMesh = defaultMesh;
						previousMesh.positionOS = effectivePositionOS ;
						PackedVaryingsMeshToPS test = (PackedVaryingsMeshToPS)0;
						float3 curTime = _TimeParameters.xyz;
						previousMesh = ApplyMeshModification(previousMesh, _LastTimeParameters.xyz, test);
						_TimeParameters.xyz = curTime;
						float3 previousPositionRWS = TransformPreviousObjectToWorld(previousMesh.positionOS);
					#else
						float3 previousPositionRWS = TransformPreviousObjectToWorld(effectivePositionOS);
					#endif

					#ifdef ATTRIBUTES_NEED_NORMAL
						float3 normalWS = TransformPreviousObjectToWorldNormal(defaultMesh.normalOS);
					#else
						float3 normalWS = float3(0.0, 0.0, 0.0);
					#endif

					#if defined(HAVE_VERTEX_MODIFICATION)
						ApplyVertexModification(inputMesh, normalWS, previousPositionRWS, _LastTimeParameters.xyz);
					#endif

					VPASSpreviousPositionCS = mul(UNITY_MATRIX_PREV_VP, float4(previousPositionRWS, 1.0));
				}
				#endif

				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.positionRWS.xyz = positionRWS;
				outputPackedVaryingsMeshToPS.normalWS.xyz = normalWS;
				outputPackedVaryingsMeshToPS.tangentWS.xyzw = tangentWS;
				outputPackedVaryingsMeshToPS.uv1.xyzw = inputMesh.uv1;
				outputPackedVaryingsMeshToPS.uv2.xyzw = inputMesh.uv2;

				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					outputPackedVaryingsMeshToPS.vpassPositionCS = float3(VPASSpositionCS.xyw);
					outputPackedVaryingsMeshToPS.vpassPreviousPositionCS = float3(VPASSpreviousPositionCS.xyw);
				#endif
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord3 = v.ase_texcoord3;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(WRITE_NORMAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target2
			#elif defined(WRITE_NORMAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target1
			#else
			#define SV_TARGET_DECAL SV_Target0
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
						#if defined(SCENESELECTIONPASS) || defined(SCENEPICKINGPASS)
						, out float4 outColor : SV_Target0
						#else
							#ifdef WRITE_MSAA_DEPTH
							, out float4 depthColor : SV_Target0
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target1
								#endif
							#else
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target0
								#endif
							#endif

							#if (defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)) || defined(WRITE_RENDERING_LAYER)
							, out float4 outDecalBuffer : SV_TARGET_DECAL
							#endif
						#endif

						#if defined(_DEPTHOFFSET_ON) && !defined(SCENEPICKINGPASS)
						, out float outputDepth : DEPTH_OFFSET_SEMANTIC
						#endif
						
					)
			{
			UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(packedInput);
			UNITY_SETUP_INSTANCE_ID(packedInput);

				float3 positionRWS = packedInput.positionRWS.xyz;

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);

				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				input.positionRWS = positionRWS;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false );
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				PickingSurfaceDescription surfaceDescription = (PickingSurfaceDescription)0;
				float2 vertexToFrag70_g57778 = packedInput.ase_texcoord7.xy;
				float4 tex2DNode3_g57768 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, vertexToFrag70_g57778 );
				float temp_output_22_0_g57769 = tex2DNode3_g57768.a;
				float temp_output_22_0_g57771 = temp_output_22_0_g57769;
				float3 ase_worldPos = GetAbsolutePositionWS( positionRWS );
				float3 temp_output_95_0_g57773 = cross( ddy( ase_worldPos ) , ddx( ase_worldPos ) );
				float3 normalizeResult96_g57773 = normalize( temp_output_95_0_g57773 );
				float dotResult74_g57769 = dot( normalizeResult96_g57773 , V );
				float temp_output_76_0_g57769 = ( 1.0 - abs( dotResult74_g57769 ) );
				#ifdef UNITY_PASS_SHADOWCASTER
				float staticSwitch281_g57769 = 1.0;
				#else
				float staticSwitch281_g57769 = ( 1.0 - ( temp_output_76_0_g57769 * temp_output_76_0_g57769 ) );
				#endif
				float lerpResult80_g57769 = lerp( 1.0 , staticSwitch281_g57769 , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g57769 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g57771 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g57771 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g57769 );
				
				surfaceDescription.Alpha = temp_output_98_0_g57769;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold =  _Cutoff;
				#endif

				outColor = _SelectionID;
			}

            ENDHLSL
		}

        Pass
        {

            Name "FullScreenDebug"
            Tags 
			{ 
				"LightMode" = "FullScreenDebug" 
            }

            Cull [_CullMode]
			ZTest LEqual
			ZWrite Off

            HLSLPROGRAM
			/*ase_pragma_before*/
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
            #pragma multi_compile _ DOTS_INSTANCING_ON

			#pragma vertex Vert
			#pragma fragment Frag

            #pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
            #pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC _TRANSPARENT_REFRACTIVE_SORT
            #pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT

			#define SHADERPASS SHADERPASS_FULL_SCREEN_DEBUG

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

			#ifndef SHADER_UNLIT
			#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
			#define VARYINGS_NEED_CULLFACE
			#endif
			#endif

            #if _MATERIAL_FEATURE_COLORED_TRANSMISSION
            #undef _MATERIAL_FEATURE_CLEAR_COAT
            #endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
		    #define OUTPUT_SPLIT_LIGHTING
		    #endif

            #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
            #undef  _REFRACTION_PLANE
            #undef  _REFRACTION_SPHERE
            #define _REFRACTION_THIN
            #endif

			#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
			#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
				#define WRITE_NORMAL_BUFFER
			#endif
			#endif

            #if SHADERPASS == SHADERPASS_MOTION_VECTORS && defined(WRITE_DECAL_BUFFER_AND_RENDERING_LAYER)
                #define WRITE_DECAL_BUFFER
            #endif

			#ifndef DEBUG_DISPLAY
				#if !defined(_SURFACE_TYPE_TRANSPARENT)
					#if SHADERPASS == SHADERPASS_FORWARD
					#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
					#elif SHADERPASS == SHADERPASS_GBUFFER
					#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
					#endif
				#endif
			#endif

            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif
        
			#if (defined(_TRANSPARENT_WRITES_MOTION_VEC) || defined(_TRANSPARENT_REFRACTIVE_SORT)) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
			#endif

            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

            struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				#if UNITY_ANY_INSTANCING_ENABLED || defined(ATTRIBUTES_NEED_INSTANCEID)
					uint instanceID : INSTANCEID_SEMANTIC;
				#endif
			};

			struct VaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				#if UNITY_ANY_INSTANCING_ENABLED || defined(ATTRIBUTES_NEED_INSTANCEID)
					uint instanceID : CUSTOM_INSTANCE_ID;
				#endif
			};

			struct VertexDescriptionInputs
			{
				 float3 ObjectSpaceNormal;
				 float3 ObjectSpaceTangent;
				 float3 ObjectSpacePosition;
			};

			struct SurfaceDescriptionInputs
			{
				 float3 TangentSpaceNormal;
			};

			struct PackedVaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				#if UNITY_ANY_INSTANCING_ENABLED || defined(ATTRIBUTES_NEED_INSTANCEID)
					uint instanceID : CUSTOM_INSTANCE_ID;
				#endif
			};

            PackedVaryingsMeshToPS PackVaryingsMeshToPS (VaryingsMeshToPS input)
			{
				PackedVaryingsMeshToPS output;
				ZERO_INITIALIZE(PackedVaryingsMeshToPS, output);
				output.positionCS = input.positionCS;
				#if UNITY_ANY_INSTANCING_ENABLED || defined(ATTRIBUTES_NEED_INSTANCEID)
				output.instanceID = input.instanceID;
				#endif
				return output;
			}

			VaryingsMeshToPS UnpackVaryingsMeshToPS (PackedVaryingsMeshToPS input)
			{
				VaryingsMeshToPS output;
				output.positionCS = input.positionCS;
				#if UNITY_ANY_INSTANCING_ENABLED || defined(ATTRIBUTES_NEED_INSTANCEID)
				output.instanceID = input.instanceID;
				#endif
				return output;
			}

            struct VertexDescription
			{
				float3 Position;
				float3 Normal;
				float3 Tangent;
			};

			VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
			{
				VertexDescription description = (VertexDescription)0;
				description.Position = IN.ObjectSpacePosition;
				description.Normal = IN.ObjectSpaceNormal;
				description.Tangent = IN.ObjectSpaceTangent;
				return description;
			}

            struct SurfaceDescription
			{
				float3 BaseColor;
				float3 Emission;
				float Alpha;
				float3 BentNormal;
				float Smoothness;
				float Occlusion;
				float3 NormalTS;
				float Metallic;
			};

			SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
			{
				SurfaceDescription surface = (SurfaceDescription)0;
				surface.BaseColor = IsGammaSpace() ? float3(0.5, 0.5, 0.5) : SRGBToLinear(float3(0.5, 0.5, 0.5));
				surface.Emission = float3(0, 0, 0);
				surface.Alpha = 1;
				surface.BentNormal = IN.TangentSpaceNormal;
				surface.Smoothness = 0.5;
				surface.Occlusion = 1;
				surface.NormalTS = IN.TangentSpaceNormal;
				surface.Metallic = 0;
				return surface;
			}

			VertexDescriptionInputs AttributesMeshToVertexDescriptionInputs(AttributesMesh input)
			{
				VertexDescriptionInputs output;
				ZERO_INITIALIZE(VertexDescriptionInputs, output);

				output.ObjectSpaceNormal =                          input.normalOS;
				output.ObjectSpaceTangent =                         input.tangentOS.xyz;
				output.ObjectSpacePosition =                        input.positionOS;
				#if UNITY_ANY_INSTANCING_ENABLED
                #else
                #endif

				return output;
			}

			AttributesMesh ApplyMeshModification(AttributesMesh input, float3 timeParameters  )
			{
				VertexDescriptionInputs vertexDescriptionInputs = AttributesMeshToVertexDescriptionInputs(input);

				VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs);

				input.positionOS = vertexDescription.Position;
				input.normalOS = vertexDescription.Normal;
				input.tangentOS.xyz = vertexDescription.Tangent;
				return input;
			}

			FragInputs BuildFragInputs(VaryingsMeshToPS input)
			{
				FragInputs output;
				ZERO_INITIALIZE(FragInputs, output);

				output.tangentToWorld = k_identity3x3;
				output.positionSS = input.positionCS; // input.positionCS is SV_Position
				#if UNITY_ANY_INSTANCING_ENABLED
                #else
                #endif

				return output;
			}

			FragInputs UnpackVaryingsMeshToFragInputs(PackedVaryingsMeshToPS input)
			{
				UNITY_SETUP_INSTANCE_ID(input);
				VaryingsMeshToPS unpacked = UnpackVaryingsMeshToPS(input);
				return BuildFragInputs(unpacked);
			}

			#define DEBUG_DISPLAY
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/FullScreenDebug.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/VertMesh.hlsl"

			PackedVaryingsType Vert(AttributesMesh inputMesh)
			{
				VaryingsType varyingsType;
				varyingsType.vmesh = VertMesh(inputMesh);
				return PackVaryingsType(varyingsType);
			}

			#if !defined(_DEPTHOFFSET_ON)
			[earlydepthstencil]
			#endif
			void Frag(PackedVaryingsToPS packedInput)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(packedInput);
				FragInputs input = UnpackVaryingsToFragInputs(packedInput);

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS.xyz);

			#ifdef PLATFORM_SUPPORTS_PRIMITIVE_ID_IN_PIXEL_SHADER
				if (_DebugFullScreenMode == FULLSCREENDEBUGMODE_QUAD_OVERDRAW)
				{
					IncrementQuadOverdrawCounter(posInput.positionSS.xy, input.primitiveID);
				}
			#endif
			}
            ENDHLSL
        }
		
	}
	
	CustomEditor "Rendering.HighDefinition.LightingShaderGraphGUI"
	
	Fallback Off
}
/*ASEBEGIN
Version=19303
Node;AmplifyShaderEditor.FunctionNode;501;-592,384;Inherit;False;DESF Weather Wind;67;;57765;b135a554f7e4d0b41bba02c61b34ae74;5,3133,2,2371,2,2432,2,3138,0,3139,0;0;1;FLOAT3;2190
Node;AmplifyShaderEditor.FunctionNode;502;-320,384;Inherit;False;DESF Core Billboard;0;;57768;e3fce2294f3bde941a48e407ffdf732f;12,139,1,1010,0,999,0,998,0,1012,1,1002,1,1003,1,1007,1,865,0,69,0,885,1,969,0;1;457;FLOAT3;0,0,0;False;15;FLOAT3;0;FLOAT3;556;FLOAT;56;FLOAT3;770;FLOAT;50;FLOAT;57;FLOAT;49;FLOAT;351;FLOAT;649;FLOAT;996;FLOAT3;458;FLOAT3;967;FLOAT4;968;SAMPLERSTATE;703;SAMPLERSTATE;708
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;524;79.95,342.8214;Float;False;False;-1;2;Rendering.HighDefinition.LightingShaderGraphGUI;0;1;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;META;0;1;META;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;525;79.95,342.8214;Float;False;False;-1;2;Rendering.HighDefinition.LightingShaderGraphGUI;0;1;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;526;79.95,342.8214;Float;False;False;-1;2;Rendering.HighDefinition.LightingShaderGraphGUI;0;1;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;SceneSelectionPass;0;3;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;527;79.95,342.8214;Float;False;False;-1;2;Rendering.HighDefinition.LightingShaderGraphGUI;0;1;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;DepthOnly;0;4;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;False;False;False;False;False;False;False;False;True;True;0;True;_StencilRefDepth;255;False;;255;True;_StencilWriteMaskDepth;7;False;;3;False;;0;False;;0;False;;7;False;;3;False;;0;False;;0;False;;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;529;79.95,342.8214;Float;False;False;-1;2;Rendering.HighDefinition.LightingShaderGraphGUI;0;1;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;TransparentBackface;0;6;TransparentBackface;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;True;2;5;False;;10;False;;0;1;False;;0;False;;False;False;True;3;1;False;;10;False;;0;1;False;;0;False;;False;False;True;3;1;False;;10;False;;0;1;False;;0;False;;False;False;False;True;1;False;;False;False;False;True;True;True;True;True;0;True;_ColorMaskTransparentVelOne;False;True;True;True;True;True;0;True;_ColorMaskTransparentVelTwo;False;False;False;False;False;True;0;True;_ZWrite;True;0;True;_ZTestTransparent;False;True;1;LightMode=TransparentBackface;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;530;79.95,342.8214;Float;False;False;-1;2;Rendering.HighDefinition.LightingShaderGraphGUI;0;1;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;TransparentDepthPrepass;0;7;TransparentDepthPrepass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;False;False;False;False;False;False;False;False;True;True;0;True;_StencilRefDepth;255;False;;255;True;_StencilWriteMaskDepth;7;False;;3;False;;0;False;;0;False;;7;False;;3;False;;0;False;;0;False;;False;True;1;False;;False;False;True;1;LightMode=TransparentDepthPrepass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;531;79.95,342.8214;Float;False;False;-1;2;Rendering.HighDefinition.LightingShaderGraphGUI;0;1;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;TransparentDepthPostpass;0;8;TransparentDepthPostpass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=TransparentDepthPostpass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;532;79.95,342.8214;Float;False;False;-1;2;Rendering.HighDefinition.LightingShaderGraphGUI;0;1;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;Forward;0;9;Forward;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;True;2;5;False;;10;False;;0;1;False;;0;False;;False;False;True;1;1;False;;0;True;_DstBlend2;0;1;False;;0;False;;False;False;True;1;1;False;;0;True;_DstBlend2;0;1;False;;0;False;;False;False;False;True;0;True;_CullModeForward;False;False;False;True;True;True;True;True;0;True;_ColorMaskTransparentVelOne;False;True;True;True;True;True;0;True;_ColorMaskTransparentVelTwo;False;False;False;True;True;0;True;_StencilRef;255;False;;255;True;_StencilWriteMask;7;False;;3;False;;0;False;;0;False;;7;False;;3;False;;0;False;;0;False;;False;True;0;True;_ZWrite;True;0;True;_ZTestDepthEqualForOpaque;False;True;1;LightMode=Forward;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;533;79.95,342.8214;Float;False;False;-1;2;Rendering.HighDefinition.LightingShaderGraphGUI;0;1;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;ScenePickingPass;0;10;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;True;3;False;;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;534;130.95,752.8214;Float;False;False;-1;2;Rendering.HighDefinition.LightingShaderGraphGUI;0;1;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;MotionVectors;0;5;MotionVectors;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;False;False;False;False;False;False;False;False;True;True;0;True;_StencilRefMV;255;False;;255;True;_StencilWriteMaskMV;7;False;;3;False;;0;False;;0;False;;7;False;;3;False;;0;False;;0;False;;False;True;1;False;;False;False;True;1;LightMode=MotionVectors;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;523;128,384;Float;False;True;-1;2;Rendering.HighDefinition.LightingShaderGraphGUI;0;12;ALP/Billboard Cross Wind;53b46d85872c5b24c8f4f0a1c3fe4c87;True;GBuffer;0;0;GBuffer;34;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;False;False;False;False;False;False;False;False;True;True;0;True;_StencilRefGBuffer;255;False;;255;True;_StencilWriteMaskGBuffer;7;False;;3;False;;0;False;;0;False;;7;False;;3;False;;0;False;;0;False;;False;False;True;0;True;_ZTestGBuffer;False;True;1;LightMode=GBuffer;False;False;0;;0;0;Standard;38;Surface Type;0;0;  Rendering Pass;1;0;  Refraction Model;0;0;    Blending Mode;0;0;    Blend Preserves Specular;1;0;  Back Then Front Rendering;0;0;  Transparent Depth Prepass;0;0;  Transparent Depth Postpass;0;0;  ZWrite;0;0;  Z Test;4;0;Double-Sided;1;0;Alpha Clipping;1;638196071850913385;  Use Shadow Threshold;1;638196071856642558;Material Type,InvertActionOnDeselection;0;0;  Energy Conserving Specular;1;0;  Transmission,InvertActionOnDeselection;0;0;Receive Decals;1;0;Receive SSR;1;0;Receive SSR Transparent;0;0;Motion Vectors;1;0;  Add Precomputed Velocity;0;0;Specular AA;0;638196071914474086;Specular Occlusion Mode;1;0;Override Baked GI;0;0;Depth Offset;0;0;  Conserative;1;0;GPU Instancing;1;0;LOD CrossFade;1;638196072048432042;Tessellation;0;0;  Phong;0;0;  Strength;0.5,True,_TessellationPhong;0;  Type;0;0;  Tess;16,True,_TessellationStrength;0;  Min;10,True,_TessellationDistanceMin;0;  Max;25,True,_TessellationDistanceMax;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Vertex Position;1;0;0;11;True;True;True;True;True;True;False;False;False;True;True;False;;True;0
WireConnection;502;457;501;2190
WireConnection;523;0;502;0
WireConnection;523;1;502;556
WireConnection;523;4;502;56
WireConnection;523;7;502;50
WireConnection;523;8;502;57
WireConnection;523;9;502;49
WireConnection;523;10;502;351
WireConnection;523;30;502;649
WireConnection;523;11;502;458
WireConnection;523;12;502;967
WireConnection;523;27;502;968
ASEEND*/
//CHKSM=9BA986DCECD6AE76B79BC42D2C1B649348272807