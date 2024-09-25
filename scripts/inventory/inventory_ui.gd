extends Control

@onready var inventory = preload("res://assets/ui/inventory/player_inventory.tres")
@onready var inv_slots: Array = $PanelContainer/GridContainer.get_children()

const inv_slot_square_radius = 34 * 34

func _input(event: InputEvent) -> void:
	if(not event is InputEventMouseButton):
		return
		
	if(event.is_action_released("Click")):
		for slot: TextureRect in inv_slots:
			var trueItemPosition = event.position - Vector2(32, 32)
			if(trueItemPosition.distance_squared_to(slot.global_position) < inv_slot_square_radius):
				highlight_slot(slot.slot_index, true)
				break
	elif(event.is_action_released("Right-Click") and inventory.selected):
		unhighlight_slot()

func _ready():
	inventory.update_inv_ui.connect(update_display)

func unhighlight_slot():
	inv_slots[inventory.selectedIndex].toggle_highlight()
	inventory.selected = false

func highlight_slot(slot_index: int, unghighlight_selected: bool):
	if(inventory.selected and unghighlight_selected):
		#deselects slot on second click
		if(inventory.selectedIndex == slot_index):
			unhighlight_slot()
			return
			
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
