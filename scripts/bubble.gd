extends Area2D
class_name Bubble


var _player : PlayerStats = null
var _timer : float = 5.0
var _velocity : Vector2

# Called when the node enters the scene tree for the first time.
func _launch(force : float) -> void:
	_velocity.x = force


func _exit_tree() -> void:
	if _player:
		_player.is_in_bubble = false
		(_player.get_parent() as CharacterBody2D).velocity = _velocity


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	_timer -= delta
	if _timer <= 0.0:
		destroy_bubble()
		return
	
	_velocity.x = move_toward(_velocity.x, 0.0, delta * 400.0)
	_velocity.y -= delta * 15.0
	global_position += _velocity * delta
	
	if _player:
		global_position.x = (_player.get_parent() as Node2D).global_position.x
		(_player.get_parent() as Node2D).global_position = global_position


func _on_body_entered(body: Node2D) -> void:
	if abs(_velocity.x) < 0.2 or _player:
		if body.global_position.y > global_position.y:
			destroy_bubble()
		else: # jump
			var p := body as PlayerMovement
			if p:
				p.velocity.y = -300 # TODO: ajustar pulo
			queue_free()
	else:
		if _velocity.dot(body.global_position - global_position) < 0.0:
			return
		
	var stats := body.find_child("Stats")
	if stats and stats is PlayerStats:
		_player = stats as PlayerStats
		_player.is_in_bubble = true
		
func destroy_bubble() -> void:
	queue_free()
