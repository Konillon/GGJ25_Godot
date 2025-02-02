extends Node2D
class_name PlayerGun

var _stats : PlayerStats
var _input : PlayerInput
var _timer : float = 0.0


@export var offset : Vector2
@export var action : String # TODO: sai fora
@export var bullet : PackedScene
@export var cooldown : float = 1.0 # TODO: sai fora


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_stats = get_parent().find_child("Stats")
	_input = get_parent().find_child("Input")


func _setup_bullet(_new_bullet : Node2D) -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_timer = _timer - delta
	if _timer > 0.0 or _stats.is_stunned or _stats.is_in_bubble:
		return
	
	if _input.bubble:
		var new_bullet := bullet.instantiate()
		new_bullet.global_position = global_position + Vector2(offset.x if _stats.facing_right else -offset.x, offset.y)
		_setup_bullet(new_bullet)
		get_tree().current_scene.add_child(new_bullet)
		_timer = cooldown
