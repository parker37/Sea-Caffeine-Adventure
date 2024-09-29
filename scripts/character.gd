extends Sprite2D

@export var character : String
@export var voice : AudioStreamMP3
var audiostream

var plain : String
var highlight : String
var plain_sprite : Texture2D
var highlight_sprite : Texture2D

func _ready() : 
	audiostream = get_node("AudioStreamPlayer2D")
	audiostream.stream = voice
	
	if character == "clam" and Global.completed_clam:
		character = "clam_open"
	
	plain = "res://assets/characters/%s.png" % character
	highlight = "res://assets/characters/%s_highlight.png" % character
	plain_sprite = load(plain)
	highlight_sprite = load(highlight)
	
	texture = plain_sprite
	
func _input(event):
	if (event is InputEventMouseButton 
	and event.is_pressed()
	and event.button_index == MOUSE_BUTTON_LEFT
	and !Global.dialogue_on):
		if (get_rect().has_point(to_local(event.position))):
			Global.dialogue_on = true
			audiostream.play()
			DialogueManager.show_example_dialogue_balloon(load("res://dialogue/character_dialogue.dialogue"), character)
