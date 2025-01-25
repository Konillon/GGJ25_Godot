extends Node
class_name PlayerInput

@export var joy : bool = false
@export var id : int

var horizontal_input : float = 0.0
var bubble : bool = false
var jump : bool = false
var shoot : bool = false
var shoot_up : bool = false


func get_button_name(button : String) -> String:
	return "%s%s" % [button, get_sufix()]

func get_sufix() -> String:
	return "_kb%s" % id if not joy else "_joy%s" % id

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	bubble = Input.is_action_just_pressed(get_button_name("bubble"))
	jump = Input.is_action_just_pressed(get_button_name("jump"))
	shoot = Input.is_action_just_pressed(get_button_name("shoot"))
	horizontal_input = Input.get_axis(get_button_name("left"), get_button_name("right"))
