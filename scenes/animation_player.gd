extends AnimationPlayer

func switch_scene():
	get_tree().change_scene_to_file("res://scenes/map_rooms/win_room.tscn")

func _on_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fade_out":
		DialogueManager.show_example_dialogue_balloon(load("res://dialogue/character_dialogue.dialogue"), "charles")
