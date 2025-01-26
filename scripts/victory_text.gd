extends Label


@export var team : int

func _ready() -> void:
	VictoryManager.on_victory.connect(check_victory)

func _exit_tree() -> void:
	VictoryManager.on_victory.disconnect(check_victory)


func check_victory(t: int):
	if t == team:
		visible = true
