extends ReferenceRect

signal start_game
signal load_game
signal open_settings

func _on_StartButton_pressed():
	print("Start button clicked.") # Debug log.
	emit_signal("start_game")

func _on_LoadButton_pressed():
	print("Load button clicked.") # Debug log.
	emit_signal("load_game")

func _on_SettingsButton_pressed():
	print("Settings button clicked.") # Debug log.
	emit_signal("open_settings")
