extends TextureRect

@export var slot_index: int
@export var is_highlighted: bool = false

@onready var slot_highlighted_texture = preload("res://assets/ui/inventory/item_container_highlight.png")
@onready var slot_unhighlight_texture = preload("res://assets/ui/inventory/item_container.png")

func update_texture(new_texture: Texture2D):
	$item_icon.texture = new_texture
	
func toggle_highlight():
	if(is_highlighted):
		texture = slot_unhighlight_texture
		is_highlighted = false
	else:
		texture = slot_highlighted_texture
		is_highlighted = true
