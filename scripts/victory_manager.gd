extends Node


signal on_victory(team: int)
var _won : bool = false


func reset():
	pass
	

func register_loss(team: int):
	on_victory.emit(1 if team == 0 else 0)
