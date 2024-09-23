extends Control

@onready var inventory = preload("res://assets/ui/inventory/player_inventory.tres")
@onready var inv_slots: Array = $PanelContainer/GridContainer.get_children()

const inv_slot_square_radius = 34 * 34

func _input(event: InputEvent) -> void:
	if(event is InputEventMouseButton and event.is_released()):
		var outside_inventory = true
		for slot: TextureRect in inv_slots:
			var trueItemPosition = event.position - Vector2(32, 32)
			if(trueItemPosition.distance_squared_to(slot.global_position) < inv_slot_square_radius):
				highlight_slot(slot.slot_index)
				outside_inventory = false
				break
		if(outside_inventory and inventory.selected):
			unhighlight_slot()
	else:
		pass

func add_item(item: InvItem, slot: int):
	pass

func remove_item(item: InvItem, slot: int):
	pass

func unhighlight_slot():
	inv_slots[inventory.selectedIndex].toggle_highlight()
	inventory.selected = false

func highlight_slot(slot_index: int):
	if(inventory.selected):
		inv_slots[inventory.selectedIndex].toggle_highlight()
	else:
		inventory.selected = true
		
	inv_slots[slot_index].toggle_highlight()
	inventory.selectedIndex = slot_index
		
# Updates when item is added or removed
func update_display():
	for idx in range(inv_slots.size()):
		if (inventory.items[idx] != null):
			inv_slots[idx].update_item(inventory.items[idx].texture)
		else:
			inv_slots[idx].update_item(null)
