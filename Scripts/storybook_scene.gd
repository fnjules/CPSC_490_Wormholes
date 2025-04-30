extends Control

#intializing for pressing the next and previous buttons at the bottom of the page
func _ready():
	$ScrollContainer/Control/NextButton.pressed.connect(_on_next_button_pressed)
	$ScrollContainer/Control/PreviousButton.pressed.connect(_on_previous_button_pressed)
	#display the first page (and then subsequent ones)
	update_page_display()

#update contents on page
func update_page_display():
	#fetch current page
	var page = SingletonScript.get_current_page_data()
	#update with text of next page
	$ScrollContainer/Control/ChapterNumber.text = page.chapter_number
	$ScrollContainer/Control/ChapterName.text = page.chapter_name
	$ScrollContainer/Control/MainStoryText.text = page.main_story_text
	#if visual texture is found, update with visual of next page
	var texture_path = page.story_picture
	if ResourceLoader.exists(texture_path):
		var texture = load(texture_path)
		$ScrollContainer/Control/StoryPicture.texture = texture
	#reset scroll to top
	$ScrollContainer.scroll_vertical = 0

#handle next button
func _on_next_button_pressed():
	#play page flipping music
	$ScrollContainer/Control/NextButton/NextSfx.play()
	#head to credits if on sixth/last page
	if SingletonScript.current_page_index == SingletonScript.total_pages - 1:
		get_tree().change_scene_to_file("res://Scenes/credit_screen.tscn")
	else:
		SingletonScript.next_page()
		update_page_display()

func _on_previous_button_pressed():
	#play page flipping music
	$ScrollContainer/Control/PreviousButton/PreviousSfx.play()
	#head to home if on first page
	if SingletonScript.current_page_index == 0:
		get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")
	else:
		SingletonScript.previous_page()
		update_page_display()
