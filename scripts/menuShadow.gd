extends Label

@export var _color : Color
@export var _rate : float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_color.h = _color.h +delta*_rate
	if(_color.h>359): _color.h =0
	label_settings.shadow_color = _color
	pass
