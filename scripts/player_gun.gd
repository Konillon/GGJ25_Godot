extends Node2D
class_name PlayerGun

var _stats : PlayerStats
var _offset : Vector2
var _timer : float = 0.0


var action : String
var bullet : PackedScene
var cooldown : float = 1.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_stats = get_parent().find_child("Stats")


func setup_bullet(new_bullet : Node2D) -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_timer = _timer - delta
	if _timer > 0.0 or _stats.is_stunned or _stats.is_in_bubble:
		return
	
	if Input.is_action_just_pressed(action):
		var new_bulled := bullet.instantiate()
		new_bulled.position = position + (_offset if _stats.facing_right else -_offset)
		setup_bullet(new_bulled)
		get_tree().current_scene.add_child(new_bulled)
		_timer = cooldown
