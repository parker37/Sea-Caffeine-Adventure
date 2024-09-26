extends Area2D

#textures for changing sprite
var plain_sprite : Texture2D
var highlight_sprite : Texture2D

#strings for file paths
var plain_string : String
var highlight_string : String

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
