extends Area2D


@export var team : int
signal on_pressed()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	var stats : PlayerStats = body.find_child("Stats")
	if stats and stats.team == team:
		on_pressed.emit()
