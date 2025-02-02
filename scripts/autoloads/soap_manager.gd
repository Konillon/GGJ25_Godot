extends Node


var soap_counts : Array[int]
signal on_update_soaps(team: int, new_count: int)


func _ready() -> void:
	reset_scores()
	

func reset_scores() -> void:
	soap_counts = [0, 0]


func get_soap(team: int) -> int:
	if team < 0 or team >= 2:
		return 0
	return soap_counts[team]


func add_soap(team: int) -> void:
	if team < 0 or team >= 2:
		return
	
	soap_counts[team] += 1
	on_update_soaps.emit(team, soap_counts[team])


func take_soaps(team: int, amount: int):
	if team < 0 or team >= 2:
		return
	
	soap_counts[team] -= amount
	soap_counts[team] = max(soap_counts[team], 0)
	on_update_soaps.emit(team, soap_counts[team])
