extends Node2D

func _ready() -> void:
	%AnimationPlayer.get_child(0).visible = true
	%AnimationPlayer.play("fade_in")
	pass
