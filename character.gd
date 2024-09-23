extends Sprite2D

func _input(event):
	if (event is InputEventMouseButton and event.is_released()):
		if get_rect().has_point(to_local(event.position)):
			#go to next room
			DialogueManager.show_example_dialogue_balloon(load("res://dialogue/test_dialogue.dialogue"), "start")
