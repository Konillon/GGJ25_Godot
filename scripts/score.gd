extends Label


@export var team : int


# Called when the node enters the scene tree for the first time.
func _init() -> void:
	SoapManager.on_update_soaps.connect(_update_text)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _update_text(team_id: int, score: int):
	if team != team_id:
		return
	text = str(score)
