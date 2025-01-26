extends CharacterBody2D
class_name PlayerMovement


const SPEED = 150.0
const JUMP_VELOCITY = -300.0


var _stats : PlayerStats
var _input : PlayerInput
var _anim : AnimatedSprite2D

var _stun_timer : float = 0.0
var _last_vel : float = 0.0

func _ready() -> void:
	_stats = find_child("Stats")
	_input = find_child("Input")
	_anim = find_child("AnimatedSprite2D")


func leave_tree():
	pass


func _get_horizontal_velocity() -> float:
	return SPEED * (0.05 if _stats.is_in_bubble else 1.0)


func _physics_process(delta: float) -> void:
	_stun_timer -= delta
	if _stun_timer < 0.0:
		_stats.is_stunned = false;
	if is_on_floor() and _last_vel > 500.0:
		print("stunned")
		_stats.is_stunned = true
		_stun_timer = 1.0
	
	# Add the gravity.
	if not _stats.is_in_bubble and not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if _input.jump and is_on_floor() and not _stats.is_stunned:
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := _input.horizontal_input
	if direction and not _stats.is_stunned:
		velocity.x = direction * _get_horizontal_velocity()
		_stats.facing_right = direction > 0.0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if not _stats.is_in_bubble and not _stats.is_stunned:
		if is_on_floor() and velocity.y >= 0.0:
			if abs(velocity.x) > 0.01:
				_anim.play("walking")
			else:
				_anim.play("idle")
		else:
			_anim.play("jump")
	
	_last_vel = velocity.y
	move_and_slide()
