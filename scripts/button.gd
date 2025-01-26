extends Area2D


@export var team : int
signal on_pressed()

var pressing_node : Node2D

@onready var _sprite : Sprite2D = $Sprite2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	var stats : PlayerStats = body.find_child("Stats")
	if stats and stats.team == team:
		pressing_node = body;
		_sprite.region_rect.position.x = 0
		on_pressed.emit()


func _on_body_exited(body: Node2D) -> void:
	if pressing_node and pressing_node == body:
		pressing_node = null
		_sprite.region_rect.position.x = 30
