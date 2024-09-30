extends Sprite2D

@export var item : InvItem
var item_name : String
@export var ID : Global.pickup_ids

func _ready():
	match item.name:
		"seaweed":
			if Global.picked_up_seaweed:
				visible = false
		"burried_cup":
			if Global.picked_up_emptycup:
				visible = false
		"sharktooth":
			if Global.has_table:
				visible = true
				if Global.picked_up_sharktooth:
					visible = false
		"sanddollar":
			if (ID in Global.collected_sanddollars):
				visible = false
			
	item_name = item.name

func _input(event):
	if (event is InputEventMouseButton
	and event.is_pressed()
	and event.button_index == MOUSE_BUTTON_LEFT
	and !Global.dialogue_on):
		if (get_rect().has_point(to_local(event.position)) and visible):
			Global.dialogue_on = true
			var temp_name = item_name
			if(item_name == "burried_cup"):
				temp_name = "emptycup"
				
			DialogueManager.show_example_dialogue_balloon(load("res://dialogue/item_pickups.dialogue"), temp_name)
			
			match item.name:
				"seaweed":
					if Global.picked_up_seaweed == true:
						visible = false
				"burried_cup":
					Global.picked_up_emptycup = true
					visible = false
				"sharktooth":
					Global.picked_up_sharktooth = true
					visible = false
				"sanddollar":
					Global.picked_up_sanddollar = true
					visible = false
					Global.collected_sanddollars.append(ID)
