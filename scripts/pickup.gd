extends Sprite2D

@export var item_name : String

func _input(event):
	if (event is InputEventMouseButton 
	and event.is_released()
	and event.button_index == MOUSE_BUTTON_LEFT):
		if (get_rect().has_point(to_local(event.position)) and !Global.dialogue_on):
			Global.dialogue_on = true
			DialogueManager.show_example_dialogue_balloon(load("res://dialogue/item_pickups.dialogue"), item_name)
