#ifndef SHMUP_GAME_STATS_H
#define SHMUP_GAME_STATS_H

#include <godot_cpp/classes/resource.hpp>
#include <godot_cpp/classes/wrapped.hpp>

using namespace godot;

class GameStats : public Resource {
	GDCLASS(GameStats, Resource);

public:
	GameStats();
	~GameStats();
	static GameStats *singleton;
	static GameStats *get_instance();
	static void set_instance(GameStats *p_game_stats);

	int64_t get_score() const;
	void set_score(int64_t p_score);
	int64_t increase_score(int64_t p_score);
	void emit_score_changed_signal(int64_t value);

protected:
	static void _bind_methods();

private:
	int64_t score;
};

#endif