extends Area2D

var _stats : PlayerStats
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_stats = get_parent().find_child("Stats")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("soap"):
		area.queue_free()
		SoapManager.add_soap(_stats.team)
