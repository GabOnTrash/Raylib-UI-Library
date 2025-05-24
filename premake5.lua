workspace "UI LIBRARY"
    architecture "x64"
    configurations { "Debug", "Release" }
    startproject "Example"

project "Example"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    staticruntime "on"

    targetdir ("bin/%{cfg.buildcfg}")
    objdir ("bin-int/%{cfg.buildcfg}")

    files {
        "src/**.cpp",
        "include/**.hpp"
	"include/**.h"
    }

    includedirs {
        "include"
    }

    filter "system:windows"
        systemversion "latest"

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"

project "Example"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++17"
    staticruntime "on"

    targetdir ("bin/%{cfg.buildcfg}")
    objdir ("bin-int/%{cfg.buildcfg}")

    files {
        "examples/**.cpp"
    }

    includedirs {
        "include",
        "vendor/raylib/include" -- Raylib headers
    }

    libdirs {
        "vendor/raylib/lib"     -- Raylib compiled .lib
    }

    links {
        "Example",
        "raylib",
        "winmm",
        "gdi32",
        "opengl32"
    }

    filter "system:windows"
        systemversion "latest"

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"
