extends CharacterBody2D
class_name PlayerMovement

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


var _stats : PlayerStats


func _ready() -> void:
	_stats = find_child("Stats")


func leave_tree():
	pass


func _get_horizontal_velocity() -> float:
	return SPEED * (0.05 if _stats.is_in_bubble else 1.0)


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not _stats.is_in_bubble and not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * _get_horizontal_velocity()
		_stats.facing_right = direction > 0.0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
