workspace "test"
	configurations{ "Debug","Release" }
	platforms{ "x86_64", "x86" }
	
	location "build"
    
	startproject "test_exe"
	filter { "platforms:x86_64" }
		architecture "x64"
	filter { "platforms:x86" }
		architecture "x86"

project "test_dll"
	kind "SharedLib"
	location "build"
	files "*_dll.cpp"
    
project "test_exe"
	kind "ConsoleApp"
	location "build"
	
	files "*_exe.cpp"
	-- either of these cause the error
	dependson "test_dll"
	links "test_dll"
