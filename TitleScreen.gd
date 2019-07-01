extends CanvasLayer

func _on_MenuButtons_start_game():
	get_node("/root/GlobalStorage")._set_scene("res://scenes/PlayingField.tscn")
