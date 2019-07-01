extends TextureButton

var button_pressed = false

func _ready():
	button_pressed = false

func _process(delta):
	if button_pressed:
		set_position(get_viewport().get_mouse_position())

func _on_Piece_button_down():
	print("Clicked") # Debug log.
	button_pressed = true

func _on_Piece_button_up():
	button_pressed = false
	#var alt_drop_test = get_node("/root/GlobalStorage")._get_alternate_drop_location()
	if get_node("/root/GlobalStorage")._get_alternate_drop_location() == true:
		#set_position(get_node("/root/GlobalStorage")._get_drop_location())
		self.position.x = get_node("/root/GlobalStorage")._get_drop_location_x()
		self.position.y = get_node("/root/GlobalStorage")._get_drop_location_y()
		
		#set location occuipied
		
	else:
		set_position(get_viewport().get_mouse_position())