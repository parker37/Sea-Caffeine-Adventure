extends Sprite2D

@export var character : String
@export var plain_sprite : Texture2D

func _ready():
	texture = plain_sprite
	
func _input(event):
	if (event is InputEventMouseButton 
	and event.is_pressed()
	and event.button_index == MOUSE_BUTTON_LEFT
	and !Global.dialogue_on):
		if (get_rect().has_point(to_local(event.position))):
			Global.dialogue_on = true
			DialogueManager.show_example_dialogue_balloon(load("res://dialogue/character_dialogue.dialogue"), character)
