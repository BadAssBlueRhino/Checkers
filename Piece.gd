extends Area2D

signal now_occupied

# Drop location related
onready var resting_node = null
onready var resting_position = self.position
var active_drop_node
var active_drop_position
var active_drop_viable

# Game piece related.
var piece_active : bool = false
var piece_pressed : bool = false

func _ready():

func _process(delta):
	if piece_pressed:
		set_position(get_viewport().get_mouse_position())

func _on_Piece_mouse_entered():
	piece_active = true

func _on_Piece_mouse_exited():
	piece_active = false

# Recieve signal from BoardCollisionArea.gd
func _entered_node(entered, name, pos, is_occupied):
	if entered == true:
		active_drop_node = name
		active_drop_position = pos
		active_drop_viable = is_occupied
	else:
		active_drop_viable = false

func _on_Piece_input_event(viewport, event, shape_idx):
	if piece_active == true and event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		print("Clicked") # Debug log.
		piece_pressed = true
	elif active_piece == true and event is InputEventMouseButton and event.pressed == false and event.button_index == BUTTON_LEFT:
		print("Unclicked") # Debug log.
		button_pressed = false
		if active_drop_viable == true:
			resting_node = active_drop_node
			resting_position = active_drop_position
			emit_signal("now_occupied", resting_node) # Send singal to all nodes, that node is now occupied
		else
			pass
		self.position = resting_position
			
		
	
