extends Area2D

func _ready():
	#set default texture to plain
	get_parent().texture = get_parent().item.texture
	
	#connect signals for mouse enter and exit
	connect("mouse_entered", on_mouse_enter)
	connect("mouse_exited", on_mouse_exit)

#change sprite based on whether or not the mouse is hovering
func on_mouse_enter():
	get_parent().texture = get_parent().item.texture_highlight
	
func on_mouse_exit():
	get_parent().texture = get_parent().item.texture
