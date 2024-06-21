extends CanvasLayer

var game_stats: GameStats = GameStats.get_instance()
@onready var score_text: Label = $MarginContainer/ScoreText
@export var adjust_amount = 5


func _ready():
	GameStatsInstance.score_changed_signal.connect(on_score_changed_signal)
	
func on_score_changed_signal(value) -> void:
	GameStatsInstance.increase_score(value)
	score_text.text = "Score: %d" % GameStatsInstance.get_score()
	
