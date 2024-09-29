extends Sprite2D

@export var character : String
@export var voice : AudioStreamMP3
var audiostream

func _ready() : 
	audiostream = get_node("AudioStreamPlayer2D")
	audiostream.stream = voice

func _input(event):
	if (event is InputEventMouseButton 
	and event.is_pressed()
	and event.button_index == MOUSE_BUTTON_LEFT
	and !Global.dialogue_on):
		if (get_rect().has_point(to_local(event.position))):
			Global.dialogue_on = true
			audiostream.play()
			DialogueManager.show_example_dialogue_balloon(load("res://dialogue/character_dialogue.dialogue"), character)
