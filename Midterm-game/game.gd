extends Node2D

var game_end = false
var moves = 0

func _process(_delta):
	$moves.text = 'Moves: ' + str(moves)
	if game_end == false:
		#get how many destinations the map have
		var destinations = $Destination.get_child_count()
		for i in $Destination.get_children():
			if i.occupied:
				destinations -= 1
	#when all destination get reached 
		if destinations == 0:
			$AcceptDialog.popup()
			game_end = true


func _on_AcceptDialog_confirmed():
	get_tree().reload_current_scene()
	
