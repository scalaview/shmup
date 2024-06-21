#include "game_stats.h"

using namespace godot;

void GameStats::_bind_methods() {
	ClassDB::bind_static_method("GameStats", D_METHOD("get_instance"), &GameStats::get_instance);
	ClassDB::bind_method(D_METHOD("set_score", "score"), &GameStats::set_score);
	ClassDB::bind_method(D_METHOD("get_score"), &GameStats::get_score);
	ClassDB::bind_method(D_METHOD("increase_score", "score"), &GameStats::increase_score);
	ClassDB::bind_method(D_METHOD("emit_score_changed_signal", "value"), &GameStats::emit_score_changed_signal);

	ADD_SIGNAL(MethodInfo("score_changed_signal", PropertyInfo(Variant::INT, "value")));
}

GameStats *GameStats::singleton = nullptr;

GameStats::GameStats() {}

GameStats::~GameStats() {}

GameStats *GameStats::get_instance() {
	return GameStats::singleton;
}
void GameStats::set_instance(GameStats *p_game_stats) {
	GameStats::singleton = p_game_stats;
}

int64_t GameStats::get_score() const {
	return score;
}

void GameStats::set_score(int64_t p_score) {
	score = p_score;
}

int64_t GameStats::increase_score(int64_t p_score) {
	score += p_score;
	return score;
}

void GameStats::emit_score_changed_signal(int64_t value) {
	emit_signal("score_changed_signal", value);
}