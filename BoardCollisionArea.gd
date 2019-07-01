extends Area2D

signal entered_node
signal left_node

var is_start_position : bool = false setget _set_is_start_position, _get_is_start_position
var is_occupied : bool = false setget _set_is_occupied, _get_is_start_position

func _set_is_start_position(switch):
	is_start_position = switch

func _get_is_start_position():
	return is_start_position

func _set_is_occupied(switch):
	is_occupied = switch

func _get_is_occupied():
	return is_occupied

func _on_Board_Area_mouse_entered():
	# Set location relative to canvas, because we alter its original positon
	get_node("/root/GlobalStorage")._set_drop_location(get_global_transform_with_canvas().get_origin())
	get_node("/root/GlobalStorage")._set_alternate_drop_location(true)
	get_node("/root/GlobalStorage")._set_global_node_entered_name(self.get_name())
	emit_signal("entered_node", self.name, self.get_global_transform_with_canvas().get_origin())
	print("Mouse in.") # Debug log.

func _on_Board_Area_mouse_exited():
	get_node("/root/GlobalStorage")._set_alternate_drop_location(false)
	get_node("/root/GlobalStorage")._set_global_node_entered_name("empty")
	emit_signal("left_node")
	print("Mouse out.") # Debug log.