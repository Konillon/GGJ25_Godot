extends Area2D
class_name MegaBubble


@export var team : int = 0
@export var destructible : bool = 0

var velocity : float = 0.0


func _physics_process(delta: float) -> void:
	position.x += velocity * delta
