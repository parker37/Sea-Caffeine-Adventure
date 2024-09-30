extends Sprite2D

@export_file var connected_room
@export var facing : String

func _ready():
	match facing:
		"right":
			set_frame(1)
		"left":
			set_frame(0)
		"up":
			set_frame(2)
		"down":
			set_frame(3)

func _input(event):
	if (event is InputEventMouseButton and event.is_pressed() and !Global.dialogue_on):
		if get_rect().has_point(to_local(event.position)):
			if Global.completed_sharks:
				%AnimationPlayer.get_child(0).visible = true
				%AnimationPlayer.play("fade_out")
			else:
				#go to next room
				SwishEffect.play()
				get_tree().change_scene_to_file(connected_room)
