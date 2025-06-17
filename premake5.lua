project "imgui"
  kind "StaticLib"
  language "C++"

  targetdir ("build/bin/" .. outputdir .. "/%{prj.name}")
  objdir ("build/obj/" .. outputdir .. "/%{prj.name}")

  includedirs
  {
      ".",
      IncludeDir["sdl"],
      IncludeDir["VulkanSDK"]
  }

  files
  {
      "backends/imgui_impl_sdl3.cpp",
      "backends/imgui_impl_vulkan.cpp",
      "backends/imgui_impl_dx12.cpp",
      "backends/imgui_impl_win32.cpp",
    --"imconfig.h",
    --"imgui.h",
    "imgui.cpp",
    "imgui_draw.cpp",
    --"imgui_internal.h",
    "imgui_widgets.cpp",
    --"imstb_rectpack.h",
    --"imstb_textedit.h",
    "imgui_tables.cpp",
    --"imstb_truetype.h",
    "imgui_demo.cpp"
  }

  links
  {
      "sdl"
  }

  filter "system:windows"
    systemversion "latest"
    cppdialect "C++17"
    staticruntime "On"

  filter "configurations:Debug"
    runtime "Debug"
    symbols "on"

  filter "configurations:Release"
    runtime "Release"
    optimize "on"

    defines
    {
        "IMGUI_DISABLE_DEMO_WINDOWS"
    }
