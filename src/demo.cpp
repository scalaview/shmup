#include "demo.h"
#include <godot_cpp/variant/utility_functions.hpp>

void Demo::_bind_methods() {
}

void Demo::_ready() {
	UtilityFunctions::print("Hello World!");
}