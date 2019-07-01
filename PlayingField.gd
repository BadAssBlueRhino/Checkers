extends Node

var level = preload("res://scenes/Level1.tscn")
#var piece = preload("res://scenes/GamePiece.tscn")
var piece = preload("res://scenes/Piece.tscn") # could also use class_name to preload every time.
var current_level

func _ready():
	# Load level 1.
	current_level = level.instance()
	add_child(current_level)
	current_level.set_scale(Vector2(1.5,1.5))
	current_level.set_position(Vector2(240,360))
	
func _on_Timer_timeout():
	#load pieces
	var start_pos = get_node("current_level")
	var pos = start_pos._get_start_positions()
	
	for i in start_pos[0].size(): # 8 times
		var white_piece = piece.instance()
		$WhitePieceContainer.add_child(white_piece)
		get_node("/root/GlobalStorage")._add_global_occupied_nodes(start_pos[0][i][0])
		var loc = $current_level.get_node(start_pos[0][i][1]).get_global_transform_with_canvas().get_origin()
		white_piece.set_position(loc) # make each variables location