extends Area2D
class_name Shuriken
const _timeToRotate = 0.1
var _timer : float = 0.8
var _velocity : Vector2
var _sprite : Sprite2D
var _rotateTimer : float = 0.1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_sprite = find_child("Sprite2D")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(area: Area2D) -> void:
	if area is Bubble:
		(area as Bubble).destroy_bubble()
		queue_free()
	elif area is MegaBubble:
		area.queue_free()
		queue_free()

func _launch(force : Vector2) -> void:
	_velocity = force
	
func _physics_process(delta: float) -> void:
	_rotateTimer -= delta
	if(_rotateTimer <=0.0):
		_sprite.rotation_degrees += 90
		_rotateTimer = _timeToRotate
	_timer -= delta
	if _timer <= 0.0:
		queue_free()
		return
	
	#_velocity.x = move_toward(_velocity.x, 0.0, delta * 100.0)
	#_velocity.y = move_toward(_velocity.y,0.0, delta*100.0)
	global_position += _velocity * delta
