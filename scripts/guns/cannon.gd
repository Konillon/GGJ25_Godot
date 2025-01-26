extends Node2D


@export var cost : int
@export var team : int

@export var bubble : PackedScene
@export var spawn_offset : Vector2
@export var launch_velocity : float

func activate() -> void:
	if SoapManager.get_soap(team) < cost:
		return # TODO: feedback preço
	SoapManager.take_soaps(team, cost)
	
	var new_bubble = bubble.instantiate() as MegaBubble
	new_bubble.global_position = global_position + spawn_offset
	new_bubble.team = team
	new_bubble.velocity = launch_velocity
	get_tree().current_scene.add_child(new_bubble)
