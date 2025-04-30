extends Control

#reference code: combo of scrolling credits and infinite background
#1. Scrolling credits: https://github.com/benbishopnz/godot-credits
#2. Infinite bg: https://www.youtube.com/watch?v=V_ytJTWloaU

#note: onreadys are helpful for preinitializing vars for _ready func
#global vars for controlling scroll contents and speed
@onready var scrollCreditTitle = $ScrollContainer/Control/CreditLabel
@onready var scrollText = $ScrollContainer/Control/LongCreditText
var scroll_speed = 80 #note: pixels per sec
var returnHome = false

#mostly to ensure player can't manually scroll my container
func _ready():
	$ScrollContainer.mouse_filter = Control.MOUSE_FILTER_IGNORE

#timing of scrolling text up until it's completely gone from screen
func _process(delta):
	#scrolling text up at a consistent speed
	scrollCreditTitle.position.y -= scroll_speed * delta
	scrollText.position.y -= scroll_speed * delta
	#trigger a return to home when text box is fully above visible screen
	if scrollCreditTitle.position.y <= -1296:
		if not returnHome:
			returnHome = true
			_return_to_title()

#switch back to title scene
func _return_to_title():
	#wait a second before returning to title
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")
