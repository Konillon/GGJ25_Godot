extends Node


var soap_counts : Array[int]


func ready() -> void:
	reset_scores
	

func reset_scores() -> void:
	soap_counts = [0, 0]


func add_soap(team: int) -> void:
	if team < 0 or team >= 2:
		return
	
	soap_counts[team] += 1
