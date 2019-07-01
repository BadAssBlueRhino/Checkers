extends Area2D

func _on_TestCol_mouse_entered():
	print("Mouse has entered test shape.")

func _on_TestCol_mouse_exited():
	print("Mouse has left test shape.")

#func _on_TestCol_input_event(viewport, event, shape_idx):
#	if(event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT):
#		print("Mouse has left clicked test shape")