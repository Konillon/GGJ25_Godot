extends CharacterBody2D
class_name PlayerMovement

const SPEED = 150.0
const JUMP_VELOCITY = -200.0


var _stats : PlayerStats
var _input : PlayerInput


func _ready() -> void:
	_stats = find_child("Stats")
	_input = find_child("Input")


func leave_tree():
	pass


func _get_horizontal_velocity() -> float:
	return SPEED * (0.05 if _stats.is_in_bubble else 1.0)


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not _stats.is_in_bubble and not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if _input.jump and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := _input.horizontal_input
	if direction:
		velocity.x = direction * _get_horizontal_velocity()
		_stats.facing_right = direction > 0.0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
