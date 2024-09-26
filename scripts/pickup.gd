extends Sprite2D

@export var item : InvItem
var item_name : String

func _ready():
	item_name = item.name

func _input(event):
	if (event is InputEventMouseButton
	and event.is_pressed()
	and event.button_index == MOUSE_BUTTON_LEFT
	and !Global.dialogue_on):
		if (get_rect().has_point(to_local(event.position))):
			Global.dialogue_on = true
			DialogueManager.show_example_dialogue_balloon(load("res://dialogue/item_pickups.dialogue"), item_name)
			Global.inventory.add_item(item)
