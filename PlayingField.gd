extends Node

var level = preload("res://scenes/Level1.tscn")
var piece_scene = preload("res://scenes/Piece.tscn")
var current_level

func _ready():
	# Load level 1.
	current_level = level.instance()
	add_child(current_level)
	current_level.set_scale(Vector2(1.5,1.5))
	current_level.set_position(Vector2(240,360))
	
func _on_Timer_timeout():
	# Load pieces.
	for i in range(8):
		var piece = piece_scene.instance()
		$WhitePieceContainer.add_child(piece)
		piece.set_position(loc) # make each variables location
		current_level.connect("entered_node_bounce", piece, "_entered_node")
		
	# find spaces and connect to signal
	var spaces = $current_level.get_tree().get_nodes_in_group("Spaces")
	for i in spaces:
		spaces[i].connect("now_occupied", piece, "_on_start_game")
