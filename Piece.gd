extends Area2D

var button_pressed : bool = false
var active_piece : bool = false
var resting_node = "empty"
var resting_position = Vector2(0,0)
var active_node

func _ready():
	resting_position = self.position

func _process(delta):
	if button_pressed:
		set_position(get_viewport().get_mouse_position())

func _on_Piece_mouse_entered():
	active_piece = true

func _on_Piece_mouse_exited():
	active_piece = false

func _on_Piece_input_event(viewport, event, shape_idx):
	
	# If you have picked up the piece, remove its old resting spot from GlobalStorage.
	if active_piece == true and event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		print("Clicked") # Debug log.
		button_pressed = true
		if get_node("/root/GlobalStorage")._get_global_occupied_nodes().has(resting_node):
			get_node("/root/GlobalStorage")._remove_global_occupied_nodes(resting_node)
	
	# If you let go of the piece find a new spot to drop, or return to the last one.
	elif active_piece == true and event is InputEventMouseButton and event.pressed == false and event.button_index == BUTTON_LEFT:
		button_pressed = false
		
		# Check if you need to drop it in a square.
		if get_node("/root/GlobalStorage")._get_alternate_drop_location() == true:
			if get_node("/root/GlobalStorage")._check_if_space_occupied(get_node("/root/GlobalStorage")._get_global_node_entered_name()):
				# Space is occupied, so return to previous
				set_position(resting_position)
				resting_node = "empty"
				print("Node full")
			else:
				# Get name of node & location entered.
				self.position = get_node("/root/GlobalStorage")._get_drop_location() 
				resting_position = self.position
				resting_node = get_node("/root/GlobalStorage")._get_global_node_entered_name()
				print("Dropped piece in empty node")
				
				# Add its name to GlobalStorage.
				get_node("/root/GlobalStorage")._add_global_occupied_nodes(resting_node)
		else:
			set_position(get_viewport().get_mouse_position())
			# self.position = resting_position
			resting_position = get_viewport().get_mouse_position()
			resting_node = "empty"
			print("No alternate drop location.")
	else:
		pass

func when_entered_node():
	active_node = 


func check_if_occupied():
	