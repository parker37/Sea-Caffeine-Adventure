extends Sprite2D

@export_file var connected_room
@export var facing : String

func _ready():
	match facing:
		"right":
			set_frame(0)
		"left":
			set_frame(1)
		"up":
			set_frame(2)
		"down":
			set_frame(3)

func _input(event):
	if (event is InputEventMouseButton and event.is_released()):
		if get_rect().has_point(to_local(event.position)):
			#go to next room
			get_tree().change_scene_to_file(connected_room)
