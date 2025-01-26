extends "res://scripts/guns/player_gun.gd"

@export var offset_up : Vector2
const LAUNCH_FORCE := 250.0

func _process(delta: float) -> void:
	_timer = _timer - delta
	if _timer > 0.0 or _stats.is_stunned or _stats.is_in_bubble:
		return
	
	if _input.shoot:
		var new_bullet := bullet.instantiate()
		new_bullet.global_position = global_position + Vector2(offset.x if _stats.facing_right else -offset.x, offset.y)
		_launch_shuriken(new_bullet, true)
		get_tree().current_scene.add_child(new_bullet)
		_timer = cooldown
		
	if _input.shoot_up:
		var new_bullet := bullet.instantiate()
		new_bullet.global_position = global_position + (offset_up)
		_launch_shuriken(new_bullet, false)
		get_tree().current_scene.add_child(new_bullet)
		_timer = cooldown

func _launch_shuriken(new_bullet : Node2D, horizontal : bool) -> void:
	var shur := new_bullet as Shuriken
	var force : Vector2 
	if(horizontal):
		force = Vector2(LAUNCH_FORCE if _stats.facing_right else -LAUNCH_FORCE,0)
	else :
		force = Vector2(0, -LAUNCH_FORCE)
	shur._launch(force)
