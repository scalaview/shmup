#ifndef SHMUP_DEMO_H
#define SHMUP_DEMO_H

#include <godot_cpp/classes/node.hpp>
#include <godot_cpp/classes/wrapped.hpp>
#include <godot_cpp/core/binder_common.hpp>

using namespace godot;

class Demo : public Node {
	GDCLASS(Demo, Node);

public:
	void _ready();

protected:
	static void _bind_methods();
};

#endif //SHMUP_DEMO_H