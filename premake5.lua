project "shaderc"
	kind "StaticLib"
	language "C"
	staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"libshaderc/src/shaderc_private.h",
		"libshaderc/src/shaderc.cc",
		"libshaderc_util/src/args.cc",
		"libshaderc_util/src/compiler.cc",
		"libshaderc_util/src/file_finder.cc",
		"libshaderc_util/src/message.cc",
		"libshaderc_util/src/resources.cc",
		"libshaderc_util/src/shader_stage.cc",
		"libshaderc_util/src/spirv_tools_wrapper.cc",
		"libshaderc_util/src/version_profile.cc",
		"libshaderc_util/include/libshaderc_util/**.h",
		"third_party/spirv-tools/source/**.cpp",
		"third_party/spirv-tools/source/**.h"
	}

	includedirs
    {
		"libshaderc_util/include",
		"libshaderc/include",
		"third_party/glslang",
		"third_party/spirv-tools/include",
		"third_party/spirv-headers/include",
		"third_party/spirv-tools",
		"third_party/spirv-headers/include/spirv/unified1"

	}

	defines{"ENABLE_HLSL"}

	filter "system:linux"
		pic "On"
		systemversion "latest"

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
