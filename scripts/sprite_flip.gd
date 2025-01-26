extends AnimatedSprite2D


var _stats : PlayerStats


func _ready() -> void:
	_stats = get_parent().find_child("Stats")


func _process(_delta: float) -> void:
	flip_h = not _stats.facing_right
