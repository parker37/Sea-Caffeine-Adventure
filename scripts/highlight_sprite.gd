extends Area2D

var plain_sprite : Texture2D
var highlight_sprite : Texture2D

var plain_string : String
var highlight_string : String

func _ready():
	match get_parent().item_name:
		"seaweed":
			plain_string = "res://assets/icons/seaweed.png"
			highlight_string = "res://assets/seaweed_highlight.png"
		"sanddollar":
			plain_string = "res://assets/icons/sanddollar.png"
			highlight_string = "res://assets/sanddollar_highlight.png"
			
	var plain_image = Image.load_from_file(plain_string)
	plain_sprite = ImageTexture.create_from_image(plain_image)
	
	var highlight_image = Image.load_from_file(highlight_string)
	highlight_sprite = ImageTexture.create_from_image(highlight_image)
	
	get_parent().texture = plain_sprite
	connect("mouse_entered", on_mouse_enter)
	connect("mouse_exited", on_mouse_exit)
	
func on_mouse_enter():
	get_parent().texture = highlight_sprite
	
func on_mouse_exit():
	get_parent().texture = plain_sprite
