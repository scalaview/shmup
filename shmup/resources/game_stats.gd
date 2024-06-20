class_name GameStats

extends Resource

signal score_changed(new_score)

@export var score: int :
	set(value):
		score = value
		score_changed.emit(score)

@export var highscore: int = 0
