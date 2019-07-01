extends Node

var global_current_scene = null
var global_drop_location
var global_alternate_drop_location : bool = false
var global_node_entered_name = "empty"
var global_occupied_nodes = []

func _add_global_occupied_nodes(node):
	global_occupied_nodes.append(node)

func _remove_global_occupied_nodes(node):
	var i = global_occupied_nodes.find(node)
	global_occupied_nodes.remove(i)

func _get_global_occupied_nodes():
	return global_occupied_nodes

func _get_global_node_entered_name():
	return global_node_entered_name

func _set_global_node_entered_name(name):
	global_node_entered_name = name

func _get_drop_location():
	return global_drop_location

func _set_drop_location(loc):
	global_drop_location = loc

func _get_alternate_drop_location():
	return global_alternate_drop_location

func _set_alternate_drop_location(switch):
	global_alternate_drop_location = switch

func _check_if_space_occupied(name):
	if global_occupied_nodes.has(name) == true:
		return true
	else:
		return false

func _ready():
	global_current_scene = get_tree().get_root().get_child(get_tree().get_root().get_child_count() - 1)

func _set_scene(scene):
	global_current_scene.queue_free()
	var s = ResourceLoader.load(scene) # Don't need load scene
	global_current_scene = s.instance()
	get_tree().get_root().add_child(global_current_scene)