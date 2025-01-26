extends Area2D


@export var team : int


func _on_area_entered(area: Area2D) -> void:
	if area is MegaBubble and (area as MegaBubble).team != team:
		VictoryManager.register_loss(team)
