extends Control

#note: hmm handle connection error by ignoring intializaing of start button
func _ready():
	$ExitButton.pressed.connect(_on_exit_button_pressed)
	#scalable min window size
	DisplayServer.window_set_min_size(Vector2i(2304, 1296))

#exit program
func _on_exit_button_pressed():
	$ExitButton/ExitSfx.play()
	get_tree().quit()

#head to first page
func _on_start_button_pressed():
	$StartButton/StartSfx.play()
	get_tree().change_scene_to_file("res://Scenes/storybook_scene.tscn")
