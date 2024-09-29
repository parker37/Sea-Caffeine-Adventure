extends Area2D

var plain = preload("res://assets/arrows_sheet.png")
var highlight = preload("res://assets/arrows_highlight.png")

func _ready():
	#set default texture to plain
	get_parent().texture = plain
	
	#connect signals for mouse enter and exit
	connect("mouse_entered", on_mouse_enter)
	connect("mouse_exited", on_mouse_exit)

#change sprite based on whether or not the mouse is hovering
func on_mouse_enter():
	get_parent().texture = highlight
	
func on_mouse_exit():
	get_parent().texture = plain
