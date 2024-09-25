extends Area2D

#textures for changing sprite
var plain_sprite : Texture2D
var highlight_sprite : Texture2D

#strings for file paths
var plain_string : String
var highlight_string : String

func _ready():
	#set file paths to images
	match get_parent().item_name:
		"seaweed":
			plain_string = "res://assets/icons/seaweed.png"
			highlight_string = "res://assets/seaweed_highlight.png"
		"sanddollar":
			plain_string = "res://assets/icons/sanddollar.png"
			highlight_string = "res://assets/sanddollar_highlight.png"
	
	#set sprite to file paths
	plain_sprite = load(plain_string)
	highlight_sprite = load(highlight_string)
	
	#set default texture to plain
	get_parent().texture = plain_sprite
	
	#connect signals for mouse enter and exit
	connect("mouse_entered", on_mouse_enter)
	connect("mouse_exited", on_mouse_exit)

#change sprite based on whether or not the mouse is hovering
func on_mouse_enter():
	get_parent().texture = highlight_sprite
	
func on_mouse_exit():
	get_parent().texture = plain_sprite
