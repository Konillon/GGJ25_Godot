extends PlayerGun


const LAUNCH_FORCE := 200.0


# Called when the node enters the scene tree for the first time.
func _setup_bullet(new_bullet : Node2D) -> void:
	var bubble := new_bullet as Bubble
	bubble._launch(LAUNCH_FORCE if _stats.facing_right else -LAUNCH_FORCE)
