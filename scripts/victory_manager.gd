extends Node

@onready var _scene_to_load : String = "res://scenes/sandbox.tscn"

signal on_victory(team: int)
var _won : bool = false
var _timer : float = 0.0


func _init() -> void:
	reset()


func _process(delta: float) -> void:
	if _won:
		_timer -= delta
		if _timer < 0.0:
			finish()

func reset():
	_timer = 5.0
	_won = false
	SoapManager.reset_scores()


func finish() -> void:
	reset()
	get_tree().change_scene_to_file(_scene_to_load)


func register_loss(team: int):
	if _won:
		return
	
	on_victory.emit(1 if team == 0 else 0)
	_won = true
	
