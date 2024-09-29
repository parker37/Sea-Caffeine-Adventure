extends Button

var bubble_sound : Node
var coffee_room = "res://scenes/map_rooms/coffee_room.tscn"

func _ready():
	bubble_sound = get_node("bubble_sound")
	
func _on_pressed() -> void:
	bubble_sound.play()


func _on_bubble_sound_finished() -> void:
	get_tree().change_scene_to_file(coffee_room)
