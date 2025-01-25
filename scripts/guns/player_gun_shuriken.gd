extends "res://scripts/guns/player_gun.gd"

const LAUNCH_FORCE := 250.0

func _setup_bullet(new_bullet : Node2D) -> void:
	var shur := new_bullet as Shuriken
	shur._launch(LAUNCH_FORCE if _stats.facing_right else -LAUNCH_FORCE)
