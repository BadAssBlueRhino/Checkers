extends Area2D

signal entered_node

var is_start_position : bool = false setget _set_is_start_position, _get_is_start_position
var is_occupied : bool = false setget _set_is_occupied, _get_is_start_position

func _ready():
	connect("entered_node", get_parent(), "entered_node_bounce")

func _set_is_start_position(switch):
	is_start_position = switch

func _get_is_start_position():
	return is_start_position

func _set_is_occupied(switch):
	is_occupied = switch

func _get_is_occupied():
	return is_occupied

func _on_Board_Area_mouse_entered():
	emit_signal("entered_node", true, self.name, self.get_global_transform_with_canvas().get_origin(), is_occupied)
	print("Mouse in.") # Debug log.

func _on_Board_Area_mouse_exited():
	get_node("/root/GlobalStorage")._set_alternate_drop_location(false)
	get_node("/root/GlobalStorage")._set_global_node_entered_name("empty")
	emit_signal("entered_node", false, self.name, self.get_global_transform_with_canvas().get_origin(), is_occupied)
	print("Mouse out.") # Debug log.

func _is_now_occupied(node)
	if self.name() == node
		is_occupied = true
