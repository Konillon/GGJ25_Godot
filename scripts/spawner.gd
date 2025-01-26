extends Node


@export var points : Array[Node2D]
@export var spawn_time : float = 1.0
@export var max_amount : int = 3
@export var soap : PackedScene

var _timer : float
var _objects : Array[NodePath]


func count() -> int:
	var i : int = 0
	while i < _objects.size():
		if not get_tree().current_scene.has_node(_objects[i]):
			_objects.remove_at(i)
		else:
			i += 1
	
	return _objects.size()


func do_spawn():
	if count() >= max_amount:
		return
	var i := randi_range(0, points.size() - 1)
	var pos := points[i].global_position
	for obj in _objects:
		if get_node(obj) and pos.distance_squared_to((get_node(obj) as Node2D).global_position) < 0.1:
			return
	var new_soap := soap.instantiate() as Node2D
	new_soap.global_position = pos
	get_tree().current_scene.add_child(new_soap)
	_objects.push_back(new_soap.get_path())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_timer -= delta
	if _timer <= 0.0:
		do_spawn()
		_timer += spawn_time
