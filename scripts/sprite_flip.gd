extends AnimatedSprite2D


@export var animations : Array[SpriteFrames]
var rng = RandomNumberGenerator.new()

var _stats : PlayerStats
var _anim : AnimatedSprite2D


func _ready() -> void:
	_stats = get_parent().find_child("Stats")
	_anim = get_parent().find_child("AnimatedSprite2D")
	sprite_frames = animations[rng.randi_range(0, animations.size() - 1)]

func _process(_delta: float) -> void:
	flip_h = not _stats.facing_right
	if _stats.is_stunned:
		_anim.play("stun")
	elif _stats.is_in_bubble:
		_anim.play("inside_bubble")
